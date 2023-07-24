Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B175E656
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:17:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD15827;
	Mon, 24 Jul 2023 03:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD15827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161470;
	bh=2qlq7uUxNq/Q9bKoby1GbgQFSQ7lyi23LUd+35mUoQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RWoEEkKoUoRN7qhFZp/GDI47R/MHIJFKrXQwoMMq3EY4G+22HxTa2qTDGGyJJjGxS
	 DssxQpUiUwS0cAf/M2rE+rm8/W/crvPR3dPae9x7Ga4dxAZjnOzOqUiXnqpBcSPkYn
	 PA3N3Wjr8Qqw/rfxP4Rdf0R9rEfraGNe1aPg6uLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C823F805C0; Mon, 24 Jul 2023 03:15:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3B6AF805C1;
	Mon, 24 Jul 2023 03:15:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3720F805B6; Mon, 24 Jul 2023 03:15:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41CD7F805B3
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41CD7F805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mj8P5d9M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26B9E60F32;
	Mon, 24 Jul 2023 01:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6569C433C8;
	Mon, 24 Jul 2023 01:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161318;
	bh=2qlq7uUxNq/Q9bKoby1GbgQFSQ7lyi23LUd+35mUoQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mj8P5d9MazwgUZrH4eHGF7N29GHaBmii0olHJ0N4g6FNfJ1bCJYDgdKSW6+fssUfH
	 83Vsoopcanpr2/CvfubKmX0VjpEZmIYfYXndKzknBI2aepnkaVoioPqWD2mqdLOcMI
	 Df05LjKR5bdYkaXotsqET+X/5b0RqBDztFtG5/vOUrfbcIisc7Edhaw/LsyDgjG4C0
	 UUz6A7i5QIYGHoyQ+0Uw93+IJckprnsPb+9LX+FLWD8RHRS1IV5UFBA5gdreOOyXlf
	 5hozAHAoM9GjBIxYmaFqtno600RJUOeL6dFHFO5m5AtDvA2IE0WNonC4iE49WttLNN
	 Q2YaN3OH9lM1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 22/58] ASoC: Intel: sof_sdw_rt_sdca_jack_common:
 test SOF_JACK_JDSRC in _exit
Date: Sun, 23 Jul 2023 21:12:50 -0400
Message-Id: <20230724011338.2298062-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LGPCIWH7ITKVJD32TND5H5EXWIV7CSU5
X-Message-ID-Hash: LGPCIWH7ITKVJD32TND5H5EXWIV7CSU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGPCIWH7ITKVJD32TND5H5EXWIV7CSU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

[ Upstream commit 526a1876fc48e2d0c0ea8ad63b58bdb2cc13047f ]

if (!SOF_RT711_JDSRC(sof_sdw_quirk)) is tested in rt711_sdca_add_codec_
device_props(), and we don't add software node to the device if jack
source is not set. We need to do the same test in
sof_sdw_rt711_sdca_exit(), and avoid removing software node if jack
source is not set.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230602202225.249209-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
index 7f16304d025be..cf8b9793fe0e5 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
@@ -143,6 +143,9 @@ int sof_sdw_rt711_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *
 	if (!ctx->headset_codec_dev)
 		return 0;
 
+	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+		return 0;
+
 	device_remove_software_node(ctx->headset_codec_dev);
 	put_device(ctx->headset_codec_dev);
 
-- 
2.39.2

