Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDA72A6E9
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 01:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDFB320C;
	Sat, 10 Jun 2023 01:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDFB320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686355190;
	bh=jMvLkIwov7jZbh3lqJ+FO/iO/HC/0tfsdn2t7EVEjZM=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ga7ZCMa/pAuan/3f13VuqT1jJlNHt5hpxyeLP3audC7jvjzk9E4gBfKgML4Oy6sy5
	 ezQsUCdMk/qOGrROyy077H/JLo3Hg9m+nRtR74MWajkpZVt2anXaeOfOV9yqg9NCnx
	 ALWDhfk0jiwPa7tw+K9uITvdT6M2lptjVP0HVMjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63FF2F80290; Sat, 10 Jun 2023 01:58:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F742F800ED;
	Sat, 10 Jun 2023 01:58:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A9FAF8016C; Sat, 10 Jun 2023 01:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B24FF800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 01:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B24FF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sAh2SbCK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18BED63E46;
	Fri,  9 Jun 2023 23:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FA3C433EF;
	Fri,  9 Jun 2023 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686355130;
	bh=jMvLkIwov7jZbh3lqJ+FO/iO/HC/0tfsdn2t7EVEjZM=;
	h=From:Date:Subject:To:Cc:From;
	b=sAh2SbCKZvgqZ2z9xNpLxHwIF14oT3AMBzndpIHBWw3fEqQZDY8uOpQz1qwk3Lq9H
	 PIV52tpibJtFUjjAjyFYYap/4JoBD/ZczfFzV56/gtGf+Pc3YlLp6Ftf9b/92hkqPC
	 mWYRVfPvGzLw7tUpVv/GuSxmHMvA531sJYZrAO2BPPLpTY3SRZzeM15QlGRpf6EBhp
	 lsqPHpF18kwKyVyBY5UsxKuM+uzCyef6ZVP2XTDTKJkEbOP9rGiKVupOvneFAMZ7T6
	 l6zwmzPX9LwYkjAy+gVFaAHGSeOjjv8tmVreMEPDIrSwm7IcyKmNgzPuXqFj1IbxhM
	 iYo9zRXVjoByQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 00:58:44 +0100
Subject: [PATCH] ASoC: max98363: Remove cache defaults for volatile
 registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-mx98363-volatile-v1-1-7acad55f5dd6@kernel.org>
X-B4-Tracking: v=1; b=H4sIALO8g2QC/x2NQQrCMBAAv1L27EJMoG79inhIk41drIlspBZK/
 27qcQaG2aCyCle4dhsoL1Kl5AbnUwdh8vnBKLExWGOd6c2AvpaAr3Ug1ztcyuw/MjNSJEo2XkK
 KBK0dfWUc1ecwHfW36PPQb+Uk6393u+/7D0/PDlx+AAAA
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jMvLkIwov7jZbh3lqJ+FO/iO/HC/0tfsdn2t7EVEjZM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkg7y4qGeZ0ttEUH1G4TkBn8qL/xLFF8O6TjCiovDf
 A6ZDAweJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZIO8uAAKCRAk1otyXVSH0HWTB/
 0YDVAaDCOTZzZFNq0p4CHfJYyaEj4kvi3mYPTolWbo1byh4Lz507K9X/je1g6ZViI5bxi80kHb2E8P
 NdtlrYX1QQiTfjQ0J7Q0k8ycTFw0Sc8PrhavlQ+a3ZGQGkYrfBP3I3vcVsHdj+FUrPBBDiAy0I1uvb
 ll4VQIlvB5D6hqU+YFmVD74NVGQzhIqMDIlA6MzKQGSwZ5APXVuXe2vxOVF4+U6bvxlqacRz0+an20
 fvRgCWwoN2VIPKHB7NbbJXBKOviAlhuP2/cF1dzY3LL2sU9TvNcm+iZyxaaaRiFY9GYvMiBDIlEMEf
 PHLS5l6zjit8veP8hTtde7QczMB3fG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: GUCDL7RR4PRQJ2IT3OBMSW2RMJGZZ3C3
X-Message-ID-Hash: GUCDL7RR4PRQJ2IT3OBMSW2RMJGZZ3C3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUCDL7RR4PRQJ2IT3OBMSW2RMJGZZ3C3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The max98363 driver provides cache defaults for a number of volatile
registers. This is not meaningful, the cache values will never be used so
at best they will just consume memory and at worst they will be used in
preference to real values from the device, remove them.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98363.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index dcce06bff756..747941d9fd00 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -15,11 +15,6 @@
 #include "max98363.h"
 
 static struct reg_default max98363_reg[] = {
-	{MAX98363_R2001_INTR_RAW, 0x0},
-	{MAX98363_R2003_INTR_STATE, 0x0},
-	{MAX98363_R2005_INTR_FALG, 0x0},
-	{MAX98363_R2007_INTR_EN, 0x0},
-	{MAX98363_R2009_INTR_CLR, 0x0},
 	{MAX98363_R2021_ERR_MON_CTRL, 0x0},
 	{MAX98363_R2022_SPK_MON_THRESH, 0x0},
 	{MAX98363_R2023_SPK_MON_DURATION, 0x0},
@@ -28,7 +23,6 @@ static struct reg_default max98363_reg[] = {
 	{MAX98363_R2040_AMP_VOL, 0x0},
 	{MAX98363_R2041_AMP_GAIN, 0x5},
 	{MAX98363_R2042_DSP_CFG, 0x0},
-	{MAX98363_R21FF_REV_ID, 0x0},
 };
 
 static bool max98363_readable_register(struct device *dev, unsigned int reg)

---
base-commit: 44c026a73be8038f03dbdeef028b642880cf1511
change-id: 20230609-asoc-mx98363-volatile-8d88f2d7cfd8

Best regards,
-- 
Mark Brown <broonie@kernel.org>

