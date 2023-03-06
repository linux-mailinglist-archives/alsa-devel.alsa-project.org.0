Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D446AC16E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:36:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9BD1101;
	Mon,  6 Mar 2023 14:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9BD1101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109803;
	bh=XWT1IwidgLr0jSesGV2biIoL9GxsLvYYjcIQL1LYrxE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SEp8Tr0YIYzYWkiKGjwsQCbnBFwvRTAAlXkbUB7hLVvoLxtICjxYtqH/Sc6SUglmT
	 0dOCvI/6UFFH5O8aBY4mH2uOu+gcaR6oSjZO9Mu43Zf/XycOnxKFadqwT1sAx3LLOH
	 kR6fKDCGnx+8uRCi7Uo2/b0LUSdTHitE49ct5Kv4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EEDF805A0;
	Mon,  6 Mar 2023 14:33:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A92CCF8053B; Mon,  6 Mar 2023 14:32:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A24DF80482
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A24DF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uB0yv6OH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D16160F38;
	Mon,  6 Mar 2023 13:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010F0C433AA;
	Mon,  6 Mar 2023 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109535;
	bh=XWT1IwidgLr0jSesGV2biIoL9GxsLvYYjcIQL1LYrxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uB0yv6OHWWrgXsCGkuGZios5vuvjuaFIsuHXPE9Q0EwjwKB5iqPZqdSb3R6IGfvjk
	 51S0tyKXMeFP+7oq1NASdxg5LKBGyVIxKHVAkG4FqiPWJi2kmF0SAeGnUxawmOGylq
	 AOO7Bopmbcaj48O715gMrNuzApcjR/AjAre8TgmQHejEuQ+Gq7aRZn43PdClV4uVk7
	 RVzJUSTmNZWtRzZ55KaWZp637uszer5oeGXvFPPc0ZMcbUHSbwj9hBeaGlAhozVnrh
	 HlbR0/dx3RASvcrfLpG0VXaMMjD5DlWxdIj87qab93L4vuoSbpKAH4IDsikJ2FsaRD
	 AIsX4VlXnzSNg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH v3 0/2] ASoC: dt-bindings: renesas,rsnd.yaml:
 add R-Car Gen4 support
Message-Id: <167810953370.75807.4506250468842557501.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:32:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 2ZPQJIMTTA3X5YHNJRNUTWDFS5JMCETB
X-Message-ID-Hash: 2ZPQJIMTTA3X5YHNJRNUTWDFS5JMCETB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZPQJIMTTA3X5YHNJRNUTWDFS5JMCETB/>
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car Gen4 support
      commit: 7f8b5b24bbb463614dd6b797e6b2ee92b3e2a6a1

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

