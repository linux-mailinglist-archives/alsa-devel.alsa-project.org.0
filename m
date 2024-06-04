Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C08FAE81
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 11:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC7CE76;
	Tue,  4 Jun 2024 11:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC7CE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717492553;
	bh=UBSE8GEPqxZdSjgPlJVW65yM+v8/dSAUhsYRVqOb1Jg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gLRrgryyEnWQPvIiDcuTc4RZOu2YKoyJrgwTKG7EspZ/2fmwHtnpBmD2Vb7iv+NHn
	 NwOxfA3DfkSTEua45pNLCXpjUw/ql24rzd4PvzF7XCISCHppAvAhZkUg2iPKCIQvPd
	 Qukfh81OoZ4yONnY/eZHRbrCkWSdpSLIglsHW9/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61A57F8051D; Tue,  4 Jun 2024 11:15:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9B9EF8051E;
	Tue,  4 Jun 2024 11:15:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF0DEF802DB; Tue,  4 Jun 2024 11:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 809DBF80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 11:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 809DBF80088
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B63131A1E06;
	Tue,  4 Jun 2024 11:15:05 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 54FFA1A1DCB;
	Tue,  4 Jun 2024 11:15:05 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9DE281820F76;
	Tue,  4 Jun 2024 17:15:03 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: dmaengine_pcm: terminate dmaengine before synchronize
Date: Tue,  4 Jun 2024 16:58:57 +0800
Message-Id: <1717491537-9033-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: BMGOOMQ7ULMJEA35DK2HS5OUHH7SH7KG
X-Message-ID-Hash: BMGOOMQ7ULMJEA35DK2HS5OUHH7SH7KG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMGOOMQ7ULMJEA35DK2HS5OUHH7SH7KG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When dmaengine supports pause function, in suspend state,
dmaengine_pause() is called instead of dmaengine_terminate_async(),

In end of playback stream, the runtime->state will go to
SNDRV_PCM_STATE_DRAINING, if system suspend & resume happen
at this time, application will not resume playback stream, the
stream will be closed directly, the dmaengine_terminate_async()
will not be called before the dmaengine_synchronize(), which
violates the call sequence for dmaengine_synchronize().

This behavior also happens for capture streams, but there is no
SNDRV_PCM_STATE_DRAINING state for capture. So use
dmaengine_tx_status() to check the DMA status if the status is
DMA_PAUSED, then call dmaengine_terminate_async() to terminate
dmaengine before dmaengine_synchronize().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/core/pcm_dmaengine.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 12aa1cef11a1..7346c993a067 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -358,6 +358,12 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
 int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
+	struct dma_tx_state state;
+	enum dma_status status;
+
+	status = dmaengine_tx_status(prtd->dma_chan, prtd->cookie, &state);
+	if (status == DMA_PAUSED)
+		dmaengine_terminate_async(prtd->dma_chan);
 
 	dmaengine_synchronize(prtd->dma_chan);
 	kfree(prtd);
@@ -378,6 +384,12 @@ EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close);
 int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
 {
 	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
+	struct dma_tx_state state;
+	enum dma_status status;
+
+	status = dmaengine_tx_status(prtd->dma_chan, prtd->cookie, &state);
+	if (status == DMA_PAUSED)
+		dmaengine_terminate_async(prtd->dma_chan);
 
 	dmaengine_synchronize(prtd->dma_chan);
 	dma_release_channel(prtd->dma_chan);
-- 
2.34.1

