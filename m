Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0352135D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 13:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED368173C;
	Tue, 10 May 2022 13:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED368173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652181293;
	bh=yY35YDk9RI0PBtv75HOzfwiJh95q25x5cV9WWHxl4EE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snzpbe4R38FwqwzTyk6TmMFGdUFo9Ti1RYHDgysO7TRm41Hrg7YJT4vYrfSXSo5cN
	 JT5uCTGKWUP/WGB9HyboPCXWpEKORFXvZuB6aKjuRFQZfW03IKIJdERbvfM8lFSWNr
	 eNcOrrR1bWQSGTwRcFkEzSzfH8x7LuOHZZQPCrxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26599F801F5;
	Tue, 10 May 2022 13:13:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE8B8F8019D; Tue, 10 May 2022 13:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4100F8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 13:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4100F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qCo58HqP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C717618A3;
 Tue, 10 May 2022 11:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DBFC385C6;
 Tue, 10 May 2022 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652181222;
 bh=yY35YDk9RI0PBtv75HOzfwiJh95q25x5cV9WWHxl4EE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qCo58HqPanRTwnk/T8AsGRSAJIXwBMYOzPGekrW8HFKapMQdZ51y7Gfu22/f3wDa8
 YX8TsrAV8HG/6acmRSOif8EW7PuQ3PCbQoeSoTrkndGaLXxSMem7CHz/w0dA1Lbe+3
 5m3n7UJDTqx1xaaCF2UagutMu8hHD72qqfqvaSM44l11B2STki1A7KCMxh9IYGx9L0
 Q8erj5tt71wLZJM6ywAg4tVqUjFA0Trhgz0MQHOnSOhHjIkWwPNwiF6+NfY1jO24EZ
 8tXGXDToprqOFL/2RtaeVd2ab0dNXc8dKIScOuqRuCzcQyMwBEbpNK3KlqmmMm1qCd
 89Cx3RByetuxA==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 00/38] Clean up usage of the endianness flag
Message-Id: <165218121671.43065.13246450134508582073.b4-ty@kernel.org>
Date: Tue, 10 May 2022 12:13:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: steven.eckhoff.opensource@gmail.com, chrome-platform@lists.linux.dev,
 alsa-devel@alsa-project.org, lars@metafoo.de,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tzungbi@google.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 kmarinushkin@birdec.com, oder_chiou@realtek.com,
 linux-mediatek@lists.infradead.org, alexandre.belloni@bootlin.com,
 matthias.bgg@gmail.com, srinivas.kandagatla@linaro.org,
 codrin.ciubotariu@microchip.com, bleung@chromium.org, cychiang@chromium.org
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

On Wed, 4 May 2022 18:08:27 +0100, Charles Keepax wrote:
> Before componentisation any part registered as a CODEC would have
> automatically supported both little and big endian, ie. the core
> would duplicate any supported LE or BE PCM format to support the other
> endian as well. As componentisation removed the distinction between
> CODEC drivers and platform drivers, a flag was added to specify
> if this behaviour is required for a particular component. However,
> as most systems tend to use little endian the absence of the flag
> is rarely noticed. Also the naming of the flag "endianness" is a
> little unobvious as to if it should be applied to a particular
> component.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/38] ASoC: soc-component: Add comment for the endianness flag
        commit: 5c832efdbf8651e2800a0169a870786bd85ee230
[02/38] ASoC: atmel-pdmic: Remove endianness flag on pdmic component
        commit: 52857c3baa0e5ddeba7b2c84e56bb71c9674e048
[03/38] ASoC: atmel-classd: Remove endianness flag on class d component
        commit: 0104d52a6a69b06b0e8167f7c1247e8c76aca070
[04/38] ASoC: cs4270: Remove redundant big endian formats
        commit: 99a4b91ae967d22158d3f4d4f9564ac63295930e
[05/38] ASoC: cs42l51: Remove redundant big endian formats
        commit: 2bf1e87b9338e8986f78b675a201f7f02a3c43d5
[06/38] ASoC: cs4349: Remove redundant big endian formats
        commit: 8a85e2fca6476968f8558163b95c2df38930e523
[07/38] ASoC: hdmi-codec: Remove redundant big endian formats
        commit: 6edfed8f2cce012e87277c8a1786a2de7d5cae35
[08/38] ASoC: sta32x: Remove redundant big endian formats
        commit: a9b5bef89a68ec45ec198e2d316cd8b9b9bf6655
[09/38] ASoC: sta350: Remove redundant big endian formats
        commit: 2ac5b98284b3744514dcf75909a3bb3c3d5ab7d4
[10/38] ASoC: hdac_hda: Add endianness flag in snd_soc_component_driver
        commit: 1324cd8d14f06ff933c825ca5a51139604bc6b97
[11/38] ASoC: max98504: Add endianness flag in snd_soc_component_driver
        commit: a0556e3ad0c40359d5fa3dc72de14ad2efb9dfda
[12/38] ASoC: adau1372: Add endianness flag in snd_soc_component_driver
        commit: ac6f26c18f2d231e4006b2f12e0e46aeb6430cbb
[13/38] ASoC: cs4234: Add endianness flag in snd_soc_component_driver
        commit: de88ca441a3066668cae62741a52042f0273d364
[14/38] ASoC: cs35l41: Add endianness flag in snd_soc_component_driver
        commit: f0688b567fb88ba7636e87a5daed8a175275aa2e
[15/38] ASoC: cx2072x: Add endianness flag in snd_soc_component_driver
        commit: 1c3cbc1dacecdb427b693992f1a05b5837b33a70
[16/38] ASoC: lochnagar: Add endianness flag in snd_soc_component_driver
        commit: ba7328f31cd508964cf2a0b62edfb0b8339c1e77
[17/38] ASoC: mt6351: Add endianness flag in snd_soc_component_driver
        commit: 39723d3493edd60ed41f9891391d4335b65547b9
[18/38] ASoC: mt6358: Add endianness flag in snd_soc_component_driver
        commit: a5f956e221e92a0e93f036651cdab80a2eb6bb18
[19/38] ASoC: mt6359: Add endianness flag in snd_soc_component_driver
        commit: d990af7422761fa58713e2f56664f7c8c2bf6383
[20/38] ASoC: mt6660: Add endianness flag in snd_soc_component_driver
        commit: 8044910bc28e06e0dc0194f160118e00964d8b6a
[21/38] ASoC: pcm3060: Add endianness flag in snd_soc_component_driver
        commit: f0488349c1183a3a524434958d909f38628e1d4b
[22/38] ASoC: rt1019: Add endianness flag in snd_soc_component_driver
        commit: 3816069538d54a9c45345f45b569bb2e42846561
[23/38] ASoC: rt9120: Add endianness flag in snd_soc_component_driver
        commit: 80827c123f2a5f5e0fbcc6cb33b102666acec08e
[24/38] ASoC: tlv320adc3xxx: Add endianness flag in snd_soc_component_driver
        commit: f5e0084b5beed00f11fb7cd1e90b8b91fcd06e9f
[25/38] ASoC: tscs454: Add endianness flag in snd_soc_component_driver
        commit: ff69ec96b87dccb3a29edef8cec5d4fefbbc2055
[26/38] ASoC: cros_ec_codec: Add endianness flag in i2s_rx_component_driver
        commit: cfacadbdca23f1a8d9c5db2a8f1bb3c6a1dd4dd8
[27/38] ASoC: wcd934x: Add endianness flag in snd_soc_component_driver
        commit: 6b1b1579aa9879bbf729f75c386cb3c932b1f5b3
[28/38] ASoC: wcd9335: Add endianness flag in snd_soc_component_driver
        commit: e230b1b1819f2941b8b31174a3839388641920f8
[29/38] ASoC: rt700: Add endianness flag in snd_soc_component_driver
        commit: 4982fc1def317febc74398e839dab2a4059692fa
[30/38] ASoC: rt711: Add endianness flag in snd_soc_component_driver
        commit: 33f06beac3ade10834a82ad4105dcd91d4b00d61
[31/38] ASoC: rt711-sdca: Add endianness flag in snd_soc_component_driver
        commit: 3e50a5001055d79c04ea1c79fe4b4ff937a3339c
[32/38] ASoC: rt715: Add endianness flag in snd_soc_component_driver
        commit: 1a6750123b5d2f05200fb55633b32c81c840f681
[33/38] ASoC: rt715-sdca: Add endianness flag in snd_soc_component_driver
        commit: e8f4ddcb33de9b1eaf74d150234a2cd07dddcfad
[34/38] ASoC: rt1308-sdw: Add endianness flag in snd_soc_component_driver
        commit: 9b536b34693c8ab9caf0612bf4fdbc09fd51f126
[35/38] ASoC: rt1316-sdw: Add endianness flag in snd_soc_component_driver
        commit: 7fb6f48351c896fc6c18f9d3e7b0b4fb689e73cb
[36/38] ASoC: wcd938x: Add endianness flag in snd_soc_component_driver
        commit: ff7f9aa523d1699663cbeec4b0e69aaeab5e6bba
[37/38] ASoC: wsa881x: Add endianness flag in snd_soc_component_driver
        commit: 96bc59d097047a8a013cb77b2a1215cc4877fa96
[38/38] ASoC: sdw-mockup: Add endianness flag in snd_soc_component_driver
        commit: e2d61f6255a26a09d4fe2458fa93a33a71db1024

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
