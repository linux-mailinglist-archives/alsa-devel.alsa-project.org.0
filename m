Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E373D7A29
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 17:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25EA41F0D;
	Tue, 27 Jul 2021 17:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25EA41F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627400949;
	bh=C91IOFLpn/xlTe/YVqK/AkLDbvPKJZILi/jlymQD7Mw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOhy+etVqTzTsPMj6mMoRdej3gCJLaQnOUOqMCJzrMtPM/JoF36JUyOcbV0AKpVat
	 ErWsMHJ9Dkb8CqnbtrA+EIdVKXi1XaTQ4hz4aa6b5k1ze26A7HQGn4WN9h3OGAc9Tg
	 4nqwCoK8LX/JpLeLF40S0DJuxKNjeuTy9Xdppdk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CACCF804E5;
	Tue, 27 Jul 2021 17:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3999F804E5; Tue, 27 Jul 2021 17:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06294F804E2
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 17:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06294F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pZ66KAPY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1242761B66;
 Tue, 27 Jul 2021 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627400824;
 bh=C91IOFLpn/xlTe/YVqK/AkLDbvPKJZILi/jlymQD7Mw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pZ66KAPYPX8myWetK+eJPLri9mdjl2h4JEvsee0o/ZItxGSCv7hxi3BnYY5yp3PcH
 4xQtaubLk9ii3LtvHgD1G7OkSPUMkXQ4O0TTdUnFADFRIIatGtkYr6C/LAVZDb5/6n
 WBYRcd31vG8OhKBvBeCBXOkfhLfEBivie+ubJ/LmE00nyusreAktEH3Z/3Y79W+oIj
 dmdMRsRntLWF8fbrLQu0QhyBe7XJikNiUeSma2MOIR+tSepeifCXiIEy9DWOjX0CsW
 XPNcaywtzmNDnEPqfn0j2fwgDcAjoMxlSiwlKfTvE0/4Biamt38hKsE2/wWAKLztvk
 riAhgcdKvBNdw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: fix an IS_ERR() vs NULL bug in probe
Date: Tue, 27 Jul 2021 16:46:26 +0100
Message-Id: <162739969149.18968.15163991241105613933.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727081756.GA19121@kili>
References: <20210727081756.GA19121@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

On Tue, 27 Jul 2021 11:17:56 +0300, Dan Carpenter wrote:
> The devm_ioremap() function returns NULL on error, it doesn't return
> error pointers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fix an IS_ERR() vs NULL bug in probe
      commit: 37108ef45ae9021d23174ce89e76ad41443090bf

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
