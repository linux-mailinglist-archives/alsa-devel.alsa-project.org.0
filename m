Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E19077F8
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E1D0DF9;
	Thu, 13 Jun 2024 18:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E1D0DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295210;
	bh=WPF2iC1SV8AsqNd6SPxTttV/JMzPbLAHKzCU/mAhLq0=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WzEX2nAgySjfLje3MZOe744LXz8TjBtKAmHYLuHqr5SZlWvMokTPyRgvw/UdkILp6
	 VimRZggAx7luiXNNHT9T90DHxYPcRezKOQRn9yk0t18/oajBVTz9idaJbvsfYrFq5M
	 FrUmoXG6tOFDBYpoSg3Jdop0Rb1VLcFpeJmrjCtI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 270CEF8065E; Thu, 13 Jun 2024 18:04:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80C78F808C7;
	Thu, 13 Jun 2024 18:04:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB419F80448; Mon, 10 Jun 2024 12:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99C9DF800D0
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 12:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C9DF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=glvYyz/W
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AAuTbW009009;
	Mon, 10 Jun 2024 05:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718016989;
	bh=m28Tjms8EG/D+LF08iHzhc9HsItx6aYa/0oUcN3SEgw=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=glvYyz/WsEiU2YwVpFf87uAP78t6GUf9L2Se+jmkDNr4kQo/ZCFeOrJxsKFI89JUV
	 DxtbIKX0l8c5qpbDycH5aBWq/mjFRGNQjewNkvy7hagW8zzHZvcc7Gj418jJREIRT7
	 rteukvMIe6O5cRAT6kKlTBAtSamQwF6C2J/LFlqc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AAuTil004949
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 05:56:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 05:56:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 05:56:29 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AAuSlc110545;
	Mon, 10 Jun 2024 05:56:28 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Mon, 10 Jun 2024 16:26:01 +0530
Subject: [PATCH v2 2/2] ASoC: ti: davinci-mcasp: Set min period size using
 FIFO config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240610-asoc_next-v2-2-b52aaf5d67c4@ti.com>
References: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
In-Reply-To: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Devarsh Thakkar <devarsht@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Jayesh Choudhary <j-choudhary@ti.com>, Jai
 Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=WPF2iC1SV8AsqNd6SPxTttV/JMzPbLAHKzCU/mAhLq0=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmZtvYRZUS1YnZ7wXULBNwFYahVxcCh5M0cRfMj
 OW3gz+xT/mJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZmbb2AAKCRBD3pH5JJpx
 RSYnD/9/UHlozo/st4AN88B7W06HOUrbfDOElMmFCyGwQhRUERSoD1E2xe2iv2HlZERyxH6qOZx
 qc0y3ynQllWf22HxB/v0xGVUk0IVEcDKpx+jHP8/cjeOHdB3gCd/Qbpu3LCFZxGb7P4AFE1qgWW
 y/7RDNYKXnSTb6fhMNLPEeweIGu7T9kxY5Awp6bXAyzoV3KxAtZ4dp4YzfZUOxnUbHgaIxjmb6I
 Sc7sIayOVVg32WbWPElFNlN3ZWPK0dhfXWWVem1Vs+iy9plJ5CW9R9VW/3+lfFS0L7Tvv+Rdegx
 0VQYg05UCkEt38uAgJpSiJV7+x758nQmnI21Th6eGaWS8QN5aiK5fNdpjCbtuc0Opuy+QBQyfqE
 BpoUsTCZK6uK9heI4BU+rrHHa7+TXYeoz9b4EUGJs4sX882Z3ViB4gx+VFIdBkX5WFpY8owP/L/
 Vu8nSk8vnp2BN8djvj5Gwp6AHqIf3b3Ninue++dyi06rNK9xp/oSHnEFYztNU7OVFBF+nbuDhut
 f+vcCRT2nTB9eQowOLFAMUPMoMKNOjx2ePNGyZpixgTuQdgaswm1KPaPzA7K+eV+Jnro3fNb6Z6
 KP6hz9b2I8UXOsAMfRstRUSkxt44is9Vv/DeydzFataw14QLjiXCoxWfn1FHuUnR+91Tw81Vgn+
 CNDOd3qHWIqvCSA==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PLQCOEAY2ZFK5BQHDIOH4H2DA5CODWN7
X-Message-ID-Hash: PLQCOEAY2ZFK5BQHDIOH4H2DA5CODWN7
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:04:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLQCOEAY2ZFK5BQHDIOH4H2DA5CODWN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The minimum period size was enforced to 64 as older devices integrating
McASP with EDMA used an internal FIFO of 64 samples.

With UDMA based platforms this internal McASP FIFO is optional, as the
DMA engine internally does some buffering which is already accounted for
when registering the platform. So we should read the actual FIFO
configuration (txnumevt/rxnumevt) instead of hardcoding frames.min to
64.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 1e760c315521..2b1ed91a736c 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1472,10 +1472,11 @@ static int davinci_mcasp_hw_rule_min_periodsize(
 {
 	struct snd_interval *period_size = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+	u8 numevt = *((u8 *)rule->private);
 	struct snd_interval frames;
 
 	snd_interval_any(&frames);
-	frames.min = 64;
+	frames.min = numevt;
 	frames.integer = 1;
 
 	return snd_interval_refine(period_size, &frames);
@@ -1490,6 +1491,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	u32 max_channels = 0;
 	int i, dir, ret;
 	int tdm_slots = mcasp->tdm_slots;
+	u8 *numevt;
 
 	/* Do not allow more then one stream per direction */
 	if (mcasp->substreams[substream->stream])
@@ -1589,9 +1591,12 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
+	numevt = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+			 &mcasp->txnumevt :
+			 &mcasp->rxnumevt;
 	snd_pcm_hw_rule_add(substream->runtime, 0,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-			    davinci_mcasp_hw_rule_min_periodsize, NULL,
+			    davinci_mcasp_hw_rule_min_periodsize, numevt,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 
 	return 0;

-- 
2.43.0

