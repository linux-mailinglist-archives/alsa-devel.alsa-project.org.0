Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A8119364
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:11:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB0B1614;
	Tue, 10 Dec 2019 22:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB0B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576012276;
	bh=69Xmydp4hCatMxbMzSZmo2uHqZc7EEbZLo1UFv7cAms=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eiAE+rqjrWOozlJhUfXNRsVpd5HvrCbdJeCA5Cgo2AFM8RVQyRLOfje7tFMKlRowP
	 K9pgdvPOliswcraEALV3sr81wXDlDHG79+XQogMp42+NydzX2MvhH74tMMdKzVXqWX
	 60ubzQoZ1KBbUp7MPGYc/J7brNCehunkt0t6dcb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCA4F80249;
	Tue, 10 Dec 2019 22:09:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3678DF80248; Tue, 10 Dec 2019 22:09:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 625A6F800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 625A6F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rEJmvFdh"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15D06246A7;
 Tue, 10 Dec 2019 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012180;
 bh=ExUDjvtm01aCy1m6j1T8rrhTrcy9sZWU0k3WFEOT2v8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rEJmvFdh7D3Faqw/zNynkcPmUu4kDNzD1pCTBwaaNoU3a53QyXtuS7pejAqMSXtrq
 gLHUtguuNCKI0lsIcZVtXCtizjzeX5Sop+wKfnBxi/KmgApiCUY8WEbTwQHTAj17Yy
 queCkgydcRpcmEda5zXdkJ8M9uesDCMg1scM2YVs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:04:03 -0500
Message-Id: <20191210210735.9077-99-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 138/350] ASoC: soc-pcm: fixup
	dpcm_prune_paths() loop continue
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit bed646dc3f7bcec91178c278deaf969cce0700a8 ]

dpcm_prune_paths() is checking widget at 2 parts.
(A) is for CPU, (B) is for Codec.
If we focus to (A) part, continue at (a) is for (1) loop. But,
if we focus to (B) part, continue at (b) is for (2) loop, not for (1).
This is bug.
This patch fixup this issue.

	static int dpcm_prune_paths(...)
	{
		...
   (1)		for_each_dpcm_be(fe, stream, dpcm) {
			...

 ^			widget = dai_get_widget(...);
 |
(A)			if (widget && widget_in_list(...))
 | (a)				continue;
 v
 ^ (2)			for_each_rtd_codec_dai(...) {
 |				widget = dai_get_widget(...);
(B)
 |				if (widget && widget_in_list(...))
 v (b)					continue;
			}
			...

Fixes: 2e5894d73789 ("ASoC: pcm: Add support for DAI multicodec")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87blui64mf.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b600d3eaaf5cd..cdce96a3051bf 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1385,6 +1385,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 	struct snd_soc_dapm_widget *widget;
 	struct snd_soc_dai *dai;
 	int prune = 0;
+	int do_prune;
 
 	/* Destroy any old FE <--> BE connections */
 	for_each_dpcm_be(fe, stream, dpcm) {
@@ -1398,13 +1399,16 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 			continue;
 
 		/* is there a valid CODEC DAI widget for this BE */
+		do_prune = 1;
 		for_each_rtd_codec_dai(dpcm->be, i, dai) {
 			widget = dai_get_widget(dai, stream);
 
 			/* prune the BE if it's no longer in our active list */
 			if (widget && widget_in_list(list, widget))
-				continue;
+				do_prune = 0;
 		}
+		if (!do_prune)
+			continue;
 
 		dev_dbg(fe->dev, "ASoC: pruning %s BE %s for %s\n",
 			stream ? "capture" : "playback",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
