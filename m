Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83C93BEE1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 11:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A5EF50;
	Thu, 25 Jul 2024 11:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A5EF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721899097;
	bh=OVu+AwzZ1DFmeiVH8FBfon+bMVBCK121eB0dGILl95Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LfdIYYJZ9Jnv73XNze8lCEXfPXNwVKsvbjRP2mxYG9q3jvCe1PffQmVpxC7DySPjZ
	 1fcwlYu3vJ3ly5qxeDvverI5IUkNAzpQu+dsS/BUKAF/gclO378wsEZwO1tuwTFAar
	 dC9kDu0gwqDYG06RxUrvWfA/sDVdio7U+m8Ryt38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5753DF805B2; Thu, 25 Jul 2024 11:17:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D83D3F805B2;
	Thu, 25 Jul 2024 11:17:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0EB1F8026D; Thu, 25 Jul 2024 11:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C800F801F5
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 11:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C800F801F5
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F1351A0517;
	Thu, 25 Jul 2024 11:14:02 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CADEA1A0515;
	Thu, 25 Jul 2024 11:14:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 36826181D0FA;
	Thu, 25 Jul 2024 17:14:00 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_micfil: Differentiate register access
 permission for platforms
Date: Thu, 25 Jul 2024 16:54:54 +0800
Message-Id: <1721897694-6088-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: IYE62AC3GVAXVGWIAFBWNVEX5AE3PPFR
X-Message-ID-Hash: IYE62AC3GVAXVGWIAFBWNVEX5AE3PPFR
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYE62AC3GVAXVGWIAFBWNVEX5AE3PPFR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On i.MX9x platforms, the REG_MICFIL_FSYNC_CTRL, REG_MICFIL_VERID,
REG_MICFIL_PARAM are added, but they are not existed on i.MX8x
platforms.

Use the existed micfil->soc->use_verid to distinguish the access
permission for these platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 96a6b88d0d67..22b240a70ad4 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -855,6 +855,8 @@ static const struct reg_default fsl_micfil_reg_defaults[] = {
 
 static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case REG_MICFIL_CTRL1:
 	case REG_MICFIL_CTRL2:
@@ -872,9 +874,6 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:
-	case REG_MICFIL_FSYNC_CTRL:
-	case REG_MICFIL_VERID:
-	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:
@@ -883,6 +882,12 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_VAD0_NDATA:
 	case REG_MICFIL_VAD0_ZCD:
 		return true;
+	case REG_MICFIL_FSYNC_CTRL:
+	case REG_MICFIL_VERID:
+	case REG_MICFIL_PARAM:
+		if (micfil->soc->use_verid)
+			return true;
+		fallthrough;
 	default:
 		return false;
 	}
@@ -890,6 +895,8 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 
 static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case REG_MICFIL_CTRL1:
 	case REG_MICFIL_CTRL2:
@@ -899,7 +906,6 @@ static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:	/* Write 1 to Clear */
-	case REG_MICFIL_FSYNC_CTRL:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:	/* Write 1 to Clear */
@@ -907,6 +913,10 @@ static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_VAD0_NCONFIG:
 	case REG_MICFIL_VAD0_ZCD:
 		return true;
+	case REG_MICFIL_FSYNC_CTRL:
+		if (micfil->soc->use_verid)
+			return true;
+		fallthrough;
 	default:
 		return false;
 	}
-- 
2.34.1

