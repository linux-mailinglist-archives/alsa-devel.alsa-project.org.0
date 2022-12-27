Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8A6656A5E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB50739E;
	Tue, 27 Dec 2022 13:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB50739E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142538;
	bh=upmhgxT55eJIknAlC9223pccAU73zhkRG/nn53TEe1g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AybM80vj0ALy/56QdulmOhbU4+hQ14I31prO2Rk1K5aI8q73qzHn2V1jMwIuVw5MB
	 4wAdNaMihT0uZLUVMZGyPKnwRHnnTSxcwaD9FQuuf9J/hOd7Ea1SnNwsaTjGnb+4VP
	 9c5WGfszUnPKiJhygTwDTe5DuYrJXn/D3RY8+mhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4679F805C6;
	Tue, 27 Dec 2022 12:57:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6B33F805AF; Tue, 27 Dec 2022 12:57:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E45B9F805A9
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E45B9F805A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lr3vDoK+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E5C961057;
 Tue, 27 Dec 2022 11:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2529C433F2;
 Tue, 27 Dec 2022 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142250;
 bh=upmhgxT55eJIknAlC9223pccAU73zhkRG/nn53TEe1g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lr3vDoK+X0EH6BT0oXBO6Zuv89jDC5/98K6dH1ztsPEdkk96lU4eibX7d1ym43BP7
 dqD0ZQP7hz/GsYQNLKYAsuaVXo7Coa2csYSn09OpRbuU2gMiWiP1J0dhcpqe6G9/O8
 0SI59ZQMroK6nCsk9mBr7ltsaONHs175BRRix0QGGF5yStWufBDH76lmOteoA7OJr2
 7Wu1ssq+pNP9ktZrjS9NWMqiSf/6QV1JlrCzy5vst6PE0eijCL1dfMvCFUlvRrgAQa
 kqnHX7yUcI8uvvfYpbgamDNn7NIp41ufnitYvxKDSMLy1R1sFb54Jqb9d2vCWX2WT1
 3pHdr+lrj+iHw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/11] ASoC: SOF: Extend the IPC ops optionality
Message-Id: <167214224844.82924.12642881601312879071.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
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

On Wed, 21 Dec 2022 12:23:17 +0200, Peter Ujfalusi wrote:
> This series will extend the IPC ops optionality to cover it up to the existence
> of the top level ipc pointer itself. There is no functionality change.
> 
> The reason for the extended optionality is that we have "DSPless"
> debug/development support coming up (currently it is in SOF's topic/sof-dev
> stable branch) initially supporting Intel's HDA platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: SOF: sof-audio: Treat tplg_ops->route_setup() as optional
        commit: 5315411729b188a8d39252a8c4b9bbdbc3ba6d92
[02/11] ASoC: SOF: sof-audio: Update documentation for sof_ipc_tplg_ops
        commit: 7cbb15593223e1fa56717fd33222c9a804162d70
[03/11] ASoC: SOF: Add helper macro to be used to get an IPC ops
        commit: caf0f4662e07fcc721d1c85af82aa8a7d57621f3
[04/11] ASoC: SOF: pcm: Extend the optionality of IPC ops to IPC as well
        commit: 148dd6a264900fe12c2b3d96efc40511dba177fc
[05/11] ASoC: SOF: control: Extend the optionality of IPC ops to IPC as well
        commit: cfa12c3679b49d8758b94c778afa6a71abf19989
[06/11] ASoC: SOF: sof-audio: Extend the optionality of IPC ops to IPC as well
        commit: cd6afb060c5a3cfad7582d5e09d43fd16a5202e5
[07/11] ASoC: SOF: topology: Extend the optionality of IPC ops to IPC as well
        commit: dbdbf88bdd4f29b391041ef887f89f7ae0809971
[08/11] ASoC: SOF: pm: Extend the optionality of IPC ops to IPC as well
        commit: 510758ee926a30b09b0692d1d42501847ab8b058
[09/11] ASoC: SOF: sof-priv: Mark fw_tracing ops optional in documentation
        commit: 1cf79c3484250d67180525662a247f8fecab3cea
[10/11] ASoC: SOF: trace: Use sof_ipc_get_ops() in sof_fw_trace_init
        commit: 8419fd90ee5c9038cb2776fad71fcc9b93f78e11
[11/11] ASoC: SOF: trace: No need to check for op pointer in sof_fw_trace_free()
        commit: 8a33863a0e287b17a5c637f231f31ff631348f8f

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
