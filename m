Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B64598EC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 01:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE601680;
	Tue, 23 Nov 2021 01:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE601680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637625808;
	bh=4E0l/y9QM1pvLLTk7ZJ7qZ6aORmi66iU0Av5/8iT9WU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xv/HDDQbh6zWdyp5lxG7eq639aP0X+QzBcp9BNvZUaBR320lzyREyF6Yb1gF2Voij
	 v46Gp4tLAY/N6COAwjmBC50soWS8XRTzYZHWzxUCFxi5jK8Xs8IlydGU2bNwOr0xd3
	 AV0sY22VfRQYxRNuaUUhF/9O5dNa3klke5Cg758g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86363F8051A;
	Tue, 23 Nov 2021 01:00:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D0ADF80517; Tue, 23 Nov 2021 01:00:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B803F804FE
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 01:00:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B803F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bU2cj64/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF63F60F24;
 Tue, 23 Nov 2021 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637625614;
 bh=4E0l/y9QM1pvLLTk7ZJ7qZ6aORmi66iU0Av5/8iT9WU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bU2cj64/CTa8ibHtH9RTNrmtw/e4r2CuGxVR4EH5g2f7qpnar7jzj2j9s468w2F2c
 KRb5XphBZ6XSmNiDkqXNYfzdqC8rhyT2edtECYGreJLmQdRPjMfPdAh5RS36bwTl+i
 FzLirC67XTv8y4U1UGU/KVcYNdniLnaWzIiup6nbzSb4YTQNR7vLmu9shZ6Z+tbCvu
 K9zO+S7e79SEgs3ZOQidHW3T4BQBXgH/PNoPYYOZW3/aFztbtOBO0exR0kpq2MXYhG
 HLuMEbk1kyEtzwyoP3JSzTI3sa/XJWACXUkeYec0JpJP/QogWwfWVD4tZ5+4TR5/dz
 NEPSW1dC47y2w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
References: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: SOF: enable multicore with dynamic pipelines
Message-Id: <163762561248.2471742.17711439098780520731.b4-ty@kernel.org>
Date: Tue, 23 Nov 2021 00:00:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Fri, 19 Nov 2021 21:26:11 +0200, Kai Vehmanen wrote:
> initial support for SOF dynamic pipelines was added in commit
> 5fcdbb2d45df ("ASoC: SOF: Add support for dynamic pipelines").
> 
> When a pipeline is marked dynamic in the SOF DSP firmware
> topology definition (the tplg file kernel loads from filesystem),
> it means the pipeline resources are not allocated when DSP is
> booted (at driver probe, or at runtime resume), but rather delayed
> until the pipeline is actually used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SOF: Intel: hda: expose get_chip_info()
        commit: 81ed6770ba67358b07e96a277206f6c742737dab
[02/10] ASoC: SOF: Introduce num_cores and ref count per core
        commit: 5974f6843203f0061d9df05c32262a10359740a6
[03/10] ASoC: SOF: Add ops for core_get and core_put
        commit: c414d5df9d05471aa47f50fca7fa4412daca7ac7
[04/10] ASoC: SOF: Intel: TGL: set core_get/put ops
        commit: 41dd63cccb42ec26f555cbb2495d85828a4b0e96
[05/10] ASoC: SOF: Intel: CNL/ICL/APL: set core_get/core_put ops
        commit: 9cdcbc9f6788661fb02fb2340032a5c8115aaf9b
[06/10] ASoC: SOF: topology: remove sof_load_pipeline_ipc()
        commit: 7cc7b9ba21d4978d19f0e3edc2b00d44c9d66ff6
[07/10] ASoC: SOF: free widgets in sof_tear_down_pipelines() for static pipelines
        commit: b2ebcf42a48f4560862bb811f3268767d17ebdcd
[08/10] ASoC: SOF: hda: don't use the core op for power up/power down
        commit: d416519982cb1d25358f558a4e68d9d254c9ca53
[09/10] ASoC: SOF: add support for dynamic pipelines with multi-core
        commit: 9ea807488cdaef83da702d4a02d54138b88f4377
[10/10] ASoC: SOF: Intel: hda: free DAI widget during stop and suspend
        commit: 05827a1537f35221d84b8f5606f2f4c1371c69f3

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
