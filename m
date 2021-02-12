Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B20331A03D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Feb 2021 15:03:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD2F016DD;
	Fri, 12 Feb 2021 15:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD2F016DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613138609;
	bh=LykWiFRcQ2R+pYDC+Yzhos18q3Efle9L0MitUI/4m5I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hh7km5SDkELDeAKX3xawPxHzmWPL7UGZ/tj+zQhao7z9yiM94c6U0UEp7WrjO0iDN
	 8oNUainoDHTE48qL6vus/WrPhQAdTuBQIeaFTER/W46N/jmFjIebO+ycrB9V/VWnph
	 1RFsZ1vsLpB5xlFqbRKnzQiTtwoDFbKskTikmLZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6BB3F8014B;
	Fri, 12 Feb 2021 15:01:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F13EF8022B; Fri, 12 Feb 2021 15:01:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9598AF8014D
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 15:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9598AF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f3rRdwbv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE06060C41;
 Fri, 12 Feb 2021 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613138504;
 bh=LykWiFRcQ2R+pYDC+Yzhos18q3Efle9L0MitUI/4m5I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=f3rRdwbvjslSWugUVoOuJQyH3gAXqgYg8g5Ljh1oPgmdze18pRVb9+Nm5oYghtL8z
 qylNvRz2F+gIgsgSuwklZMjsfvVQCFD4aw5ZxVJeDgEnUQ46G3VpdTdaXZ2tl6L8I9
 OMwBo+JVAZgI59Y2FZr7XSrZMD8vnHso/RARAqNNV+QC5gT4vmBlnyjGw3FrevgJxo
 1Q7J4LZQGmq2lo6iyso5QeH2BNj8n3X3HJH8q1Ia4mjtpN7vwXSLEV5BDUGc8nT3W7
 1HB9OxUedRiCdzwcMrIXVPnp9ey2dgCkqhDa5T9TdigmCjaeySu4WBfb4Ld2Vw6UxV
 xKQNiUXGr7DDA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tuqs90rl.wl-kuninori.morimoto.gx@renesas.com>
References: <87tuqs90rl.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: soc-pcm: add soc_pcm_hw_update_xxx()
Message-Id: <161313845009.18039.13656414494193984390.b4-ty@kernel.org>
Date: Fri, 12 Feb 2021 14:00:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 04 Feb 2021 08:50:05 +0900, Kuninori Morimoto wrote:
> These adds soc_pcm_hw_update_xxx() and cleanup soc-pcm.c
> 
> Kuninori Morimoto (3):
>   ASoC: soc-pcm: add soc_pcm_hw_update_rate()
>   ASoC: soc-pcm: add soc_pcm_hw_update_chan()
>   ASoC: soc-pcm: add soc_pcm_hw_update_format()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc-pcm: add soc_pcm_hw_update_rate()
      commit: f6c04af5dc4b80e70160acd9a7b04b185e093c71
[2/3] ASoC: soc-pcm: add soc_pcm_hw_update_chan()
      commit: 6cb56a4549e9e2e0f7f67b99cb1887c0e803245a
[3/3] ASoC: soc-pcm: add soc_pcm_hw_update_format()
      commit: debc71f26cdbd45798c63b0dcdabdea93d2f6870

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
