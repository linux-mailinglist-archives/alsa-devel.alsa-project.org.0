Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8DD3B95
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 10:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E4F166F;
	Fri, 11 Oct 2019 10:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E4F166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570783811;
	bh=u3rMbNVPbF+pS/Rv2BT+32+9c5dRT3TD7Qt7Gv5QT3c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JlaIDpy2noeyGw0VVCbdEJqMzRkOORyKU/6ED6gTf81rbFB1Kx0+SrXa6uly17rFP
	 vN0u1WtmNvmLqs9CPFnmlxu1cxjSP+pnS06ti6gV+SJBKolrQXHtvvA3zsNmjBmawI
	 nGLhZ+83e+MzpRI/ch/2V2nxvwYsM4U9TG2qqcNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2986AF802DF;
	Fri, 11 Oct 2019 10:48:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A115F802BE; Fri, 11 Oct 2019 10:48:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD141F80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 10:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD141F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="PKMm3t0O"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9B8jVnm018619; Fri, 11 Oct 2019 10:48:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=dn57trJDwkZf1zTqrirKMCOuNO/LkBA2sd55GnG6NrU=;
 b=PKMm3t0OsAVAyHFmAAlnAP0bWm6GHiWzxQmRPaq1eXJD1wgLj5zdV8OvDjkWAtvgOdYR
 8ii3smM+kk5ljgpYs+HOATNvoJG1BIBTlvlNi5mpmQjjy+hfac7Q8+qFBWsipIUzfiHj
 O0ALWBKDhiIs4PSeevSExUmfbcjbPTMd5lPnaRXzk8LUox7HIeg4Ld0GtTL/O9sWaZhb
 UL0yG/OJC35RRR8oSNysU+ktBDANlgq1OsXl4f7LdpTdr0esEJfaJtfJI1RY7S67PXY1
 s6wuaRxaW+wNtVD/l8xUtM5vlCPjHopuYdMhPFBHRgcJB9yizr6MDxRfp/d7ERK2ZhpC EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vegahhecn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 10:48:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6F1710002A;
 Fri, 11 Oct 2019 10:48:19 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19BF12AF4B7;
 Fri, 11 Oct 2019 10:48:19 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct
 2019 10:48:19 +0200
Received: from localhost (10.201.21.218) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct 2019 10:48:18
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Fri, 11 Oct 2019 10:48:16 +0200
Message-ID: <20191011084816.14279-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.218]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_06:2019-10-10,2019-10-11 signatures=0
Subject: [alsa-devel] [PATCH] ASoC: stm32: spdifrx: retry synchronization in
	sync state
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When STM32 SPDIFRX is in sync state, allow multiple
synchro attempts, instead of exiting on first unsuccessful
trial. This is useful when spdif signal is not immediately
available on input. This also allows Pulseaudio to check
iec capture device availability when no signal is present.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index cd4b235fce57..3fd28ee01675 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -351,6 +351,8 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 		     SPDIFRX_CR_CUMSK | SPDIFRX_CR_PTMSK | SPDIFRX_CR_RXSTEO;
 		cr_mask = cr;
 
+		cr |= SPDIFRX_CR_NBTRSET(SPDIFRX_NBTR_63);
+		cr_mask |= SPDIFRX_CR_NBTR_MASK;
 		cr |= SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_SYNC);
 		cr_mask |= SPDIFRX_CR_SPDIFEN_MASK;
 		ret = regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
@@ -666,7 +668,7 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 	struct snd_pcm_substream *substream = spdifrx->substream;
 	struct platform_device *pdev = spdifrx->pdev;
 	unsigned int cr, mask, sr, imr;
-	unsigned int flags;
+	unsigned int flags, sync_state;
 	int err = 0, err_xrun = 0;
 
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_SR, &sr);
@@ -726,11 +728,23 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 	}
 
 	if (err) {
-		/* SPDIFRX in STATE_STOP. Disable SPDIFRX to clear errors */
+		regmap_read(spdifrx->regmap, STM32_SPDIFRX_CR, &cr);
+		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) &&
+			     SPDIFRX_SPDIFEN_SYNC;
+
+		/* SPDIFRX is in STATE_STOP. Disable SPDIFRX to clear errors */
 		cr = SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_DISABLE);
 		regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
 				   SPDIFRX_CR_SPDIFEN_MASK, cr);
 
+		/* If SPDIFRX was in STATE_SYNC, retry synchro */
+		if (sync_state) {
+			cr = SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_SYNC);
+			regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
+					   SPDIFRX_CR_SPDIFEN_MASK, cr);
+			return IRQ_HANDLED;
+		}
+
 		if (substream)
 			snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
