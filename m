Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB550CA6D
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Apr 2022 15:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401241705;
	Sat, 23 Apr 2022 15:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401241705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650719643;
	bh=XrX+GXS7IdJqw3b4gYomRwQqW8IhaViNt4H9CoiGIj0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ca4VmKP/bQAvYOEkwy7I8zt/Z53FC9jLfGE0dKbryO6GHggmCb1Rhc+F+VMcVogMi
	 ln6ipQQBH9Vt3B6SKHVJ3wPjQco8FElk4/9liamBorZBKs3w7TBUyvzLOcVPbxvqR3
	 Rl32rwMj9zqAwX4rpuJF2+Aw11AkUNfUdAy9b0UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE791F8028B;
	Sat, 23 Apr 2022 15:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5315EF80248; Sat, 23 Apr 2022 15:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A591CF80134
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 15:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A591CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YXN0I+Sb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FB6CB801BD;
 Sat, 23 Apr 2022 13:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401B8C385A5;
 Sat, 23 Apr 2022 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650719569;
 bh=XrX+GXS7IdJqw3b4gYomRwQqW8IhaViNt4H9CoiGIj0=;
 h=From:To:Cc:Subject:Date:From;
 b=YXN0I+SbJhkBgXT3B0ZEzyMLShsb6t9yh8xjaBnXA3WiM72z6sQU8CKN5c0w7Mlb/
 q/HKfsx8gy/kIo3/7Z+xMjLD2QshcmgEmptRKnTQIp5jpl4etBWv+50jquo5QcKZ4R
 oD5uKGCa0Qxpb1ixKq8Ik9qHon6t3FGvVu58VxV3dT7lGFdbRZx3ha/YclyE9qRVY0
 V4A7B/La60J5hhOWYRWaN2bFl8eHeNNF3PnRZDIeyLgIe5wv2tA7lasX06ad23xN6E
 OpPWZexntCXmR078u6CuW5Q5kkXPNdTkXV6TJy4ayRmFGbsgUHYNywfuQyTASF6oHd
 CvrnHBtainPdQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ops: Validate input values in snd_soc_put_volsw_range()
Date: Sat, 23 Apr 2022 14:12:39 +0100
Message-Id: <20220423131239.3375261-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; h=from:subject;
 bh=XrX+GXS7IdJqw3b4gYomRwQqW8IhaViNt4H9CoiGIj0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiY/sxs/Vj5wtigFPcFLWGSzYCNvScYBd84kzOiL2z
 qLib8bKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmP7MQAKCRAk1otyXVSH0EJTB/
 0TD3UjfYpNjaKhn5dC44wrTjGCyPDe9kWfc6lZ0NGRTSdQytu3a4uzxdE//bFBcjMSkQVaT0KfXeaY
 lBMN/AQvNjZt+CtrnKOEnv/NXYm2vXBqjBH1b5Wpfq+qcSUGdbVY002C3bP0SN6+2gmyCFTDG9xOUC
 rFOwcABtImG4WvU52PJGQhpJhIDesWTPi3jrtUWXLZkUGbHnK3Ae5QGy/9p5CvAq6Us8K2d+SW2umI
 aOQrt2w+R70mUZW4UAXfcPpM5Aj5ZWgxTKU7VrilIviErzR6Kd/9RJOkVLkJ4R9Pxi5E7XJGuCM8Q3
 9kDIlzYuxXjEXAO1eSolYqicVyTS6q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Check that values written via snd_soc_put_volsw_range() are
within the range advertised by the control, ensuring that we
don't write out of spec values to the hardware.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a0ca58ba1627..884c8fd48dab 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -519,7 +519,15 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 	unsigned int mask = (1 << fls(max)) - 1;
 	unsigned int invert = mc->invert;
 	unsigned int val, val_mask;
-	int err, ret;
+	int err, ret, tmp;
+
+	tmp = ucontrol->value.integer.value[0];
+	if (tmp < 0)
+		return -EINVAL;
+	if (mc->platform_max && tmp > mc->platform_max)
+		return -EINVAL;
+	if (tmp > mc->max - mc->min + 1)
+		return -EINVAL;
 
 	if (invert)
 		val = (max - ucontrol->value.integer.value[0]) & mask;
@@ -534,6 +542,14 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 	ret = err;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
+		tmp = ucontrol->value.integer.value[1];
+		if (tmp < 0)
+			return -EINVAL;
+		if (mc->platform_max && tmp > mc->platform_max)
+			return -EINVAL;
+		if (tmp > mc->max - mc->min + 1)
+			return -EINVAL;
+
 		if (invert)
 			val = (max - ucontrol->value.integer.value[1]) & mask;
 		else
-- 
2.30.2

