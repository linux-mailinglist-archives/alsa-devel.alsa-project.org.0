Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49B52F136
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 18:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F27A81718;
	Fri, 20 May 2022 18:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F27A81718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653065996;
	bh=5eW7QW59k/M62V1+P9ocVaObYnldsVstjJ4/K3L5dqc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVrl9wLaxTcU/nDWQO2KRYaLP0yBwhM1YnOFMwzOwhszwoZMYj4AMcNEDqwl+QQ6x
	 yr1OSjpLS85wWcVuID1uWpcGSLSFLtZJK2GHhW9Rl3VzwELPbhgGBZ7rZ86RGAefLp
	 SAC3tWVLiEWNotvaScZ63q/e0NiQCJoOVrLCd8UQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62782F80240;
	Fri, 20 May 2022 18:58:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E601F8019D; Fri, 20 May 2022 18:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FEE2F800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 18:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FEE2F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TocdB2ce"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CAD8EB82CBC;
 Fri, 20 May 2022 16:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EB1C385A9;
 Fri, 20 May 2022 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653065929;
 bh=5eW7QW59k/M62V1+P9ocVaObYnldsVstjJ4/K3L5dqc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TocdB2ceOiF73aMPdSHwUUZ8UhLMU/VXazy389x+96TL3S5HUtLfY807DySBe3efm
 DaAUWPaN7O8hruWxI3ID0tMK1JIPC18+lLcK3qjqlslk9cenIj+pgSHlzZLDklKqsE
 MftpcUJ8a8zh3uZjwoY7iGpC2l7coydIORrrj8OoPAntLLn/3tt4Rib1h+vyc2jO86
 055bL9vVRnURti/ZEwinype4DWPV2WizR7+GEm38OXAz0AL8ehlzP+iLYgQ0h5kviC
 2a/jH++md5ZYM2gtXrd1EmocY8Dx20gPkMHtGh92PlBnJKmUgaDqvMENDHenosvtl7
 b/mrP4AsKeW4Q==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, AjitKumar.Pandey@amd.com,
 daniel.baluta@nxp.com
In-Reply-To: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
References: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: Introduce generic (in)firmware tracing
 infrastructure
Message-Id: <165306592720.462688.5698887121075841093.b4-ty@kernel.org>
Date: Fri, 20 May 2022 17:58:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
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

On Mon, 16 May 2022 13:47:03 +0300, Peter Ujfalusi wrote:
> SOF is using dma-trace (or dtrace) as a firmware tracing method, which is only
> supported with IPC3 and it is not applicable for IPC4.
> 
> Currently the dtrace is 'open managed' regardless of IPC version (we do force
> disable it for IPC4, but the dtrace calls remain in place).
> 
> From the kernel point of view there are only few ops that needs to be exposed
> by the firmware tracing support and everything else is IPC private, should not
> be known by the core.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: Introduce IPC independent ops for firmware tracing support
      commit: 0cfbaee21fcbf131f02c475dbc15f8a18ee621bc
[2/8] ASoC: SOF: Rename dtrace_is_supported flag to fw_trace_is_supported
      commit: 25b17da691f3c1a7cc433f864fd4845998a5a37a
[3/8] ASoC: SOF: Clone the trace code to ipc3-dtrace as fw_tracing implementation
      commit: 671e0b90051ec19e83c12501905734fb808b944e
[4/8] ASoC: SOF: Switch to IPC generic firmware tracing
      commit: 1dedbe4f223cac603e871d91133b9aa3136fbc21
[5/8] ASoC: SOF: ipc3-dtrace: Move host ops wrappers from generic header to private
      commit: b69979a1ec2d9347a43bf0ebdad2c1eb23447ca6
[6/8] ASoC: SOF: Modify the host trace_init parameter list to include dmab
      commit: 4b49cbd1e7ebe4b000a7eedc4f910488da62c055
[7/8] ASoC: SOF: Introduce opaque storage of private data for firmware tracing
      commit: 08341b27bd2ee3c79265ef7925b3bc68a1790ab9
[8/8] ASoC: SOF: ipc3-dtrace: Move dtrace related variables local from sof_dev
      commit: 0683532999ab3890f44f832cd47feee9e2374c22

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
