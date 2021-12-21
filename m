Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221847B896
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CCF174D;
	Tue, 21 Dec 2021 03:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CCF174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055166;
	bh=HnpNOtspzDhWwmKYV0kN529sItn2tnYQ4xgAceq/f0E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/kD2RyfIPfS9cIulv8Y/9eivjxvxlGEkwQWg67QVVd91ErGZrXNzS9YF+7rFgDOG
	 zdfZZ1hpNZtVJppqVtamBGG303NE/keRerJXx1nzNP5pDBdb8NuGETb7x9PtA5GR69
	 2bNjvjCpWIPa77KoqcWfGpbWpxtEKtx7tie/251g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CC86F8050F;
	Tue, 21 Dec 2021 03:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA7A4F804E2; Tue, 21 Dec 2021 03:50:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24547F8010B
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24547F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JNgi8vOp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0549E61374;
 Tue, 21 Dec 2021 02:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7732C36AE9;
 Tue, 21 Dec 2021 02:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055045;
 bh=HnpNOtspzDhWwmKYV0kN529sItn2tnYQ4xgAceq/f0E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JNgi8vOp232qTuTofl1eNudVeYVwArVYf2PESkQ8kV6hIVPsPH70lDo9LypxUXJnQ
 VTFHilheapNFnpwP3wDWLmR590VkTxdWIBZ3mgdYLdBUOA6qCXeK01s6rF4G2eK35S
 npdC2EMPz+WUq92PP8V3dUnMG/PTcmiPiL3WuEnQYu8of4G4gFyzQp6c8jWysgI1jg
 lwcfFhA0v5uDm474EociSsOfsQqpZtiIjWmcbTLwvcgUqapwaT2heyIbz5KJX1pnbJ
 ubvcED2T9EVkhagRCHR8d8bQwvxAIVJvpMxoxpYQdTJIaBEEPrI+PLUwLEvBvH2+KJ
 00zPAVQaWXBfg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211216231628.344687-1-pierre-louis.bossart@linux.intel.com>
References: <20211216231628.344687-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: remove suport for TRIGGER_RESUME
Message-Id: <164005504460.2647792.15148138424517768936.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Thu, 16 Dec 2021 17:16:25 -0600, Pierre-Louis Bossart wrote:
> None of the SOF platforms support INFO_RESUME, and rely on the
> indirect path used by the ALSA core with the prepare and TRIGGER_START
> steps.
> 
> Let's remove the left-over dead code.
> 
> Ranjani Sridharan (3):
>   ASoC: SOF: pcm: remove support for RESUME trigger
>   ASoC: SOF: Intel: hda: remove support for RESUME trigger
>   ASoC: SOF: Intel: hda: remove support for RESUME in platform trigger
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: pcm: remove support for RESUME trigger
      commit: eed5391f6747ffa7e3972b53aa721bded8feeff7
[2/3] ASoC: SOF: Intel: hda: remove support for RESUME trigger
      commit: 9b465060d144dd8196729cc8d77e328f1328dcbf
[3/3] ASoC: SOF: Intel: hda: remove support for RESUME in platform trigger
      commit: 35218cf61869ca4b11c8c0b49a95f75f379e403a

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
