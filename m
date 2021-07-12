Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 661553C538D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:51:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED187169F;
	Mon, 12 Jul 2021 12:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED187169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626087115;
	bh=IeWvLG9dBW5i+3dXkgj42gvpmnDrw+Wdi1aLf/mY6BU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PAxGyl3O1aLz0e5BSmWz9iT40L7iiC9UFddfzdH5B9zm3qfFUZtW/doAmRebWj3Sl
	 yWgTO4y5LmKDY7Bu331YO1uH2I4bRafG1uE+qTn6YHA2FT1X+3TDGu64dSqBVIDQqm
	 /RdU1knpvGnB6jHt+l7RQB6tBJ10AsPsyFJ4dDng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3B7AF80508;
	Mon, 12 Jul 2021 12:48:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62735F804FE; Mon, 12 Jul 2021 12:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E175CF804E7
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 12:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E175CF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cn+/GGn9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F6CE61106;
 Mon, 12 Jul 2021 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086875;
 bh=IeWvLG9dBW5i+3dXkgj42gvpmnDrw+Wdi1aLf/mY6BU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cn+/GGn9yVwf1DMPpHi79I1DSDJZvhgYzbajD1uXbEmo9fwD1GsOIVxKCLwi26Njj
 7V3zwzlEs35hlP3bt30/O2FQtLVBKo1U3wEMKlSSC5WfwAdCjt8KlgSU2cWhz2m5GS
 vFW9jY2dqxCNqlY6DZQWIaNTLVWglkv7w32p3mg3TTyjrcSgbc0cbZ/Hquu+Y0m9Ic
 BM8qvmF71V/sbX3LW2O5kqF972xX62Eayg04IL5FwF/nGguFG20w5EpEANgYTtXBbV
 lRQOBqo2sX7lkXRe4RWtD5l040PN177jCPdWoumvb6Q3kCQ1/+Rgks32Ln/4lp2WdZ
 FUInag9KOpzLA==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, tiwai@suse.com,
 Zhang Qilong <zhangqilong3@huawei.com>, perex@perex.cz
Subject: Re: [PATCH -next 0/2] Fix unbalanced pm_runtime_enable in error handle
Date: Mon, 12 Jul 2021 11:46:03 +0100
Message-Id: <162608623153.3192.12439505219680705153.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618141104.105047-1-zhangqilong3@huawei.com>
References: <20210618141104.105047-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Fri, 18 Jun 2021 22:11:02 +0800, Zhang Qilong wrote:
> This two patches fixed the unbalanced PM disable depth. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> 
> Zhang Qilong (2):
>   ASoC: mediatek: mt8192:Fix Unbalanced pm_runtime_enable in
>     mt8192_afe_pcm_dev_probe
>   ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in
>     mt8183_afe_pcm_dev_probe
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8192:Fix Unbalanced pm_runtime_enable in mt8192_afe_pcm_dev_probe
      commit: 2af2f861edd21c1456ef7dbec52122ce1b581568
[2/2] ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in mt8183_afe_pcm_dev_probe
      commit: 19f479c37f76e926a6c0bec974a4d09826e32fc6

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
