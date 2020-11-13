Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD5F2B1F9C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 17:08:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C2E1891;
	Fri, 13 Nov 2020 17:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C2E1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605283699;
	bh=hh0PhRS5eherMkaY5zf5Q544lC3meiQjctJvI3oZJ7g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SNy9kZbVu5XlUot9Okaz9ltQ31psGVzphfgK/P4MNu5ec54YWV7LJzv7lSXVJ3WH1
	 gWiLs/7M4CsLt6kmfLBFxawOGQXelfNvitC0j7SPBkco1iIiGEruX2Hw7GHBYsrHyx
	 VTzIWaoh3MC85ni+TpmSyYY14PnKyRjnoEOKjkN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51C17F80271;
	Fri, 13 Nov 2020 17:06:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC80FF8025E; Fri, 13 Nov 2020 17:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6BDF8022D
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 17:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6BDF8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uq2tPMtb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9177F2076E;
 Fri, 13 Nov 2020 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605283595;
 bh=hh0PhRS5eherMkaY5zf5Q544lC3meiQjctJvI3oZJ7g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uq2tPMtbPqchjNHdGMvPArei9VJmDur6J2IQnfxEU7Zk1URZke2wmPemSKHPWHZUr
 xEEIrUpcBvAjajhXDcMeJxqSaBDYFuqMbZmda/hJ/tSplXy31CQLf3n5lzH0m4LW7I
 ObyNiU2Af9AXAiiR00s1SLA5bOJWEiHFzsIxyoyA=
Date: Fri, 13 Nov 2020 16:06:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
References: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: use inclusive language for bclk/fsync/topology
Message-Id: <160528356701.2641.14750729735896901993.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org
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

On Thu, 12 Nov 2020 10:30:56 -0600, Pierre-Louis Bossart wrote:
> The SOF (Sound Open Firmware) tree contains a lot of references in
> topology files to 'codec_slave'/'codec_master' terms, which in turn
> come from alsa-lib and ALSA/ASoC topology support at the kernel
> level. These terms are no longer compatible with the guidelines
> adopted by the kernel community [1], standard organizations, and need
> to change in backwards-compatible ways.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: topology: use inclusive language for bclk and fsync
      commit: f026c123001bcc15b78311495cec79a8b73c3cf2
[2/4] ASoC: SOF: use inclusive language for bclk and fsync
      commit: df132fa9daf4828598dbba553e1b2bb5cf36a715
[3/4] ASoC: Intel: atom: use inclusive language for SSP bclk/fsync
      commit: 84b53a366ebc45027e64f2e37001e4e602a93464
[4/4] ASoC: Intel: keembay: use inclusive language for bclk and fsync
      commit: a6e9717a71fd825b6d18a532954d1f9daadcd875

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
