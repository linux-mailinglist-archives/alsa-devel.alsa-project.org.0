Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDC22EE22
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 15:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9776F169B;
	Mon, 27 Jul 2020 15:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9776F169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595858382;
	bh=jNwju0vY0pLF/O53Go6DQXUA0FUZ/h2HMv7bB3iVNhw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=led1++vhshVdwfOFoDOGCyXhYNAePNMs+Zyl1TAZC1kazIPlts6/oBT7dB/sn0NY8
	 1bR7y0xAfvAM9Pco5d/Wt9tCrO8k1c3E8LGv4IJH/WVKlWmY+6koIsheDl3iigvKeD
	 OewDS1umcPSjfKMYsZFBsqgjIlmKE646/9sXiHcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30E76F80246;
	Mon, 27 Jul 2020 15:57:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1720EF8028D; Mon, 27 Jul 2020 15:56:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A811F80246
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 15:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A811F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Drs66Hm/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C3C22070A;
 Mon, 27 Jul 2020 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595858213;
 bh=jNwju0vY0pLF/O53Go6DQXUA0FUZ/h2HMv7bB3iVNhw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Drs66Hm/mhMyu+tP+UkanZLFINRdgHmwssDjK8cBJdL3YZrXvlVqDyJsn5RqQlqB5
 nC/ecniFYBKv3UEQtErpnd0UEJ4fYTGvRjM6WnCEpJb4rsQCKUQYq+Leo+fQdYYidw
 XgkZYzcgOTQ3fIhSbkRgw+Rv8PaikaZXB7vYqM6o=
Date: Mon, 27 Jul 2020 14:56:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wo2pydeg.wl-kuninori.morimoto.gx@renesas.com>
References: <87wo2pydeg.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: intel: use asoc_substream_to_rtd()
Message-Id: <159585818664.22279.12500468400036652515.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 27 Jul 2020 10:07:49 +0900, Kuninori Morimoto wrote:
> I have posted "ASoC: add asoc_substream_to_rtd() macro"
> patch-set to ALSA SoC ML (= see Link), and then Pierre-Louis
> wanted that Intel patch was separated for boards.
> 
> The patches which are not for Intel were already accepted.
> This is for Intel, and Intel boards.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel/boards: use asoc_substream_to_rtd()
      commit: 2207b93bc7866e5ece41b5bad46ddfed995b2137
[2/2] ASoC: intel: use asoc_substream_to_rtd()
      commit: 2ab9a4096639337b88132529d39420576098e187

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
