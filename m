Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226207506D3
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8822B844;
	Wed, 12 Jul 2023 13:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8822B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162536;
	bh=Sw2ueSy4tZEpmuUmU7Jczj7DR7fFT6A4T0//O/sKxPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SVCFJjAHniaAlH79ciTjgL2V8f8mlnq+Xow8l+1OU24Eqh++ndTZ4eNJtl8wo08pf
	 aUuB7jrFokIp63ao6v2cJ67+KpSmFqBq8q+slKFAL8U/0HHZJN3XJdB2EgdwHDStSp
	 tpeuTkKiobbyT4HtkVP0R2yerAWj6l8vImChyGDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04DABF80579; Wed, 12 Jul 2023 13:46:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E46AF805A0;
	Wed, 12 Jul 2023 13:46:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90CF5F8057B; Wed, 12 Jul 2023 13:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4454AF80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4454AF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VPI1nKjD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01AF161794;
	Wed, 12 Jul 2023 11:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094BFC433CA;
	Wed, 12 Jul 2023 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162404;
	bh=Sw2ueSy4tZEpmuUmU7Jczj7DR7fFT6A4T0//O/sKxPY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VPI1nKjDq36R3KKeWXgPC0cNNUn/G11E22AE7djhJVSr6ImhzfntGoCUUHYRx9cTL
	 gYgF3O/2QpT1QEWqMOe+0NAeR6xZVzFR/0Btpq61qhS6+nritv44l9p6q/u8YPNX2w
	 BPmJkgNBQRVOAGH5By9OflQzXUkiQneSJnmFZgSG6DHZtzZGyB/0LY0nywStbnD90k
	 eNH2vovXIgE98UJesg2Ys4XgeyasWSNb7ot7ANUwgNmeor8Z7c51yZMMsIODxmhPOo
	 jL5a6TnUNxGAHU6WiLD7DdAmhAM+XgiEdpMuWCzFhiMa/oZC3bzSMIoiNkmlFAUsxV
	 k+4Jn60C3TCsA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Wojciech Ziemba <wojciech.ziemba@intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230623085830.749991-1-herve.codina@bootlin.com>
References: <20230623085830.749991-1-herve.codina@bootlin.com>
Subject: Re: [PATCH v6 00/13] Add support for IIO devices in ASoC
Message-Id: <168916240075.46574.17744650036079379558.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:46:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 2LOTMTG37UXNTSUZML4W2U6P6WPVRC4T
X-Message-ID-Hash: 2LOTMTG37UXNTSUZML4W2U6P6WPVRC4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LOTMTG37UXNTSUZML4W2U6P6WPVRC4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Jun 2023 10:58:17 +0200, Herve Codina wrote:
> Several weeks ago, I sent a series [1] for adding a potentiometer as an
> auxiliary device in ASoC. The feedback was that the potentiometer should
> be directly handled in IIO (as other potentiometers) and something more
> generic should be present in ASoC in order to have a binding to import
> some IIO devices into sound cards.
> 
> The series related to the IIO potentiometer device is already applied.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: dt-bindings: Add audio-iio-aux
        commit: cacff5e8a305b98595829ac4f5fe669e015ce19c
[02/13] ASoC: dt-bindings: simple-card: Add additional-devs subnode
        commit: b5f3484117b86cb128f500ff2d730c3cfcb9ddfc
[03/13] iio: inkern: Check error explicitly in iio_channel_read_max()
        commit: f75c544d74133278b004195220f540d8ab953e14
[04/13] iio: consumer.h: Fix raw values documentation notes
        commit: 1e1b4fbd6d0f8c54af14dcf18bd3136816153b12
[05/13] iio: inkern: Remove the 'unused' variable usage in iio_channel_read_max()
        commit: ad4e8480a1db8713ee7dfcc2770ea9f577750111
[06/13] iio: inkern: Fix headers inclusion order
        commit: 524cfdf6b88e2536f90f726b8c01ffe218f37d68
[07/13] minmax: Introduce {min,max}_array()
        commit: c952c748c7a983a8bda9112984e6f2c1f6e441a5
[08/13] iio: inkern: Use max_array() to get the maximum value from an array
        commit: 97aee7157eeadaf628e7f76da5e49cee91f19901
[09/13] iio: inkern: Replace a FIXME comment by a TODO one
        commit: 4dc603735826ec3963e30d6f25260255ca96d103
[10/13] iio: inkern: Add a helper to query an available minimum raw value
        commit: 7560418078b939e1e83f7dce502ec3c1ca8c152f
[11/13] ASoC: soc-dapm.h: Convert macros to return a compound literal
        commit: 12e58fec5b2aff3ae6fef4e6c278f295a666b9b6
[12/13] ASoC: codecs: Add support for the generic IIO auxiliary devices
        commit: 1d298ad822178d365b53eac298c1752730505306
[13/13] ASoC: simple-card: Handle additional devices
        commit: 6d8ad35d119ca4c9c6fdf83faa733102c4a63f4b

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

