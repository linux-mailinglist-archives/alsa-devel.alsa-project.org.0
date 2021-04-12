Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F030435D0BC
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 21:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A121671;
	Mon, 12 Apr 2021 21:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A121671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618254280;
	bh=F4gTDTpxIjl+nx0umiKmI7BvmyGY0MWoRT3gO2/gBNg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3Fe3BXb+CMm9Puqw6tFwwrj/NyX3HFEl8jS7fI6/6ZBei6WUPfQZqiBaV6TU0/tV
	 s7QNJ9HnlHOuIK4hPQcHJBVGnWw365BIGHTv3ggd/W8zXUQccZi8UfR1IL0vO5pP4/
	 cg2Dz2TEwe88IwLt07hUdag3ih4kqDnlSFexJyw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF96F804AA;
	Mon, 12 Apr 2021 21:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86FABF80482; Mon, 12 Apr 2021 21:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B5EBF8042F
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 21:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B5EBF8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vt2eUtgN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDB4A61352;
 Mon, 12 Apr 2021 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618254100;
 bh=F4gTDTpxIjl+nx0umiKmI7BvmyGY0MWoRT3gO2/gBNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vt2eUtgN5c9C+kvNXZnAVST2gP5z2QBhTJvMFqBOpvafSZh5phs2vi6ODR6Vqx+dO
 2Awo4AfKqtEHpeWGPzU8aNb1TFPA+rZ4CuS9qzk0OLlBh3VsyP6RExd7Qhs1eRwVfD
 ZAD6g6hm7sykRVwjLxxtbnGbnMf4xRZh8jx4Vep5Hcq/w6bGvdjTmwaLaTPzpK6/2U
 hzFW4n5nFBjUtM6DL49WeD6Cn4+PT/XxatmPm9K+XsWi2kLqdGPCgjepmSv9UkHJ6Q
 DRv03Jfq31EdnltgOuuktaQKyL/3WSMQzJ9a3rkAjbsWRex0JaZWtlLRayT901xLBs
 Ox3gCEuQfjiew==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: descriptor corrections for TGL and
 ADL
Date: Mon, 12 Apr 2021 20:01:03 +0100
Message-Id: <161825392630.52100.4693285955114573632.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412161519.13508-1-pierre-louis.bossart@linux.intel.com>
References: <20210412161519.13508-1-pierre-louis.bossart@linux.intel.com>
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

On Mon, 12 Apr 2021 11:15:17 -0500, Pierre-Louis Bossart wrote:
> One missed property for TigerLake and need for separate descriptors
> between ADL-S and the other flavors.
> 
> Libin Yang (1):
>   ASoC: SOF: Intel: add missing use_acpi_target_states for TGL platforms
> 
> Sathya Prakash M R (1):
>   ASoC: SOF: Intel: Update ADL P to use its own descriptor
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: add missing use_acpi_target_states for TGL platforms
      commit: 1b9889974ce93dea50d010972a93c0eb529ac612
[2/2] ASoC: SOF: Intel: Update ADL P to use its own descriptor
      commit: 4ad03f894b3c96d77e51474f0c9731793fac412e

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
