Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AAD4A0487
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 00:48:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 950E11745;
	Sat, 29 Jan 2022 00:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 950E11745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643413722;
	bh=jb+7wVF0N8FRGaFAktQ2hXk3Id0/NgbfKwfEMIjr0Ss=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r+uXuWONBNbB7fph2nSTwhG+9U4LNgIJGD5yVsYKsndoat9A+KfcUHGyFZxbGyQR0
	 I61pcdFS+oZ7WfcMkg6SCCVNkL/vaxSn1P0iRXxw4nNvirXIFG5Mp3VXtChpVRdBNB
	 fpzZUXFoesjw12b4k2qvg1j76m7pUQPxhwOXNYXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE4B0F80425;
	Sat, 29 Jan 2022 00:47:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 550B7F80249; Sat, 29 Jan 2022 00:46:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D553F800C0
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D553F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GKX92s0t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AEB861F3D;
 Fri, 28 Jan 2022 23:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EA3C340EC;
 Fri, 28 Jan 2022 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413608;
 bh=jb+7wVF0N8FRGaFAktQ2hXk3Id0/NgbfKwfEMIjr0Ss=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GKX92s0tih3kUz3YkFsmkblN2iViRLZmRPOxzF9dPf/9OFSnaPVKx+xFreBJV+/Am
 Iw9Ni+3KwInI9Qzkz2AnoRNOAxRexT58V4G9boIuQ1ok6uj9DNv4ZhZvD1lItN76+S
 qi8lEVOHtjYWjLXmF6ylIGpoCXSQFn28DS+753c78vCJez9rh2R9noXuvnxnjxrr1O
 fyl8hjSfal7iFvR5lcJFKlcyq7VCuMqmSpvxN3xvs6Qgy1tet7/PHcLKUh5E3VEQcm
 AIXoSUzKHaPV2LeN9D5phcT987xvMkNKr4mcRv6NW/RzqIK3LyGUMGa1X3uUjSc0qs
 Ufgqud8UWLtBw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20220119155249.26754-1-tiwai@suse.de>
References: <20220119155249.26754-1-tiwai@suse.de>
Subject: Re: [PATCH v2 0/2] ASoC DPCM lockdep fixes
Message-Id: <164341360760.694662.12609476959781347657.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 23:46:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Wed, 19 Jan 2022 16:52:47 +0100, Takashi Iwai wrote:
> this is the revised patches for addressing ASoC lockdep warnings due
> to the recent DPCM locking refactoring.
> 
> 
> Takashi
> 
> v1->v2:
>   - minor correction in the changelog for nested lock
>   - debugfs removal workaround
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/2] ASoC: soc-pcm: Fix DPCM lockdep warning due to nested stream locks
      commit: 3c75c0ea5da749bd1efebd1387f2e5011b8c7d78
[2/2] ASoC: soc-pcm: Move debugfs removal out of spinlock
      commit: 9f620684c1ef5a002b6622ecc7b5818e81252f48

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
