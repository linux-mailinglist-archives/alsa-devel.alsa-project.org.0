Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A815BFAD2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70AB15C3;
	Wed, 21 Sep 2022 11:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70AB15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752349;
	bh=saf5MjyZS/Ao0yFYu51Y1H/XCy/26iny1D/d5NZk9L8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZBOhP/BDU8Np3lVsmtNnvGvImTyVKEGvPaXH3yhvSS3fulLv9+uLloLNNa/cbU2Hg
	 sjRYqdUNuVHhl7OaIPW9wZbfjyz5JKnNOtxwVIftSZ2S3aT3Er5ffaikTaJAQjB1TL
	 dE/dxDda+RxTciW5+hSzDaFbUYaLKoUZpNcH0z/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41BEEF8053B;
	Wed, 21 Sep 2022 11:24:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B94BF8053B; Wed, 21 Sep 2022 11:24:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0FF8F80539
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0FF8F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XRwVQHu9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA55A6303F;
 Wed, 21 Sep 2022 09:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD750C433C1;
 Wed, 21 Sep 2022 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752273;
 bh=saf5MjyZS/Ao0yFYu51Y1H/XCy/26iny1D/d5NZk9L8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XRwVQHu9QfuxxYKt12h7RahLFRZMbqb4pTulq/pvntoq3u9qYtBSHwUtJfs4//ZPa
 J6/xRvABGCWPretGsGzfaWgzGdwzTs26QWNVo9MKa4AF5meWfoIy/v69iTy7tVXGx7
 tCW2QWSq/7autUIrDLcq3yBcSCq4eY0tzcqDBHcD2ZG3Yo+7hAL5koBU/DjDbGZAt2
 E5y+JlcctPfunoD8wBZaLvk6wA58UbKRUpvBC3/N+EExLkP9GiaFlXzUKvd3WT2vkG
 fGhscRUP7UVJDTXMRhjw/tfwZS/b/wK2vhda7Wu6Sckomd/j2Gd147eodO3+FHWal3
 FhU3e2McguOLA==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220920151413.3455255-1-yangyingliang@huawei.com>
References: <20220920151413.3455255-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: rt5682s: simplify the return of
 rt5682s_probe()
Message-Id: <166375225784.526450.17898794623132964146.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 10:24:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com
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

On Tue, 20 Sep 2022 23:14:13 +0800, Yang Yingliang wrote:
> After commit bfc5e8b860ad ("ASoC: rt5682s: Reduce coupling of
> Micbias and Vref2 settings"), the return of rt5682s_probe()
> can be simplified. No functional changed.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: simplify the return of rt5682s_probe()
      commit: 2edd66eccfeab9734512fac352b50d17366246f5

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
