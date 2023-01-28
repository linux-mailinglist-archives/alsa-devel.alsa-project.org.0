Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAB67F75D
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 11:49:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C93EAB;
	Sat, 28 Jan 2023 11:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C93EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674902986;
	bh=OPsHbgzLdqwYQd1m4ImhqSwn7ne/bkBi7OcQQaQhu+g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=t6NODAWHsSSUioUo0jw/2nxXxZRy4nWL9nOlLyfy94rESF86JdpjoH9eGmXKVLUGj
	 BTU82PjPz+EVchdEC8x0KdjAk5Xbs+TIy6yI/QU14cXuLM0Rx7ZZpMZQWoYy44jREz
	 MfX3FzmDYPmVrCRsMG0Cl0lc3TjJDkEk0xSuqNz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C622F80074;
	Sat, 28 Jan 2023 11:48:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40C8EF8030F; Sat, 28 Jan 2023 11:48:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33CFAF80074
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 11:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33CFAF80074
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gkF/PYcK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9D6F60BA6;
 Sat, 28 Jan 2023 10:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46697C433EF;
 Sat, 28 Jan 2023 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674902886;
 bh=OPsHbgzLdqwYQd1m4ImhqSwn7ne/bkBi7OcQQaQhu+g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gkF/PYcK5V3vmyshqRmHkW12KZkely6AuA3QTZMcUjVWN6kLfwu6ttm/MekTfhlLh
 cQ/bJUwl8VWHCKYDz5fOKJADjCoUcCa0MQ09fLPFNdmMjLzOpeDXwZo2ZboipSp9y3
 zcgYaxhzRnMFEj6ufU356VL8n+d80fRSCrgXcFb+YSf+sbgqhe2Tx/WOM6d6u6CA/x
 HKi+Q7mbgKSzcBCWSU+Rycp2XPjgCOkYnsglVhh8zQ2KUDLN8a3DcG5ZLX/CMEkiqZ
 rCN62kC5EQlS10GTgxxgosa29yGOPU4Qpx/n/2xOqTWYZgiOBj/jtEjAe7WN8a1RhD
 doGNYpLtgbhxQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
Subject: =?utf-8?q?Re=3A_=EF=BB=BFFrom_644473b181f0f310e428301a2ed459f912?=
 =?utf-8?q?eec7ea_Mon_Sep_17_00=3A00=3A00_2001?=
Message-Id: <167490288394.2145828.1502152108556968978.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 10:48:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 27 Jan 2023 14:00:13 +0200, Peter Ujfalusi wrote:
> The following series will enable multi-stream support for playback and capture
> streams.
> Currently only a single PCM can be connected to a DAI, with the multi-stream
> support it is possible to connect multiple PCMs to a single DAI.
> 
> To achieve this we need to make sure that DAIs/AIF are only set up once since
> other stream could be connected to it later.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[01/18] ASoC: SOF: ipc4-topology: No need to unbind routes within a pipeline
        commit: 9a62d87acee94919af1fe92f2412fff83dcbcda0
[02/18] ASoC: soc-pcm: Export widget_in_list()
        commit: 5edcf2a3aad41ee398ac011cda7bccca400b56f0
[03/18] ASoC: SOF: sof-audio: Set up/free DAI/AIF widgets only once
        commit: 73ea660947b52969214473434396a33d283c5ac8
[04/18] ASoC: SOF: sof-audio: Only process widgets in the connected widget list
        commit: 4639029b046bcab11bd566afa2979c68edeb338a
[05/18] ASoC: SOF: pcm: do not free widgets during suspend trigger
        commit: 82b18242ae68214c44ccb13e993c2bc925f28428
[06/18] ASoC: SOF: topology: Set IPC-specific trigger order for DAI links
        commit: e380c9071032b89ea2e77b871792d908d0f15512
[07/18] ASoC: SOF: Introduce PCM setup/free PCM IPC ops
        commit: 7201a3d47e8a6a0b3a55125e70a9c650afabe7b0
[08/18] ASoC: SOF: ipc4-pcm: Define pcm_setup/free ops
        commit: ba223b3ad0b9f1753f0822c5c441a925cc82b63a
[09/18] ASoC: SOF: ipc4: Add flag to skip triggering pipelines during FE DAI trigger
        commit: 37a26eec53b09b7054234b77200ce729601b0ccb
[10/18] ASoC: SOF: sof-audio: Populate the PCM stream pipeline_info
        commit: 19137532dbe32ff2c8b5b1442c077bf3abff86f3
[11/18] ASoC: SOF: ipc4-pcm: Use the PCM stream's pipeline_info during trigger
        commit: 2d271af1af241e64726ada07c6bef6572f1be6a5
[12/18] ASoC: SOF: Introduce struct snd_sof_pipeline
        commit: 9c04363d222bc94d49d883458b2854334a848b5f
[13/18] ASoC: SOF: ipc4-pcm: Rename 'data' variable to trigger_list
        commit: 6f9eb19a33d608ba36162a9ccbd34a77249fcc2e
[14/18] ASoC: SOF: ipc4-pcm: Implement pipeline trigger reference counting
        commit: 32c4b69872e5fe5fd9517826be31dbf2c3dd917a
[15/18] ASoC: SOF: ipc4-topology: Protect pipeline free with mutex
        commit: 6bc4d1b714aafc0ee3c7649c36aa19998b4c11f9
[16/18] ASoC: SOF: Avoid double decrementing use_count in sof_widget_setup on error
        commit: 955a6f131a50c3685c560ef7b75880d272337b33
[17/18] ASoC: SOF: Protect swidget->use_count with mutex for kcontrol access race
        commit: f94f3915274d22d5cd8b253e0533822b934f5f41
[18/18] ASoC: SOF: ipc4-pcm: Do not run the trigger pipelines if no spipe is stored
        commit: 251a2b11851531526260db1dbc5673a7d6177895

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

