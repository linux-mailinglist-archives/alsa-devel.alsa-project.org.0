Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED15B889D0A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 12:35:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CB2211E;
	Mon, 25 Mar 2024 12:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CB2211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711366509;
	bh=icR7OHWR6JquUBWLnsXFZ4wZBk0R1ldLo6TRqTFJlQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dhRHuciHt//Ism/67G1gn9Z/uqWrN8reyrPFBjUQedxVMHnwpfEK2jBnehJb7y58u
	 NGF5QXZ8r5EqAnk3ZDRJ6hJz3CX5Bz1KA/Dhdh7LJxEY3Vz4uQZ7djxUu768YesFQi
	 5CZLTKngYxGFhnGve2Ux2UGZIAMsfZu/8SOgvmWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F353AF805BB; Mon, 25 Mar 2024 12:34:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B369F805F7;
	Mon, 25 Mar 2024 12:34:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF829F80236; Mon, 25 Mar 2024 12:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC9A7F8025F
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 12:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9A7F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XPUzT90z
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P3P0Pm021761;
	Mon, 25 Mar 2024 06:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=BmoExtKFAN5u65MmJlIEn9jHB6pkbaLrjdksSjCZXAo=; b=
	XPUzT90ziie8P3UpHwidJ8F+M42nrVaSSgstdx5YSlqVnA0g6QvoO7kIfSH+r0G5
	XpDZPbkKlIvz28hvgPhsRhuJ5PnWavxRyrKVJcpFv51/z81ref6cEsALbirzK/Lv
	elmKGi09yAxsJ578DNMjSwHZ8K+UfBG7wt8oR66fTiyaVZy/hO/uDBoDZMZjRYqF
	Bi6P/3mxWt40owyWO/tDyQ94WIU0ksjGMIN9/cGMc1DxX5+ZoNwBWNiU4giLe5bf
	S/sKnJrUL/C79TtM3WqfjvatfGBlT9wE64VA/UKsYk74k31OSub613dMpMiyfTxU
	mhPiBXmNZzbbDQk8p4f7vQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyb6v1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:31:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 11:31:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 25 Mar 2024 11:31:27 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4559E820257;
	Mon, 25 Mar 2024 11:31:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 3/5] ALSA: hda: hda_cs_dsp_ctl: Use
 cs_dsp_coeff_lock_and_[read|write]_ctrl()
Date: Mon, 25 Mar 2024 11:31:25 +0000
Message-ID: <20240325113127.112783-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325113127.112783-1-rf@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TKkn3GQ3V7LBpnkd5hqcKvTKUDr4AgaY
X-Proofpoint-GUID: TKkn3GQ3V7LBpnkd5hqcKvTKUDr4AgaY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XH4VVPLLGVOQESRCC7FE5GPFJAXE2C36
X-Message-ID-Hash: XH4VVPLLGVOQESRCC7FE5GPFJAXE2C36
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XH4VVPLLGVOQESRCC7FE5GPFJAXE2C36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Using the cs_dsp_coeff_lock_and_[read|write]_ctrl() wrappers tidies
the calling functions as it does not need to manage the DSP pwr_lock.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 463ca06036bf..725544d81941 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -51,13 +51,8 @@ static int hda_cs_dsp_coeff_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_v
 	struct hda_cs_dsp_coeff_ctl *ctl = (struct hda_cs_dsp_coeff_ctl *)snd_kcontrol_chip(kctl);
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	char *p = ucontrol->value.bytes.data;
-	int ret = 0;
-
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
-	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, p, cs_ctl->len);
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
-	return ret;
+	return cs_dsp_coeff_lock_and_write_ctrl(cs_ctl, 0, p, cs_ctl->len);
 }
 
 static int hda_cs_dsp_coeff_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
@@ -65,13 +60,8 @@ static int hda_cs_dsp_coeff_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_v
 	struct hda_cs_dsp_coeff_ctl *ctl = (struct hda_cs_dsp_coeff_ctl *)snd_kcontrol_chip(kctl);
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	char *p = ucontrol->value.bytes.data;
-	int ret;
-
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, p, cs_ctl->len);
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
-	return ret;
+	return cs_dsp_coeff_lock_and_read_ctrl(cs_ctl, 0, p, cs_ctl->len);
 }
 
 static unsigned int wmfw_convert_flags(unsigned int in)
-- 
2.39.2

