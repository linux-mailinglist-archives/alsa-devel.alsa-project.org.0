Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A485172ABFB
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290463E8;
	Sat, 10 Jun 2023 15:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290463E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405609;
	bh=EIaZroKoN2dVZbUmzxGbc6AQm+jh8EaWWjfXcibnqfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XWiXYExHKsx+adL04Lro/6c+f3vbu6SPaHk59vXURoqhsmd+sHvLKIWj+kGGJhiVR
	 HQQzoh2wu0LsMeNhJeYjapYqSdZ3Y5MDSp4NAisMWk5M1qsPLjIThIGV8V4IMVJyLv
	 k7dtazBi2/ETiaR6tje3doG7ucMYL52Tgr/B/vh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51919F80520; Sat, 10 Jun 2023 15:58:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 764F4F8016C;
	Sat, 10 Jun 2023 15:58:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CED91F80494; Sat, 10 Jun 2023 15:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE6D3F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE6D3F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H9KzRiuo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E37C61284;
	Sat, 10 Jun 2023 13:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E033C4339B;
	Sat, 10 Jun 2023 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405396;
	bh=EIaZroKoN2dVZbUmzxGbc6AQm+jh8EaWWjfXcibnqfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H9KzRiuouNojP6mOk2GFagb+J7+0glp7STXLFM3LdHucPpgqdhk3DYRb+RmdadaEu
	 WC7GR4dGIQZI6vBggXgMBvgBbhiM9oUzIpv6VevpjbKi5+SDJTeRncjZeXVSKa99Lp
	 6pHue8K7zlQaz8pPwTUpI7fFUMA4q9CJoDZwHmzk5hkaGvlA6/dhteSpoilasnjDw5
	 JHyWpU/Ly9vfGUDWeBTXBSHFJrFQWHd9XgEB/Tt0pJXMIE/C+7vLfPD9m/MsQB6p3H
	 90zHEyvRNBDto1DQfQfbQ5hEikpBop5sfk7X+PwHfFYOmrp5f024nADvwufAzmJusQ
	 gFgZQz9p4kN9w==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:21 +0100
Subject: [PATCH 01/10] ASoC: cs35l32: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-1-b806c4cbd1d4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EIaZroKoN2dVZbUmzxGbc6AQm+jh8EaWWjfXcibnqfM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEIm2oWsHEwkTAw5DKp2RoQkLnqtguurmL1qnHQ
 322dqZKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCAAKCRAk1otyXVSH0F97B/
 9uxLBIeCaSX48suRPOWUTOaYGzaED2J8/CApAC++MaqGBbVDrYmF5oCYVvVQ5iGL+cUIQFF/ZQsrx3
 zu6bFanrm4feSTg888lQvb/E+hZiRH6Ugk0Aw3wGhSvKmzwhmGMJyfuJbm21oo18FLG+aqygOx/IMd
 5ct4pVSPGuuY+LWcuvOJ35iORGS0/av51GXcAgGECLAruGJjUJ1cKCXmaPMTmaswpF3DaDt30wn3RZ
 LQCNph7DEUcqyU1KFziaynOZH0dZmWrraJeUJo142w4WYGg5AjlxQVinXgAHM+tPPw0x19J0ZJInCp
 JGytrcixBRn29TZWWIVeegjwiwCiOs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 3ITVVWNKSKEJPXLEGYNWKU4ZOKDH3HBL
X-Message-ID-Hash: 3ITVVWNKSKEJPXLEGYNWKU4ZOKDH3HBL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ITVVWNKSKEJPXLEGYNWKU4ZOKDH3HBL/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l32 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index dc7a58d68076..8421599f1de7 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -260,7 +260,7 @@ static const struct regmap_config cs35l32_regmap = {
 	.volatile_reg = cs35l32_volatile_register,
 	.readable_reg = cs35l32_readable_register,
 	.precious_reg = cs35l32_precious_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

