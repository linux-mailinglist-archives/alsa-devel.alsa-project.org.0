Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A6735D0B9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 21:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 126FD1662;
	Mon, 12 Apr 2021 21:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 126FD1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618254203;
	bh=RYIGgnMpyZjD+wdo8Y4ADPryIM+CPN8WSbFZ+mteMrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExPF3aF5ZzVytb9Hym2QsZP52MkLVJMap8Gav/x7cA4+NoLROSWHamt9X/tQEiKub
	 2EqLSqXxwqMCM0hE/lw7AhHizfLcVPiWYuNp1jDomeuYdmUiya7Kpp+IqAwIo256mz
	 BNKFINbLA+WAAc2Sc/GqvRmCkcw8YFapInUdemFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A5DF802A9;
	Mon, 12 Apr 2021 21:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4556DF80269; Mon, 12 Apr 2021 21:01:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7877F800D3
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 21:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7877F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GnKtvirH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 677E561350;
 Mon, 12 Apr 2021 19:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618254092;
 bh=RYIGgnMpyZjD+wdo8Y4ADPryIM+CPN8WSbFZ+mteMrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GnKtvirHXsmP4BxLlDYSHR2LynR1dAYpvMGENTLf06f0dAGd8mVkPSt0nip9d2kAQ
 agazIqymdwvhlEp6yqEdwGqhSh3DXUi+jGoQegEB3ohJDfTg7jYrif7VN28Xroe5IJ
 V93DPkHvs7Og8nloxUYhGucD9m9esH1GKDzO3QUO41CunrdqKocRDqaJ9Iuf8TZmMJ
 x9Hzrf19YPrq4aLqxV2Du7t7HAS3521iRXyaAfZUPIAlqUVz+z/aJVxo9YrtMBpsTE
 2+v0FCNkCjju2r1sTmI8HqeiBaVOs5CfV7QUpzcbArJYvlYTp7ZHV/6hMQG1OgtnI7
 N8hBduRj+fykg==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] ASoC: SOF: simplify probe and report errors
Date: Mon, 12 Apr 2021 20:01:00 +0100
Message-Id: <161825392630.52100.15360826880049350043.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409220959.1543456-1-ranjani.sridharan@linux.intel.com>
References: <20210409220959.1543456-1-ranjani.sridharan@linux.intel.com>
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

On Fri, 9 Apr 2021 15:09:57 -0700, Ranjani Sridharan wrote:
> These patches simplify the sof_probe_complete handling and
> address reporting of errors during probe.
> 
> Peter Ujfalusi (2):
>   ASoC: SOF: core: Add missing error prints to device probe operation
>   ASoC: SOF: Simplify sof_probe_complete handling for acpi/pci/of
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: core: Add missing error prints to device probe operation
      commit: 3bcae98e101727457c727b354c95c3ea8f074dce
[2/2] ASoC: SOF: Simplify sof_probe_complete handling for acpi/pci/of
      commit: 4d1284cd795296e4aa7be6db5fdce85f31374520

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
