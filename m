Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9076A5E805F
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 19:08:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE28A843;
	Fri, 23 Sep 2022 19:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE28A843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663952925;
	bh=hLbB6Mc/9YPvSzqJ/DD7cP09+IT2DN/AsYc0wB8FrUI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GcOAqucMOdMqI076cQiet4+pjAHa6cHyi2fClc4ikhdHUDXBQn83cry3P7zPqDPtE
	 gALN5dZkPbC7wfQmWhrLK86yb8ezpVKElSw7yIsL1w+FGXZ2RXaQHQx+wpKZu8QC6/
	 FSpt+O8BjrnfOZ6yCwhbvYaHievKvnNRxnPQrFWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A3FF8053B;
	Fri, 23 Sep 2022 19:07:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2F0CF8053A; Fri, 23 Sep 2022 19:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D264DF80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 19:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D264DF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kGeMQI2g"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDB02625B3;
 Fri, 23 Sep 2022 17:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793DCC433D7;
 Fri, 23 Sep 2022 17:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663952821;
 bh=hLbB6Mc/9YPvSzqJ/DD7cP09+IT2DN/AsYc0wB8FrUI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kGeMQI2gON2zZSAo47tEjveFUDbVcnw/LtEWBcMpfp2NGQbIvkeelzodHjaDIoMUs
 QyqCyvVru8jwoEvHim2f/5sDJTt8VM4VPjiAUVlfj+7dIhPMQvYjtmnJtZzo2pWWTF
 lbY3Ue3xwbIQ1oPi3GJCNiZ//kuDCsRx3Ga6ZI7ivJBnwrwiuEBdcyFAHH8M1RKazS
 7OFQ8SI9PhTBBmc0IpwCCcHM5OyFBclS8AztvNu5GXRNpPM2jZ0iQr+Lf/igthe7NL
 8RTbcULduqrm/1ohChVxBEk9mlQUOA0FFjBuqszhvplf4/dPLIGSpZu10U7Gm/blyD
 RJw1OV95WD17w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: SOF: Intel: MTL: Fixes for suspend/resume
Message-Id: <166395282022.610218.12704120726441235308.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:07:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Thu, 22 Sep 2022 14:36:34 -0700, Ranjani Sridharan wrote:
> This series includes fixes for suspend/resume and module
> loading/unloading for the MTL platform.
> 
> Fred Oh (4):
>   ASoC: SOF: Intel: introduce new op to handle dsp power down
>   ASoC: SOF: Intel: define and set power_down_dsp op for HDA platforms
>   ASoC: SOF: Intel: mtl: define and set power_down_dsp op
>   ASoC: SOF: Intel: use power_down_dsp op in hda_dsp_remove
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SOF: Intel: introduce new op to handle dsp power down
        commit: af62eaf2872bf2c381f322c61f7ff751162797f6
[02/10] ASoC: SOF: Intel: define and set power_down_dsp op for HDA platforms
        commit: c714031f936e11ef9e5695efdb73cd1f45eedb69
[03/10] ASoC: SOF: Intel: mtl: define and set power_down_dsp op
        commit: 2090cb9bf57471900d5cdf11b47dd1a121f021bf
[04/10] ASoC: SOF: Intel: use power_down_dsp op in hda_dsp_remove
        commit: e32de6402e5b51cd6a24861987b1846606beec13
[05/10] ASoC: SOF: Intel: Add a new op for disabling interrupts
        commit: 423693a6c351f4abb869d1dbf5df7374766aaa1a
[06/10] ASoC: SOF: Intel: define and set the disable_interrupts op for cavs platforms
        commit: b2520dbcb0d3646e70fedcaab2bdfb33df1c8508
[07/10] ASoC: SOF: Intel: MTL: define and set the disable_interrupts op
        commit: 39df087f6fa9436926b540d7d4022c09d0b8fde7
[08/10] ASoC: SOF: Intel: HDA: use IPC version-specific ops
        commit: 0fbd539f666a7783b55507675b6c68673db27766
[09/10] ASoC: SOF: Intel: MTL: reuse the common ops for PM
        commit: 6ae87bab269b347c725893ee162a0ad03ecca97c
[10/10] ASoC: SOF: Intel: MTL: remove the unnecessary snd_sof_dsp_read()
        commit: 68fb254e9ccca9e3f832f86b707eb2551aa5b86d

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
