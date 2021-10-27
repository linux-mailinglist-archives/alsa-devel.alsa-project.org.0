Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE243CFC1
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8411516A5;
	Wed, 27 Oct 2021 19:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8411516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355940;
	bh=5dv0HGz4bWpWJPI+ZLbq2SON0N8XFp8vjVzsWv6u1gI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sPh7fTZWs6Yt4ZzDoabtZy+bnZig9AOShE6dI4W0obKSIFyqwIuMsSBqDkiQDJ/14
	 NOcLDtGp5PcgHPb5fCNJsctEWf8vMiSR5KZ3wDrEAqfhnh4HSIJTO4VMhZ2fgq7Uvq
	 1gfm5z8vw7K9CAZMkm4/GtFDIFTYJRei9B9LNasI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33CCFF804ED;
	Wed, 27 Oct 2021 19:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC8DF804E5; Wed, 27 Oct 2021 19:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76032F8032B
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76032F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UFX8KAyi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 536A1610A0;
 Wed, 27 Oct 2021 17:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355754;
 bh=5dv0HGz4bWpWJPI+ZLbq2SON0N8XFp8vjVzsWv6u1gI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UFX8KAyigPYakyshO2cMNU6BMxeiz+hrBvd2joCBB42KXMt0ODkOJ5+cQTrYxEYMd
 pCGX0Pd2XFlFkaetWP611YM5kX7Yh7qdpehaNOPXAhjTK9uZG2IsOjLUgz0IAUFgV2
 ArXrvB1F1h9KMZTCzw8fZ1hWCp+iWsDiIC4LOfQtirvuwg5ix5SQEqJp0RhZCczeEU
 URjewVIhoEJv/KCD1fUkzEBYe6GAIL48g0jP3oRJ4AOFuZ7HSrkoSHlTfGWyJ56EwN
 wIjgqdSSTlpDDePF+MtDutLmsOI5x9qQNFvPkN9fYccuw3DS72DesuqHlc7zWikKxE
 OxAsURSDXfRjg==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20211027065228.833825-1-yangyingliang@huawei.com>
References: <20211027065228.833825-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: amd: acp: Fix return value check in
 acp_machine_select()
Message-Id: <163535575308.4012075.1966286577719870369.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, tiwai@suse.com
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

On Wed, 27 Oct 2021 14:52:28 +0800, Yang Yingliang wrote:
> In case of error, platform_device_register_data() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix return value check in acp_machine_select()
      commit: fdde18b9773636cc5866ccd8f2093e1cf0022dea

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
