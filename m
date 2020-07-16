Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E175E222F7D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 01:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917D315E5;
	Fri, 17 Jul 2020 01:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917D315E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594943990;
	bh=0UyQAP8tcrF94mbXpbS2Opl05OwH26HECxnpInCYxX0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDftMJ72zCLgRlCyE//t3BdR9A1W8sKLAtag6Z2sYHT+x37qGoe1k+rLTsC7S7asW
	 9qPzA2uUBKHC1Ik92I/uFjErBVH7xJ4MNmGyS5lVJkr+i8y4tDOAeCb/lp0RmAnr+x
	 tkNrWHfKSpUCtmGhcaOYXboiKLQCRGXIuPbZ17Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85BABF8014C;
	Fri, 17 Jul 2020 01:57:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC1ADF802BC; Fri, 17 Jul 2020 01:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D9AEF8028A
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D9AEF8028A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tupy/zbw"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 133D62076D;
 Thu, 16 Jul 2020 23:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943827;
 bh=0UyQAP8tcrF94mbXpbS2Opl05OwH26HECxnpInCYxX0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Tupy/zbwkMH5QQrLPJSc/qBA4A20C6EBpSa9jdjFhrLNYq5hsLXvgANnaIanlp7vv
 6DmYiErw/CZsMb56z0Xt3u/M5IFTclQlT60AxE477nP9HMiuyyaFOdVRl59pg1T50u
 enZngjFH5PQm1gS58uXMZoWpRPwJbkFIwinUduu8=
Date: Fri, 17 Jul 2020 00:56:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7uhxxk6.wl-kuninori.morimoto.gx@renesas.com>
References: <87h7uhxxk6.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/21] ASoC: merge .digital_mute() into .mute_stream()
Message-Id: <159494380521.42174.12866785781053580028.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 09 Jul 2020 10:55:05 +0900, Kuninori Morimoto wrote:
> These are v3 patch-set.
> ALSA SoC has 2 mute callbacks (= .digital_mute(), .mute_stream()).
> But the difference between these 2 are very small.
> 	.digital_mute() is for Playback
> 	.mute_stream()  is for Playback/Capture
> 
> This patch-set adds new .no_capture_mute flag and emulate
> .digital_mute() by .mute_stream().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/21] ASoC: hdmi-codec: return -ENOTSUPP for digital_mute
        commit: e07e49c0d1e3693facf588142c4cbde45904b3f8
[02/21] ASoC: soc-dai.c: add .no_capture_mute support
        commit: 350d993510115e3d9e78f1b3359bff7b68e88418
[03/21] ASoC: hdmi-codec: merge .digital_mute() into .mute_stream()
        commit: d789710fb248df0c2279a785c7b9beb313629c0a
[04/21] ASoC: ti: merge .digital_mute() into .mute_stream()
        commit: 059374fe9ea5dd1e5a1d6b14741baf994dbc8dd2
[05/21] ASoC: spear: merge .digital_mute() into .mute_stream()
        commit: 1ff123965bd00f1aacbd4549b03a6a5b98432eaf
[06/21] ASoC: meson: merge .digital_mute() into .mute_stream()
        commit: f795ff78e266492a5278cbef89d3422bdcf591b0
[07/21] ASoC: atmel: merge .digital_mute() into .mute_stream()
        (no commit info)
[08/21] ASoC: codecs: merge .digital_mute() into .mute_stream()
        commit: 54b5927067dd79b58032a4938ee13b233f1a368c
[09/21] ASoC: codecs: tlv*: merge .digital_mute() into .mute_stream()
        commit: 960af79d31495b81bf9406f2f1fda425cb49342b
[10/21] ASoC: codecs: tas*: merge .digital_mute() into .mute_stream()
        commit: 38803ce7b53bd7588e8ad899a73fe21e8741723b
[11/21] ASoC: codecs: ssm*: merge .digital_mute() into .mute_stream()
        commit: bd63ed76890f38246a42cee715a437774bedf70b
[12/21] ASoC: codecs: pcm*: merge .digital_mute() into .mute_stream()
        commit: 1eb2c43d26a585bbbe196360e921c5ffe9d00fd1
[13/21] ASoC: codecs: max*: merge .digital_mute() into .mute_stream()
        commit: 18e028e22ebfe362656f534c540d7b3c6c094bd0
[14/21] ASoC: codecs: alc*: merge .digital_mute() into .mute_stream()
        commit: 4c66c2fc106f04899e778eec5f7a33a6fef4471e
[15/21] ASoC: codecs: wm*: merge .digital_mute() into .mute_stream()
        commit: 26d3c16e62e9f07b99d3886bec05effe5aadcbe5
[16/21] ASoC: codecs: es*: merge .digital_mute() into .mute_stream()
        commit: 8667d948a6185fcde88ebc89e090fa574a44c366
[17/21] ASoC: codecs: da*: merge .digital_mute() into .mute_stream()
        commit: f39c0540d6941b2390cea20f413b620adcc3be86
[18/21] ASoC: codecs: cs*: merge .digital_mute() into .mute_stream()
        commit: 03c0f1b5e1e01afdff8bca8ea6c599ff9a349ed6
[19/21] ASoC: codecs: ak*: merge .digital_mute() into .mute_stream()
        commit: 50891431aaadf784980f8649d676327928bce72f
[20/21] ASoC: soc-dai: remove .digital_mute
        (no commit info)
[21/21] ASoC: soc-core: snd_soc_dai_digital_mute() for both CPU/Codec
        (no commit info)

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
