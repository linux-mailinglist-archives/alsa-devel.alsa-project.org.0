Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948672077BF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 17:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AEEE185A;
	Wed, 24 Jun 2020 17:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AEEE185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593013275;
	bh=N7+mbm5wzRi6pfxsURMJkIJPZB9F4sOXJxYRIdcUyT0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CrhClcwfiU3ASdK01AOh2eh9XC6uwZj9q2vRT9LAHBay8eo69CxpK30HgHf8Ictra
	 oPgTEp8dciDmvzllZ5lsQ/2ozjjwpxA9BZ1OIgKZj4pK0ilKNXJnoxnvXL+QvU0q8A
	 L5BsYsesrDv7ZcfhR9ShL8JgwtcM68F2ZQqJGP3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 042C1F802A8;
	Wed, 24 Jun 2020 17:38:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACC8CF802A7; Wed, 24 Jun 2020 17:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7299DF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 17:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7299DF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iEz3weDC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7365620706;
 Wed, 24 Jun 2020 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593013123;
 bh=N7+mbm5wzRi6pfxsURMJkIJPZB9F4sOXJxYRIdcUyT0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=iEz3weDCjhslik0qqWgIeXdM1oLWbMeLdqMB570vYQf+IzbIR1Vhllil5peWth6xG
 lceseXtma0mFVrxy3nYvl7Zd3Wy52QMQtm8a1lWxFF9XlETxBcmWLNLtsX5NHI16Vx
 sUhaNmXOhMv5+ZMuZelmTKgRetz2rp/UL8RCtR0E=
Date: Wed, 24 Jun 2020 16:38:40 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "shumingf@realtek.com" <shumingf@realtek.com>
In-Reply-To: <20200623125312.27896-1-shumingf@realtek.com>
References: <20200623125312.27896-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: fix the pop noise while OMTP type headset
 plugin
Message-Id: <159301311578.33465.1942988642931932348.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 flove@realtek.com
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

On Tue, 23 Jun 2020 20:53:12 +0800, shumingf@realtek.com wrote:
> To turn the headphone output switch off during jack type detection, it
> could avoid the pop noise when jack type switches to OMTP type.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: fix the pop noise while OMTP type headset plugin
      commit: 9bc5fd71b680ca017d59510b4f402577758b8496

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
