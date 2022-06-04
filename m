Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C379053D679
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jun 2022 12:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F2D6187A;
	Sat,  4 Jun 2022 12:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F2D6187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654340116;
	bh=KVlbmKFLv8UzCF9JnjTyDCzs29jOBCJQy6PD8U6yVnc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NH3UYue7lwTwRxXTAAQxTMM+SXu/o5YG5sWWJc8ZvBHDziAdCs4vcDxUUXruOt79/
	 N9sEVhScMfT5gb+j5OTRczi+iBU5+MaC1kD6kcVv8j+RfMeQ/dtq0+FH3CoEWM595m
	 5l8Yg5s5OONVs3Zr3ofHHpU/17ynAkSmNAftNTvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8E9DF800E8;
	Sat,  4 Jun 2022 12:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAEF8F800E8; Sat,  4 Jun 2022 12:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8102F800E8
 for <alsa-devel@alsa-project.org>; Sat,  4 Jun 2022 12:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8102F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BXKryQFq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66F9CB802C5;
 Sat,  4 Jun 2022 10:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320B2C385B8;
 Sat,  4 Jun 2022 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654340053;
 bh=KVlbmKFLv8UzCF9JnjTyDCzs29jOBCJQy6PD8U6yVnc=;
 h=From:To:Cc:Subject:Date:From;
 b=BXKryQFq55XZnnbwtQq80AshUsCCNv9SoLfjlzDIW0r/TxrBZWL/X6mWFkmrwmoyR
 v2E2UJEKMqGm/E+zGG4A5RKo1beH5dce+1kvoqxkgt0hHTFQ2msdBjqCLeP8RwT84k
 6ujiQ8qIYvV5Om+9OPDiyWAcGeZfaRwJqHEktqy9RRKCwW0f9SrkuGcizHeaNWKXZJ
 Y886YGE7ZvOAC+ejO6C2wT8RA7AhW14owQRC9aMJBSvJIrABHtUKSvrf/pg0GNEQ5y
 Rza/hfmogt4Zh9/cZk0VkjdCjWqVGfvCB8qLwdALU8F/XkIo2nCf1CM0tI75wpWlIO
 Kp3nXB9E+pJlg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ops: Fix boolean/integer detection for simple controls
Date: Sat,  4 Jun 2022 11:54:07 +0100
Message-Id: <20220604105407.4055294-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; h=from:subject;
 bh=KVlbmKFLv8UzCF9JnjTyDCzs29jOBCJQy6PD8U6yVnc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimzmMbsJHSElp7cIgj6n6EarmIELRsXYh+wzoaznh
 9nYMAbiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYps5jAAKCRAk1otyXVSH0FC8B/
 9OtMQ+cYwG8RQo3xH5BJOBhV+9rWtXiGBEwZAG716Q6ZkxfYY84tEUXOP3bGqGHLJNkds8Cu08phU7
 6/NVQ4LzzXqfMjWBAIgRebWWPl9owcofujRhnv5j1S4m07ixwgX6WVY9OAkQNYqTbiG2slIg8BmHvY
 u9rB7UWAnP5HnnA0ML0AOkDDQy6dRxrFYQjXxLgMiR6wELprjVtKb6il283XiTRzejE9ruP7uVWSkC
 xcUEeZ9AJ4dA35+xJ3gXqURsbiDZ1vA8VVspViN945X9YIz/+Q0Bp4qdeqUV7cm6Rf5W616lFwnjtd
 PbrB/fpd4kZE9Pb/ZnLhw47+Pd32OX
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

The standard snd_soc_info_volsw() detects if a control is a volume control
and needs to be reported as an integer even if it only has two values by
looking for the string " Volume" in the control name. This results in false
positives if the control has a name like "HP Volume Ramp Switch" since any
" Volume" is matched, not just a trailing one. Fix this by making sure that
we only match at the end of the control name.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index e11109dcaa50..0267e39de2a8 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -176,13 +176,21 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	const char *vol_string = NULL;
 	int max;
 
 	max = uinfo->value.integer.max = mc->max - mc->min;
 	if (mc->platform_max && mc->platform_max < max)
 		max = mc->platform_max;
 
-	if (max == 1 && !strstr(kcontrol->id.name, " Volume"))
+	/* Even two value controls ending in Volume should always be integer */
+	if (max == 1) {
+		vol_string = strstr(kcontrol->id.name, " Volume");
+		if (vol_string && strcmp(vol_string, " Volume"))
+			vol_string = NULL;
+	}
+
+	if (!vol_string)
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
 	else
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-- 
2.30.2

