Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F175768F037
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 14:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9354B832;
	Wed,  8 Feb 2023 14:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9354B832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675864669;
	bh=DeQ1r4YPsQy0hvx8QKDPEGZkDrtPXdHip9bsSqdMKQ4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SyCrZwPp3BSDWq0xydMXPLx3pfDB/+YoOxZK2jM9HOSiVPV3Hcm9B59UFnugznDZk
	 jwAsobwxVwqQxW+foktl3D+UH2Vk2GuB0PxfLLGJir/AOX7A7820jhY6Z8vMR8pTpC
	 gbnyWGRCTzfvVGzICosLi1HkwuXIpfRi34WZTpSw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4FD1F80518;
	Wed,  8 Feb 2023 14:56:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD609F8051D; Wed,  8 Feb 2023 14:56:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B20FCF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 14:56:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B20FCF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EpTJ3QT4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAE90616CF;
	Wed,  8 Feb 2023 13:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6195C4339B;
	Wed,  8 Feb 2023 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675864560;
	bh=DeQ1r4YPsQy0hvx8QKDPEGZkDrtPXdHip9bsSqdMKQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EpTJ3QT4xKcH3+6YdBKvVP7sMeEa7zWbhu5hLFNMWNIozWVM0olIF95S8ih5I34N2
	 WbxDTOV1Syf+5CWM+W+b03JwLNvpz2LvEvbpSRMzXS+8XNwDZzsMwWYVs2UvMm5k7l
	 XoBsg8D+E2NrJRUlRaFAhSNBmF+KWrDmmcKYj4avVoh5JUhyPsuEUe+MTouH0UTorF
	 0NWmHBOsLsdZPbAbmiZJBE9if8NCsVksVubeQiYBwnwIz7cUMZLABAl6ImKO0OgLzC
	 9QS8V/VIuunoghV9NeCjfTagpc6FN9LLmVUh3dC4U8PHdRxtpzxgyR2pd+0VhLaW8p
	 C5rX3+EshO5Sw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: dt-bindings: renesas,rsnd.yaml:
 adjust to R-Car Gen4
Message-Id: <167586455859.136560.17907345236016567230.b4-ty@kernel.org>
Date: Wed, 08 Feb 2023 13:55:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: 4GHJ7PSFY6UIO3O5IARLGP2MWFCAQ27C
X-Message-ID-Hash: 4GHJ7PSFY6UIO3O5IARLGP2MWFCAQ27C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GHJ7PSFY6UIO3O5IARLGP2MWFCAQ27C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Feb 2023 01:31:19 +0000, Kuninori Morimoto wrote:
> Cc Geert
> 
> These are R-Car Gen4 support for Renesas sound driver.
> 
> I have posted these patches as [RFC], because the schemas
> doesn't work correctly for me under certain conditions.
> "required: dmas/dma-names" always hits to "if-then" and
> never hits to "else" for some reasons. I'm still not sure why...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: renesas,rsnd.yaml: tidyup reg/reg-name
      commit: 55194032620ae97338ac435505f1296e13fbe821

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

