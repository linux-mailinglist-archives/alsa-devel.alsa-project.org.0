Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D719260446
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 20:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E94F517B8;
	Mon,  7 Sep 2020 20:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E94F517B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599502161;
	bh=qhVkRJzUKtNgMs6UB0sb3RFbpfgz/9FwO2mF7MzHnIk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtGkUhMnbRzvDfa31AisGqWyIQnd0zjLIvGCtbKq/XV0l6kgxQCHikFw5Kb8Eh4kg
	 YYNI7qVXQbq6cf/g4y5Drl9uYOg3rVtD8CAy0OfATX5hC6Hs5Gi6qx6ssj30iyUm+E
	 R4DwWTX0N4Qk5Nnt94H+KvHpFmEIWCnrTGZ3JSjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB77F802DC;
	Mon,  7 Sep 2020 20:06:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDAFCF802E0; Mon,  7 Sep 2020 20:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 403BBF802DC
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 20:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 403BBF802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fvgJpRoa"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD236206B5;
 Mon,  7 Sep 2020 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599501977;
 bh=qhVkRJzUKtNgMs6UB0sb3RFbpfgz/9FwO2mF7MzHnIk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fvgJpRoafq5JIiFayT/g+3c6nem/WlCmye0jP0LqyExGsC4nXgjH6fuP8/cQlS6DF
 ote1mK446ZrWaDSSLLwY02/k5iHnLz6LBvZO3oLGWoY70IGhT1Y2/W+Ha+OD4Vm+oP
 r2xfLry0hJwfXDTKtN15DI8t/9gQdRSOn4fuJ8vY=
Date: Mon, 07 Sep 2020 19:05:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 00/16] ASoC: SOF: component UUID support for 5.10
Message-Id: <159950192275.52707.5567953011255569290.b4-ty@kernel.org>
Cc: daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
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

On Fri, 4 Sep 2020 16:27:28 +0300, Kai Vehmanen wrote:
> This series adds support for UUID based component identification
> in SOF. UUIDs provide a more scalable alternative to the old
> component type based approach to identify which DSP components
> should be loaded.
> 
> More detailed description of UUID usage in SOF is available in:
> https://thesofproject.github.io/latest/developer_guides/uuid/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: SOF: tokens: add token for component UUID
        commit: 43fbb0860c682859780907d00bdb4abbb1b6359e
[02/16] ASoC: SOF: add comp_ext to struct snd_sof_widget
        commit: f970a77f1d064eeddc32a9ed0fd7db3a66d82fdd
[03/16] ASoC: SOF: topology: create component extended tokens
        commit: 92f500cfc329ee3082f20b2f1364788b759ab588
[04/16] ASoC: SOF: topology: parse comp_ext_tokens for all widgets
        commit: 929e427a9c4e59d744fb5d3771b87a741ea3078a
[05/16] ASoC: SOF: use the sof_ipc_comp reserved bytes for extended data
        commit: 50b55fd463ce565b768d8bc214dd0280bee8b10d
[06/16] ASoC: SOF: topology: add helper for setting up IPC component
        commit: a905bb0193e7d637bc6b6c86e87f7f9976363d07
[07/16] ASoC: SOF: append extended data to sof_ipc_comp_dai
        commit: f8ee6c9f5258ce0f7e342d7ecc63d81e45a607fe
[08/16] ASoC: SOF: append extended data to sof_ipc_comp_mixer
        commit: f375bb336df3152360fbcdc4b7c49998d43abd0c
[09/16] ASoC: SOF: append extended data to sof_ipc_comp_volume
        commit: 9fed9d91c00e60cab61844efdb521f4ea5255da0
[10/16] ASoC: SOF: append extended data to sof_ipc_comp_host
        commit: bbc1364cdd323e6188371744f91d55152e79c14f
[11/16] ASoC: SOF: append extended data to sof_ipc_comp_src
        commit: b64ce2c62ca3d751dc9407e61eef1ba66f6e18c8
[12/16] ASoC: SOF: append extended data to sof_ipc_comp_asrc
        commit: c7ded588468ada986f1f96645f7e84781e46fc87
[13/16] ASoC: SOF: append extended data to sof_ipc_comp_tone
        commit: 3584ba4c78f719a081ba140db0662aacdd00190f
[14/16] ASoC: SOF: append extended data to sof_ipc_comp_process
        commit: 783898ce68de5261faa4697622f38df8b08251a7
[15/16] ASoC: SOF: append extended data to sof_ipc_comp_mux
        commit: d2306f4ed181e3bfe91a96a360f9674613c036a6
[16/16] ASoC: SOF: topology: make process type optional
        commit: 988d941882336b860d5fae1ee6f487eb110fe6d6

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
