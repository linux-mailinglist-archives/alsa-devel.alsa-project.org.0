Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9396997F6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:54:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE736E96;
	Thu, 16 Feb 2023 15:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE736E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559297;
	bh=SAwHxQ/gSzx3tIPkoaBgffqQPABlaFMW+rxGRpZZdtU=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nB4tdlgudMxcBvQOtOt0HaTIwl5xIjo3xmN5WgCIHMQJHm4PNwfz1d30QjOA36JbX
	 aUI7WJXILRLw/waO3aVhqaBl9c3KH1QD6BSGGEc8V1rYSxT5HuLwdDsyTR2/AxyC1Q
	 J8hWZribNoSy5Ky+6iF8TSc48/+dVGpDYHZ3K0ls=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B6BF80542;
	Thu, 16 Feb 2023 15:53:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 355F8F804B4; Mon, 13 Feb 2023 19:13:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0146F800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 19:13:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0146F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256
 header.s=mailo header.b=WOxJY9do
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1676311991; bh=SAwHxQ/gSzx3tIPkoaBgffqQPABlaFMW+rxGRpZZdtU=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=WOxJY9doUQun7DHJGdNqL2N6NZJXqvNK6kLIo0oOCOiHGxZImLdYGtpTh9c8XIrrr
	 n3yBFPgJ/Qu1a2FXUAAlYspClGxVF0c1w9KaTzj0AicJo2B74IVPEw1cSN17aydPR/
	 8bTTt6oxQD/oTe6R/4QJoArYmV18fuCN6aCDPnX4=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon, 13 Feb 2023 19:13:10 +0100 (CET)
X-EA-Auth: 
 mVOtM26hiXOBErT5zUvL2AUpwMZen8W1yzH2o2fU8H6i/YJLJZUYw/Hgyue7COmu2GQyHjdRlMk9Tu+oYwHqJ9yq0UfBQuWD
Date: Mon, 13 Feb 2023 23:43:03 +0530
From: Deepak R Varma <drv@mailo.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-pcm-rpmsg: Remove unused variable
Message-ID: <Y+p9r5y9DPSJkPVf@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: drv@mailo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YXI2VK5W5TM62PMMEMOFJK2JXTMK5EOS
X-Message-ID-Hash: YXI2VK5W5TM62PMMEMOFJK2JXTMK5EOS
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:53:34 +0000
CC: Saurabh Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXI2VK5W5TM62PMMEMOFJK2JXTMK5EOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Variable ret is initialed but is never modified or used except for
returning the initial value 0. The value can be directly returned
instead and the variable definition can be dropped.
Issue identified using returnvar.cocci Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 2f310994f7ee..6614b3447649 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -140,7 +140,6 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
-	int ret = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		msg = &info->msg[TX_HW_PARAM];
@@ -184,7 +183,7 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 
 	info->send_message(msg, info);
 
-	return ret;
+	return 0;
 }
 
 static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component *component,
@@ -282,7 +281,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
-	int ret = 0;
 
 	/* Flush work in workqueue to make TX_CLOSE is the last message */
 	flush_workqueue(info->rpmsg_wq);
@@ -305,7 +303,7 @@ static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
 		dev_warn(rtd->dev, "Msg is dropped!, number is %d\n",
 			 info->msg_drop_count[substream->stream]);
 
-	return ret;
+	return 0;
 }
 
 static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
-- 
2.34.1



