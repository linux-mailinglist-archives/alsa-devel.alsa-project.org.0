Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D3798FB0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD3FDE5;
	Fri,  8 Sep 2023 21:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD3FDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201649;
	bh=LtluMiPiAvNOgrlFsorMjnATBMItZh1rE0cJ9Uf6TLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cOKft8N67BoSUJjJjzzmx87qAZEIMrBIUR3cr/r622jCimC4EvTPCLX0+U/lPghls
	 h2fCjwMajLPdmbVcLy1PjIxO7sb+Y52UkbGiCg/yZ8gbJVR+spb1Lwe4hXUNZg+9w5
	 WSUhWflUwGfxTBv56cve3hyZJWdUVZ8+YU0YYlW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4A79F80431; Fri,  8 Sep 2023 21:33:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5426DF80494;
	Fri,  8 Sep 2023 21:33:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F003F80537; Fri,  8 Sep 2023 21:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F270F800F5;
	Fri,  8 Sep 2023 21:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F270F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z0/VDig3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 098E3B821D4;
	Fri,  8 Sep 2023 19:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E064C433C9;
	Fri,  8 Sep 2023 19:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201584;
	bh=LtluMiPiAvNOgrlFsorMjnATBMItZh1rE0cJ9Uf6TLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z0/VDig3T+E8aCLIqotHkOVBb8PLc4ew1h4J6YtiTQS3o2rLJywhCDEdd3gMafa+e
	 fawsBhdv2gAm2JGlH9Dp/rmcO4M5i+rZp3z+muCOdDJJ2mpwkfy210tgPXW+zJv/IM
	 bfiM9byhXdb/nwZHI3Wr8VhhQJQM1dNMgty9rUYp/iDtvb8PEhXdaCedm4ajxzugoy
	 3wS7AMKMIieaQZdcqUhUqLe0QJ4p5ID8UJmutB44j/GeFKCJWojPGUoT6cnf0ElI1c
	 7qK0grvyZt6o+uTW+H/ZOGf3SQT3t5po3t3podiSoioO6NVOUMzoMkQuHUiJcyD/4o
	 34QKTWx03sqHQ==
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
Subject: [PATCH AUTOSEL 6.4 15/31] ASoC: SOF: topology: simplify code to
 prevent static analysis warnings
Date: Fri,  8 Sep 2023 15:31:44 -0400
Message-Id: <20230908193201.3462957-15-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193201.3462957-1-sashal@kernel.org>
References: <20230908193201.3462957-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TCTJF2IDSODGSTSMBGQUM777QTMZAYWE
X-Message-ID-Hash: TCTJF2IDSODGSTSMBGQUM777QTMZAYWE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TCTJF2IDSODGSTSMBGQUM777QTMZAYWE/>
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
index f160dc454b448..8e6f6148f0a07 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1117,10 +1117,11 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 {
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
+	const char *sname = w->sname;
 	struct snd_soc_dai *cpu_dai;
 	int i, stream;
 
-	if (!w->sname)
+	if (!sname)
 		return;
 
 	if (w->id == snd_soc_dapm_dai_out)
@@ -1133,7 +1134,7 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
-		    strcmp(w->sname, rtd->dai_link->stream_name))
+		    strcmp(sname, rtd->dai_link->stream_name))
 			continue;
 
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-- 
2.40.1

