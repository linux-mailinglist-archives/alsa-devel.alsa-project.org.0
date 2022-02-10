Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 549254B151C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 19:18:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC6C1AAA;
	Thu, 10 Feb 2022 19:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC6C1AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644517106;
	bh=y9KoYEHTuytQnzjdUCEQMgDLFL2j5uawuME74AvZBFw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIbiHU9XgosThdws2hAKKTo3S6+WrNOgOo76ZXaPWrhocGCxqHmFiizk7HJQtTwYm
	 V/yQi8fJh9hZ8aWK1uYkOgxXSKObo24fXSm/LuHCG7xSLi8urFFSgr93lCi+0VyIkt
	 dTao0ZO7XlXcmBSpqe/4Zuh9mzLnkvRq2qc6S5z0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23FF1F80302;
	Thu, 10 Feb 2022 19:17:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F71F800A7; Thu, 10 Feb 2022 19:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03B54F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 19:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03B54F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ix/mZN/5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99E1161E59;
 Thu, 10 Feb 2022 18:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC03C004E1;
 Thu, 10 Feb 2022 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644517030;
 bh=y9KoYEHTuytQnzjdUCEQMgDLFL2j5uawuME74AvZBFw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ix/mZN/5UW7pmVM3vYhS7NC+PUaymZ+trN2vNmdR2x1+Jhg/EyMXtP6O/J0KCQZa8
 f3kpnqnwUAbrZwkQU9XW2d54BbskBx7K1C/sYEXQP8zZ7m0vxz8QyehqFEQX958Iz3
 qIq2HOuR9XJknJcVm3IwN5Oc8bVwyfusA+NvaTH4tBF8OIAhugHP5gn5/nrGQX+otk
 J0fy+g/JbeBvQ2/BHpQd5M7exuntEgKQWxDSSov9qCLwZgMMvQbIKxYAcEIk4nmGTf
 UYonPN9jiuDyUeX+rBH/UklWubkXd0VQ2SDdNFaQGrI3PN+IXIisAVMqDBDR2tGWi2
 gtzLpSDPoH5lA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
References: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: IPC client infrastructure
Message-Id: <164451702780.82170.4074299845971307664.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 18:17:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

On Thu, 10 Feb 2022 12:55:10 +0200, Peter Ujfalusi wrote:
> The Linux SOF implementation is historically monolithic in a sense that all
> features accessible in the firmware can be used via the snd_sof_dev struct in
> one way or another.
> 
> Support for features can not be added or removed runtime and with the current
> way of things it is hard if not impossible to implement support for dynamic
> feature support when based on the firmware manifest we can easily enable/access
> independent modules with the SOF.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Drop unused DSP power states: D3_HOT and D3_COLD
      commit: 2439a35508277922ea116c99ff4d4a32c607464c
[2/9] ASoC: SOF: Move the definition of enum sof_dsp_power_states to global header
      commit: 5fdc1242453e2ae88b2cdb607e4eda6b687f084c
[3/9] ASoC: SOF: ipc: Read and pass the whole message to handlers for IPC events
      commit: ab3a2189a3744527f54ace1be19eb13e6c3d24df
[4/9] ASoC: SOF: Split up utils.c into sof-utils and iomem-utils
      commit: ee8443050b2bf06d80fdd2c78cc25cae2abdedcd
[5/9] ASoC: SOF: Introduce IPC SOF client support
      commit: 6955d9512d0ea814f1c2761bef7ad7b3cedf4d68
[6/9] ASoC: SOF: sof-client: Add support for clients not managed by pm framework
      commit: 1069967afe1e6b728061682ff99ec534a55a5613
[7/9] ASoC: SOF: Convert the generic IPC flood test into SOF client
      commit: 6e9548cdb30e5d6724236dd7b89a79a270751485
[8/9] ASoC: SOF: Convert the generic IPC message injector into SOF client
      commit: cac0b0887e5304bddfda91a4a7106f9328c31318
[9/9] ASoC: SOF: Convert the generic probe support to SOF client
      commit: 3dc0d709177828a22dfc9d0072e3ac937ef90d06

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
