Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3966252F13
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 14:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CBAE1754;
	Wed, 26 Aug 2020 14:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CBAE1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598446680;
	bh=CW9kNzo3j+PP+YGjUxwav44EE03197hg0IMKJjSSSCQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gwWsNeQHLdjoahyzbEF4z6g7L9JPHI44SNYSjiipC6lCh6CP+MbUrFPVlt8BSzaGQ
	 Gi6NL1HLWRhCnYdUNG7Law40Pv4qdhDFzRyO8kqH88ZBoJsyUzhcAA4qf4A4u/vXAM
	 1F5umr1aOKIVUcgyXq2svgSUxofocKEr8VdxIUQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55195F800EB;
	Wed, 26 Aug 2020 14:56:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E38A1F801EC; Wed, 26 Aug 2020 14:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01338F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 14:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01338F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CmD1Cb7V"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B14EF208E4;
 Wed, 26 Aug 2020 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598446567;
 bh=CW9kNzo3j+PP+YGjUxwav44EE03197hg0IMKJjSSSCQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CmD1Cb7V4IP3ch1vRUAAE/9g4gX3zwAnIIIvR5+EsItJp9KhBdckNC748eJBEuYWv
 WNIKB41KQ+Lk7GZ+ZjxY0P1TrfnIZCGzTH8/VdszFYsrud1do+/CLPHa3p28wBDVfi
 pnKVz+xKNgmxBk6tdBmSEvlMYhRwMIfJhP9Y7wAU=
Date: Wed, 26 Aug 2020 13:55:31 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/7] SOF fixes and updates
Message-Id: <159844653099.37071.12835752319691209056.b4-ty@kernel.org>
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

On Tue, 25 Aug 2020 16:50:33 -0700, Ranjani Sridharan wrote:
> This series includes fixes for error reporting, topology parsing and
> runtime PM issues along with updates for DMIC support and IMX platforms.
> 
> Iulian Olaru (2):
>   ASoC: SOF: imx: Replace sdev->private with sdev->pdata->hw_pdata
>   ASoC: SOF: sof-of-dev: Add .arch_ops field
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: Intel: hda: report error only for the last ROM init iteration
      commit: 53ec753137f2a407c949cef3158e89ece7688637
[2/7] ASoC: SOF: fix a runtime pm issue in SOF when HDMI codec doesn't work
      commit: 6c63c954e1c52f1262f986f36d95f557c6f8fa94
[3/7] ASoC: SOF: intel: hda: support also devices with 1 and 3 dmics
      commit: 3dca35e35b42b3405ddad7ee95c02a2d8cf28592
[4/7] ASoC: SOF: topology: fix the ipc_size calculation for process component
      commit: 878694dcbe51794c7a68195b92a3707ed4ff5826
[5/7] ASoC: SOF: Intel: hda: add extended rom status dump to error log
      commit: 29c8e4398f02adacd429c7847dacc8aea5a0c2f1
[6/7] ASoC: SOF: imx: Replace sdev->private with sdev->pdata->hw_pdata
      commit: 17b3f99a360d76fed46e7ec1e12d6670bd7ca884
[7/7] ASoC: SOF: sof-of-dev: Add .arch_ops field
      commit: 5a1fa00ad74bd5e77feab84a6d64c06f267df415

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
