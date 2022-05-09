Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918AE520687
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249AA16E3;
	Mon,  9 May 2022 23:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249AA16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652130876;
	bh=/HNj4vbFe+rbGCIOvT0X4rdEp6WvFWKGhMhMgUZ7V6g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NuZYbsZziwBXTPl0134iepUkamutQ4Pew8N571/yX4NQq0FagrwRAGe6KjV3KphV3
	 JuXUIzpN2deExwE2MGyJFBie7UFFNSRQAgoisGXydR9lmwjRPcvIwY+yAhXiM7QjUG
	 cXQcUuBxwGdVTD027nZZyL4F1Tv4Mz9sF2nZoR+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8559DF80269;
	Mon,  9 May 2022 23:13:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 019D5F8025D; Mon,  9 May 2022 23:13:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C43F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C43F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fF7Eqyzz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B26261702;
 Mon,  9 May 2022 21:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A66C385BB;
 Mon,  9 May 2022 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652130808;
 bh=/HNj4vbFe+rbGCIOvT0X4rdEp6WvFWKGhMhMgUZ7V6g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fF7EqyzzOgJozMR47JWEeiU3x5UILq3oH6cAxfugjNEuxqX5U22vu92xHiVbwJzrv
 9jfrDFAxWf9QRAfu8mk0Uy6aRR8G20N0Wb9TJZm81PUdOlU1goXSB70f2kwhQbUIFM
 4cM/dcLNoK4h9GVLzEj73mrExixbxF6x27IjgYjE/Kbrw3xjjnReage1PYj9TkslD/
 AKZkGCwyHXWicGZ1AuZWJ4Q72V4/AV3zMysbeUjwqHgChv1kLIa4DVMwk4wTBxH4uW
 508sbIlxNSSg8HK6vjptDSjgPD9hL60LQqjVESSrnoHRIWrEFxgKzm9ue9spY/Lr7k
 gpMpFIIbVaJhg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 rander.wang@intel.com
In-Reply-To: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
References: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: sof-client: Update for different IPC
 versions
Message-Id: <165213080684.1980311.14671784909471716067.b4-ty@kernel.org>
Date: Mon, 09 May 2022 22:13:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Fri, 6 May 2022 16:26:39 +0300, Peter Ujfalusi wrote:
> The current IPC client infrastructure can only be used with IPC3.
> This series carries updates for the core side of the client support to handle
> IPC4 messages and updates the ipc message injector to be usable with IPC4.
> 
> The IPC flood test is only supported by SOF_IPC (IPC3), we are not going to
> create the aux device for it at all if the firmware is using IPC4.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: sof-client: Add API to get the maximum IPC payload size
      commit: a669ec5f4bc485a56b2f379e7c7197a810872cc1
[2/8] ASoC: SOF: ipc-msg-injector: Query the maximum IPC payload size
      commit: ef368c3347fe79a4193317b130b02064801920d7
[3/8] ASoC: SOF: sof-client-probes: Query the maximum IPC payload size
      commit: a1e5bbc8ea6ae6e0fa1bd42f2ef810b13d9ec066
[4/8] ASoC: SOF: sof-client: Add API to get the ipc_type
      commit: cdf8233d2cd2e55c8bc409e5b4fbdb181a1dea2b
[5/8] ASoC: SOF: sof-client: Add support IPC4 message sending
      commit: 100c9374318f881c3083573af9dc76afa229fd23
[6/8] ASoC: SOF: ipc-msg-injector: Separate the message sending
      commit: a9aa3381e404abae3dd8c37b7c845415b56f0305
[7/8] ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages
      commit: 066c67624d8ca2a2465690d4a7b7f52b880e9925
[8/8] ASoC: SOF: sof-client: IPC flood test can only work with SOF_IPC
      commit: 5889ccdd094ac32ee52851fc9eccd124897daf2b

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
