Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135153FC89
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:57:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE4B1AB5;
	Tue,  7 Jun 2022 12:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE4B1AB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599451;
	bh=/FaoEG+0isQTgHaNsrpZwMErN2EgRLXLibACJQzoXko=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwzlM3p9eLomVutBG1Mrvvo4qRqvRVp6mULNvG6NENr9mnUVqBwL3f3BclX7sXtHD
	 PlRw3OJ5tImxoLuPrg2LdrQOphXp8RuaD5jhMsFYxu9oZnump1TtkI7XgLrw9yrIF7
	 kkk7rchnPvm+nBR+TnVPnC6m/QEqOwsiCOj8E7Fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A65CF8055B;
	Tue,  7 Jun 2022 12:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D15F8F8053D; Tue,  7 Jun 2022 12:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27FB4F80535
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27FB4F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XC7aFtR2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 324E6B81F0D;
 Tue,  7 Jun 2022 10:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC235C385A5;
 Tue,  7 Jun 2022 10:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599303;
 bh=/FaoEG+0isQTgHaNsrpZwMErN2EgRLXLibACJQzoXko=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XC7aFtR2xuV8c4i/UJUsJODwhND2GyFYwwKHGIbHrBM2wMup64mo899gbITct2G5I
 lDhaAjUEVl2as6s9r05rNnISPJzz4acVAHE8qoh1Jd8iNS5k8/q8KKBHkf84eLmdjC
 8fkFpfekTFYUQLmGorOPC141b+ihhXff2gq2XFfiBOs9Nma6b1ywDAWsHutnDi/A7s
 BHEQ2LNopp9v7p8aPGVp5ktdiB+gwnWcwrpGUCsKpIH35TqlCX3XUddrY6ApS5rg85
 6GTntC+V9rbA2qVmxYryks8E4waFVgN5FT4iio6/W/QKjXh7f2+WLeC2rckvNWBUaI
 jGsLN/i2o6PMA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, vitalyr@opensource.cirrus.com
In-Reply-To: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v4 00/17] ALSA: hda: cirrus: Add initial DSP
 support and firmware loading
Message-Id: <165459930242.399031.6035865247693032487.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Wed, 25 May 2022 14:16:21 +0100, Vitaly Rodionov wrote:
> The CS35L41 Amplifier contains a DSP, capable of running firmware.
> The firmware can run algorithms such as Speaker Protection, to ensure
> that playback at high gains do not harm the speakers.
> Adding support for CS35L41 firmware into the CS35L41 HDA driver also
> allows us to support several extra features, such as hiberation
> and interrupts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[09/17] ASoC: cs35l41: Move cs35l41 exit hibernate function into shared code
        commit: 94e0bc317ad241c022a6bb311b3a28b4d51ea8b6
[10/17] ASoC: cs35l41: Do not print error when waking from hibernation
        commit: 97076475e2fdf471348b9ce73215cdbceeb4390f
[11/17] ASoC: cs35l41: Add common cs35l41 enter hibernate function
        commit: e341efc308e5374ded6b471f9e1ec01450bcc93e

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
