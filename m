Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B09376906D5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 312C9E89;
	Thu,  9 Feb 2023 12:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 312C9E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941676;
	bh=+Dpc3UPpgbhslDUa1Pjver094CNhUa16gcojS/lg89A=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nyXips+WxHwQVT0hYDQT/89n/HyTNB6mgEAsN48qvOcXpCP7BUiVRfpN+kntXQxXW
	 m3Wij1D1LZ4/uod9R4qi7+8SDssr+vOFUl711WrXzQ/JsrzP7gub3dKNmQeGL4KVAm
	 A7/95Ri/TOvc5EiUSA6f6YtlwV9sBtQ1az8+3MNA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED9FDF8057B;
	Thu,  9 Feb 2023 12:18:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51430F80527; Thu,  9 Feb 2023 12:18:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35FA3F80527
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:18:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35FA3F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B0Veg2J2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE6C561A2F;
	Thu,  9 Feb 2023 11:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2830FC433EF;
	Thu,  9 Feb 2023 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941525;
	bh=+Dpc3UPpgbhslDUa1Pjver094CNhUa16gcojS/lg89A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0Veg2J2WoAjM/4ZGRS5FT5ZcS5rglhFe2zLtZ6RHORbQnVx1VZkAWKiQsiSlh4vH
	 IgCZUsQSbRskc7RdESkwuxIQr7JHZOtmOHVmp7Yry4n0Dbvcwo+tnzoMBYT6kklFwX
	 V6PgsnhoIyTeT4fHWjsuk1o1GOfkE86wUaSDSgDs3f0Gg24I0lmIbgcQrHwQ/Dr2c0
	 GOtleQCe8E5eCtAPEZ5esj+NE4dMsuZrAZbXKW6JPTRRz5iI1D3vrlw9K/MG0GDb+b
	 8Fc+xWLUpN5TE45UE6npXUtbGB3p1vSyobCTwdK12/sxSMsPnTEyTPLygzVjHETvzZ
	 fKUuySyDbOM8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 04/13] ASoC: cs42l56: fix DT probe
Date: Thu,  9 Feb 2023 06:18:22 -0500
Message-Id: <20230209111833.1892896-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111833.1892896-1-sashal@kernel.org>
References: <20230209111833.1892896-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5D3CTMTXHOU5A2TLYYQGLGLJ5YGAWB5M
X-Message-ID-Hash: 5D3CTMTXHOU5A2TLYYQGLGLJ5YGAWB5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5D3CTMTXHOU5A2TLYYQGLGLJ5YGAWB5M/>
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
index d41e031931061..3c5ec47a8fe64 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1193,18 +1193,12 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client,
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

