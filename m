Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C973AC95
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 00:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29547852;
	Fri, 23 Jun 2023 00:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29547852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687473335;
	bh=Fx3v4G/Q/qRPvxtg3Mgx/rYdfAvEoHue1uehMtXOhZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dp632sULTo0GqYbpB+F957YtoVos2f4usoi+A0Uy1EC1PerK1tJJSH9qrJv5SH2FT
	 mJSvyR3Y51PlKdcxLixdxTQD3aHFW9DUIAxhCbdhMHWSC1+Xna6Re1SM1+ErHiRIE5
	 pW3XevEEni68wyxV36uCRcej0AmRBHT0BB5vAMJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2EA4F80558; Fri, 23 Jun 2023 00:33:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59F5EF80551;
	Fri, 23 Jun 2023 00:33:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D4CAF801F5; Fri, 23 Jun 2023 00:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62085F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 00:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62085F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jk5peD++
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1E5061924;
	Thu, 22 Jun 2023 22:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F27CC433CA;
	Thu, 22 Jun 2023 22:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687473224;
	bh=Fx3v4G/Q/qRPvxtg3Mgx/rYdfAvEoHue1uehMtXOhZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jk5peD++dJDfFdJZnWbVzS3MvLCy9R+jOHoXLYovKYM9fB5hizu5axPGxPBWRYp2e
	 dX0fTz91H0BC3BlqDJOwEfeyO426zb9qctjpO/37mf+5DxLAPSBRHWhPxGpcsvdQsa
	 GdqM3W4TfHjLqT39SAm6sGe8RoPD97ISunnC3sB0x3cKqyvDLzy/VVhf23wG5fzb1h
	 KWi8bVxAUlXv1rtUV5dEWxsS4Vf0Yl0gSBVla+pdgqD/lrCqRxhPofk/huDYpbw7Mw
	 xbK3hE8R009lLxgJ0IexZNUluF/7g+av++i9JRk+WFzCkBIFdDdfvk2BhgOYmeTPTG
	 sfc6hflfW85Ww==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230621231044.3816914-1-robh@kernel.org>
References: <20230621231044.3816914-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: microchip,sama7g5-pdmc: Simplify
 "microchip,mic-pos" constraints
Message-Id: <168747322064.318849.2286093832255639633.b4-ty@kernel.org>
Date: Thu, 22 Jun 2023 23:33:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: B6Y7T57PAIIBZ3DRXYXYMJMGCBYY3WOJ
X-Message-ID-Hash: B6Y7T57PAIIBZ3DRXYXYMJMGCBYY3WOJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6Y7T57PAIIBZ3DRXYXYMJMGCBYY3WOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Jun 2023 17:10:44 -0600, Rob Herring wrote:
> "enum" values should be integers or strings, not arrays (though json-schema
> does allow arrays, we do not). In this case, all possible combinations are
> allowed anyways, so there's little point in expressing as an array.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: microchip,sama7g5-pdmc: Simplify "microchip,mic-pos" constraints
      commit: b2c28785b125acb28a681462510297410cbbabd7

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

