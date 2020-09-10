Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D75264663
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 14:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8A4516C2;
	Thu, 10 Sep 2020 14:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8A4516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599742484;
	bh=UD5TaEy8wxsIp8mgrsHiGFMm82kAp/qRHT62V05wZ/c=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Crh3lf0VsRqJtzdbWbilE/lW2tSQjKvjJVNZPQudoP11YPBtzuRZEpvEppJGmDO/r
	 0uZC4E+3sSLq/a31X0rKkDkAaMRTLkDxlVEpERFsHyTCENOV6+lFQoqWXFO7fOFUie
	 8JBAq1v0M3Nt4eP//HACMCU/3uXmadM7xsWjiTmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 131C1F8028E;
	Thu, 10 Sep 2020 14:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC8C3F80264; Thu, 10 Sep 2020 14:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE09F800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 14:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE09F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pigTNppn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DB0B208FE;
 Thu, 10 Sep 2020 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599742327;
 bh=UD5TaEy8wxsIp8mgrsHiGFMm82kAp/qRHT62V05wZ/c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pigTNppn4yTAbkkFsKlwZKc5rp/cZDxXMIjQKcrl38XBMQDNgsoeyJbc+xT2FrbuE
 5hwVtobENa27f1/CUF47R+egESEI/eWR8qsrXlzO8BJIfLORRvXcBxqvHpmEZbL/yi
 cFr835WK9hubS7YEGVv8FrkwYDn/yzJ6a4jERk6g=
Date: Thu, 10 Sep 2020 13:51:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
References: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/8] ASoC: q6dsp: Add support to Codec Ports.
Message-Id: <159974228224.39114.1744393464890136484.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org
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

On Thu, 10 Sep 2020 11:17:24 +0100, Srinivas Kandagatla wrote:
> LPASS IP on SoCs like SM8250 has Digital Codec part integrated into it.
> This ports are exposed in Q6DSP as Codec ports. This patchset adds
> support to those q6afe ports along with q6routing and q6afe-dai.
> 
> This patchset has been tested along with other patches on
> Qualcomm Robotics RB5 Platform with Soundwire and WSA8815 Codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: q6dsp: q6afe: add support to Codec DMA ports
      commit: 150b2e86c54ad09c26e60f32925aeaf1fca1a5d3
[2/8] ASoC: q6dsp: q6routing: add support to Codec DMA ports
      commit: 825492cb518bcf654e9205b3c723585191314d1a
[3/8] ASoC: q6dsp: q6afe: prepare afe_apr_send_pkt to take response opcode
      commit: 342a4f8ca12b1cac812151b05f8a837eebc6885c
[4/8] ASoC: q6dsp: q6afe: add global q6afe waitqueue
      commit: 181202d021f51d4c0442e71adc34e9629a35a6d8
[5/8] ASoC: q6dsp: q6afe: add lpass hw voting support
      commit: 55e07531d922540c656c7fc2e21d76e1b751f279
[6/8] ASoC: q6dsp: q6afe: update q6afe_set_param to support global clocks
      commit: 84ab3b9f19f6ff0bb5df6c6deea75ab4c1d2aff8
[7/8] ASoC: q6dsp: q6afe: add codec lpass clocks
      commit: 0c3e35fc1ebe22a5254ba3bff2599a2c49b00abe
[8/8] ASoC: q6dsp: q6afe-dai: add support to Codec DMA ports
      commit: 1fdbcfa9fdee6f9cc00129f0f5ed0ff29cfef646

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
