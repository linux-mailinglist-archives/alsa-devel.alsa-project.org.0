Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920B907975
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 19:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AEDBEC0;
	Thu, 13 Jun 2024 19:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AEDBEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718298715;
	bh=hAvadJc30c7xwyyr2Veg3piHx/bbbzaPI9OpNL5/0Og=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MIu7yU8m2BwjJI9DbYM5pvgT1WYTUpWvILWfYlGa1TcDsN1bQg+72lwsBK95WbE1q
	 vELyYfCah8T9ovasnGoRC6Gn3ZD/NUlmx4GYYQKbzKWMImkzyi1M5ZcHG8A8XywruZ
	 d5Xfn9+HsZ/MZSg+4YFHYmimKTiE6hrOOlqe0vSo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5166AF805B1; Thu, 13 Jun 2024 19:11:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B7BF805B0;
	Thu, 13 Jun 2024 19:11:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D6C9F80578; Thu, 13 Jun 2024 19:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7087FF800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 19:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7087FF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B51TCbhl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1A57CE2704;
	Thu, 13 Jun 2024 17:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A6FC2BBFC;
	Thu, 13 Jun 2024 17:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718298655;
	bh=hAvadJc30c7xwyyr2Veg3piHx/bbbzaPI9OpNL5/0Og=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=B51TCbhlWFhEyQtPYVLxn7b8XSjANrp/Wp28BAiDKti08YwzLiSjExRS49v4yRIR4
	 DzhSXxhtZrW3ULetc9FgaIA2UI9937UOYSQkYN+c6U1Ky/z5YRyvK5tQO0wNtJbhFj
	 UsAMfZ9swL1g6a5Qg8KveiPWpczbXJkj7+9/fnCG7d5yvpb95jMDs1LdylqStJjdW/
	 cAUpShmbjOqpsQcF+wRx+uQXMAcoCCyEETmavFexfzF0kAVe4TYy1wKq1eiqlYCxiU
	 4Zv/ysm4P5qmvzEyfVknUASnGsLYnHxFX2A/Og6Dz7cR/1wpH0NSt2ucMStGZZir0f
	 8m/zox0p+s/xA==
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
References: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] mfd: arizona: Simplify with
 spi_get_device_match_data()
Message-Id: <171829865427.2725542.2835088856988490637.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 18:10:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
Message-ID-Hash: YSPG43BQAVTYU7IC73KONNOBG3HKVQZI
X-Message-ID-Hash: YSPG43BQAVTYU7IC73KONNOBG3HKVQZI
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSPG43BQAVTYU7IC73KONNOBG3HKVQZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jun 2024 16:24:56 +0200, Krzysztof Kozlowski wrote:
> Use spi_get_device_match_data() helper to simplify a bit the driver.
> 
> 

Applied, thanks!

[1/2] mfd: arizona: Simplify with spi_get_device_match_data()
      commit: 6cc27f7d3e26c6e661385c3cdbc554a8fefbdce5
[2/2] mfd: madera: Simplify with spi_get_device_match_data()
      commit: 8385f6c81bb6042273a6b6cf793424b309ec8f2b

--
Lee Jones [李琼斯]

