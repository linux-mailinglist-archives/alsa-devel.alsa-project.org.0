Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C486BD5CF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 17:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5C3A10E1;
	Thu, 16 Mar 2023 17:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5C3A10E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678984469;
	bh=KASXsKcwhzOFvQl9CRD+V3oEgR7AUj1FxHxAfxlkrZg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DSL/zzLExtYcKywl3/qPE/OsOmXBTfp4mVGefgkOdTPsnzymbyMZqgLhNc1OjzcQ0
	 4iVYyXXt4dV9sSr/vwx2RIGhuhhQeJyY0g8CUse5tlFqjBSRH4qoOg6nSVOafrmWW6
	 aBTq3pnCgPfy5fW+ZITkaZyqGEUhrxlIy0Gcs5KI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC12F80272;
	Thu, 16 Mar 2023 17:33:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36DC1F80425; Thu, 16 Mar 2023 17:33:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFE0DF80533
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 17:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE0DF80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ks9z3oxK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52A90620B3;
	Thu, 16 Mar 2023 16:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AFCC4339E;
	Thu, 16 Mar 2023 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678984407;
	bh=KASXsKcwhzOFvQl9CRD+V3oEgR7AUj1FxHxAfxlkrZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ks9z3oxKXvFTUvqT172yFQ6sGLxLMmWx3jxYZkDMQ7UYUWl79iiMZyijHo2Fnxc4Y
	 Nsw8XqfwhVURzNrWEuUhYSjbHZVLXatdyHdkANz2EeDE6T/ZBFmOA8JeUYXbBoL42K
	 lVp8zFHTyef0wmOl6cDLe09CwGqB8jlUhv67vk0KNJ/rBWwFT3VqcYVkR/THYWGxEQ
	 3xrVF7TuL+uEIT6hhLSfJ4YfcKOyvsMLv4+xZqdJN3C4vEsqqHxRBl9Oyd89tKuawZ
	 aNMqYUm8CbJP5lD1YDxG7VuKqJlrIpQm20m/etmS+M/0ZQSfJr2wyBr65z8oKcoqhM
	 PuM+WU3tFZlvg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 3/6] ASoC: amd: yc: Add DMI entries to support HP
 OMEN 16-n0xxx (8A43)
Date: Thu, 16 Mar 2023 12:33:04 -0400
Message-Id: <20230316163309.708796-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316163309.708796-1-sashal@kernel.org>
References: <20230316163309.708796-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZHPYQ6YJPXTW6MJCEJPO3LZBV7RJQGTQ
X-Message-ID-Hash: ZHPYQ6YJPXTW6MJCEJPO3LZBV7RJQGTQ
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Duc Anh Le <lub.the.studio@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 mario.limonciello@amd.com, Syed.SabaKareem@amd.com, aniol@aniolmarti.cat,
 mendiebm@gmail.com, wimvanboven@gmail.com, lxy.lixiaoyan@gmail.com,
 xazrael@hotmail.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHPYQ6YJPXTW6MJCEJPO3LZBV7RJQGTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Duc Anh Le <lub.the.studio@gmail.com>

[ Upstream commit d52279d5c9204a041e9ba02a66a353573b2f96e4 ]

This model requires an additional detection quirk to enable the internal microphone.

Signed-off-by: Duc Anh Le <lub.the.studio@gmail.com>
Link: https://lore.kernel.org/r/20230227234921.7784-1-lub.the.studio@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4e681e9c08fe5..4a69ce702360c 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -262,6 +262,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A43"),
+		}
+	},
 	{}
 };
 
-- 
2.39.2

