Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7956948A3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 15:51:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1210208;
	Mon, 13 Feb 2023 15:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1210208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676299877;
	bh=h9DHZIWk5d+3fOFSD+01gZW510pTOFnqX663KvpUkTw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ftbDomxtIuJIbZ9TaVHbeT5sQt6X0dMvAY/Rv7TiAKSa5DkGOUMRMOETdFx4asIq9
	 K6IhSbe10fVSDA9WrcA3kKrUgVMcow7uOcNnO5YvZytYW3wuX4AKdaA1yJT9QOBGZ3
	 P4lQuyvRc7wzZadhhdGLPvAPiN58OIMGgE+XC4R8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE87F804B0;
	Mon, 13 Feb 2023 15:50:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97271F804F2; Mon, 13 Feb 2023 15:50:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 439F2F804B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 15:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 439F2F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KwtavNN8
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31D5UX5D028354;
	Mon, 13 Feb 2023 08:50:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JIw8mwY5Md9J5BihoIWcs2nfJGbKKEYCYk7xpXo8uDM=;
 b=KwtavNN8opSlhFVCAxvQt7gDRvMENHJyrOOr5yVcbih+xawgGpVKnU/BRoHaOgzm42Yq
 /vAuv8wCz7MtEFz3PmDiv4Qs2tIi+uLH6PyTQcADOXz3MHg00F1Ke2bYS91YyFP27cB/
 SDxx1hrHiF7pyl+j/+5ODoR8gMSNBzIE+8xzAJwMPO9Svj5Lq3D5mzJTuRCqQPTv23bD
 +GSDlaFno32Eut1ibghvGGtg+tErifXPGHNpdRuV4wuvarBppJPt9ONLNOrM50U87qAL
 Y6xU3VGsTuPrqoSe2snzM2qfsvPatInsJbTHPwmblIGJv+PTTM0ng2M9mcNnEkE2TAZr dg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3np9a72amh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 08:50:13 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 13 Feb
 2023 08:50:11 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Mon, 13 Feb 2023 08:50:11 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D7C0411AA;
	Mon, 13 Feb 2023 14:50:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/3] ALSA: hda: cs35l41: Correct error condition handling
Date: Mon, 13 Feb 2023 14:50:06 +0000
Message-ID: <20230213145008.1215849-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213145008.1215849-1-sbinding@opensource.cirrus.com>
References: <20230213145008.1215849-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Gg-lYgEfW_18MPAlBlaKj0GT02Ieh2fr
X-Proofpoint-ORIG-GUID: Gg-lYgEfW_18MPAlBlaKj0GT02Ieh2fr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HIOZ2OFGV25FUFAZWFJ3MR7XDXMOZVBJ
X-Message-ID-Hash: HIOZ2OFGV25FUFAZWFJ3MR7XDXMOZVBJ
X-MailFrom: prvs=7408c1a398=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIOZ2OFGV25FUFAZWFJ3MR7XDXMOZVBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Function cs_dsp_coeff_write_ctrl() can return 3 possible values:
0 - no change, 1 - value has changed and -1 - error, so positive value
is not an error.
Fixes: 7406bdbc4fb8 ("ASoC: wm_adsp: Return whether changed when writing controls")

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 5433f6227ac9..463ca06036bf 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -218,10 +218,10 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
 	mutex_unlock(&dsp->pwr_lock);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
-	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
+	if (ret == 0 || (cs_ctl->flags & WMFW_CTL_FLAG_SYS))
 		return 0;
 
 	ctl = cs_ctl->priv;
-- 
2.34.1

