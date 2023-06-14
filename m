Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94773006D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 15:48:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26561EB;
	Wed, 14 Jun 2023 15:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26561EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686750523;
	bh=p/0VE/rByCIyvGAL4zC37aNdWZD6WdRSZcHy56kY3M0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ijQrLPJgR11k3gUeQnwwDKrHD0J07LBLWaRtvMWMJ3gJ9EngnewGfNGgdNLf5QCp9
	 oVwUDaJIFW6L6YwM4EBwi0j2SCIA+XQSBD6ZGqqlEClgAsDXsf71fAC/a/Kk6uSy79
	 qo3VmDzqxao8V7zxPTm0/7TNOH9FMuDRmztNI4Sw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34101F80549; Wed, 14 Jun 2023 15:47:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A89EFF80132;
	Wed, 14 Jun 2023 15:47:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5737F80155; Wed, 14 Jun 2023 15:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22E10F80130
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 15:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E10F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O9qDYGfl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE2DB64259;
	Wed, 14 Jun 2023 13:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DD1C433C8;
	Wed, 14 Jun 2023 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750457;
	bh=p/0VE/rByCIyvGAL4zC37aNdWZD6WdRSZcHy56kY3M0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O9qDYGflnqx/TygYKkvzkqHZfn65jqamRxhTQSp9tSNd5pSPwygQaJr1t5rL4dEEL
	 76+q2plxIlFjh0T/IwRNh2MninYJQm8kdHyR6ypFTl1fpXr9dYPkia4qPk/ZfIILoQ
	 ArT/iaoOoyC7GuWMJTjsXWCmsC0w89sGSC/yE8iXws2sH80B+CwBbt33BFxCUIPhCF
	 idsGrbAGu85MLBKF5cIvQlUdWIWKmxzZ2gRL8yIA0LPkdsjxpsDZ08mtTU1q6qm8D3
	 ebBkwz0Jwz0JenOiGrDdvcFtDEjCZVj/y8JVEmts4A040A42PF6H4M4daRhi+Sk1UQ
	 vzBIWlMhhvjNA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jai Luthra <j-luthra@ti.com>,
 Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230613201006.2822985-1-robh@kernel.org>
References: <20230613201006.2822985-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: ti,tlv320aic3x: Add missing type
 for "gpio-reset"
Message-Id: <168675045523.162323.250624917490081736.b4-ty@kernel.org>
Date: Wed, 14 Jun 2023 14:47:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: IFKCRHLJAOBGVJTSPF45KOXDUMGRMY5L
X-Message-ID-Hash: IFKCRHLJAOBGVJTSPF45KOXDUMGRMY5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFKCRHLJAOBGVJTSPF45KOXDUMGRMY5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 14:10:05 -0600, Rob Herring wrote:
> "gpio-reset" may be deprecated, but it still needs a type.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ti,tlv320aic3x: Add missing type for "gpio-reset"
      commit: a3f6df1bf514516d276e90d38ca11581701f2e8e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

