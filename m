Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE4425F5B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DBAD1607;
	Thu,  7 Oct 2021 23:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DBAD1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642933;
	bh=oWE2f8ls0ajej5nrdJ4zjanC04qhrFStHJlubcM5wZw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+vhX4T7hSLlI7/0geuzLNGRMk0D/HVu7zk0ZBF/ZZDVNTIaleowV1UTfNaGP3QLe
	 GFiKzaIeXgrWZSwXaHAh8jF9uBrSJx+ofakMw09cRKeV4zyCMcfc9yO+LAmavQdOpl
	 hdwft0BTIAnRXAgnWFCFILjYJt7tE61ix03R6BYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 147E7F80526;
	Thu,  7 Oct 2021 23:38:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FD49F80526; Thu,  7 Oct 2021 23:38:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50334F804FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50334F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bYnbdrbE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35D3B6121F;
 Thu,  7 Oct 2021 21:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642685;
 bh=oWE2f8ls0ajej5nrdJ4zjanC04qhrFStHJlubcM5wZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bYnbdrbEFdTLTM9Z0Dey5TFDp8DWXM0i/2IBx4IEw8rse3bcMKsgQfmeyy4mmaJPv
 vVKpyQk6MSzWxytZ0eTmB+bWmjbQtNEuz73807HQAUr0qa0E980GndtzLb1fIZHzs+
 A5z/BpdPdo1Lr0O60bCdiTGCudTroRp8FlZJYEKK3DC1WvCYqW2iaFQFuBgp7lxypw
 UPJeA+PwsC1xjUR1AXTvLai/bzSDv4M7wuoQMFa6tFQ4SRxYioy1oUT08WUD9xx88K
 3RpVEbqyGFa4DixTVu3PUPna8/o4yG/yEDWludQI88lwlYfwxffEYdaVUi37BMCHNX
 Jc4EXJZPRiaEg==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt5682s: Fix hp pop produced immediately after
 resuming
Date: Thu,  7 Oct 2021 22:37:32 +0100
Message-Id: <163364264608.649699.17296255198206672474.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007085519.12543-1-derek.fang@realtek.com>
References: <20211007085519.12543-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Mark Brown <broonie@kernel.org>,
 kevin_chen_ym@realtek.com, shumingf@realtek.com, flove@realtek.com
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

On Thu, 7 Oct 2021 16:55:19 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> When the system plays a sound immediately after resuming from S3,
> it could hear a little pop from headphones.
> It is due to the HP was unmuted before the completion of
> jack re-detection finished in parallel.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Fix hp pop produced immediately after resuming
      commit: 06096537b778c5cfe7618908fe9e55e817083d92

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
