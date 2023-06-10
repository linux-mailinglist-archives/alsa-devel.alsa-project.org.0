Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD20872AC01
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87E1483A;
	Sat, 10 Jun 2023 16:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87E1483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405661;
	bh=XE/HOtiY712F8cPy+rPIEF9BvNarjb3niAAMcV4MBUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nqCZz7t81gNGHN6TfBD+Bf1riH35naWq8+vPlldOrT+U9jiRyhuZ6Ho9h5Pwrs3nv
	 fVuuLxDtmXg2Dy985bkEiy4gWCGUI6R/pc260PvtqtMAb3K7MAHXD1xPHd2W0ADi6K
	 nJLSDQMwigIA2OCPza/YqyraNqjiuZZWzSwXI+xs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86856F8057A; Sat, 10 Jun 2023 15:59:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0DFFF80563;
	Sat, 10 Jun 2023 15:58:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22022F80553; Sat, 10 Jun 2023 15:56:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ADFEF80199
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ADFEF80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QPG17hbd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8648061284;
	Sat, 10 Jun 2023 13:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9A1C4339E;
	Sat, 10 Jun 2023 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405401;
	bh=XE/HOtiY712F8cPy+rPIEF9BvNarjb3niAAMcV4MBUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QPG17hbdRLbclGVCVBVc9KUsAk/pexQrc0JDk3KX8r37F82SzlhYuBayF4ojjeHrq
	 Zb7t203o5e6q64TSf9T5wIlo9uoAi2WWPseaNtj7RndSHvI6hs6QGzhZA8j0/y6ope
	 aqRb4Umrq+iyyfjtWTiL2WCTepTokTZqMYClsA6+RfdgzUzecvjTIJieH1pIyCRsv8
	 uikI/S5K8LjNcjLnl9+xzbOlO/4/uG2rORxFIxyFoQntkWLv+p4mR6jSt3O1VEMd1s
	 y7OL8CLrR6pxHc0LGvtA98VFBSZKgJlxA+SOGaVbXPVAmZudSQhAxBDWjpd9WAFTnM
	 q3SSoBcDj4gUQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:23 +0100
Subject: [PATCH 03/10] ASoC: cs35l34: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-3-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XE/HOtiY712F8cPy+rPIEF9BvNarjb3niAAMcV4MBUU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEJdj9WP2SMiJw31ZvpKTbmCahHoUb6Sjq4xB8z
 4v9gIa+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCQAKCRAk1otyXVSH0MB0B/
 9r0QOGGVpqnjVseXsZCBcufIlrhOmS3K9tdVnXG4aUOrxyP+bzB66X/aU4t02ZSw3v+ampOonBLKX6
 ha8Kjj+te4usQu6jjRwTkipkdLYsCjQK2Dr9v01wD31F0GHl3W8jVnyj4/lspqFSxlpf6q7VPKaG2L
 5HPaSgyhLuoo8e6xkJC6N06Di0HF6y7vuXtgLj6zux6Tk/aroauStSQvwj5QBRh7aflwxDZXGAj/4O
 GkqY0NgvTsNK9BMmBiA+sXfr/iH+/7U8PWNEsFrjmAqJFSG9R/BQD2pigDwg2wGtBfKE7GfTr/98lU
 WGUIAKoZhFMoXMcD5+xP85oXP3zFpI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 7H6NAX4Y6WBPPUCBGT2XL2PX4E5MNNJ5
X-Message-ID-Hash: 7H6NAX4Y6WBPPUCBGT2XL2PX4E5MNNJ5
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7H6NAX4Y6WBPPUCBGT2XL2PX4E5MNNJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l34 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l34.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index b3f98023e6a7..471d9e421fc1 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -799,7 +799,7 @@ static struct regmap_config cs35l34_regmap = {
 	.volatile_reg = cs35l34_volatile_register,
 	.readable_reg = cs35l34_readable_register,
 	.precious_reg = cs35l34_precious_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

