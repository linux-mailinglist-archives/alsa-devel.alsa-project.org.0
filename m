Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B86732DE0
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0601826;
	Fri, 16 Jun 2023 12:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0601826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911293;
	bh=FxyDFM80gAodbMr/Zh0mljDGdPjue49EbrEZmedq9oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nTZtJ1j13IgUUVELELpjJPEDefUbg8gY4W7bpCvpSKuoSFHAfcY/0cxfjeaJxdVTO
	 qXyIXrBB+BPKPCqmWVsCSfwNXihCTpXIAZqL2RDDI6XVN3jZUGzLdQ9d9tE4SUv2VW
	 ykn9JCrYYgObIiY8bhPrvvzzSX2n8ECV0W4Y7HSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73BDEF805A8; Fri, 16 Jun 2023 12:25:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE899F805A8;
	Fri, 16 Jun 2023 12:25:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A830F80549; Fri, 16 Jun 2023 12:25:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C1FA6F800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1FA6F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M0RuRNND
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7766362B57;
	Fri, 16 Jun 2023 10:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01979C433B9;
	Fri, 16 Jun 2023 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911143;
	bh=FxyDFM80gAodbMr/Zh0mljDGdPjue49EbrEZmedq9oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M0RuRNNDUMdQGvaF9gRU6orIC8OhPpBFxX9IjIs/OY9NmUxPSlhqGhlo4cwWtKm7T
	 XlaE/Y4FlSC7w5WWsJk29WdOc7tZbmoik9uFCFr5sHOpZ8mH86aGgvgDWxPfweFp3d
	 Cpj8mO1c0hZvNZmkOmn6UB/haMTcTwTDoJ2zO0SEBKsZqFitTTA9lIvBz1r4tTzevq
	 NT1mfVkkOUG6Hdjs25fA/K5cznHrsoszVGTiZnR1qjkgYRYhMqrN9Hv3uMiFdXFvT9
	 abYlEGDome3uUDpTeB7gbb6gD6j6q7hr2o6UherofwXqLS/EmAD1TFz+/G/nAdQVpB
	 spM0VSAGkvuQg==
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
	savagecin@gmail.com,
	SJLIN0@nuvoton.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 11/30] ASoC: nau8824: Add quirk to active-high
 jack-detect
Date: Fri, 16 Jun 2023 06:24:59 -0400
Message-Id: <20230616102521.673087-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RK3IHN3HHJ7MQA6BVVMIVTZ773J33ECB
X-Message-ID-Hash: RK3IHN3HHJ7MQA6BVVMIVTZ773J33ECB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RK3IHN3HHJ7MQA6BVVMIVTZ773J33ECB/>
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
index 4f19fd9b65d11..5a4db8944d06a 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1903,6 +1903,30 @@ static const struct dmi_system_id nau8824_quirk_table[] = {
 		},
 		.driver_data = (void *)(NAU8824_MONO_SPEAKER),
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

