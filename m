Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D1362505
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:05:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 895FF16A8;
	Fri, 16 Apr 2021 18:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 895FF16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618589107;
	bh=boVgnYbnQa5Iw5RVwQB/kZPwgG/+sE0Z3xMNh+HQc/c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=av1X2PEs6bpg1vOgKz03lmr5i7KdYeN4uVtvm79irDLaTbH3QddERTBbHaLPsiayk
	 b2o8l1asccbWutko2APJg5m4oXBt1SMhLQCyg3guy35ZG1Erge1rX12RW1GTVIaZ2N
	 hdK8oXruYuIp6K2ULeo6e5SVx6Ixl76+ek/yVSpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF6C6F8042F;
	Fri, 16 Apr 2021 18:02:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E834F80425; Fri, 16 Apr 2021 18:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6B3F800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6B3F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p7a75ZDI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A77F16124B;
 Fri, 16 Apr 2021 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618588957;
 bh=boVgnYbnQa5Iw5RVwQB/kZPwgG/+sE0Z3xMNh+HQc/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p7a75ZDI2s3UT+qgbc7xnDWPDLkQBHKSEn4Xeh0VqQS0T4MSzX2c0YmNdjMLEutN7
 iHCVPRWI6tqXnQ3vWPo0WfF27g9jlI0+fwjS3t+tR4O0xL7PTMNpnBho/hCmWyy8Oy
 j17mH7aHUA97VnU+sYmN2ttnQ0VXGYr5AOfV23gKe7c2/NWNJ9Db2MrwS9oMjCkraK
 iOJP4eIk//SFYdm462WE6JikIuAMRFgpw62BLKHK+Txl7CIILgGwcSA6YHsY33j261
 penoj3frQEg4neqzpPQGzpyvBwOvaBOS/whhe0zwXmNuyfWxyvKFCSZmtTxxn28NDD
 nIMBsZVOMmZqA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: soc-pcm: ignore dummy-DAI at
 soc_pcm_params_symmetry()
Date: Fri, 16 Apr 2021 17:01:50 +0100
Message-Id: <161858869853.28833.10548793569178461990.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <874kg7yopb.wl-kuninori.morimoto.gx@renesas.com>
References: <874kg7yopb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 16 Apr 2021 10:59:12 +0900, Kuninori Morimoto wrote:
> I noticed if we have...
> 
> 	1) Sound Card used DPCM
> 	2) It exchanges rate to 48kHz by using .be_hw_params_fixup()
> 	3) Codec had symmetric_rate = 1
> 
> We will get below error.
> I didn't confirm, but maybe same things happen
> if it exchanged channels/sample_bits.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-pcm: don't use "name" on __soc_pcm_params_symmetry() macro
      commit: 1cacbac447d9b29a4057d7bbffe8c3d4125ec82a
[2/4] ASoC: soc-pcm: indicate DAI name if soc_pcm_params_symmetry() failed
      commit: ee39d77ed91f220b1458137118dea158a095d5c5
[3/4] ASoC: soc-utils: add snd_soc_component_is_dummy()
      commit: 8f1a16818a08047c83bc6e29efc07b15fd11fa29
[4/4] ASoC: soc-pcm: ignore dummy-DAI at soc_pcm_params_symmetry()
      commit: 9c2ae363f3347baacd2353a017eb62363420a1ea

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
