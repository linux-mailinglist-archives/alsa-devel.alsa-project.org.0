Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434C425F54
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3311E1686;
	Thu,  7 Oct 2021 23:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3311E1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642885;
	bh=lQjNj4ltrifXgYG4t2VTgCzZ88xFZSrmWilbC9hfXHg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ihu/WKN33oau+Xa7MfA+Io0ZEKzJm5Ym5c89qWmmG9qIhTso7GKRa31T71fQFH5cN
	 9Av9J2sB+ZzHL9e2JxsR0wgPp3eAMGiQGhIpC+3mn+tnGae2Aw0V4fj6WI6jZ+9+k5
	 JlgFEcGqdRfQQeifVBnbqX3auFhtUxr1dm4F+sO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A776F80515;
	Thu,  7 Oct 2021 23:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96203F804FC; Thu,  7 Oct 2021 23:38:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7E48F804F1
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7E48F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M0/CQKeA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FAA26120D;
 Thu,  7 Oct 2021 21:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642680;
 bh=lQjNj4ltrifXgYG4t2VTgCzZ88xFZSrmWilbC9hfXHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M0/CQKeA3+hqPyaU89yAZN9tSXL5ZCeanj6kDrxkcI18yEMl0gWpFnckHjycqL3aK
 E+T4N0jr0aGtzHe5cOQyAVyEnEWENeHdjB2YXqiORiqt52jagqWqviMtJ0C7GTqntb
 oneu6k+OJ6SVnQF77djVwBaQjrYQHW1IN5x+m3LPBgf48AAaOpnpZUlqfzDv75Nqjw
 V/rwQlkttjg2ZPX3kJaNgW6QXxEsysivTlFu+dwno562uv8GQrUk54akLohAT/eKwK
 WiQeXm1f4xUW4ppnhKWOHlNrmZlfBkwzVAVpcprfzG0C9XX51vMMFa4xTpNr3vX2Ez
 6gqbWkDGkQC4w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH 00/19] ASoC: SOF: Improvements for debugging
Date: Thu,  7 Oct 2021 22:37:30 +0100
Message-Id: <163364264606.649699.6310777207318503716.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, ranjani.sridharan@linux.intel.com,
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

On Wed, 6 Oct 2021 14:06:26 +0300, Peter Ujfalusi wrote:
> The aim of this series is to clean up, make it easier to interpret and less
> 'chatty' prints aimed for debugging errors.
> 
> For example currently the DSP/IPC dump is printed every time we have an IPC
> timeout and it is posible to lost the first and more indicative dump to find the
> rootcause.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/19] ASoC: SOF: core: debug: force all processing on primary core
        commit: 1539c8c5fcca217e3de063e7fbec97f83c7938a7
[02/19] ASoC: SOF: debug: Swap the dsp_dump and ipc_dump sequence for fw_exception
        commit: e85c26eca639f3cf0ad989756f0eac2045391bb6
[03/19] ASoC: SOF: ipc and dsp dump: Add markers for better visibility
        commit: 3f7561f74169e199f9d6f4f0cdb9eb681052381a
[04/19] ASoC: SOF: Print the dbg_dump and ipc_dump once to reduce kernel log noise
        commit: 9ff90859b95f6c85ce2d671ecd1e95e91dbe7f15
[05/19] ASoC: SOF: loader: Print the DSP dump if boot fails
        commit: 247ac640739dda167a127a2ecb158595695ffd7d
[06/19] ASoC: SOF: intel: atom: No need to do a DSP dump in atom_run()
        commit: e131bc58868a529c1c97567fc6d0d8855bdb3ffd
[07/19] ASoC: SOF: debug/ops: Move the IPC and DSP dump functions out from the header
        commit: 360fa3234e9205306b7730d9afa64c8c3f909160
[08/19] ASoC: SOF: debug: Add SOF_DBG_DUMP_OPTIONAL flag for DSP dumping
        commit: 34346a383de96e9fcecb1906d711fc1b09d9b90a
[09/19] ASoC: SOF: intel: hda-loader: Use snd_sof_dsp_dbg_dump() for DSP dump
        commit: 0ecaa2fff2debf46d6cc978cd6e48d923e3d339d
[10/19] ASoC: SOF: Drop SOF_DBG_DUMP_FORCE_ERR_LEVEL and sof_dev_dbg_or_err
        commit: 23013335bc3c906e304cda507d80b8006381a4f7
[11/19] ASoC: SOF: debug: Print out the fw_state along with the DSP dump
        commit: c05ec07143998d8505a054378f8d5b287648c9bf
[12/19] ASoC: SOF: ipc: Re-enable dumps after successful IPC tx
        commit: e6ff3db9efe96a9c3cd8b0c33744f259c1928a42
[13/19] ASoC: SOF: ops: Force DSP panic dumps to be printed
        commit: 705f4539c4c834de9a7885512585b3a27fedf216
[14/19] ASoC: SOF: Introduce macro to set the firmware state
        commit: 58a5c9a4aa993fe2059c1b8dbcff9bf468d722b8
[15/19] ASoC: SOF: intel: hda: Drop 'error' prefix from error dump functions
        commit: 4fade25dfbe121f8ef61458b4655966f133b1907
[16/19] ASoC: SOF: core: Clean up snd_sof_get_status() prints
        commit: e51838909b69a8c941629a6f86804f8e189103e2
[17/19] ASoC: SOF: loader: Drop SOF_DBG_DUMP_REGS flag when firmware start fails
        commit: f8c3ec4368df1e5051030beaeb961fd7f625d2d1
[18/19] ASoC: SOF: Intel: hda-loader: Drop SOF_DBG_DUMP_REGS flag from dbg_dump calls
        commit: 7511b0edf1b8d9a1321ac19cb076fcdfe534439a
[19/19] ASoC: SOF: Intel: hda: Dump registers and stack when SOF_DBG_DUMP_REGS is set
        commit: 3ad7b8f4817fcfd68a101ec9986c435f17cc74a1

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
