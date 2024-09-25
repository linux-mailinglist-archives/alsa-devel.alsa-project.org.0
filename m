Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA7098585B
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 13:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A58851;
	Wed, 25 Sep 2024 13:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A58851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727264528;
	bh=3EBHgI5jWIASh0jFC87Ehq5VX3rMzlLur/2SNTpmArE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EZhS8nKVb+6+um/2naQFJ6w4dwUe6BJulU1OFPyk7nQ5vG1UyqjvMD0Y20zx4Vams
	 LxpdbVHRYQHWuzs45EMSg9p8KvN1I9OW5v8X1J2pu1/SvBs3ZXBeBbrb2UjMAXgOr5
	 ArSePpifcx+/GjFKwgG6rZ9edpEhgFhmLm1whjRA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18020F805AE; Wed, 25 Sep 2024 13:41:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1520BF80508;
	Wed, 25 Sep 2024 13:41:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F047F802DB; Wed, 25 Sep 2024 13:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72BCDF8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 13:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72BCDF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MLdgPZQp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C8F6A43F2A;
	Wed, 25 Sep 2024 11:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B03C4CEC7;
	Wed, 25 Sep 2024 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264482;
	bh=3EBHgI5jWIASh0jFC87Ehq5VX3rMzlLur/2SNTpmArE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MLdgPZQpXDggwSxPt0CnPSuJovxP2A8DpJBL4hWWO/HhzGaLRrySafbJAeUjbJGwr
	 tMwQlMdgF92rrS6ky/Cicg8/61jkpkXmcHh9RRC4Usb/N6NeVlsQbihMJGi0DnTmmY
	 OtFYpUD9FkSPVlU/fiDKPzFhLM7OxqbDHD+UmHA9u6mz/rFASbFElOG0m2sX4OORLH
	 52IQVPw7PXFA+I06ZBYwpnNEyqtHSLcV2530WABsOEWotv4QmL40W8mI7mlIRgm45J
	 y0o+awoLneVUNYxYf8xap/QMO61xbK3zNM+uR37CGlsF+kgWOYEIEZo/JwHbUuvU/q
	 +yktBPvmfLSZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 098/244] ASoC: codecs: wsa883x: Handle reading
 version failure
Date: Wed, 25 Sep 2024 07:25:19 -0400
Message-ID: <20240925113641.1297102-98-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R5WNSGSQLGUI3CLCNJVOCOROU6CA6GAD
X-Message-ID-Hash: R5WNSGSQLGUI3CLCNJVOCOROU6CA6GAD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5WNSGSQLGUI3CLCNJVOCOROU6CA6GAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 2fbf16992e5aa14acf0441320033a01a32309ded ]

If reading version and variant from registers fails (which is unlikely
but possible, because it is a read over bus), the driver will proceed
and perform device configuration based on uninitialized stack variables.
Handle it a bit better - bail out without doing any init and failing the
update status Soundwire callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://patch.msgid.link/20240710-asoc-wsa88xx-version-v1-2-f1c54966ccde@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 3e4fdaa3f44fb..53f6de4340548 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -997,15 +997,19 @@ static const struct reg_sequence reg_init[] = {
 	{WSA883X_GMAMP_SUP1, 0xE2},
 };
 
-static void wsa883x_init(struct wsa883x_priv *wsa883x)
+static int wsa883x_init(struct wsa883x_priv *wsa883x)
 {
 	struct regmap *regmap = wsa883x->regmap;
-	int variant, version;
+	int variant, version, ret;
 
-	regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	ret = regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
+	if (ret)
+		return ret;
 	wsa883x->variant = variant & WSA883X_ID_MASK;
 
-	regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	ret = regmap_read(regmap, WSA883X_CHIP_ID0, &version);
+	if (ret)
+		return ret;
 	wsa883x->version = version;
 
 	switch (wsa883x->variant) {
@@ -1040,6 +1044,8 @@ static void wsa883x_init(struct wsa883x_priv *wsa883x)
 				   WSA883X_DRE_OFFSET_MASK,
 				   wsa883x->comp_offset);
 	}
+
+	return 0;
 }
 
 static int wsa883x_update_status(struct sdw_slave *slave,
@@ -1048,7 +1054,7 @@ static int wsa883x_update_status(struct sdw_slave *slave,
 	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
 
 	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
-		wsa883x_init(wsa883x);
+		return wsa883x_init(wsa883x);
 
 	return 0;
 }
-- 
2.43.0

