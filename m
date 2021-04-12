Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 409B535D0BB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 21:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B391A167B;
	Mon, 12 Apr 2021 21:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B391A167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618254253;
	bh=EAI5bX3nJvpw+S9ljR6U7378Iwh40xX6EArGTbD3oT8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=scqP37N8yBejVY/PQDh+xsV/fC4hy/+oxyDtV+OOTkG0jrfuCe4dOsXaORsdGYtEV
	 qNGf5b6yMvST+gW0p33oDgQwEXvkHDd4+TaXJchEo61kQwOUJq35aGB3ddXDMxcEPE
	 tVWRbZVBeq+oTkvfdh7GvoWV60nSAdD3aI9979rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88970F804A9;
	Mon, 12 Apr 2021 21:01:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94CC7F80431; Mon, 12 Apr 2021 21:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 239CDF802D2
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 21:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 239CDF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DXyc8EyL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 196D66105A;
 Mon, 12 Apr 2021 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618254097;
 bh=EAI5bX3nJvpw+S9ljR6U7378Iwh40xX6EArGTbD3oT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DXyc8EyL7dgjQx35WWKR9n+AnewW+pN1HsYqk5QHr6+QKrdCfJ8hM+SI3rPFmtciK
 G520pJE9+N0PTOq6J/V8NdDQK6uyucqp78VcjYDlDky7CKsMFNSowSAB9vJa3xzTa1
 wM1/Ug1BrKrggjnZe+bKnxC3nYDlXkA6dWrJsolo6YdFLcAm6m+O8tMY93JnjtgUid
 nMCYCuWViwmgTk4lM2qQe7l/v+HZWwsl8C1yNLs2n2z8Tm9ayuXODWP8IV3t5pKnW0
 mpAsjeyQeubQ+beXFuqVIOVzcRDxrspisw747vtUSMF5NEZdVI+CYU5dIKpc+SPEsC
 NzwfDOzn0Yk9Q==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/6] ASoC: SOF: simplify nocodec mode
Date: Mon, 12 Apr 2021 20:01:02 +0100
Message-Id: <161825392629.52100.14605857397021532223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
References: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Fri, 9 Apr 2021 15:01:15 -0700, Ranjani Sridharan wrote:
> This set of patches simplify the implementation
> of nocodec mode in SOF.
> 
> Pierre-Louis Bossart (6):
>   ASoC: SOF: add Kconfig option for probe workqueues
>   ASoC: soc-acpi: add new fields for mach_params
>   ASoC: SOF: change signature of set_mach_params() callback
>   ASoC: SOF: Intel: update set_mach_params()
>   ASoC: SOF: pcm: export snd_pcm_dai_link_fixup
>   ASOC: SOF: simplify nocodec mode
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: add Kconfig option for probe workqueues
      commit: e4330cae2a8cf4e4f3004947794bdd549e32cede
[2/6] ASoC: soc-acpi: add new fields for mach_params
      commit: ca6a0122557faa4fa01d6dbfa742870c33c46218
[3/6] ASoC: SOF: change signature of set_mach_params() callback
      commit: 17e9d6b0a395a1d8973a9e1d20db88d791e157b1
[4/6] ASoC: SOF: Intel: update set_mach_params()
      commit: 974cccf490ebbc0c7ea0d19edd88542cef174d38
[5/6] ASoC: SOF: pcm: export snd_pcm_dai_link_fixup
      commit: f3f3af1743350fdc7c373772fb3740dc223db8e5
[6/6] ASOC: SOF: simplify nocodec mode
      commit: 4c1cc83fcc7e02f6f6f76da2ea66af86a95fd675

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
