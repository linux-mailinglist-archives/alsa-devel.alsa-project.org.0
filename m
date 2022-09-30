Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C053B5F0665
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 10:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A46166D;
	Fri, 30 Sep 2022 10:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A46166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664526548;
	bh=TZLyGE9FJQemU54GEhCuq0dM8vwxN8v4whQYxVkYgXo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EVrfrLGYNL4NGYlpote7FWj0/W3uokvQH0VIgG05vVUbE9aQrZW0HzstUJ8kR3lpC
	 +DHOiqM7Qp/iPQvz2kT4oFAu3xZa2FB/pSTqRqxYR/CvPFidA5S84F5zrBRWu8joc4
	 a3ml1EWJy7vh9nPaw189a8VR0/OzkNUgcuBvbqd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC582F80537;
	Fri, 30 Sep 2022 10:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7591BF800AA; Fri, 30 Sep 2022 10:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF6AF800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 10:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF6AF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ahqP7KrX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33442B82698;
 Fri, 30 Sep 2022 08:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757BCC433D7;
 Fri, 30 Sep 2022 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664526459;
 bh=TZLyGE9FJQemU54GEhCuq0dM8vwxN8v4whQYxVkYgXo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ahqP7KrXxAeXqx8k/7s4MxK6Y9kUtZ5CauZB0ROr2pTp5kVBhTARgbsNZUYpoCUiJ
 edrCABdb9/X4dGvI8sJWbXk97IV/xzfUKgQP7VPQN1g0CIDWhmAIu0ODiRjjwdyoqo
 0Ds1rKcJY0apf9i0iTmhzmd8XoXH/RZS3fefAD+5931Vi/H0swQnyKaKCN41fJsg7d
 c3A6T75acX9bGdyTWmcqMX8GiTSC4l7gpOSIqXc2WOo94sL9qzHAU2awj7MnWAI7mT
 37OojpkDl/nkk55t+rAAfHOe0cNywj/OlCO3CN3E/dMYeY/XqZm9KY8p/c1uWuc4Pz
 /Jf+4WLf0Tgkw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, matthias.bgg@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
 Zhang Qilong <zhangqilong3@huawei.com>
In-Reply-To: <20220928160116.125020-1-zhangqilong3@huawei.com>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next 0/4] Fix PM disable depth imbalance in probe
Message-Id: <166452645819.46391.11087036933729907918.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 09:27:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
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

On Thu, 29 Sep 2022 00:01:12 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of probe.
> 
> Zhang Qilong (4):
>   ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
>   ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
>   ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
>   ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
      commit: 41a736ac20602f64773e80f0f5b32cde1830a44a
[2/4] ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
      commit: 86b46bf1feb83898d89a2b4a8d08d21e9ea277a7
[3/4] ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
      commit: fcbb60820cd3008bb44334a0395e5e57ccb77329
[4/4] ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
      commit: b73f11e895e140537e7f8c7251211ccd3ce0782b

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
