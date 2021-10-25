Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AEE43A60B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 23:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBC3316CE;
	Mon, 25 Oct 2021 23:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBC3316CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635198042;
	bh=P5P55FijK727UA6F5ONMA2rpeTYp2UxNoaQwbIlQjBU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z7OCJIffDn8xQgsYdV3UQYYMBj/bM7Jk/K9RNQdBEH54ggNhUgqGWh5UR40lXwXR9
	 t0UOu6A/TReLKNQlMgOuk6s8nvCB3504OqBZjE1R0mcjRfxa3qGDwnX0EQ5Ou0XHZv
	 k/yc53awMdK/pwEJS+8DydRG/bUX3J7UmGQsIuGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF5FF8025E;
	Mon, 25 Oct 2021 23:39:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D999BF8025A; Mon, 25 Oct 2021 23:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4938AF8010A
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 23:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4938AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Au8bFpTq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B013D60F22;
 Mon, 25 Oct 2021 21:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635197954;
 bh=P5P55FijK727UA6F5ONMA2rpeTYp2UxNoaQwbIlQjBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Au8bFpTqg1XyGJYgsAd+NVW9soa9kG4hLjJ1tZ7nEX9SzyGXZWHXwg6UQ/cEMahUZ
 AZnp8WfHosZW6JUSmJrGKn202PsKC4VGoNRgj2jG6LNKAw+SAWJ+ZIAObzgeq1FTa+
 7m5mM9x/carvdqMxO+NddO/vHMDSEmgrlHrGJv659/XOFpuiA2ro9MytZSoVtJypHn
 LLInUff1rS02dM5BbV+9u3mmAAwho1mjnALshT3CrYnH0vZ4ENcORT4jNj27W73wuB
 EB1/6/GoLxQDyIGipfEUUv7Unkqd5Hc+B6WBHlfE78GIzRP58zR7Pp6GiRPVtZAH1R
 w+JUR5D5MCLZw==
From: Mark Brown <broonie@kernel.org>
To: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: topology: Fix stub for
 snd_soc_tplg_component_remove()
Date: Mon, 25 Oct 2021 22:39:10 +0100
Message-Id: <163519067113.407220.298262625715409113.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025154844.2342120-1-broonie@kernel.org>
References: <20211025154844.2342120-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
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

On Mon, 25 Oct 2021 16:48:44 +0100, Mark Brown wrote:
> When removing the index argument from snd_soc_topology_component_remove()
> commit a5b8f71c5477f (ASoC: topology: Remove multistep topology loading)
> forgot to update the stub for !SND_SOC_TOPOLOGY use, causing build failures
> for anything that tries to make use of it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix stub for snd_soc_tplg_component_remove()
      commit: 1198ff12cbdd5f42c032cba1d96ebc7af8024cf9

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
