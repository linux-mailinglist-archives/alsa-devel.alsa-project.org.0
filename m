Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBE725465E
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 16:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B57B17FF;
	Thu, 27 Aug 2020 16:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B57B17FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598536853;
	bh=KpdPiJoLzAIbq52H3blvz+YyD7EsiMjqLCnq/qC5VXA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qKT0YL5AN8t7BN3M4exd1bP0tOACtFVB9GdAL5e32Y1GcKQwVOKsT1nEFORcjGkYb
	 pwNy7C3GgL2e8Z0IgKFL6cwwoT91uKRrA1Gy8T3Tvd5SToM9ELzTQtBpbqhv3XwfKK
	 HQH7UBZBE2/QRgevOZQVB3pARTKXLoKRVdKiIjmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C563F802DB;
	Thu, 27 Aug 2020 15:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49F7BF802D2; Thu, 27 Aug 2020 15:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21A73F802A7
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 15:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21A73F802A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EbtEZSSB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 256AC22BF5;
 Thu, 27 Aug 2020 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598536656;
 bh=KpdPiJoLzAIbq52H3blvz+YyD7EsiMjqLCnq/qC5VXA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=EbtEZSSBw382MQtVgElNrnsFLkn5ZmNw+2x9LOcYMNf2JiY6l2LSoR3RJpojOk4nq
 eXuVjHE0V5ISP62EumdX/VckYT/sWL/QowWXyjdL5L8U0uwHBkEyeTcv6EGIb6Zn13
 JSFAiqrVcQ0CzPFdemSPovKxulcPTMkJqdK0BRRo=
Date: Thu, 27 Aug 2020 14:56:59 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/8] SOF fixes and updates for FW boot
Message-Id: <159853660472.29762.777320843718459203.b4-ty@kernel.org>
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

On Wed, 26 Aug 2020 11:45:24 -0700, Ranjani Sridharan wrote:
> This series includes fixes and updates for the FW boot sequence for
> Intel platforms.
> 
> Ranjani Sridharan (7):
>   ALSA: hda: fix VS_LTRC register name
>   ASoC: SOF: Intel: hda: Add helper function to program ICCMAX stream
>   ASoC: SOF: Intel: hda: modify the signature of get_stream_with_tag()
>   ASoC: SOF: Intel: hda: define macro for code loader stream format
>   ASoC: SOF: Intel: hda: Define FW boot sequence with ICCMAX
>   ASoC: SOF: Intel: hda: Add sof_tgl_ops for TGL platforms
>   ASoC: SOF: Intel: hda: Simplify error handling during FW boot
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ALSA: hda: fix VS_LTRC register name
      commit: c242766f286aa5a54cc3d987e71b8c952059132d
[2/8] ASoC: SOF: Intel: hda: Remove unused parameters in cl_dsp_init()
      commit: 0ff06df0be60db920f3d7218fa2bded9fd8de3f6
[3/8] ASoC: SOF: Intel: hda: Add helper function to program ICCMAX stream
      commit: aca961f196e5da10d99f4b19e5c27e5a5d7731a3
[4/8] ASoC: SOF: Intel: hda: modify the signature of get_stream_with_tag()
      commit: c07fa3fcbd28b6d8383a05f0570d472894c6e38f
[5/8] ASoC: SOF: Intel: hda: define macro for code loader stream format
      commit: d43e381390d0aa1992ce204bb6a9af791edf3d45
[6/8] ASoC: SOF: Intel: hda: Define FW boot sequence with ICCMAX
      commit: acf705a425f0e9cd5cab06231479c0a239e5a671
[7/8] ASoC: SOF: Intel: hda: Add sof_tgl_ops for TGL platforms
      commit: 8b98491a6b8c41a7e4334fb94a58c268d831458e
[8/8] ASoC: SOF: Intel: hda: Simplify error handling during FW boot
      commit: 01d42d5a0a70bdcece7228232590f177e7114368

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
