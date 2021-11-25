Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDA45DB4D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:39:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55DC6178F;
	Thu, 25 Nov 2021 14:38:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55DC6178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637847545;
	bh=YBUe5iaqpRc+freiqsgpPGGUt/uvv62GjcaSgEBy0SE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbA6P4g35p0Wqe/cHUd19PB0czhnKqRIUkdHvlGY8w0vfBmTH1EbNVuEsA3gvzzNe
	 gtcOcBpMS7MSUFBZPJHPjdJ7aBXmOS8lLWmnd+q384yMqm9auavorv7IPgldNoth2v
	 bYfOCry7aZ2AUt4E6hyEvMJjmw7Gz7tX85LFy8sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7547DF804FC;
	Thu, 25 Nov 2021 14:37:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 675E2F804BC; Thu, 25 Nov 2021 14:37:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B152F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 14:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B152F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DLnzZ3fn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 356A861059;
 Thu, 25 Nov 2021 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637847417;
 bh=YBUe5iaqpRc+freiqsgpPGGUt/uvv62GjcaSgEBy0SE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DLnzZ3fnInJInqcpRZi7dgjPdaG1NeirxE8fZIE/F308Gn6ohRfInj1CtYDN8Oa3a
 2l6Y5+1PJvKmMCHiURFPDeqyTqJuYDgPM4okXiygZxC5XNXkrNoTEzSUI8HwiBKQy1
 +TCLrUqazBIt9Fqs6iNnjElDGXI8G5G0JVzR/XHm0RL8KP4pRhP26jJX/TGv5PHTlg
 vObqXaYnbYLPGXYOivZIlwd5KkGfiwJpopHiPe+ntNtw+bgGirQnSjem1W9WEk2sAK
 bsDru2Z0+e5OkXpDF3x4ONLmsKi9efixko4sUoBea3hG749vPEGVMZOm6Ev46xz/k4
 Rx9s4ShUxCRGQ==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, tzungbi@google.com, kaichieh.chuang@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, garlic.tseng@mediatek.com
In-Reply-To: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
References: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: remove unnecessary CONFIG_PM
Message-Id: <163784741495.3101847.17087805943861117771.b4-ty@kernel.org>
Date: Thu, 25 Nov 2021 13:36:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>
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

On Thu, 25 Nov 2021 12:24:22 +0800, Jiaxin Yu wrote:
> The unnecessary conditional inclusion caused the following warning.
> 
> Such as:
> >> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c:2368:32: warning: unused
> >> variable 'mt8192_afe_pm_ops' [-Wunused-const-variable]
>    static const struct dev_pm_ops mt8192_afe_pm_ops = {
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: remove unnecessary CONFIG_PM
      commit: faf695517c1c77bb4a4b46d54007a283962eb00e

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
