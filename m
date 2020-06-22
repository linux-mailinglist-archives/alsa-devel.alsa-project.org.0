Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07A203A30
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 17:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700C616F0;
	Mon, 22 Jun 2020 17:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700C616F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592838076;
	bh=ljSOV2vIqqJ1NhvgM4aWPaq9wUn9Uc1jPSW1roYHpfs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M/ZGrSo67Y/qQ5buSeQVQUix48d86U6nvea7RDgdfxSuoXEiHLjCWm6ukBqEjkrOb
	 cpFEiwjNshFAICJDViKtsTQbtXckx9ZUJl508oDlZgWbtOEE7GyXo+Hf+rWuEs2Ohs
	 skgCI9+Nm5yPav+PjkXsiDHw5D4gT6lptZOQGMRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98499F80162;
	Mon, 22 Jun 2020 16:59:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DC1AF801DB; Mon, 22 Jun 2020 16:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B85F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 16:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B85F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QN54frOX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48C2B20732;
 Mon, 22 Jun 2020 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592837966;
 bh=ljSOV2vIqqJ1NhvgM4aWPaq9wUn9Uc1jPSW1roYHpfs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QN54frOXfr3ncbraGASjxSv06eWuZTiQ7fMZCvFPXnQ8xRA+RKqn03XoOiUPTUdXF
 ViM+b4HjVoq0bJk6KBccYeNmgdVKo1J3wdY/LYMAmputJgRfIhCLD4dOM2cay+rrkO
 lDDR3NU7y4k4HcCWWZuX5P++E5Fh76NypxsHvnbM=
Date: Mon, 22 Jun 2020 15:59:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tuzb4mjg.wl-kuninori.morimoto.gx@renesas.com>
References: <87tuzb4mjg.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/16] ASoC: merge snd_soc_component_read() and
 snd_soc_component_read32()
Message-Id: <159283795951.27481.2932757779075244120.b4-ty@kernel.org>
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

On 16 Jun 2020 14:17:22 +0900, Kuninori Morimoto wrote:
> Because we can use "read" function which is using
> "regmap" or "driver", current ALSA SoC drivers are using both
> 	snd_soc_component_read()    // for regmap
> 	snd_soc_component_read32()  // for driver callback
> These are similar but needs different parameter.
> 
> This patch aggressively merge snd_soc_component_read() and _read32(),
> and makes snd_soc_component_read/write() as generally style.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: soc-component: merge snd_soc_component_read() and snd_soc_component_read32()
        commit: cf6e26c71bfdff823fd40945b07666d75f1e1412
[02/16] ASoC: soc-component: use io_mutex correctly
        commit: e8712315c44d2e7dfc4d29254941831ed2ddcaef
[03/16] ASoC: pxa: rename to snd_soc_component_read()
        commit: 2f86f20bafc3252b4c60152db8d2976414970513
[04/16] ASoC: atmel: rename to snd_soc_component_read()
        commit: f0daed1a49985fed34d7ef96ad5f39534e8a5f92
[05/16] ASoC: codecs: rename to snd_soc_component_read()
        commit: 981abdfe99950d6eff2481fb4c19aeeac50d0ca9
[06/16] ASoC: codecs: wcd*: rename to snd_soc_component_read()
        commit: eaf2767cad9311e864e2736e2152d31799b23eda
[07/16] ASoC: codecs: tlv*: rename to snd_soc_component_read()
        commit: e348cf543426762d7babea49712534f95d0779b9
[08/16] ASoC: codecs: max*: rename to snd_soc_component_read()
        commit: 1227f601ba34773b43969f46773430788df9e6a9
[09/16] ASoC: codecs: msm*: rename to snd_soc_component_read()
        commit: a6f80d99b939f576725b1dfd0c2b89808e101e97
[10/16] ASoC: codecs: alc*: rename to snd_soc_component_read()
        commit: e896c1ed67ef5a4df301d88ea77835e1eb4cf102
[11/16] ASoC: codecs: wm*: rename to snd_soc_component_read()
        commit: 6d75dfc3e86500eda78fc2ddc6e2cdb52b9e2a1a
[12/16] ASoC: codecs: rt*: rename to snd_soc_component_read()
        commit: 467a2553dd21c7f0468ed9e651fa4b07fd082b93
[13/16] ASoC: codecs: da*: rename to snd_soc_component_read()
        commit: 2925b58209c9acfb89b036a0d0eb5b0ebc3abb3a
[14/16] ASoC: codecs: cs*: rename to snd_soc_component_read()
        commit: a11f8a1c33ed098097ac7876a2e823c589c30b6f
[15/16] ASoC: codecs: ak*: rename to snd_soc_component_read()
        commit: 8a6fc33ba64a79c0bdb1eb8f8ebb2632af0ba36a
[16/16] ASoC: remove snd_soc_component_read32()
        commit: 5b554b0a29ce9610e3c237c77a1f76db87454b72

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
