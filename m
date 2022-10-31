Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F363613DF4
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85794167F;
	Mon, 31 Oct 2022 20:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85794167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667242895;
	bh=EUan7w4Lh3vkM5N6lp0/PKwFmfPibbJ8z8DWzSwPcdk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMRica6xeB/Q0QsOt2H8k3rkobndf+CAY5JjrRg+EC+Ub3Be9tJPBneiX1xZmlvpV
	 4EUlL1/p2mC3nA+5oOax+Narfi61StR4tuPk0lLYZ1cvNiSur3mZNqZpTzE0hYFPBZ
	 S5+YHwhki6tWr5rkrFa6QaOCAssm8yLkqs6R45dY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A93F8021D;
	Mon, 31 Oct 2022 19:59:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D426BF802E8; Mon, 31 Oct 2022 19:59:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88704F80256
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 19:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88704F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="byZuPJ+f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4EE6B81A4C;
 Mon, 31 Oct 2022 18:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D831C433D6;
 Mon, 31 Oct 2022 18:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667242789;
 bh=EUan7w4Lh3vkM5N6lp0/PKwFmfPibbJ8z8DWzSwPcdk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=byZuPJ+fTf1MB85zdbYO64I2eNR/g5Le0sH0k13Owhx/xk26iSZE0Ud9rDMd4+EQk
 52KfXSwq80fBcmHNXnp7GFYZ2Gltt1hrVjS2HHVWJhgbJNd+G/m2QxQaR+tAYZGRaT
 UMT0XsuEFA7BSyA1U37LAfgrRJIqYr8IjaFDhXF+YUDlxefm8mOfj0S9lc4GWzBUOv
 z8D5kXUytwX4l15oH/SASizRtZima6yhig2XBPHu7nQMM7AEgmpqqjRoqfYAQrU6so
 bVV0eD7Y2MMmk+4xDqZPppqi4XrjovtSyr5tTe04DlGzvDv3L8KTo1X94HL65lc/dd
 BPZ3xzJ5HiIgA==
From: Mark Brown <broonie@kernel.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20221031134031.256511-1-chenzhongjin@huawei.com>
References: <20221031134031.256511-1-chenzhongjin@huawei.com>
Subject: Re: [PATCH] ASoC: soc-utils: Remove __exit for snd_soc_util_exit()
Message-Id: <166724278811.784642.2068517227197226449.b4-ty@kernel.org>
Date: Mon, 31 Oct 2022 18:59:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Mon, 31 Oct 2022 21:40:31 +0800, Chen Zhongjin wrote:
> snd_soc_util_exit() is called in __init snd_soc_init() for cleanup.
> Remove the __exit annotation for it to fix the build warning:
> 
> WARNING: modpost: sound/soc/snd-soc-core.o: section mismatch in reference: init_module (section: .init.text) -> snd_soc_util_exit (section: .exit.text)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-utils: Remove __exit for snd_soc_util_exit()
      commit: 06ba770a799fab51e42c34fd62b742d60084d8b1

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
