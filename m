Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47C45CB3B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 18:39:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45C817CC;
	Wed, 24 Nov 2021 18:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45C817CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637775552;
	bh=kDvVXxSDuF1pg9jQ8kFydw31T0W2AUU9ZhYFTa+pP04=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uj2TdxphRRZ7wn3fisyfp4C+UUnjmiJjN5CcNCZT8G+jNhcGAmiCohsRgkhfbytWq
	 8xyiejq2KRCUtQVTd5FaQGHPKPBV/2cXQAFnqyVV49vSjyJvm4DKsd7ZsCg7fFiYzZ
	 a3ltHYsWaSbyA6hEocarz9zFwJVOnoy2ZaC/CHB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E439AF804FE;
	Wed, 24 Nov 2021 18:36:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25295F804FD; Wed, 24 Nov 2021 18:36:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D91EAF804F1
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 18:36:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91EAF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UQT3WRl4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD9FB60E0B;
 Wed, 24 Nov 2021 17:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637775406;
 bh=kDvVXxSDuF1pg9jQ8kFydw31T0W2AUU9ZhYFTa+pP04=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UQT3WRl4CJCP9bsv0im6mtcx8CgSKs6+kTO5Rz0xhYuJg1Sif/FupqfJ0wn9EkTLA
 iXr/LqDFKnQfxBrEppi4HiW16UTAeWwQGj5m6zOH76k1/xA8I3E3RMNt3/jB8VGp28
 O+aHFEKQCAnW7QKQoOVS/aJMExID85uIyqcg2G0BLE7rsH6LquPO0B1NCYHIi2Y3r9
 61pAtv5O+hIR1KRwuWozObiqzqtyyx1bdjbZr58+CFvK6osug4cVOuITi+G0Ug4OEN
 3vo3J1oHx9X5e6B+nHj3ZraeQhYTbIWVXpnjLB2wat73GCQMnScprQkVD+svy4ocxM
 02eAA8HlNrElw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20211123162347.120336-1-kai.vehmanen@linux.intel.com>
References: <20211123162347.120336-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: handle paused streams during system suspend
Message-Id: <163777540456.2712097.8474071386525162952.b4-ty@kernel.org>
Date: Wed, 24 Nov 2021 17:36:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com,
 Paul Olaru <paul.olaru@oss.nxp.com>, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

On Tue, 23 Nov 2021 18:23:47 +0200, Kai Vehmanen wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> During system suspend, paused streams do not get suspended.
> Therefore, we need to explicitly free these PCMs in the DSP
> and free the associated DAPM widgets so that they can be set
> up again during resume.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: handle paused streams during system suspend
      commit: 96da174024b9c63bd5d3358668d0bc12677be877

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
