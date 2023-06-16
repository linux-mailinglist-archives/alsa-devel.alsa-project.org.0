Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA69732E97
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A64827;
	Fri, 16 Jun 2023 12:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A64827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911622;
	bh=xcVet4QUYlmeBQFF0cY9pek2NTN+5js8BLGNsyiNVdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dmcv2OoEg5wOqs8k0Fd09B81cQrMspLAYAhGhqaxqPSJHrYgaspJgwwA6zfiBYN5V
	 KUzCb5/OrIeFlJos+AZlDAgBX9bI2/74MtpC4E98pOt5eZE7JpiYJ6fxBYJkMSUn4m
	 e44Fxb6dzhCgyYqocj8UXR5q/KMsUldHz4zx7Lg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A4DDF805E5; Fri, 16 Jun 2023 12:28:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90152F805AF;
	Fri, 16 Jun 2023 12:28:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13621F805C8; Fri, 16 Jun 2023 12:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 979FFF80557
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 979FFF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ia5sQImK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 813C1637C2;
	Fri, 16 Jun 2023 10:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CD1C433D9;
	Fri, 16 Jun 2023 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911325;
	bh=xcVet4QUYlmeBQFF0cY9pek2NTN+5js8BLGNsyiNVdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ia5sQImKew6rTWQqyc+GAxGlkSJP6KnrJorDICORf6s2yfMIfQGD8Mds2wOvhSneP
	 hy66sOx77qHkIbXbnzz45ttKX8XjAjqkDhjJEzEHjBhP/xyrFG+tPzD7fkzjnPK6/m
	 dRgX+MZhFG5CurHOdheYeN9e9EPdzWFWVWPdInNwDTDFsm5damgSicuW0UWyZNX5rL
	 YrsDJkb4wyBJzn+018IUp30VsDUfABl3LUV1kVlkI9Y9Zd/dq733peEKKXJm5PQFYz
	 hmi7O9ur8kVpjDrl1aC0VptwsnpgKL8e2AyJPFABleo1UrIyB/TpHlL8BsR1VeTTxT
	 P+uBcXU69zAkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	SJLIN0@nuvoton.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.19 2/6] ASoC: nau8824: Add quirk to active-high
 jack-detect
Date: Fri, 16 Jun 2023 06:28:35 -0400
Message-Id: <20230616102839.674283-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102839.674283-1-sashal@kernel.org>
References: <20230616102839.674283-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.286
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 66SR643CHA4CPNQ5V6EDRS3RWBNXWUNB
X-Message-ID-Hash: 66SR643CHA4CPNQ5V6EDRS3RWBNXWUNB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66SR643CHA4CPNQ5V6EDRS3RWBNXWUNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

[ Upstream commit e384dba03e3294ce7ea69e4da558e9bf8f0e8946 ]

Add  entries for Positivo laptops: CW14Q01P, K1424G, N14ZP74G to the
DMI table, so that  active-high jack-detect will work properly on
these laptops.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Link: https://lore.kernel.org/r/20230529181911.632851-1-edson.drosdeck@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/nau8824.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 4f18bb272e929..0ecea65a80b46 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1899,6 +1899,30 @@ static const struct dmi_system_id nau8824_quirk_table[] = {
 		},
 		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
 	},
+	{
+		/* Positivo CW14Q01P */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "CW14Q01P"),
+		},
+		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
+	},
+	{
+		/* Positivo K1424G */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "K1424G"),
+		},
+		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
+	},
+	{
+		/* Positivo N14ZP74G */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "N14ZP74G"),
+		},
+		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
+	},
 	{}
 };
 
-- 
2.39.2

