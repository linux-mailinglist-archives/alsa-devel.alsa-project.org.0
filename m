Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA696970F3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 23:55:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE8A083A;
	Tue, 14 Feb 2023 23:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE8A083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676415315;
	bh=F1m163MfqlLt4FsZiQ/MfsbF4sF9/xANQE+DKZufALg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=knuQSe/0tvRkcHYQaiO0iur1Xyc0ASHwTrzpXZjXl2YzCXe0HsIOOq9hCFhHQOpng
	 +EiwXD7OXkfLwUj5a4hikxp3H7OIHbCkptKKZmVKUDLe3y2mOME+oeguxKuhtB+wZE
	 gdTRnz/sjMnyjowdEeLTmCJJW5Si+gW48nA6F4PE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4080DF800F0;
	Tue, 14 Feb 2023 23:54:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77DE9F801C0; Tue, 14 Feb 2023 23:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83556F8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 23:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83556F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AHcgK2/o
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 91E59B81F43;
	Tue, 14 Feb 2023 22:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB96C433D2;
	Tue, 14 Feb 2023 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676415250;
	bh=F1m163MfqlLt4FsZiQ/MfsbF4sF9/xANQE+DKZufALg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AHcgK2/o5YHIAetDjpO3DX40HBqcWBf3GjnF7U/ZcISKr6KuuC1hM6K8phuk+z6lz
	 DctcyupKOB8kxebRRH8Khr7zhqfuZZlmuMAOUl/gHUH6WHilykFVVUv0N9+oJcKUJX
	 55Viplsp5rug8/5ZI5JT5+7LpWkEeJiFBo6mY57EPrv+7M8X+OuW56Wey7Eywjx/qz
	 QfM6jst3+m+m20Wh5GZTlAQNpl3MFaZ4qCblK0YzlG8IQO6LHvQ9iho/at7OzMSyhb
	 BwNYrSVEhxT4NC92gOBsCyQv75PWmUeAH3NLYdVTvJnCx2fuByiHXcNk/Pnjo/whSU
	 zIE5FBjk0x+Rw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH v3 0/2] ASoC: dt-bindings: renesas,rsnd.yaml:
 add R-Car Gen4 support
Message-Id: <167641524728.3158779.5732216902897782213.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 22:54:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: 7XDUDQGTV3DWTGMQI2227FLQBTNQBPE3
X-Message-ID-Hash: 7XDUDQGTV3DWTGMQI2227FLQBTNQBPE3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XDUDQGTV3DWTGMQI2227FLQBTNQBPE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Feb 2023 02:12:41 +0000, Kuninori Morimoto wrote:
> These are v3 of R-Car Gen4 support for Renesas sound driver.
> 
> I have posted these patches as [RFC], because the schemas
> doesn't work correctly for me under certain conditions.
> "required: dmas/dma-names" always hits to "if-then" and
> never hits to "else" for some reasons. I'm still not sure why...
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop "dmas/dma-names" from "rcar_sound,ssi"
      commit: 0438499a7f098c35e83134fc04899fe2188e4ef2

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

