Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A189E632
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 01:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2857C1948;
	Wed, 10 Apr 2024 01:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2857C1948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712705906;
	bh=XG1SXqamh3WyoCHxaAMZhjfQJPWeGuVprvZZH+jUryc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RP1FVufCbYcqTF6NA90hSRRxIbYN7+w0LRgvN0KqpkAQWlCPoLJX0Byln9nLOPrM7
	 +TGQwkprZSwnjDBoPt9fzd3B3g+oKaOTkdtbClq471rRzfnxOB3fjuAdupVLmTnCVx
	 wiItkGqcd47nR9gT7kQyevvypy0ZL53J5LizBjjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58665F80589; Wed, 10 Apr 2024 01:37:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98A65F8058C;
	Wed, 10 Apr 2024 01:37:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35C0EF8026D; Wed, 10 Apr 2024 01:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BC06F80238
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 01:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BC06F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RFWFSsVm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56AD8CE248D;
	Tue,  9 Apr 2024 23:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EEAC433C7;
	Tue,  9 Apr 2024 23:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712705654;
	bh=XG1SXqamh3WyoCHxaAMZhjfQJPWeGuVprvZZH+jUryc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RFWFSsVm+Dibl+Ox8Q7sc11MQ2rmD6rNXRKT500Oxt+ofnl7YQf5AondutbH+63ew
	 bqePeVbWviw0ageRm3Y59NTDK1S9+x/2Sim9Is1cs1koPrCy6OFjVEg0BMMe0WEBv9
	 KKo7LeG5noPqVZOCRsC2pWGxAOxdXWLHOOoi8qRXJ5Y3NyDqZposzVKMeXtKKgC+Gf
	 23zgMOrrRHzhdQQophZm8dl1zWerwKyMbXj0Q0tKvzhzxvrXRDc33qJ5oMbBCm0eb/
	 34gjm2PWxe/3K01LeJxGknrMeOioibUXsySn8PLWD5lG/g/sHwadM2cOC6OiqYizAT
	 YG4xmmkiHM8lA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
Subject: Re: [PATCH v2 00/13] ASoC: ti: davinci-i2s: Add features to McBSP
 driver
Message-Id: <171270565143.199334.14937657298516371152.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 00:34:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: USWKY7LYQRMXQVXEHHYJJNWGKWLYP62L
X-Message-ID-Hash: USWKY7LYQRMXQVXEHHYJJNWGKWLYP62L
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USWKY7LYQRMXQVXEHHYJJNWGKWLYP62L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Apr 2024 09:12:00 +0200, Bastien Curutchet wrote:
> This series aims to add some features to McBSP driver.
> 
> Convert bindings from .txt to .yaml.
> Add possibility to use an external clock as sample rate generator's
> input.
> Add handling of new formats (TDM, S24_LE, BP_FC).
> Enable the detection of unexpected frame pulses.
> Set the clock free-running mode according to SND_SOC_DAIFMT_[GATED/CONT]
> configuration in DAI format.
> Add ti,T1-framing[tx/rx] properties in DT. They allow to set the data
> delay to two bit-clock periods.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: dt-bindings: davinci-mcbsp: convert McBSP bindings to yaml schema
        commit: 22a1dd652de329394ca81dd2fe046444920c96dc
[02/13] ASoC: dt-bindings: davinci-mcbsp: Add optional clock
        commit: 6a4b6b062a5917d611c1bde7189c5147cf0ca832
[03/13] ASoC: ti: davinci-i2s: Remove the unused clk_input_pin attribute
        commit: 904fb8f843a99ae7473d184412b6c7bd46a51593
[04/13] ASoC: ti: davinci-i2s: Replace dev_err with dev_err_probe
        commit: 6b1517b30d6dc9442d92f0273726f1e7390eff2c
[05/13] ASoC: ti: davinci-i2s: Use external clock to drive sample rate generator
        commit: 714ffb8d36f94bdc6d576417b451e9c568c83894
[06/13] ASoC: ti: davinci-i2s: Delete unnecessary assignment
        commit: 7dd7a6d2648b0b253cb8be3cdf8e895a995548fe
[07/13] ASoC: ti: davinci-i2s: Add TDM support
        commit: 37e313cda35aa16623ccae630530651c786a1392
[08/13] ASoC: ti: davinci-i2s: Add handling of BP_FC format
        commit: eff21f5f8ea01834835ebe35995dba40f8435795
[09/13] ASoC: ti: davinci-i2s: Enable unexpected frame pulses detection
        commit: 94d57c541dbdd350a91baeee94d3f5148e1d4dd7
[10/13] ASoC: ti: davinci-i2s: Link free-run mode to SND_SOC_DAIFMT_[GATED/CONT]
        commit: 091b440ffd7cb542fd45c39dddd56bd870f9e180
[11/13] ASoC: ti: davinci-i2s: Add S24_LE to supported formats
        commit: 92e7bb2b6aa374c130dcf052f2c52f63c5b75d38
[12/13] ASoC: dt-bindings: davinci-mcbsp: Add the 'ti,T1-framing-{rx/tx}' flags
        commit: 609302ca04a3177463b0fbf4d5fc55a3ab4f900d
[13/13] ASoC: ti: davinci-i2s: Add T1 framing support
        commit: 08e02fa48429c34db231cc3b58b940de2f7caf35

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

