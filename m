Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A47C4FE755
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 19:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C214017E7;
	Tue, 12 Apr 2022 19:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C214017E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649785155;
	bh=fBl2LPwe+lkzNoWmCpfjNU0fJkItIvIhZ4aTseCslDA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kzscxIj3oT2JRFqBLW1zU2PaxBIFiydmLYGWNy/FGGRrPUBYMTi9KBDMmzH4jp/YY
	 wyILdkAR/5OY/EDaYGvLTTuqh91zW6yQr/SXa4/eobXUuxGCqY1LuWqdecBWvdQr7c
	 cYef2rnSy2x7R2LiP2PwWBlCUDw0flNWRru/VsB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C145F80109;
	Tue, 12 Apr 2022 19:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58BE9F80154; Tue, 12 Apr 2022 19:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1080F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 19:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1080F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iNfsGuun"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3DAAB817F0;
 Tue, 12 Apr 2022 17:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54F8C385A5;
 Tue, 12 Apr 2022 17:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649785088;
 bh=fBl2LPwe+lkzNoWmCpfjNU0fJkItIvIhZ4aTseCslDA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iNfsGuunmEJvjQyK2c6nNDTLD2+K/jCdL5eQBjgOlJZWhXXk34SSgEGpuog3S0KQ1
 17Ge60XubFC8tzfEdHcu8Di7nK4YOtbp5tQtacf6vNXmiIwuT2ppRnRxDGut1dBixa
 MjPyVB35lXzXTtaKbvKiur1Vo+yJHmv9D2ZLQZJBOQU+W1W884RZeXPlwrvNQmhhQg
 +ZuXjSIc3VrHqT0cJ7lQuaIAPG+C+RYN5N3JxcIXdmZ10DNbRsmCxQwA3tTwfduzfg
 /hSmymkS99KALSHNrhTAbtF0FVsuBtc0ESfTkeGJkHVybdZGu2txptPTtzMsw8uhr5
 GCbr1ubQRDGHw==
From: Mark Brown <broonie@kernel.org>
To: ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/15] ASoC: SOF: Abstractions for top-level IPC ops
Message-Id: <164978508747.404572.10382904573744741596.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 18:38:07 +0100
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

On Tue, 5 Apr 2022 10:26:53 -0700, Ranjani Sridharan wrote:
> This series is continuation of the IPC abstraction in the SOF driver in
> preparation for supporting the new IPC supported by the SOF firmware.
> It introduces abstraction for top-level IPC ops for sending/receiving
> regular and large IPC's.
> 
> Peter Ujfalusi (15):
>   ASoC: SOF: Add helper function to prepare and send an IPC message
>   ASoC: SOF: Add high level IPC IO callback definitions to ipc_ops
>   ASoC: SOF: ipc3: Implement the tx_msg IPC ops
>   ASoC: SOF: ipc3: Use sof_ipc3_tx_msg() internally for message sending
>   ASoC: SOF: ipc3: Implement the set_get_data IPC ops
>   ASoC: SOF: ipc3: Implement the get_reply IPC ops
>   ASoC: SOF: ipc3: Implement rx_msg IPC ops
>   ASoC: SOF: ipc: Separate the ops checks by functions/topics
>   ASoC: SOF: ipc: Add check for mandatory IPC message handling ops
>   ASoC: SOF: ipc: Use the get_reply ops in snd_sof_ipc_get_reply()
>   ASoC: SOF: ipc: Switch over to use the tx_msg and set_get_data ops
>   ASoC: SOF: ipc: Switch over to use the rx_msg ops
>   ASoC: SOF: Add widget_kcontrol_setup control ops for IPC3
>   ASoC: SOF: sof-audio: Use the widget_kcontrol_setup ops for kcontrol
>     set up
>   ASoC: SOF: ipc: Move the ipc_set_get_comp_data() local to ipc3-control
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: SOF: Add helper function to prepare and send an IPC message
        commit: b4dcafe45e46f107b5f65a004d49e11e56fe4f87
[02/15] ASoC: SOF: Add high level IPC IO callback definitions to ipc_ops
        commit: 25e77672c4e18fe76dbf2e21ab8c7c36d6a323cc
[03/15] ASoC: SOF: ipc3: Implement the tx_msg IPC ops
        commit: 0881918087ac7adfeed2652a03b4edb1131826ba
[04/15] ASoC: SOF: ipc3: Use sof_ipc3_tx_msg() internally for message sending
        commit: dbcf543cf91edc7f6fe833d51b58fe65265f2a72
[05/15] ASoC: SOF: ipc3: Implement the set_get_data IPC ops
        commit: e974b8e190d30fdd0c5edc1447ee1425a30d15ea
[06/15] ASoC: SOF: ipc3: Implement the get_reply IPC ops
        commit: 783b5f1797595a9df4476dd66f7bf34915be246b
[07/15] ASoC: SOF: ipc3: Implement rx_msg IPC ops
        commit: 74ad8ed6512186134527fc82440f62007a98ff48
[08/15] ASoC: SOF: ipc: Separate the ops checks by functions/topics
        commit: 785b3fbe61c6c1c413b696e335e9f288aaec4364
[09/15] ASoC: SOF: ipc: Add check for mandatory IPC message handling ops
        commit: defad9d2e2703b040c3a001978c09c75970357f0
[10/15] ASoC: SOF: ipc: Use the get_reply ops in snd_sof_ipc_get_reply()
        commit: 045bc49bc9572f883db1a0740cb36bf6eeb206db
[11/15] ASoC: SOF: ipc: Switch over to use the tx_msg and set_get_data ops
        commit: 85d0f881471531ffb081711b13df32b1f6f1f637
[12/15] ASoC: SOF: ipc: Switch over to use the rx_msg ops
        commit: 2f1f5a438899a9d2933ef004a1f0f2c962b29fb4
[13/15] ASoC: SOF: Add widget_kcontrol_setup control ops for IPC3
        commit: e394ffb82f9c24fd6f7f4d896cb4ef32771dae7a
[14/15] ASoC: SOF: sof-audio: Use the widget_kcontrol_setup ops for kcontrol set up
        commit: 50d4d8cf544dfbb9668dce87a21580fedb6e827f
[15/15] ASoC: SOF: ipc: Move the ipc_set_get_comp_data() local to ipc3-control
        commit: e760f102c92c16307abebffd24a31bdb3ccd78ac

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
