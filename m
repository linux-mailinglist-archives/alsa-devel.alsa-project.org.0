Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3134D8BB
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 22:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6751679;
	Mon, 29 Mar 2021 21:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6751679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617048004;
	bh=VMff+Qv6NeIX9a1HoADYuLB7R+Md++1sW41s5i4v3l0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqM5hRpQ0dZp/mPsUYEZ+iD3xsElqfH7OTAgYUuXro+KxRMqTCOfokdomdx2cZSqi
	 fAPKw2WGTKIiPvAi0YJchiolGkUVhSQezwHI+TP8U+RPSbPFF8tpH4jvJxo9WXWE8J
	 ZJoUM0UQIavE0h8dcJEufiddAuJZ1jfpyPAMJFDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC6AF801DB;
	Mon, 29 Mar 2021 21:58:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46A20F8016E; Mon, 29 Mar 2021 21:58:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03354F80157
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 21:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03354F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LO1Okk5E"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D7C361494;
 Mon, 29 Mar 2021 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617047906;
 bh=VMff+Qv6NeIX9a1HoADYuLB7R+Md++1sW41s5i4v3l0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LO1Okk5EyAoTa+OR2sEzi7g/DU4llvPF4CAXEDM8pXNgXUXlY70DGfmmd23gLflnh
 0Dx8S9/6YqUmDOLwhjWBd0Gs91cD8N2x1K/jVzeKes8G9lZTURmooMKyBeB3sVMPe1
 dj6nJbUQUzDSpKP9MBaUfCFz/wnU1vEfCUtCIRP/1XGxEyaiymoScdmonhx7zNrujq
 KwYZXhqnIcGsVB90RLb+Q/iIS/7UMQsLFTjZaLzOyHKbLPzGhaoiEQUwvu4Xba67S1
 afamk2iHurB04AXA57AGj8CJ5Iv1dUXvhdynRyOSbZ/vXNO2V9CEfMIy+kr6L3KrQ3
 hiB2p299e14Sg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, YueHaibing <yuehaibing@huawei.com>,
 lgirdwood@gmail.com
Subject: Re: [PATCH -next] ASoC: dwc: Fix -Wmissing-prototypes warnings
Date: Mon, 29 Mar 2021 20:58:07 +0100
Message-Id: <161704724765.10039.16753813852849832832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329150524.18184-1-yuehaibing@huawei.com>
References: <20210329150524.18184-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Mon, 29 Mar 2021 23:05:24 +0800, YueHaibing wrote:
> while CONFIG_SND_DESIGNWARE_PCM is not set, building with W=1 shows this:
> 
> sound/soc/dwc/local.h:127:6: warning: no previous prototype for ‘dw_pcm_push_tx’ [-Wmissing-prototypes]
>  void dw_pcm_push_tx(struct dw_i2s_dev *dev) { }
>       ^~~~~~~~~~~~~~
> sound/soc/dwc/local.h:128:6: warning: no previous prototype for ‘dw_pcm_pop_rx’ [-Wmissing-prototypes]
>  void dw_pcm_pop_rx(struct dw_i2s_dev *dev) { }
>       ^~~~~~~~~~~~~
> sound/soc/dwc/local.h:129:5: warning: no previous prototype for ‘dw_pcm_register’ [-Wmissing-prototypes]
>  int dw_pcm_register(struct platform_device *pdev)
>      ^~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: Fix -Wmissing-prototypes warnings
      commit: 0803a5cb5b7cf369c3e2af4108ee44d0b6e1c197

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
