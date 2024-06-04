Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63A9077D4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D1C1945;
	Thu, 13 Jun 2024 18:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D1C1945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294830;
	bh=eMhqaoNHJ3tHzDi6VNuN8VlXihGxJv2kvkvNe0CppiA=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UqBCwqeHizP8AvBw1WKsIqSbdjKSaO8YL7h0ET5XpMPb20/9Cyxh5jpbS2blNxDHQ
	 CGO3fukLSV3h5+ZfgM0P9HGIok530adq2ZFXO11P/pc7inz6hhk6N+hBotte7F5pn9
	 lR7rXjqUo24G/86lu2Yuuv6RYzBBKvqCYSHHcKJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D598F89717; Thu, 13 Jun 2024 18:02:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F915F896EF;
	Thu, 13 Jun 2024 18:02:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D644FF802DB; Tue,  4 Jun 2024 12:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D884F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 12:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D884F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=H5+cpgZu
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454A2FYQ119449;
	Tue, 4 Jun 2024 05:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717495335;
	bh=aiAJG9A2lXmBO3D4+H7SDy5jGWfjtvudxc1KcNRhPHk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=H5+cpgZuX9iIF8gQ29GBYHlxuEoSJBKpxwMw65IlghMRnwRtDt/2k6w29SR6SH6IJ
	 SDmZl4+ak9jmnAeUU1vPzchcCtRFhEioOD9xfH/CJNEErOtfJHzsOTlDvPZlBoYSA8
	 xOadELTDAisheXxjqbKZj3QnKSs5vM5OHm8GX9MU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454A2FtQ030398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:02:15 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:02:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:02:15 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454A2E92130460;
	Tue, 4 Jun 2024 05:02:15 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Tue, 4 Jun 2024 15:31:51 +0530
Subject: [PATCH 2/2] ASoC: ti: davinci-mcasp: Set min period size using
 FIFO config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240604-asoc_next-v1-2-e895c88e744d@ti.com>
References: <20240604-asoc_next-v1-0-e895c88e744d@ti.com>
In-Reply-To: <20240604-asoc_next-v1-0-e895c88e744d@ti.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark
 Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=eMhqaoNHJ3tHzDi6VNuN8VlXihGxJv2kvkvNe0CppiA=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmXuYiUfBPv3bkEGL189j5N4WDta+evgx+wbTGN
 ls6nNkcMy2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZl7mIgAKCRBD3pH5JJpx
 RQcGEACl67P2gaXQhns4uPnJR7XAkyL6OS3dRQI2hPO7SoIm6YC7egACmjuxKB66aDznzzL7ZJ9
 bI0xTe08wlmTQe59AfOsg9TrlRS4X1/YToBjsZylpnehntLU2bgozZyoKOFFcePo6u9qMMFukHg
 T19ORJPmHgkgMJMwdSGsYXfi/Tp/kNbk47+OqEUFauOPm8omuppWRceZFgTt66k5N+KqL2cIwMq
 bGZvBGSxMgRT+3rt6VwWRhbGmKOjmWXp1Z+hsgMn40wX7nPOIibeg7TDW1/EkyCPIE5567wK2ZF
 mOkox9pDVgyheyzPNC7dDnPDtuaB5cl5xIHf7mWfOWNL/+1uZvFBd5CdFr0sY9slvz91LioUJ09
 f4W+2ctMUxd3FVcygAT4MtwwLzB2b+hYQuvayD3SS6O6HMbzQWv/mpkGyZ7efLqjTAyd5msOboK
 0BdW9wNbOhdiF0vSG79JH/jTNP6Pc/g+4eGJ5N3FKwsHJb0EVdXYlArTd5PEKx0SnbXZO6goGvW
 5xlkXLX8Xm4FYqmX3qFyIUIPIGN3bY2JOuNZVphHzH/z4U4AHtb4bLDcbtkZcYMKhyGw7oQpdfp
 iablLtsJXQYzJ1fHqzBjMYDnso6V4PQ/5dpNeHjoUadv68d4Lzap6zxirlewY23jjyttxTf0F6U
 QLKsgHoBfRThCiQ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JQLP4RJAPPTO2RQMLRDXGZXI2VZZOJEG
X-Message-ID-Hash: JQLP4RJAPPTO2RQMLRDXGZXI2VZZOJEG
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:02:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQLP4RJAPPTO2RQMLRDXGZXI2VZZOJEG/>
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
index 1e760c315521..2a53fb7e72eb 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -70,6 +70,7 @@ struct davinci_mcasp_context {
 struct davinci_mcasp_ruledata {
 	struct davinci_mcasp *mcasp;
 	int serializers;
+	u8 numevt;
 };
 
 struct davinci_mcasp {
@@ -1470,12 +1471,13 @@ static int davinci_mcasp_hw_rule_format(struct snd_pcm_hw_params *params,
 static int davinci_mcasp_hw_rule_min_periodsize(
 		struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
 {
+	struct davinci_mcasp_ruledata *rd = rule->private;
 	struct snd_interval *period_size = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
 	struct snd_interval frames;
 
 	snd_interval_any(&frames);
-	frames.min = 64;
+	frames.min = rd->numevt;
 	frames.integer = 1;
 
 	return snd_interval_refine(period_size, &frames);
@@ -1516,6 +1518,9 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 		if (mcasp->serial_dir[i] == dir)
 			max_channels++;
 	}
+	ruledata->numevt = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+				   mcasp->txnumevt :
+				   mcasp->rxnumevt;
 	ruledata->serializers = max_channels;
 	ruledata->mcasp = mcasp;
 	max_channels *= tdm_slots;
@@ -1591,7 +1596,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 
 	snd_pcm_hw_rule_add(substream->runtime, 0,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-			    davinci_mcasp_hw_rule_min_periodsize, NULL,
+			    davinci_mcasp_hw_rule_min_periodsize, ruledata,
 			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
 
 	return 0;

-- 
2.43.0

