Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0869069A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:18:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E0693A;
	Thu,  9 Feb 2023 12:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E0693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941518;
	bh=DVjmWlmCwv9TD+taSPBJEaoZBEgQjmneEUDXNNTh/GQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kNSkZYMud+6/s2aj9L0x/qu8zd5AoraipwurYgNr5nEiFXHvOqtSwRfzFdzg3MS4K
	 kMCo0Iorg5Knq3xSZLAIbJTMMea36QueyxQ8WDVBWcQstN/NussgKE9y39kUQnte6Q
	 Kl4M0KlIBppaUlBhtza5mhcwnS2Q3KNgN5t0qcLI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50493F8057B;
	Thu,  9 Feb 2023 12:16:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70CAFF8055C; Thu,  9 Feb 2023 12:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56A47F8052D
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A47F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NtC6kDQg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3B3EB820FC;
	Thu,  9 Feb 2023 11:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3331FC4339E;
	Thu,  9 Feb 2023 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941342;
	bh=DVjmWlmCwv9TD+taSPBJEaoZBEgQjmneEUDXNNTh/GQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtC6kDQgankDFiZ56N2f3wRDnlLWjSGwMxiBoGIjWsGkyLVK9Dtx9dpaSw/l7gcEq
	 3zrYPMlrUxPztRkFXBm6pqkcjiMeVEynPj/xb6qbYHn/TAkwTqezGNpHdHnqc+gfnP
	 u25p8SU6pwYIfe4qEkOm3Vti+fHuRW6EdrHVwbVjVS0e++j+Nv9aUoayyr5J3+jARP
	 KpR1ZdtEXMBBe+Y8WPJ5OwEp6wYev4Dco5NYXx6wwicKUBjqr1dhHAhNVwS8lkM79M
	 PZGzIIPm6AY8ucF5RkjNwR+mr+ss70IDh6zIZx8NCvjPCRXVoVRgtQW4cehwZ3bXSK
	 j6qZUz4YWPXvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/38] ASoC: cs42l56: fix DT probe
Date: Thu,  9 Feb 2023 06:14:31 -0500
Message-Id: <20230209111459.1891941-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YZRLQMZL4HUWEQJOMHJQPZZXZDIQGGAV
X-Message-ID-Hash: YZRLQMZL4HUWEQJOMHJQPZZXZDIQGGAV
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZRLQMZL4HUWEQJOMHJQPZZXZDIQGGAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit e18c6da62edc780e4f4f3c9ce07bdacd69505182 ]

While looking through legacy platform data users, I noticed that
the DT probing never uses data from the DT properties, as the
platform_data structure gets overwritten directly after it
is initialized.

There have never been any boards defining the platform_data in
the mainline kernel either, so this driver so far only worked
with patched kernels or with the default values.

For the benefit of possible downstream users, fix the DT probe
by no longer overwriting the data.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20230126162203.2986339-1-arnd@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l56.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 26066682c983e..3b0e715549c9c 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1191,18 +1191,12 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 	if (pdata) {
 		cs42l56->pdata = *pdata;
 	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
 		if (i2c_client->dev.of_node) {
 			ret = cs42l56_handle_of_data(i2c_client,
 						     &cs42l56->pdata);
 			if (ret != 0)
 				return ret;
 		}
-		cs42l56->pdata = *pdata;
 	}
 
 	if (cs42l56->pdata.gpio_nreset) {
-- 
2.39.0

