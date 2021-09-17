Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108540F9F0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2057F177D;
	Fri, 17 Sep 2021 16:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2057F177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631887610;
	bh=Yix9jceNDyfEMb1PcjV6VtH9zcTD/1xIKGkgd3AcrGc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AGpX8BWZM1aq7a+6kmO52dMWS8UL9hbn0LDoKpG5TzXo6MS4wChoKeWtoZ9FMJ3CG
	 9sZ+5q5isRNrLSkHXtvGwg56SomAUJ/s2KbQD3w2PL7HOMWXQLDlW4BvDEJNCXoHMy
	 6dX+Ay4Tfu6m9IKXx+CkeSwgTkYRhheyUav2250w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1899FF804CA;
	Fri, 17 Sep 2021 16:04:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C93F8027C; Fri, 17 Sep 2021 16:04:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6694AF80152
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6694AF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RTc8bsMK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D3AB61212;
 Fri, 17 Sep 2021 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631887476;
 bh=Yix9jceNDyfEMb1PcjV6VtH9zcTD/1xIKGkgd3AcrGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RTc8bsMKykLDP14I1P61MU2XWjrhsX2xBthm62Kn7WeyLcYP59fh4O0HzxAztFwYX
 iPSIFGv1qI7w0JNaIDuTSKB4Wj5DN8KdoRBd/iEr16hVu4oSxcbHCEDGYgGlzwa+Q0
 Do6+RRo9TwYrp5BfmFQEYsvodWOBRvZ/TQfpAkBb9gSn2TsxJgzRVj+W8mfIqeFkcb
 R4Ft82mclMsPDF95ycQg7x86ko4sxezpxqAHbkNfHnuuYpRtj041xg76BAjALo9+lN
 rEJJCtKdu36jXKEGIh3/9VGu2ITb64SVoNVDQE77z5DeInf41El1KveKY7sQCApv7t
 +QHyYFVKZHSsQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Rename sof_arch_ops to dsp_arch_ops
Date: Fri, 17 Sep 2021 15:03:43 +0100
Message-Id: <163188719814.50326.7112332224591931711.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916130308.7969-1-peter.ujfalusi@linux.intel.com>
References: <20210916130308.7969-1-peter.ujfalusi@linux.intel.com>
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

On Thu, 16 Sep 2021 16:03:08 +0300, Peter Ujfalusi wrote:
> From the name sof_arch_ops one can not decipher that these ops are DSP
> architecture ops.
> Rename it to dsp_arch_ops and change also the macro to retrieve the DSP
> architecture specific ops as well.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Rename sof_arch_ops to dsp_arch_ops
      commit: 0ed66cb7b6d38f0bab061466c1aa0e9f3db45e93

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
