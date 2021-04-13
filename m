Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6509535E25C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 17:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64461679;
	Tue, 13 Apr 2021 17:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64461679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618326707;
	bh=At7aWxWurGsIOSo+8oSLGvP7YMSoNoS+cSZVclvAi+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=By1fKQXt+i7AIDO7IHsKfY+wF/6u89zMFyeCjlAsaktxZtjXq/9EVfeb4Q5bPEg5a
	 QPEICIiyLb89ZhgkKiysOTKnHPuF36KpllJYU8+JZ0njM0XmKaKDMGo26ZaJB0xQbx
	 w7ifTDQ2AxHRB3vER8jF9PVmr1bA1OQO1mVDz7C4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 401F9F80260;
	Tue, 13 Apr 2021 17:10:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF374F8023A; Tue, 13 Apr 2021 17:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C598F8022B
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 17:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C598F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sHezMDzy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 230DF613B7;
 Tue, 13 Apr 2021 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618326563;
 bh=At7aWxWurGsIOSo+8oSLGvP7YMSoNoS+cSZVclvAi+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sHezMDzyBYh2KZVH8LKon8RUa8rnvLNN7JlnLyo7aQIIzQvpQb17LcukbteGDujM5
 jGuY836+pQOG/68bPAQ2nyI+7YHRvNKmoCJ4L6ylgb4pOQQ+1oXocCe+d3C2FzpFIq
 ZyuiUvjk4xTVSoc3q6vLkf9UhQ9hnthnAARlpy91FZ5LDaOA5TBIs0ON9PUnV7igRv
 lW57rhE2wvIke5sDRLE9VNuKiJ8XfwG0Pu75VyRM1qL2HGTTvlSOET5iTYzAdl3sb9
 cstftTkhl7b1Bu3SKeGRYw0wDBMSZkqI0PB0TOag0dX2m9T7XD4jqCSDG76tPk9OjD
 1bdVW3LPpUmRQ==
From: Mark Brown <broonie@kernel.org>
To: Chen Lifu <chenlifu@huawei.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH -next] ASoC: sti: sti_uniperif: add missing
 MODULE_DEVICE_TABLE
Date: Tue, 13 Apr 2021 16:08:54 +0100
Message-Id: <161832446010.49152.17428685818110323930.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409015953.259688-1-chenlifu@huawei.com>
References: <20210409015953.259688-1-chenlifu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 9 Apr 2021 09:59:53 +0800, Chen Lifu wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sti: sti_uniperif: add missing MODULE_DEVICE_TABLE
      commit: 462c47c2fcc26d838c82646a31d6e3e8fc01ce68

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
