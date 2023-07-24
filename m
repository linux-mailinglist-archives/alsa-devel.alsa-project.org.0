Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4F75E62B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05C8204;
	Mon, 24 Jul 2023 03:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05C8204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161347;
	bh=NEikLDfpeK3unjoQbd/Unr2X5ziouPV7lAi1vlD5w9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M7yKDtQe5lUNdDe6CFEcqYxhFXnZUgxVL/DazkDfnRQXX8tdcTxBAWMzuFECuN+0K
	 fBqjt85aJZHQQC6cZd78lFn3F9ZOcfk+BfeF6GDy+i5Hl7ZBcAd1DCZpH+nNhcf+IS
	 XOLwuMawZlI0OeSPyZU0LFjvtGGIwOL+1/PGIXTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C97E4F80535; Mon, 24 Jul 2023 03:14:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE51DF801F5;
	Mon, 24 Jul 2023 03:14:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBC88F80310; Mon, 24 Jul 2023 03:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05111F800C7
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05111F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hVh/rVZu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1BF760F08;
	Mon, 24 Jul 2023 01:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828F2C433C8;
	Mon, 24 Jul 2023 01:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161271;
	bh=NEikLDfpeK3unjoQbd/Unr2X5ziouPV7lAi1vlD5w9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVh/rVZuyeJ71iQNypNd8Ffvw10WNZldAM7AOz9j4ynTRrMTBrCSVRVezWNWZtvii
	 Gtipa94ae4rvgECXrRok55qo9XmomoQoQdCNZ/ByxOrbPXeh6POvjExLVA0jp0aSHC
	 zN7pe/uE4g3gIkfeg4kUmhLWxKlvK47veKd2zQZdcCU5AqmLZ+0rE/2FmZuZAkwtoo
	 AUrVA005vFdzrULVbuNcqpFumeFbvfNRhyLFGxif/SjnngruuFn0/QdueiVOHW0tfX
	 DGDiEkG36G3/AR7EXaPktLv9zaLHK0IY/w0HxPal/7lISgSAfa/dmAP2fPngSTi4ux
	 tJyJk59LRf2Ew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	gongjun.song@intel.com,
	uday.m.bhat@intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 10/58] ASoC: Intel: sof_sdw: add quirk for MTL RVP
Date: Sun, 23 Jul 2023 21:12:38 -0400
Message-Id: <20230724011338.2298062-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WJB7ID4PGJGAHGK5ODKTJPWGCUPTVRXH
X-Message-ID-Hash: WJB7ID4PGJGAHGK5ODKTJPWGCUPTVRXH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJB7ID4PGJGAHGK5ODKTJPWGCUPTVRXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

[ Upstream commit 289e1df00e49a229a1c924c059242e759a552f01 ]

We should use RT711_JD2_100K for on board rt711.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
Link: https://lore.kernel.org/r/20230512173305.65399-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 144f082c63fda..db99f7fefdfc7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -415,6 +415,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD1 | SOF_SDW_TGL_HDMI),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Meteor Lake Client Platform"),
+		},
+		.driver_data = (void *)(RT711_JD2_100K),
+	},
 	{}
 };
 
-- 
2.39.2

