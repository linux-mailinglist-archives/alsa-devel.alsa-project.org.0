Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024F95FD8B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 00:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5053682A;
	Tue, 27 Aug 2024 00:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5053682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724713020;
	bh=M0Ntd6s913U5SOeV1TIdFxvvzwDT79BkVPTJjzmt8gE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nvbuMg3h0G3jEQaVCEufAn5cLohzMTTCr9pdEwMOq3mv6WtdV+wzSOfOylIGT/oFB
	 HC8xES1MIIARsHqkg22a0Chx+KPLHbOcaC9QHjPyvDKh01p5Sw8qv7qQ5nzdhBAzbJ
	 ADCRkGMMLqc7GkRYH3Oh88qCQHuXogN0rlwuANvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0A2F805B6; Tue, 27 Aug 2024 00:56:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20E35F805AE;
	Tue, 27 Aug 2024 00:56:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6D58F80423; Tue, 27 Aug 2024 00:48:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	TIME_LIMIT_EXCEEDED,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D14CAF800AC
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 00:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D14CAF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ryhTXtJX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF80FA40E16;
	Mon, 26 Aug 2024 22:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B3CC8B7DE;
	Mon, 26 Aug 2024 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724711828;
	bh=M0Ntd6s913U5SOeV1TIdFxvvzwDT79BkVPTJjzmt8gE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ryhTXtJXPh3dqovOWwDUQ1RYohxer3IcchVGxS7K9Z24kWywHCbddiVSR25zMIwuC
	 wUHlaOoaXrsxe/eqWry5jFM6fiEDdadcnWWbnY81/iCBXunS0WK3ZpmRLA3yfciHY/
	 5uHCsp+hG7Xb0lgF4Ax6+EbH2m1NCvfc6eqvKqdiwKf13bdavU26I2nZkALXs5QIdP
	 /UR5KVmddJA6im3LdaoFA63yeIIhaGe80QU05z5QR30FjppaKFxf/dBumwoU9L7zXe
	 omX/B5t1+rDVeHQlnucrhRTUwYQgRqctNeOZovukVVuG5wtuOkusQKmQE8akVj9fLN
	 nAAAVYPnhgfSQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Liao Chen <liaochen4@huawei.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 u.kleine-koenig@pengutronix.de, andy.shevchenko@gmail.com,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org
In-Reply-To: <20240826084924.368387-1-liaochen4@huawei.com>
References: <20240826084924.368387-1-liaochen4@huawei.com>
Subject: Re: [PATCH -next 0/4] ASoC: fix module autoloading
Message-Id: <172471182196.865478.11843966952043605315.b4-ty@kernel.org>
Date: Mon, 26 Aug 2024 23:37:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: KX3E5ROMCHY4TWV3CQ3EYWP3CCJ5A2LI
X-Message-ID-Hash: KX3E5ROMCHY4TWV3CQ3EYWP3CCJ5A2LI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KX3E5ROMCHY4TWV3CQ3EYWP3CCJ5A2LI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Aug 2024 08:49:20 +0000, Liao Chen wrote:
> This patchset aims to enable autoloading of some use modules.
> By registering MDT, the kernel is allowed to automatically bind
> modules to devices that match the specified compatible strings.
> 
> Liao Chen (4):
>   ASoC: intel: fix module autoloading
>   ASoC: google: fix module autoloading
>   ASoC: tda7419: fix module autoloading
>   ASoC: fix module autoloading
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: intel: fix module autoloading
      commit: ae61a3391088d29aa8605c9f2db84295ab993a49
[2/4] ASoC: google: fix module autoloading
      commit: 8e1bb4a41aa78d6105e59186af3dcd545fc66e70
[3/4] ASoC: tda7419: fix module autoloading
      commit: 934b44589da9aa300201a00fe139c5c54f421563
[4/4] ASoC: fix module autoloading
      commit: 1165e70a4a5d8b4da77002ac22b4c5397f30e00d

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

