Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235066DE2A8
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 19:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F08EF10;
	Tue, 11 Apr 2023 19:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F08EF10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681234546;
	bh=ScMA2ZLrRu9taa5IpwTR7DDfb0acMaFdpECEOOkl7Oc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hprU1Phw6YKo+XqhUG2HDVOHZ2n2FDLhSXJ2yw+tIeqqSAiRDSDP7pYWeq1S9VWEJ
	 pvap2EGwn3iZ5iWuCe7mrj8bNAwkgY2YxU8u0bMNA8IBt4xW15kLskG+04C1EbpFi9
	 HzZOQCOaGGfyRncc4tRzRZWzgyfZR3LYGDomXk38=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A54DF8052D;
	Tue, 11 Apr 2023 19:34:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 528AAF804F2; Tue, 11 Apr 2023 19:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD063F8025E
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 19:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD063F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i7r9+z+q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DBBD620AC;
	Tue, 11 Apr 2023 17:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA6CC4339B;
	Tue, 11 Apr 2023 17:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681234432;
	bh=ScMA2ZLrRu9taa5IpwTR7DDfb0acMaFdpECEOOkl7Oc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i7r9+z+qDXFqq8/KDKOj1TPB+VYfdv/2dvD2gi0kaQ61lxfdOObCaXkp3Di8VY9bG
	 u0geIPFCEgig+y/jEWpQmUNP1owtXZwKg7lRGCEd7KhDIgjRkxBtJ0yagyZn9NHT1n
	 FJ8pAD/+Yaxp2T3iT7M+UpguZsZcueVMAchD3ONqg4Rf+2pc2S7Foa8ncUQAFsdmzm
	 8SrfbZ1Y7q+X/b0ofHlQhDTtv5pnaJbMbnxg1s+lIevlCPdoHTiRKMys2waQENzo37
	 U6qJ2DPp++F2VzE4m5K4n4wgsRl5G4O5hWbF+cjYDHPKGOKSel1dPBE5eVrs4U5PGr
	 y1/hrMleBZ/OQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@nxp.com,
 Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230405205820.6836-1-danascape@gmail.com>
References: <20230405205820.6836-1-danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8711: Convert to dtschema
Message-Id: <168123443056.491748.13637746465528590932.b4-ty@kernel.org>
Date: Tue, 11 Apr 2023 18:33:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: CH3ZOHA64ZXX5EYYZ62RV2MDXBIFTLXS
X-Message-ID-Hash: CH3ZOHA64ZXX5EYYZ62RV2MDXBIFTLXS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CH3ZOHA64ZXX5EYYZ62RV2MDXBIFTLXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 02:28:20 +0530, Saalim Quadri wrote:
> Convert the WM8711 audio CODEC bindings to DT schema
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: wm8711: Convert to dtschema
      commit: 25500613de4a867d16068b28faa963cd3ce0a11a

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

