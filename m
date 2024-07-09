Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53892BFB1
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 18:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D611060;
	Tue,  9 Jul 2024 18:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D611060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720542237;
	bh=Xs7KqgNnRre63IGaFjAAQd7xd6ANQBVKXDlQIX5cul8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r8PdasKrNyjGQ15ac35eBCU0tTOoWCh+Hj8i/l9Y2aHRgAWzM/cxjhqyPFcRoQhst
	 ugBd/KCDn7nN+AicXjPhiJHSHKt5zdjAtRYQQIIcTJaHmDj8eQCiCG1VF6WgB/KyIw
	 WzPBj7lr93dCdsBRyxpYiU4/sMqK6gndbC734wvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 523EFF801F5; Tue,  9 Jul 2024 18:23:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44F25F805AA;
	Tue,  9 Jul 2024 18:23:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2E9DF80568; Tue,  9 Jul 2024 18:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60682F80074
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 18:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60682F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d5tTULeu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A8B2614BF;
	Tue,  9 Jul 2024 16:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14026C32786;
	Tue,  9 Jul 2024 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542028;
	bh=Xs7KqgNnRre63IGaFjAAQd7xd6ANQBVKXDlQIX5cul8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5tTULeuhc8DySIX492MCnFOEFBe74HI0D3wrgNkkvsypnbjGBHtzV+wzZmnX/w5i
	 RxXVdEvJqIZT5ponaZKNs7kdd1vYb+HCwpQesPgvlwTo7/FlRa+srP3hUj6N5PQyNM
	 J2XGz7x6+mXVXfc4ne7FJxb/PXroviOoS6eo4ENpuq1YOp7as15gatCbQlRxwJmD6z
	 PRQA4tMIUgt3FgVKvAS3o/yUsXkj7H92R1peEy2iLsuYf6IItDRK8uaPPvHXTb3Bqp
	 m8Dqa/d0yVdXUvy93oVk6svbB9Q111FRqYy3ifiWFbHFExjlCXyrhA2AU+C8n+6ZHg
	 vY/XwcI+P5S/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Jason Montleon <jmontleo@redhat.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	justinstitt@google.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 08/40] ASoC: Intel: avs: Fix route override
Date: Tue,  9 Jul 2024 12:18:48 -0400
Message-ID: <20240709162007.30160-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VTHDLL2KUCWPGAURGDUD7JVSMQUELBYN
X-Message-ID-Hash: VTHDLL2KUCWPGAURGDUD7JVSMQUELBYN
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VTHDLL2KUCWPGAURGDUD7JVSMQUELBYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit fd660b1bd015e5aa9a558ee04088f2431010548d ]

Instead of overriding existing memory strings that may be too short,
just allocate needed memory and point the route at it.

Reported-by: Jason Montleon <jmontleo@redhat.com>
Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20240603102818.36165-3-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/topology.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 42b42903ae9de..691d16ce95a0f 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1545,8 +1545,8 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
 	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
-	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	int ssp_port, tdm_slot;
+	char *buf;
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
 	if (!avs_mach_singular_ssp(mach))
@@ -1557,13 +1557,24 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 		return 0;
 	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
 
+	buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	avs_ssp_sprint(buf, len, route->source, ssp_port, tdm_slot);
-	strscpy((char *)route->source, buf, len);
+	route->source = buf;
+
+	buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	avs_ssp_sprint(buf, len, route->sink, ssp_port, tdm_slot);
-	strscpy((char *)route->sink, buf, len);
+	route->sink = buf;
+
 	if (route->control) {
+		buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
 		avs_ssp_sprint(buf, len, route->control, ssp_port, tdm_slot);
-		strscpy((char *)route->control, buf, len);
+		route->control = buf;
 	}
 
 	return 0;
-- 
2.43.0

