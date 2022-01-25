Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838549B652
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 15:36:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE8D51B46;
	Tue, 25 Jan 2022 15:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE8D51B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643121368;
	bh=5clRBsdVXBAvTi/3xGhcRtm3jyRN3XEGvnSEh70XfEE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N5jIBiWAhoYByEO1k0DnhGFwDmlZVX2xoFFYpNf5i83L+WIK2rj1jmDRG5VaQLHeD
	 bqJdxDyTrdMn7fq5cLOqt7ZGdBuDQKDHvg5Z6qY1PI10T0O/qkmH84bpLn4ZkE3Var
	 TkS9l8CBixJiMWnxtTsp6YJ8MzwkFm/WREik2yAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E586F804CF;
	Tue, 25 Jan 2022 15:35:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F250F804C3; Tue, 25 Jan 2022 15:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AB1AF80161
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 15:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB1AF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WMbCLTsS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A170615D8;
 Tue, 25 Jan 2022 14:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA22C340E0;
 Tue, 25 Jan 2022 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643121293;
 bh=5clRBsdVXBAvTi/3xGhcRtm3jyRN3XEGvnSEh70XfEE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WMbCLTsSdJQw5UwSvoS9nKpOIrF1LWqEVG9vECp+cVNNO6SOjldyWoNiNG5pxo15z
 S9EFvfe9oxncKuDjIlORfjVWUPX8S3w+VJnvS/EBYl3mlsBWsh205/nwPJNLTuwKBk
 Vz6+tpP9eB6IrOe+HlTxXf8Z/wcbfjSTifqEX4o0Cj+J5kqTlaX8hhp5wgEbQZ6qcs
 khEIQdKApROCMH0OMgnbl1U2xjUFTZ561U6pfbeAEAlfeTIEged2C+IhG/qj9D0lRs
 zeUEUOacG6bnV3imI4uMqjhPVJPMPmkRVFqIYSMuJCMGZfHvBnt/a7HZJNpXKHxJAr
 xkvYILj+hvwXQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20220124153253.3548853-1-broonie@kernel.org>
References: <20220124153253.3548853-1-broonie@kernel.org>
Subject: Re: [PATCH v1 0/3] ASoC: Add bounds checking for written values
Message-Id: <164312129256.3596085.4283851500413394138.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 14:34:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Mon, 24 Jan 2022 15:32:50 +0000, Mark Brown wrote:
> This series adds verification that values written to registers are in
> bounds for controls since the core doesn't validate for us.
> 
> Mark Brown (3):
>   ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
>   ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
>   ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/3] ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
      commit: 817f7c9335ec01e0f5e8caffc4f1dcd5e458a4c0
[2/3] ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
      commit: 4f1e50d6a9cf9c1b8c859d449b5031cacfa8404e
[3/3] ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()
      commit: 4cf28e9ae6e2e11a044be1bcbcfa1b0d8675fe4d

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
