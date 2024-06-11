Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE729907805
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6444A4B;
	Thu, 13 Jun 2024 18:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6444A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295332;
	bh=8jD5Mvn4JnvcGDrCagOrGGZetRPfvF4h/uJysM7SORY=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t8Rs6my/y3eg3OfFuQmKEd1VJKztakeTruIWhQ59+Hr9ZJnfyLqAbBibSU+oTIuoL
	 gibM9ZggWZPCnGk0LqKLuOk9omjWfJ+72CtwmmQnC9J9CJpGputMXdoJriyPcQtNEY
	 NV4WTsUYI/RCv54rtPbwsz+acg34OeIjEB2t440w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6C68F80C07; Thu, 13 Jun 2024 18:05:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 784A3F8995F;
	Thu, 13 Jun 2024 18:05:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D798F80579; Tue, 11 Jun 2024 14:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0E86F8057A
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 14:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E86F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=UOVolnY7
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45BCaa6a088100;
	Tue, 11 Jun 2024 07:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718109396;
	bh=Xi+lXeC9oOPY560HM6ndHndJe00tZZ8g5JUpqfg8mMc=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=UOVolnY7O4t53trTs4QTtefjTo6wP3vqPGib4PgyPlWj8IeWuogyvRFXv90TmBdxt
	 CbJhXk6Qm63Sy+GCb2d5tsxn+/oNZGO5Xl3UABgBR5imCpyvLfI8PBYrdwqu2WVzgw
	 k8CQRQN4lRnO6Kd2QdU6HbmfL2DKT6v7nSe5ItCA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45BCaamY116897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Jun 2024 07:36:36 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Jun 2024 07:36:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Jun 2024 07:36:35 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45BCaZcw105946;
	Tue, 11 Jun 2024 07:36:35 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Tue, 11 Jun 2024 18:02:56 +0530
Subject: [PATCH v3 2/2] ASoC: ti: davinci-mcasp: Set min period size using
 FIFO config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-asoc_next-v3-2-fcfd84b12164@ti.com>
References: <20240611-asoc_next-v3-0-fcfd84b12164@ti.com>
In-Reply-To: <20240611-asoc_next-v3-0-fcfd84b12164@ti.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=8jD5Mvn4JnvcGDrCagOrGGZetRPfvF4h/uJysM7SORY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmaETOYhZakNd8NUjZCV3kKA2TKaPzDcRwgvD8M
 qVxONW06W+JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZmhEzgAKCRBD3pH5JJpx
 RSG8D/9sFwAIG62LqXVjYS9r25876+BBOXvMsmJ49kxUk+X5EKAsXm97vxjtGIlIP+88MUuc7CT
 tPKRTE+PH4RSEfGbtL7SsmRg40kUTtXMzu2aUSKF3TE1MbHYqfWX4HnxArhiHv7EL175L84kU+F
 xkHcHo5VBOA+xAvWXA/jxQdY4tLUeLDJJbe5h4d+tjr1jx04melwPcwMgt8kjOSa79xPr23VhJV
 2E6lUKdotTaonOA0ZLWuNx5vFcSehwG5zj/9lbGLzo+o5texet91cetc856dpwV5iZ7JLVIUvh8
 qVLOpNRL4kwt4zP4Ym7Sx5Or2Pg3P+DGbQ7z6tiZwR1mqWIKvIutfpeRaOByaduLu8n0jB5+/n3
 JsYMUoEH2WHlhWS6nNDu3zb7RpWoyUSP+bz1796Jyxr0j8Szf/7Lwl/2W9OnGNURwP1xmadY+TI
 IrrR20e3oM+SmgPICEV1o1P9GcodfaHr+ALuhWagi41WbQv5AxjkrXepNkpviZNnPm6S8D86j0E
 0R8ymjNggQcg6pI56GTUtqPPCI1BYTVMQOgQyP2GjV/hSTXbsbaCIwsk0HXqOr6kPRklmo/GPvp
 LcsbmBe0cRjRBBvQ1IuJWpXp9tfCEiI0nk0iPdIkz2mvr9qbLQ3MooLbJETU9TUTAAwn1xFdAzq
 ZgXHztXo8cnQtcA==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: j-luthra@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UMAS5UYOROFNOKUFWQOEMJEPK3T6VOTP
X-Message-ID-Hash: UMAS5UYOROFNOKUFWQOEMJEPK3T6VOTP
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMAS5UYOROFNOKUFWQOEMJEPK3T6VOTP/>
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

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
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

