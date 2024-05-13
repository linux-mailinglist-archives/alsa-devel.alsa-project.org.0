Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7E8C463D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 19:38:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DBA81DF;
	Mon, 13 May 2024 19:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DBA81DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715621903;
	bh=Ze4YnXQ9+Ruy/YlREfo5kfMqxowQDPvZTQDp2yrWKWk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZdR0Q0+wu4nhuwCNjHS6Iz25LPDWnMx5LKgCgLQ3MjBBH0LtZaxXRziNkrj379F8l
	 gVmFQGcoKenk4gxGNTUeQB6Odu182xaZxhmaiLcAFaqJxyO9eTiNxMWHXw1bUrSVRO
	 tycR82vW9r1R0/0rDCfU1T3RasBeUL6M+Thf+p1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA583F8058C; Mon, 13 May 2024 19:37:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1BB6F80587;
	Mon, 13 May 2024 19:37:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AFDAF804FB; Mon, 13 May 2024 19:37:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from msa.smtpout.orange.fr (smtp-76.smtpout.orange.fr
 [80.12.242.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5BF0F800E2;
	Mon, 13 May 2024 19:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BF0F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=NMO3deRZ
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 6ZcDs0lh7ME2z6ZcDsL7zL; Mon, 13 May 2024 19:37:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715621857;
	bh=mUQBjk+s3SNdJ92QJBlXrlaeh+q14MQJ4sqID/f3sz8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NMO3deRZtCm5rDDebG9M7A7LwCm4uV4f+sAz704wyybGDhXxX8Or/waFg25iNWZ48
	 KC88iB5AnZCkLGd4/ejfRKI6lDxfivEGiy42vwPOPvgV7EOAtmconRrWNG5abdIKP1
	 NhsMyrL4lniKsWUSNxIvFs44Y9rs/14Zmq6w/TRgJpkkwBsrPrz0ETpc6LzgxDoU4A
	 5s61tRwo132xm/WP5fXuHOWw2iZA5No1lav/OhJBGhdX3V9m9hsTOwdjjLwMw7KTb9
	 a3t18nt/SSvlN5CCYR30dwt96vmTn2rkH/NYZSHs22JRiOBs44XiGLVgNDJTCrF7rQ
	 sttZOFEvI3jxw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 May 2024 19:37:37 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	daniel.baluta@nxp.com
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/6] ASoC: topology: Constify an argument of
 snd_soc_tplg_component_load()
Date: Mon, 13 May 2024 19:37:20 +0200
Message-ID: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NATRXP3YB6HDA7MARAAHFM7H6CRPWBFU
X-Message-ID-Hash: NATRXP3YB6HDA7MARAAHFM7H6CRPWBFU
X-MailFrom: christophe.jaillet@wanadoo.fr
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_tplg_component_load() does not modify its "*ops" argument. It
only read some values and stores it in "soc_tplg.ops".

This argument and the ops field in "struct soc_tplg" can be made const.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/sound/soc-topology.h | 2 +-
 sound/soc/soc-topology.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index f055c6917f6c..1eedd203ac29 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -178,7 +178,7 @@ static inline const void *snd_soc_tplg_get_data(struct snd_soc_tplg_hdr *hdr)
 
 /* Dynamic Object loading and removal for component drivers */
 int snd_soc_tplg_component_load(struct snd_soc_component *comp,
-	struct snd_soc_tplg_ops *ops, const struct firmware *fw);
+	const struct snd_soc_tplg_ops *ops, const struct firmware *fw);
 int snd_soc_tplg_component_remove(struct snd_soc_component *comp);
 
 /* Binds event handlers to dynamic widgets */
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 90ca37e008b3..b00ec01361c2 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -73,7 +73,7 @@ struct soc_tplg {
 	int bytes_ext_ops_count;
 
 	/* optional fw loading callbacks to component drivers */
-	struct snd_soc_tplg_ops *ops;
+	const struct snd_soc_tplg_ops *ops;
 };
 
 /* check we dont overflow the data for this control chunk */
@@ -2334,7 +2334,7 @@ static int soc_tplg_load(struct soc_tplg *tplg)
 
 /* load audio component topology from "firmware" file */
 int snd_soc_tplg_component_load(struct snd_soc_component *comp,
-	struct snd_soc_tplg_ops *ops, const struct firmware *fw)
+	const struct snd_soc_tplg_ops *ops, const struct firmware *fw)
 {
 	struct soc_tplg tplg;
 	int ret;
-- 
2.45.0

