Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136B218DCF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DFE81678;
	Wed,  8 Jul 2020 19:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DFE81678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227772;
	bh=gVx9pVBglCab/+yLWlvOgqkrNnTRyxFbapbMdcE2/84=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tkIouSO/VZNc0FqyWSZjt3ADwo9poqWMCu0I/YiRRgDYuRpdwtdIikEqiwHRQqMhg
	 Hs8HJGRvXoRXdsrhJlUpGZM4P5zGfzKgccOAjwVj+bfEBNs0yZKGViSGwJdwgOlLBk
	 odSENd5eOf1IKid50YKEWb4PaNwhp6azomLatKAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8665CF802D2;
	Wed,  8 Jul 2020 19:00:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACD52F802C4; Wed,  8 Jul 2020 19:00:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11DC8F8015A
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11DC8F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r1xftyc4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5351206F6;
 Wed,  8 Jul 2020 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594227603;
 bh=gVx9pVBglCab/+yLWlvOgqkrNnTRyxFbapbMdcE2/84=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=r1xftyc4XBLnqgFAm47wKCJjzgHiMo2YDG17d6p5WP85qZyR8cRYULcnEMcxg1+Rn
 ylEUUpsdz/NluoZ0/RB1zuEW0oP7wct5Mev0BJ/e0Lh1p5nrheDfUJxwhwAoaL1lqW
 /4PJD3XiLBN0keLx2oOmPMfEtbfn5369HPDKSQR8=
Date: Wed, 08 Jul 2020 17:59:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 00/11] ASoC: qdsp6: add gapless compressed audio support
Message-Id: <159422758801.28431.9889241714368615225.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 vkoul@kernel.org
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

On Tue, 7 Jul 2020 17:36:30 +0100, Srinivas Kandagatla wrote:
> This patchset adds gapless compressed audio support on q6asm.
> Gapless on q6asm is implemented using 2 streams in a single asm session.
> 
> First few patches are enhacements done to q6asm interface to allow
> stream id per each command, gapless flags and silence meta data.
> Along with this there are few trivial changes which I thought are necessary!
> Last patch implements copy callback to allow finer control over buffer offsets,
> specially in partial drain cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: q6asm: add command opcode to timeout error report
      commit: b6198097b84abcbf9d098ddf5887fe62f9da2e3c
[2/2] ASoC: qdsp6: use dev_err instead of pr_err
      commit: 0579ece8f4de9956ea7087c63f55663ea79283bc

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
