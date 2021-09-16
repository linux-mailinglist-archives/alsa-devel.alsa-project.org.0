Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD14B40DDCD
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9645518B4;
	Thu, 16 Sep 2021 17:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9645518B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805487;
	bh=4QLwaC785TfYOOli3D95AGvqg+miqEkr3Vod9miFKCg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBz+N2QlvzWiZAtkuUjPr/ZUC7AGNi8+PkKxsXAs1uK1JTeaDv02FWyEeo4etWv8k
	 QpVLXu+3nJINK/cNOaES38QAA+fp6tqwPJEEqhkGgGBqqlCKt4BepjuhaMmZjxAakT
	 QjltMRs09wVvCQCLlBzbx1uI9Dbrv/hpdWrxyUyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43C61F804EB;
	Thu, 16 Sep 2021 17:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E333F804E6; Thu, 16 Sep 2021 17:15:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A18DFF804B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18DFF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R2I6djcB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0166261248;
 Thu, 16 Sep 2021 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805328;
 bh=4QLwaC785TfYOOli3D95AGvqg+miqEkr3Vod9miFKCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R2I6djcBlWxTjQGzUV6lQX/5Xa9OefD1WHbvn/RXeYIZD6rt9CbM37Fj4z7BB7or1
 Lp9cWSB/Of4VRxAd4+btG9w9krGqIHxw6jV1ohYbg6DkVp98hAGIBadGCWT/5H9NRI
 4u4u7d/dZF9uKY4kcbGHt/4L9gaMHWc3hQ5wQKBoVz2kVawL6teMTfX0JDa2XIUSSi
 SadXQV4I0Uh4Tf4N7FDpI0NcIhHnxyaCaw6PV2KCVNlAmCSOiU96P549zJ3OUMmtD/
 BhX61WyQUHgb8RGlyAux8Hkgf09rkYICxpBpHI6Nr0BD9kw4lDWbpMiwxz5pvseHZa
 dAQfUi40rTTGA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: loader: Re-phrase the missing firmware error
 to avoid duplication
Date: Thu, 16 Sep 2021 16:14:32 +0100
Message-Id: <163180495856.19842.10376911229287728676.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916085342.29993-1-peter.ujfalusi@linux.intel.com>
References: <20210916085342.29993-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Thu, 16 Sep 2021 11:53:42 +0300, Peter Ujfalusi wrote:
> In case the firmware is missing we will have the following in the kernel
> log:
> 
> 1 | Direct firmware load for intel/sof/sof-tgl-h.ri failed with error -2
> 2 | error: request firmware intel/sof/sof-tgl-h.ri failed err: -2
> 3 | you may need to download the firmware from https://github.com/thesofproject/sof-bin/
> 4 | error: failed to load DSP firmware -2
> 5 | error: sof_probe_work failed err: -2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: loader: Re-phrase the missing firmware error to avoid duplication
      commit: 25766ee44ff8db4cdf8471b587dffb28b7b9d17f

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
