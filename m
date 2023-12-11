Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E480CC38
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:59:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45461BC0;
	Mon, 11 Dec 2023 14:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45461BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702303146;
	bh=nYxR4vWh+O5VayCadz9yXoEhWfvMNjF5E4OSsSI1OBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pqbukbIkc6u9t76JQV3D4M0hYY4vMxxNzoNF8FP7K3ndIPtaBE0zEKwh5rJG4YGeN
	 qVJQFAgt9Ql3/Tu+/BoQUso3ns65ZpdvNdRyctxPac4CIFJvookUnt7ZuRpZsgPFN7
	 dael5Gr+d8MmC8T+fr4KiK8XEPusXP3WKppg2tlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61934F8057B; Mon, 11 Dec 2023 14:58:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2E22F80587;
	Mon, 11 Dec 2023 14:58:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E529AF8061C; Mon, 11 Dec 2023 14:55:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 21E53F8060D
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E53F8060D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tHbGwbW+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCC0E6123C;
	Mon, 11 Dec 2023 13:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBED4C433C7;
	Mon, 11 Dec 2023 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302938;
	bh=nYxR4vWh+O5VayCadz9yXoEhWfvMNjF5E4OSsSI1OBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tHbGwbW+wO/tmGpOeV3jMtWjiK2kCYHsm+jZfUTF2/IxSXh8OsOMhU+Blm18jjQLt
	 smLydXq4Ie7EpppGqZKf17CudVE+Cfknw2MDSbMMCfYxEHukzkkYlHBCNyI264eDh7
	 3c+uOTTWvYEmZupajqh8a+epVAlz1uvB2xx+MCHeHxin+6tdZL9exzpgsG6foBoeYp
	 GKu6jybH49+no5xNkz2effES+jr/rjMHZNmY0gwahF3g4987TUTW84mx6u0xhL2Tfj
	 xxREmc9I9jyn6N4TtgIRIQhupgNuxcZJqFbCXWzkXIzJJ9XsFU+xIpd54Zd8vCyH82
	 j70dccCyJc4QQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/29] ASoC: Intel: skl_hda_dsp_generic: Drop HDMI
 routes when HDMI is not available
Date: Mon, 11 Dec 2023 08:53:56 -0500
Message-ID: <20231211135457.381397-12-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135457.381397-1-sashal@kernel.org>
References: <20231211135457.381397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.66
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZIBYEJMI25XGUQ6QGKMUJML6RBQ65R6J
X-Message-ID-Hash: ZIBYEJMI25XGUQ6QGKMUJML6RBQ65R6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIBYEJMI25XGUQ6QGKMUJML6RBQ65R6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit 3d1dc8b1030df8ca0fdfd4905c88ee10db943bf8 ]

When the HDMI is not present due to disabled display support
we will use dummy codec and the HDMI routes will refer to non existent
DAPM widgets.

Trim the route list from the HDMI routes to be able to probe the card even
if the HDMI dais are not registered.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20231124124015.15878-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 879ebba528322..463ffb85121d3 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -157,6 +157,8 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 		card->dapm_widgets = skl_hda_widgets;
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
 		if (!ctx->idisp_codec) {
+			card->dapm_routes = &skl_hda_map[IDISP_ROUTE_COUNT];
+			num_route -= IDISP_ROUTE_COUNT;
 			for (i = 0; i < IDISP_DAI_COUNT; i++) {
 				skl_hda_be_dai_links[i].codecs = dummy_codec;
 				skl_hda_be_dai_links[i].num_codecs =
-- 
2.42.0

