Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7331C340
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 21:51:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6581655;
	Mon, 15 Feb 2021 21:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6581655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613422309;
	bh=3+nwuXCwFG7BLMfhnIbHiGIwS3X0w5RVgtp8enGR6Z0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJcI1Aeb5BLVyn4Q3dK8i0QOBuk9tzGMazWOmIrrQZgXPZDmUM9ST6ulDs9nfIM9f
	 P3LTVOLDj3/k8P2EwHOF/DRxT0Q5T4GoSKyBQ4LRtf46JR6ySZ+K/WgrSN0yNsGIFE
	 rkFgpqJUcIgsJhmZL5eVcbWdbsjuiochDkVarC4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A734AF8025B;
	Mon, 15 Feb 2021 21:50:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D6AF80258; Mon, 15 Feb 2021 21:50:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F530F800C1
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 21:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F530F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AA1KHOEx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4E3C64DFF;
 Mon, 15 Feb 2021 20:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613422211;
 bh=3+nwuXCwFG7BLMfhnIbHiGIwS3X0w5RVgtp8enGR6Z0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AA1KHOExpZpFRePMZKu26x8KBR11N3DYGfKNyUDoHZkXohkWF/+dZ+aIGJpWtOTYr
 YYNu/PH90qK4Go1Wq0oJI0Fsh0AP7tmAx7UMMrwTOF7kuNSCDS8P6ctV98XLLShS4l
 8FBKFsVjB3T0GGQ2lvQYVTOQoCy7Bgok4Z1O1B27YlcxXS9RTTbz+AuB76fs7QAL/V
 WH1fpGFkzu6YO5tHmrLR9PF6YUryIQL+2w3IMXTzUNoWbHr1szwY7eJhYeE+6g7Zfj
 ZO5OSy9pvdffYl0N99zYu91e33s2qB49i77NFQD1+P4Hul5q3XrX4RTtFdLKIUDHUb
 2d6o+8nvo+2Jw==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com
In-Reply-To: <20210214220414.2876690-1-kai.vehmanen@linux.intel.com>
References: <20210214220414.2876690-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix hwparams min/max init for dpcm
Message-Id: <161342215451.45269.18136744682520869431.b4-ty@kernel.org>
Date: Mon, 15 Feb 2021 20:49:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com
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

On Mon, 15 Feb 2021 00:04:14 +0200, Kai Vehmanen wrote:
> When runtime is initialized with dpcm_init_runtime_hw(), some of the
> min/max calculations assume that defaults are set. For example
> calculation of channel min/max values may be done using zero-initialized
> data and soc_pcm_hw_update_chan() will always return max-channels of 0
> in this case. This will result in failure to open the PCM at all.
> 
> Fix the issue by calling soc_pcm_hw_init() before calling any
> soc_pcm_hw_update_*() functions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: fix hwparams min/max init for dpcm
      commit: 140f553d1298e0ddbe21983efe5789fe8b484273

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
