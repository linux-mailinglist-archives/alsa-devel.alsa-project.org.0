Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5626AC15B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:35:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D3D1113;
	Mon,  6 Mar 2023 14:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D3D1113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109725;
	bh=vHD+Qw2wXeMkMUjtTnYb4H790o7nOfbwTCjhdr4yWd4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GfEGCeXIlMSDsXSFfOVLe9OwVtUTIk3UsqlU5KWN/vZ7ceWx0W7+Pd1by8DTaN6BM
	 Mdqidk9wZqKKx3p79dB3gla3lZ9b/6Vr5iFjkgrmNyK9h0NM/qlJv8pMPtn33w9aF8
	 SoXKK7gCNKHF+muLvOCbks/2VZm45PsAG/0ERjUY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B690F80558;
	Mon,  6 Mar 2023 14:33:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84098F8053B; Mon,  6 Mar 2023 14:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA334F8053D
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA334F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aeBBIhmK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF29E60F31;
	Mon,  6 Mar 2023 13:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9F9C4339C;
	Mon,  6 Mar 2023 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109527;
	bh=vHD+Qw2wXeMkMUjtTnYb4H790o7nOfbwTCjhdr4yWd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aeBBIhmKunx+ppCbWgZI5muIUNhqTVQ5wbnFA8nAs7/Lqw7KMHj8lQjtsVK5m9G+8
	 8zjmV2+u90SQBWkVp+GKRuzkHVuHOVB6SL8TmpsniwJc/HKK4O/p77kkCR9ts6Ybfz
	 9q9BZHwoHRYDdRpT3RXNZNm3Gvdmc/6FbI1AcQ1GA0a9pQSieduyFA9ebCVy/6cJFd
	 /zFpaxQhGiEgMu2gKA//c/eRKeykKT1WY4HTnNToOa8iV8aQ27fMWstoamZv0w9U+Z
	 oSS0HVaIQXRZuvz7boXHJNWGsePH+iTJJDkGu3FJLsjCV0HUlXmphpMC0UW89ciLpG
	 BU5rTaU25gaxA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>
In-Reply-To: <20230301113807.24036-1-claudiu.beznea@microchip.com>
References: <20230301113807.24036-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH 0/8] ASoC: microchip: some cleanups for AT91 sound
 drivers
Message-Id: <167810952550.75807.18160787538439969782.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:32:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 7LQLBTZPPA7HZKRR4PZB5KW4MGZUDT3R
X-Message-ID-Hash: 7LQLBTZPPA7HZKRR4PZB5KW4MGZUDT3R
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LQLBTZPPA7HZKRR4PZB5KW4MGZUDT3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 Mar 2023 13:37:59 +0200, Claudiu Beznea wrote:
> The following patches do some cleanups for Microchip AT91 sound drivers.
> Along with it I took the chance and updated MAINTAINERS file.
> 
> Thank you,
> Claudiu Beznea
> 
> Claudiu Beznea (8):
>   ASoC: mchp-spdiftx: use FIELD_PREP() where possible
>   ASoC: mchp-spdiftx: use regmap_update_bits()
>   ASoC: mchp-spdiftx: update debug message
>   ASoC: mchp-pdmc: use FIELD_PREP() where possible
>   ASoC: mchp-pdmc: return directly ret
>   ASoC: mchp-pdmc: avoid casting to/from void pointer
>   MAINTAINERS: add myself as maintainer for Microchip AT91 sound drivers
>   MAINTAINERS: update Microchip AT91 sound entries with documentation
>     files
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: mchp-spdiftx: use FIELD_PREP() where possible
      commit: 28ce5698456ab53540093836c6fee15119cf1821
[2/8] ASoC: mchp-spdiftx: use regmap_update_bits()
      commit: 0ab4bd5bf277349262065e88eb2feaaabf53584c
[3/8] ASoC: mchp-spdiftx: update debug message
      commit: 2d8dad4dc4d4a12afa3c31e72b60727d4c133b99
[4/8] ASoC: mchp-pdmc: use FIELD_PREP() where possible
      commit: 129742576dd1b972ea1e671595a085e29012f7f3
[5/8] ASoC: mchp-pdmc: return directly ret
      commit: 51124a30308e6db8658575e5d9ec1ea3cb3ba3c3
[6/8] ASoC: mchp-pdmc: avoid casting to/from void pointer
      commit: cb72b29cd5cfac20894a040e411dec70bb75097c
[7/8] MAINTAINERS: add myself as maintainer for Microchip AT91 sound drivers
      commit: 8f943f00d7a844daa9acafd304c2178f30ecc255
[8/8] MAINTAINERS: update Microchip AT91 sound entries with documentation files
      commit: 15dbfc04e6865bae1aa275216baa1a7eb55cd2cf

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

