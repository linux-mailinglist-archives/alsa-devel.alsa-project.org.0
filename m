Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DD24767E3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 03:23:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 723161AFE;
	Thu, 16 Dec 2021 03:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 723161AFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639621387;
	bh=s1qwF1vQj1DNpN+kOZyHRMF7gQEdyxhEvWQnz4kuSrc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BReE/VddgDnowJm37A5ebdWZ3OJdCCSM/e3cEUn9j7EFynyH5ZGQOtyOLVRAGCACB
	 sRrrxhZPZhsFx7ATKhp55PSTdqOorNXsSA1Dwb3Vop7JxUtTvlRkgiLxM2MPj4ZSNH
	 XgCSM1/kr4OXE+BjRGZgp7zpEZMzJeZRFyrg95qM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89A6CF802A0;
	Thu, 16 Dec 2021 03:21:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B979F80158; Thu, 16 Dec 2021 03:21:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B332F80158
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 03:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B332F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OqEgt9Az"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F8B661B97;
 Thu, 16 Dec 2021 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CF5C36AE3;
 Thu, 16 Dec 2021 02:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639621271;
 bh=s1qwF1vQj1DNpN+kOZyHRMF7gQEdyxhEvWQnz4kuSrc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OqEgt9AzAHireOvorlZ+D1aArZO5xbcWQq2/LZlkrqJh1qJjmjAr1A+UQx+Y273Nd
 6eWvjA6a6DTHmV4srAKC6fnrLMk1i618bs5F53E4Km1JcfD+sTP+J0A3FDsDKq6xLx
 FgwdYCq94SL+yhdd03Z6odKiAVVwv6MitljmlElEXXw/H+EUI+9iDP9FpzwAN1irbZ
 xm/FN/hqNHIRe/qVRgS6sefGSDsjvkFuAQzlR7jFqk72BSAlWpXE2o73xAH8fRLTrc
 rJ5bmeqEmAg60p4QYLGl6dNCdv9SnBYeRGwGr6D4HAgG91Zr0bY0omqyIdiKqe15zQ
 6J80PWxhIdItA==
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
References: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/8] Changes to SOF kcontrol data set/get ops
Message-Id: <163962127067.2075333.4822473610568587937.b4-ty@kernel.org>
Date: Thu, 16 Dec 2021 02:21:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 15 Dec 2021 10:03:56 -0800, Ranjani Sridharan wrote:
> This set of patches deals with modifications to the signature of kcontrol
> get/set data functions to make them more intuitive. The last patch deals
> with initializing the binary control data size after boot up.
> 
> Peter Ujfalusi (7):
>   ASoC: SOF: ipc: Rename send parameter in
>     snd_sof_ipc_set_get_comp_data()
>   ASoC: SOF: Drop ipc_cmd parameter for snd_sof_ipc_set_get_comp_data()
>   ASoC: SOF: topology: Set control_data->cmd alongside scontrol->cmd
>   ASoC: SOF: Drop ctrl_cmd parameter for snd_sof_ipc_set_get_comp_data()
>   ASoC: SOF: sof-audio: Drop the `cmd` member from struct
>     snd_sof_control
>   ASoC: SOF: control: Do not handle control notification with component
>     type
>   ASoC: SOF: Drop ctrl_type parameter for
>     snd_sof_ipc_set_get_comp_data()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: ipc: Rename send parameter in snd_sof_ipc_set_get_comp_data()
      commit: 9d562fdcd52b1bb1a13cd5078ffc06dd3eff3aef
[2/8] ASoC: SOF: Drop ipc_cmd parameter for snd_sof_ipc_set_get_comp_data()
      commit: d4a06c4334aed1fe76ae2b7aaae6ee8b72f30a8e
[3/8] ASoC: SOF: topology: Set control_data->cmd alongside scontrol->cmd
      commit: 8af783723f41d3b3d4f7f8452f190405e7059472
[4/8] ASoC: SOF: Drop ctrl_cmd parameter for snd_sof_ipc_set_get_comp_data()
      commit: 9182f3c40b52ebd91d4796d96186ba10b720b4ba
[5/8] ASoC: SOF: sof-audio: Drop the `cmd` member from struct snd_sof_control
      commit: dd2fef982ff75fbae618cc274fda09bd40582acd
[6/8] ASoC: SOF: control: Do not handle control notification with component type
      commit: 68be4f0ed40cce833cb313871c52878025e40596
[7/8] ASoC: SOF: Drop ctrl_type parameter for snd_sof_ipc_set_get_comp_data()
      commit: 47d7328f8cda15e60422c8ca36d067c4deb19b7e
[8/8] ASoC: SOF: topology: read back control data from DSP
      commit: fc5adc2bb13a6988df7ce377320f381add236002

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
