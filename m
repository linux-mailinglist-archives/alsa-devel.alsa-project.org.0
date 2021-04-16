Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27493624F8
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60B7216BD;
	Fri, 16 Apr 2021 18:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60B7216BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618589059;
	bh=GgzZ0S+TgsvHcoC+LS+Zot6MiDm3+O3n6aq2TyBHn60=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UP7Ul9wbIF/vWFkivGprLblKVSMp0kPjmUGOYgMjnzTDFzqdpk0+YVVF1XzTTR5va
	 RtPZRQtybq1Drm6xCGAfBjHU1iEj1llBwaNWVsesRgn4ODn/3nljofNMvDIVVhHZYy
	 oSv4PDFbxsQaV28Vc3BzRFS54wAlSJ0nZMvGVe8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10EDAF80290;
	Fri, 16 Apr 2021 18:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC067F80128; Fri, 16 Apr 2021 18:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E31E1F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E31E1F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d9PZNU2L"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E14BF613B0;
 Fri, 16 Apr 2021 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618588951;
 bh=GgzZ0S+TgsvHcoC+LS+Zot6MiDm3+O3n6aq2TyBHn60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d9PZNU2LNTwlRHAPEkF0S6monO2uDS2mcc4it4hoHaGu/Y7/eonEDt5FaE96zznmH
 GQePLHkm0HLyr988BjTpM60SM5Hv4yOfhXEa1+CvH9iqvZLsvaDcT+rxmemVSQYZ/X
 8kDWY3oGojvgiKqiFDFEXH52tqLszM/9FZ47EnR1aW92eD+ASL6Vp3BHsj6wXSEBTv
 25SoaKJ2Bm14ZXnkcxwOBT/j5YLyC/fTT4Q/IFHP1Qt5GwrloWJwAnPYnKHNjPMt5F
 /DF/cfpxetQVk9TwvQLW9ZaCe20XeZ+l6GmzAEFr4yudiZBNYK7y6xOa3Uh74niDEm
 dl1iwCcXj6isQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: Propagate errors on too many
 links
Date: Fri, 16 Apr 2021 17:01:48 +0100
Message-Id: <161858869853.28833.11333855316963570344.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416071147.2149109-1-thierry.reding@gmail.com>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
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

On Fri, 16 Apr 2021 09:11:46 +0200, Thierry Reding wrote:
> The DAI counting code doesn't propagate errors when the number of
> maximum links is exceeded, which causes subsequent initialization code
> to continue to run and that eventually leads to memory corruption with
> the code trying to access memory that is out of bounds.
> 
> Fix this by propgating errors when the maximum number of links is
> reached, which ensures that the driver fails to load and prevents the
> memory corruption.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: simple-card-utils: Propagate errors on too many links
      commit: 0f687d826736a5b4eee03170382fe54d413b912a
[2/2] ASoC: simple-card-utils: Increase maximum number of links to 128
      commit: 343e55e71877415a23372388b3e0c59a9bba42f6

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
