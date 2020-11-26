Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810E2C5CCC
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:07:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED5517FD;
	Thu, 26 Nov 2020 21:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED5517FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606421255;
	bh=rr3oYajfVyOIkRthandp72GS1WUAOUxDrUFGMF3OfJg=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hsIGz0j/AZeZDEFl/UIa/GNRXiYSAwm7ePyo3QbBynPS+a/xS1pY2vNYXlBhIDnKa
	 xzkX/rE8SFaBtD/ZLajxjblRJ0G2gySb+4Og0tKL2DV/TDnem32hCrCWr1Du0A4Z8A
	 ymUNlGHOxFbdvhmVVGHx3XzFA6pF+pP+aSM/jB8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5920DF8026F;
	Thu, 26 Nov 2020 21:06:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29AACF80165; Thu, 26 Nov 2020 21:05:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B4DEF800EA
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:05:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B4DEF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d7IrMfjs"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CF8F20DD4;
 Thu, 26 Nov 2020 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606421151;
 bh=rr3oYajfVyOIkRthandp72GS1WUAOUxDrUFGMF3OfJg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=d7IrMfjsjFpvrPoR8xpEOaGt3wkERpB/jOn96EITqBeDa0ClS88KIhjc2ML2DvnQi
 tANow+h3W9KJnT6W8un9mAhWY+MzRTqLIF0vwKCUIp+T8WSSDrTkHQ0zsXq9XZKPNZ
 vUKugvFZdJFbLAmQpkXps8g080OgVHogFfCxH4BA=
Date: Thu, 26 Nov 2020 20:05:24 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-amlogic@lists.infradead.org, Patrick Lai <plai@codeaurora.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Kevin Cernekee <cernekee@chromium.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Oder Chiou <oder_chiou@realtek.com>, linux-arm-kernel@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-rockchip@lists.infradead.org,
 Support Opensource <support.opensource@diasemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
Subject: Re: [PATCH v2 00/39] ASoC: fix !OF compile test warnings
Message-Id: <160642112480.9090.8863335485004584231.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 25 Nov 2020 17:44:13 +0100, Krzysztof Kozlowski wrote:
> Changes since v1:
> 1. New patch 2/39: ASoC: bd28623: mark OF related data as maybe unused,
> 2. Patches 1-13: add maybe_unused after discussions with Mark,
> 3. Add Sylwester's review to two patches (one changed so please review
>    one more time).
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/39] ASoC: ak5558: mark OF related data as maybe unused
        commit: 9f34c04057232ca2688d26416d3f0011c5ea5377
[02/39] ASoC: bd28623: mark OF related data as maybe unused
        commit: 1bab2b22675f2e4bd498a7688b681839a7ecece0
[03/39] ASoC: gtm601: mark OF related data as maybe unused
        commit: 03219faf153c3adb93d68355a8ccbaa48e40735f
[04/39] ASoC: inno_rk3036: mark OF related data as maybe unused
        commit: 66b9890634690c71910c8dd41f273e87f9bc4b4a
[05/39] ASoC: rk3328: mark OF related data as maybe unused
        commit: 84902aec0886e1a8fdd26ae6b8a65fb2c26018a8
[06/39] ASoC: tas571x: mark OF related data as maybe unused
        commit: f38c0b1e8a63439edc234a65bb549d3c6e49e66e
[07/39] ASoC: kirkwood: armada-370-db: mark OF related data as maybe unused
        commit: d013a59a199e81582c6435a924a23ed393279b07
[08/39] ASoC: meson: t9015: mark OF related data as maybe unused
        commit: b397f02171e6d6ca9b77e4cfec73c0dfe2345562
[09/39] ASoC: qcom: mark OF related data as maybe unused
        commit: 377c7b7cc11d80acf85101416d1122135f997dc5
[10/39] ASoC: samsung: smdk_wm8994: mark OF related data as maybe unused
        commit: 3285b6623653befaf97687d418c99531a09037db
[11/39] ASoC: rockchip: mark OF related data as maybe unused
        commit: 56af27ad5f363e030a1191da459460fcb70cf76a
[12/39] ASoC: ti: davinci: mark OF related data as maybe unused
        commit: 4bad6ec57d8045046ae8f8e410a16c1ad9d652f2
[13/39] ASoC: uniphier: mark OF related data as maybe unused
        commit: c0b7cf59971e9f5fd1960774dc8a1728777cd437
[14/39] ASoC: ak4118: skip of_device_id table when !CONFIG_OF
        commit: bda20fb03e54c261b6ff8b0d04344ed9a1812338
[15/39] ASoC: alc5623: skip of_device_id table when !CONFIG_OF
        commit: d11f8974896817382f8adda8b6c9071387cb2ce0
[16/39] ASoC: alc5632: skip of_device_id table when !CONFIG_OF
        commit: 5207e768347dbb3249ee83979e868850b4b9d23b
[17/39] ASoC: da7218: skip of_device_id table when !CONFIG_OF
        commit: a06cd8cf97a336c87a98c7e64e5692c5391b50e6
[18/39] ASoC: da7219: skip of_device_id table when !CONFIG_OF
        commit: a7de367daa8412fe854a255c2b4ff5bd4399c00a
[19/39] ASoC: da9055: skip of_device_id table when !CONFIG_OF
        commit: a25b45dc143748354947cbc30b682deacb27978f
[20/39] ASoC: es8316: skip of_device_id table when !CONFIG_OF
        commit: 75333af40a25ca33179cbbe68019da0b9a123262
[21/39] ASoC: max98090: skip of_device_id table when !CONFIG_OF
        commit: ac792c0ab3db9392bbbc7023fefb41bc9d467bfc
[22/39] ASoC: max98095: skip of_device_id table when !CONFIG_OF
        commit: a5a196bf0a0b9af14e0170282a3c8d8febe9fe64
[23/39] ASoC: max98371: skip of_device_id table when !CONFIG_OF
        commit: e77332c3e741e88ea025c9d0fbb22c833cdb01ad
[24/39] ASoC: max9867: skip of_device_id table when !CONFIG_OF
        commit: 682e22193120a87a25ed7d7a71bbac682a33e2ee
[25/39] ASoC: max98925: skip of_device_id table when !CONFIG_OF
        commit: d39d9cb5a2c9526c19e2d3a0a43465d49143426d
[26/39] ASoC: max98926: skip of_device_id table when !CONFIG_OF
        commit: fff68ff65129525c88d52a05a55cabff5a4b0821
[27/39] ASoC: pcm1789: skip of_device_id table when !CONFIG_OF
        commit: 36cbbf009f229fe27eac869cb279de1f80aa654b
[28/39] ASoC: pcm179x: skip of_device_id table when !CONFIG_OF
        commit: e2baf7fa3e84a6f1fb930f10547401d9363b4caf
[29/39] ASoC: rt5660: skip of_device_id table when !CONFIG_OF
        commit: c7bfb25333526463ffc38b5c3460e6778e474c9d
[30/39] ASoC: tas2562: skip of_device_id table when !CONFIG_OF
        commit: 68591e8aa122b43e5f9c6eb5cf49c559e5d6300e
[31/39] ASoC: tlv320: skip of_device_id table when !CONFIG_OF
        commit: 762e0b8baf63b1bb534254f89148884c873363f3
[32/39] ASoC: ts3a227e: skip of_device_id table when !CONFIG_OF
        commit: 62bd3054af54d4d55267a623c4d938fd42f48b59
[33/39] ASoC: es7134: mark OF related data as maybe unused
        commit: 418fb63003f6e2d99d6f6eb6ba25e1576bf55348
[34/39] ASoC: es7241: mark OF related data as maybe unused
        commit: 55c259bf06e5f7a899411e474a48d79cf1a0a2f6
[35/39] ASoC: samsung: i2s: mark OF related data as maybe unused
        commit: da773b2b45f9de4f44bd62db8b291e2b0a4c3f5b
[36/39] ASoC: max98371: drop driver pm=NULL assignment
        commit: fe4b501e56af81f88215f943c2caef5eded26920
[37/39] ASoC: max98925: drop driver pm=NULL assignment
        commit: 0eb97389cc4d470b3fdf5384f70f4dc074004843
[38/39] ASoC: max98926: drop driver pm=NULL assignment
        commit: c37de70121a03415acd4c7de58a65c4a55ab4c6b
[39/39] ASoC: samsung: smdk_wm8994: remove redundant of_match_ptr()
        commit: 0670c9a7239a478ec9675fa82d7ee0a86ef22fe5

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
