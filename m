Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCCA4B6D07
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 14:08:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51B6E1722;
	Tue, 15 Feb 2022 14:07:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51B6E1722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644930509;
	bh=fYYbK/OBz8MJd2YyRGCIlHWQmx8wNvnc38HpuBoRA8o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lnbpa4SdGTIjWi+bpFCfpKfYxfSocpyjuHbrOwfkaQQqAacvGCdo9ZYiVX9lwYgVN
	 Aysi0ZtyeGmCzvcLRmUGmTZYUXddJN9LfiND9TFS+we0am/IoV78+HAz+H6hhTr+8X
	 ClW8KkrZtPsYV7qTH8JxIY1pbSJorda8FYusl5Ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B93A1F800D8;
	Tue, 15 Feb 2022 14:07:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEB50F80132; Tue, 15 Feb 2022 14:07:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D62B8F80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 14:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D62B8F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="wuy6q9KE"
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 13E8383886;
 Tue, 15 Feb 2022 14:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644930434;
 bh=+5XeOXiBdY2HU+UPOtxSSMLjN9PVOQsjLd31SIQQPRY=;
 h=From:To:Cc:Subject:Date:From;
 b=wuy6q9KEzXzN+3V0tBAFURaiIRYty2mr9O3ATEWd0ACAEIlr/8mLwf4cloXftAni9
 eJrBFJDLCFmxIlllZQojiI+yTSYnCA9jx2LYZrTMD9FAav10LRkkxTcoh8mJGBhMWl
 ryXncxykBHtMho+d30d5kDIDfK0sgYCxbZ7fPQbIeRSVgdAh7vuvmSUsKu6uaz0kFU
 ABZu0nGGhEsTqH2lsbo6Mg4IyTOfHEGwSfSlLC9yM+Em2l+4S6Bc4TnmME74Fbd2o1
 PG1ykbOQ/yKtR7yu6gcgZFtu8rdzvRky/9y3zsx5kx3Bo/V7X3vJ/JQvmZ17v/TtrK
 m4EGdLsjCRMHw==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: ops: Shift tested values in snd_soc_put_volsw() by +min
Date: Tue, 15 Feb 2022 14:06:45 +0100
Message-Id: <20220215130645.164025-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
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

While the $val/$val2 values passed in from userspace are always >= 0
integers, the limits of the control can be signed integers and the $min
can be non-zero and less than zero. To correctly validate $val/$val2
against platform_max, add the $min offset to val first.

Fixes: 817f7c9335ec0 ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index f24f7354f46fe..6389a512c4dc6 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -317,7 +317,7 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 		mask = BIT(sign_bit + 1) - 1;
 
 	val = ucontrol->value.integer.value[0];
-	if (mc->platform_max && val > mc->platform_max)
+	if (mc->platform_max && ((int)val + min) > mc->platform_max)
 		return -EINVAL;
 	if (val > max - min)
 		return -EINVAL;
@@ -330,7 +330,7 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 	val = val << shift;
 	if (snd_soc_volsw_is_stereo(mc)) {
 		val2 = ucontrol->value.integer.value[1];
-		if (mc->platform_max && val2 > mc->platform_max)
+		if (mc->platform_max && ((int)val2 + min) > mc->platform_max)
 			return -EINVAL;
 		if (val2 > max - min)
 			return -EINVAL;
-- 
2.34.1

