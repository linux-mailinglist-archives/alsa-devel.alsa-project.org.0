Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E80798FEF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D1ADF0;
	Fri,  8 Sep 2023 21:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D1ADF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201750;
	bh=LsNGYyxSOf55GU0VS8hQG7NBZCorbOMYgTI/lqWeqOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ve3S2MbRRy7mP7TKIH3WSgdWapih1/5U2MIGD7T8WfliahNjJvPCMeWVQI+p7WE0b
	 O2AE9NJ4KCPRr4xdBOug+DGilBqZI8fIKTQYd83nWZpOgdSqzJAE33+GKNrmgEZGJ4
	 56f05Y2ESjEbPAAqZMJh6DAMjkmqUc/leAwEFp2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4943F80494; Fri,  8 Sep 2023 21:34:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A804F8047D;
	Fri,  8 Sep 2023 21:34:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C876F804F3; Fri,  8 Sep 2023 21:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD3EAF800F5;
	Fri,  8 Sep 2023 21:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD3EAF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r0jyKb2y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 521F3CE1C55;
	Fri,  8 Sep 2023 19:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D38C433BF;
	Fri,  8 Sep 2023 19:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201688;
	bh=LsNGYyxSOf55GU0VS8hQG7NBZCorbOMYgTI/lqWeqOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r0jyKb2yKOw1ugHzYs6HvM+5CLotFNX03xXhAXHO0hN0os3JkPudtwmLO6xxvAix3
	 7RGcOD/t2owWVTy7kFU8S6gq1QfadJ+v7wdcEb5cbwXl3Pg+NJrMlU2iy5sh0uUJ01
	 nGnj49859Zo89TkCcY37dali5iOiGfmmufNkjkdp1VRGfe+8VDUrXfhLwA8/b2dVOH
	 df2dIdZVG93EIEVbBaBGIH/InV4A66Tud9QhYozV6W5Ok1iwjM/6VJloLLSNGvAASJ
	 bEOf5w9Fy5dj8gMx1vzUMttJ3K7QZj1yzrwnk3dEvFYTLDxWVg/gx0IwfYd7z2Gauf
	 7nbpE3U4agFhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Yaochun Hung <yc.hung@mediatek.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 11/22] ASoC: SOF: topology: simplify code to
 prevent static analysis warnings
Date: Fri,  8 Sep 2023 15:33:55 -0400
Message-Id: <20230908193407.3463368-11-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193407.3463368-1-sashal@kernel.org>
References: <20230908193407.3463368-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B7D7WDVLHV6T7YVMO2BBPH6SGZDNG3KN
X-Message-ID-Hash: B7D7WDVLHV6T7YVMO2BBPH6SGZDNG3KN
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7D7WDVLHV6T7YVMO2BBPH6SGZDNG3KN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 55cb3dc271d81f1982c949a2ac483a6daf613b92 ]

make KCFLAGS='-fanalyzer' sound/soc/sof/intel/ reports a possible NULL
pointer dereference.

sound/soc/sof/topology.c:1136:21: error: dereference of NULL ‘w’
[CWE-476] [-Werror=analyzer-null-dereference]

 1136 |     strcmp(w->sname, rtd->dai_link->stream_name))

The code is rather confusing and can be simplified to make static
analysis happy. No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Link: https://lore.kernel.org/r/20230731213748.440285-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 872e44408298f..e7305ce57ea1f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1086,16 +1086,17 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 {
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
+	const char *sname = w->sname;
 	struct snd_soc_dai *cpu_dai;
 	int i;
 
-	if (!w->sname)
+	if (!sname)
 		return;
 
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
-		    strcmp(w->sname, rtd->dai_link->stream_name))
+		    strcmp(sname, rtd->dai_link->stream_name))
 			continue;
 
 		switch (w->id) {
-- 
2.40.1

