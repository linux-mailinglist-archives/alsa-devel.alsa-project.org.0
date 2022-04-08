Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD24F9D64
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 20:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF2C18D3;
	Fri,  8 Apr 2022 20:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF2C18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649444259;
	bh=nIAQQiM25OUwJCglLgOqN04FfV2hY/JrotWsrqPqsPs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJf4qJzj22xkBA/L1wW384qrR1f3VEBLc4M3r0HKmXdLw5CuOSx9IbofV+Rmk5NI3
	 S/TtUWOckj38R8pWwzFysPM3Hwj0E74fBBbQZL8U7nymwD9oNDtq2BafRhb/tsESVm
	 gKjl/fBAOZ3lT8wzklMbh1YbSWh52t7WS8YgNHoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6101F80311;
	Fri,  8 Apr 2022 20:56:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CC9FF8014E; Fri,  8 Apr 2022 20:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AFD3F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 20:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AFD3F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PL0p03H2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E32DA60B21;
 Fri,  8 Apr 2022 18:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4972CC385A1;
 Fri,  8 Apr 2022 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649444191;
 bh=nIAQQiM25OUwJCglLgOqN04FfV2hY/JrotWsrqPqsPs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PL0p03H2RZ4zrIHtNHXATSJ3k3akFyjyrULUbduj2T8cHrs+mrZAetrUj0jB9qpkR
 tIjGHo2c2KQZY6EsO21t+TT6G03NltB9Kelpcjyu3XTtqvIXt4v3vAIF1dL3o5I2Fe
 imzc7Qt64iVcFCJ/GclFSrWXMQBl471JnnLJl5JiPAiKWcxLmvFo9pcSRlumehztUv
 xaFhVs0xhI+A+xetEEyimj1gARyBick7ly/TYvgTxWqOd9JrHD/MkXMXi2GoNNikQf
 P9bEentAIdovHsZXwX9vLqs0eyrTrVxgrsvUzVRWRlfZpnW6oRhcTK2fdEHcv0r5q4
 P/i3vFaMBzeuA==
From: Mark Brown <broonie@kernel.org>
To: quic_srivasam@quicinc.com, perex@perex.cz, quic_potturu@quicinc.com,
 christophe.jaillet@wanadoo.fr, srinivas.kandagatla@linaro.org, tiwai@suse.com,
 lgirdwood@gmail.com
In-Reply-To: <5b5a015a9b1dc8011c6a4053fa49da1f2531e47c.1648969065.git.christophe.jaillet@wanadoo.fr>
References: <5b5a015a9b1dc8011c6a4053fa49da1f2531e47c.1648969065.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] ASoC: codecs: Fix an error handling path in
 (rx|tx|va)_macro_probe()
Message-Id: <164944418901.1442858.13330584837821971131.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 19:56:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sun, 3 Apr 2022 08:58:27 +0200, Christophe JAILLET wrote:
> After a successful lpass_macro_pds_init() call, lpass_macro_pds_exit() must
> be called.
> 
> Add the missing call in the error handling path of the probe function and
> use it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix an error handling path in (rx|tx|va)_macro_probe()
      commit: ddfd534528146660de75ee84d6db10f10e778f95

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
