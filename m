Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB27E52071F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3FC17F8;
	Mon,  9 May 2022 23:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3FC17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652133244;
	bh=pZnXDtI/OS4ccWSqzkXjaZOAjAgjMtZh0vZhjuZxnsc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QDRVQE6FwNJCSKTGrk8wSrwNXbPHwy6ntXDXlXD9zE/Lx6uZHX8w0JlVjZoKAm/fp
	 jEoWUr8IOLLThRlXJ1cQ3FGURcA1iDcncigMZJ8c+Za1KZ1qshCbCDrhmh6rf89XDi
	 4vtmGe11mnNWEeCbk0Xs0YyCprwhCyT84uhVe0+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B990F805D5;
	Mon,  9 May 2022 23:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04726F805AE; Mon,  9 May 2022 23:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B02BF8052D
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B02BF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="k2YYmBZq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249BF6xi021606;
 Mon, 9 May 2022 16:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=g5bGeQ1rPHq2n/rp9Q48HoKggmDHiEnLITCCdTT4iWo=;
 b=k2YYmBZqGz/fDYjV5OclsTXPto5Kb6Vc1sbnD1GJRmUcBaDY1xOza3Uqh44scQcHm0tc
 3G9Sep0i7LT8fWflNsigQJWiTingfoNq2rq2mLivKLl4NLlEK1ramTeVRfJKJN2pyv7e
 091sWwbiSjL7ALXwl2nGQIP4p+YjdEqAkzSjx6w9Cs2o51oqBvVSjSo/+rTSCqEZEquf
 O/PjhgmhUCwrfhjU3TzMN2ZnA3sIIV7M+ZJ9li06IPTpw1aUrlToecE8mGTrWgmMjHhB
 VjmrTWdnrqZbK34lM9ZTXARzduSs2yFbFSqjPhxQnCRj0cBnK7lTn86l11qYGp/YuSdc QQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp613jer-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:13 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9A16711D3;
 Mon,  9 May 2022 21:47:13 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 24/26] ALSA: hda: cs35l41: Add defaulted values into dsp
 bypass config sequence
Date: Mon, 9 May 2022 22:47:01 +0100
Message-ID: <20220509214703.4482-25-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: im2-oD9-T5zpqbtRUoJxV6bi-EpJRO--
X-Proofpoint-ORIG-GUID: im2-oD9-T5zpqbtRUoJxV6bi-EpJRO--
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

The config sequences for running with and without firmware and DSP
are different. The original behavior assumed that we would only
run without DSP only in the case where firmware load failed.
This meant the non-firmware sequence was written with the assumtion
that various registers would be set to their default value.
However, to support the ability to unload the firmware, the
non-firmware register sequence must be updated to update all
required registers, including values that would be defaulted,
in case the firmware sequence, which could have already run,
has changed their value.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 7e87b355b369..0eca85f3c80e 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -37,11 +37,24 @@ static efi_guid_t efi_guid = CIRRUS_EFI_GUID;
 
 static const struct reg_sequence cs35l41_hda_config[] = {
 	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3072000Hz, BCLK Input, PLL_REFCLK_EN = 1
+	{ CS35L41_DSP_CLK_CTRL,		0x00000003 }, // DSP CLK EN
 	{ CS35L41_GLOBAL_CLK_CTRL,	0x00000003 }, // GLOBAL_FS = 48 kHz
 	{ CS35L41_SP_ENABLES,		0x00010000 }, // ASP_RX1_EN = 1
 	{ CS35L41_SP_RATE_CTRL,		0x00000021 }, // ASP_BCLK_FREQ = 3.072 MHz
 	{ CS35L41_SP_FORMAT,		0x20200200 }, // 32 bits RX/TX slots, I2S, clk consumer
+	{ CS35L41_SP_HIZ_CTRL,		0x00000002 }, // Hi-Z unused
+	{ CS35L41_SP_TX_WL,		0x00000018 }, // 24 cycles/slot
+	{ CS35L41_SP_RX_WL,		0x00000018 }, // 24 cycles/slot
 	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, // DACPCM1_SRC = ASPRX1
+	{ CS35L41_ASP_TX1_SRC,		0x00000018 }, // ASPTX1 SRC = VMON
+	{ CS35L41_ASP_TX2_SRC,		0x00000019 }, // ASPTX2 SRC = IMON
+	{ CS35L41_ASP_TX3_SRC,		0x00000032 }, // ASPTX3 SRC = ERRVOL
+	{ CS35L41_ASP_TX4_SRC,		0x00000033 }, // ASPTX4 SRC = CLASSH_TGT
+	{ CS35L41_DSP1_RX1_SRC,		0x00000008 }, // DSP1RX1 SRC = ASPRX1
+	{ CS35L41_DSP1_RX2_SRC,		0x00000009 }, // DSP1RX2 SRC = ASPRX2
+	{ CS35L41_DSP1_RX3_SRC,         0x00000018 }, // DSP1RX3 SRC = VMON
+	{ CS35L41_DSP1_RX4_SRC,         0x00000019 }, // DSP1RX4 SRC = IMON
+	{ CS35L41_DSP1_RX5_SRC,         0x00000020 }, // DSP1RX5 SRC = ERRVOL
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00000000 }, // AMP_VOL_PCM  0.0 dB
 	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, // AMP_GAIN_PCM 4.5 dB
 };
-- 
2.34.1

