Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B96906DF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:21:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C16E91;
	Thu,  9 Feb 2023 12:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C16E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941697;
	bh=mh7J86w+v1MchqBoAyvDfaq2ERmrfcmmke6W2ZVt6nI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=riZjjlPartrn5+Gmci3KcMu/LBsJOMhk4Xn112dKItvHP4M/8RcmLQ6TpaJqI3WjC
	 ROpl1rbl5PTS1JETUgFFFV4C3X7NOr9/EK25fet6+I6Ii45plGbOZg/nUOInvMHxe7
	 mtAt/m4xuauOEALgwHHQYjg0yt7Ysf2zt7gWN0Ac=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15742F80269;
	Thu,  9 Feb 2023 12:19:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19DD9F80525; Thu,  9 Feb 2023 12:19:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D214FF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D214FF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uOT/KOHf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 75DCFB82102;
	Thu,  9 Feb 2023 11:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F77C4339C;
	Thu,  9 Feb 2023 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941566;
	bh=mh7J86w+v1MchqBoAyvDfaq2ERmrfcmmke6W2ZVt6nI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOT/KOHfV07UqWm32gx37gZWKsRnZw5XzIYbD4dGcNigW03LwnxucfMujoKWSCtPQ
	 Qxo6O6DA4TdLbRGWlB+ciGF/Mc+oxw0kIZLEW97HxgUgBUEsNQixuckNwlRijfKwG/
	 58Xcv2SMatWrThpc1JQZrH/vWCpyb0daWTWYfQOOXBd+P4tj1VbinMBuDcaFHDn/9Y
	 uzzijRKAijInOL3juvADj6xtHivI0cGd3s44bqdb0zMBGQCibMgCF0mZXbki6tswF6
	 OtWUo2hdWa679lTE/mv+7pEv3MoqRUJOoGH4ZgTFnz1/2bHY5rUcHFyzYMNOfatmyD
	 67V+B11qzRixw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/10] ASoC: cs42l56: fix DT probe
Date: Thu,  9 Feb 2023 06:19:11 -0500
Message-Id: <20230209111921.1893095-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111921.1893095-1-sashal@kernel.org>
References: <20230209111921.1893095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZW4NXIADXXCRDOS6UKHEMSLIP5I6SN7Q
X-Message-ID-Hash: ZW4NXIADXXCRDOS6UKHEMSLIP5I6SN7Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZW4NXIADXXCRDOS6UKHEMSLIP5I6SN7Q/>
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
index 8be7d83f0ce9a..732405587c5a4 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1192,18 +1192,12 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client,
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

