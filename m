Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2C3C5305
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:51:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6926216A1;
	Mon, 12 Jul 2021 12:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6926216A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626087064;
	bh=p+qLz+HhOqEFcAKXAJHCu8puLmOSYZop39X5dZG07EY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+DrORsQhM1MyU3yWq4iNE3CdokBiW71ZH1cjBdPR/cSpMa3C8+SrVvXa3u0qpBZW
	 +03iee2jjQc32guhywGVkr2il1yih7Si1nUbqJCA/VPwx5K4sYemUgbPMyGTIrefzg
	 Hk1hvL/wtI4Vn2uoK4q02GMzGw8l8yI1fQQbsvE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B05D4F804F2;
	Mon, 12 Jul 2021 12:47:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96433F804E6; Mon, 12 Jul 2021 12:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8918F804E4
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 12:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8918F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rU49web7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6D99610FA;
 Mon, 12 Jul 2021 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086865;
 bh=p+qLz+HhOqEFcAKXAJHCu8puLmOSYZop39X5dZG07EY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rU49web7RUua2IMfaM//7+M8yiIKwUXhdv/e9Lsl0tVAtN/EQj9BVMhbCL8YKua1j
 8nqoKs2sXd54M4LPlV1bq1W1VKT9dKMeRyT0E2wMNN/7JA24+0XwLvO9tTEnOJHP+c
 oBVojxFrYQ9Un5iayEwV6932dPiboBqfLQJc+3K3fEr4K+/hh8ofXz9kz/Ofx8ENti
 Mvz9XizXA8pcuNqnrWLaP0P/gSaNyMNfrGgRBKdMQC6dvc51jb7Sib1xtw3NkH9dfw
 2MS6M/Rx4rAAmiyXXO7OUf2KCWmSJzYSKe256pA3Ntsct+etX7uKAi16h0mq5WeZjw
 ZE7Nhg7tdikPQ==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, nicoleotsuka@gmail.com,
 Tang Bin <tangbin@cmss.chinamobile.com>, Xiubo.Lee@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz
Subject: Re: [PATCH] ASoC: fsl_xcvr: Omit superfluous error message in
 fsl_xcvr_probe()
Date: Mon, 12 Jul 2021 11:45:59 +0100
Message-Id: <162608623153.3192.455683453441836535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210624104505.13680-1-tangbin@cmss.chinamobile.com>
References: <20210624104505.13680-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Thu, 24 Jun 2021 18:45:05 +0800, Tang Bin wrote:
> In the function fsl_xcvr__probe(), when get irq failed,
> the function platform_get_irq() logs an error message, so remove
> redundant message here.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Omit superfluous error message in fsl_xcvr_probe()
      commit: 8620c40002db9679279546cc3be2aceb8c5e5e76

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
