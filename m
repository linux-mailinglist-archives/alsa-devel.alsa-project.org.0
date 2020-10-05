Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C078283DDC
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 19:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31130179C;
	Mon,  5 Oct 2020 19:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31130179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601920649;
	bh=cyMXxcFiLhcXvzPyyhK1hJjto1RJMvdtK0k3ZZmMEsY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OEd2i0A0CggydW7qbFj+xqFAn2DMuaQhvwCoCFnU4j2K+F4dAvIgwYnNTbkBiJfoF
	 XcX+16f9pSxoGi3ZRZvwdlS26SRoCOIIxq4fyKk7djtbVDzlWT1YPKFqZsh/vgwbds
	 SCbT4nDPU6DSjJJ1AOFqDMAYH1dFW5kga+TeznZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C31F80245;
	Mon,  5 Oct 2020 19:55:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11AD7F800C9; Mon,  5 Oct 2020 19:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BBDFF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 19:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BBDFF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k226qli9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12F8E207EA;
 Mon,  5 Oct 2020 17:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601920498;
 bh=cyMXxcFiLhcXvzPyyhK1hJjto1RJMvdtK0k3ZZmMEsY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=k226qli9dZYK2dP7B3Trm/PleOtPKInNxNi6lRtjlL0fzLUNr2SdkQPAbtIRwpj3F
 jGr0/R+adaIPDpzPr/xRYJAevA+0bGVcMO49en16zNhQ9VIeVl3Knbx7BCkDqvbJDI
 JAAGrCMmPXXS6UAccw2UJbIBuxxr0KuhtFVTlQUU=
Date: Mon, 05 Oct 2020 18:53:55 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
References: <20201002211902.287692-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: sof_sdw: minor corrections
Message-Id: <160192043039.23051.3761795084502724725.b4-ty@kernel.org>
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

On Fri, 2 Oct 2020 16:18:58 -0500, Pierre-Louis Bossart wrote:
> This small patchset adds a missing component string needed by UCM and
> corrects a confusion on Realtek part numbers.
> 
> Pierre-Louis Bossart (4):
>   ASoC: Intel: sof_sdw_rt1308: add extra check on init
>   ASoC: Intel: sof_sdw_rt1316: add missing component string
>   ASoC: rt715-sdw: probe with RT714 Device ID
>   ASoC: Intel: sof_sdw: add version_id to avoid rt714/rt715 confusion
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_sdw_rt1308: add extra check on init
      commit: 044eb2d13a2147a7ac15a400c2a4f020a7857c36
[2/4] ASoC: Intel: sof_sdw_rt1316: add missing component string
      commit: 8cc8945da74284809c8a4a575e55e91d5557b651
[3/4] ASoC: rt715-sdw: probe with RT714 Device ID
      commit: 4c652df83ba42fadc884541bfec856c836822302
[4/4] ASoC: Intel: sof_sdw: add version_id to avoid rt714/rt715 confusion
      commit: df64b9882b35671c4916574a783b614c6164980b

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
