Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8246558D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC0C2684;
	Wed,  1 Dec 2021 19:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC0C2684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383687;
	bh=dsGSvVwsFDlsp1QgsF8UIKkiq2nz3XnghIlxao0zEmI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=llg6yftH/0280mmOzXCwwTB56nTuKtu+tG7hd0eCAz6W8SYP5mETVuzZ8Qj5RJ9T5
	 /hlhJNZGbCtmCZXB8CwebKZNqjt+JPgtd2iAYzoXF9fhMIbcW95NoUQnH1Trg+AY/4
	 q5BRGyVVnnfgziNVPIA9diNFzRVDMsgQTDxws06Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D58F7F804FE;
	Wed,  1 Dec 2021 19:32:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44CB7F804FE; Wed,  1 Dec 2021 19:32:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91701F8028D
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91701F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lr9RZlOW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 737E5B820FF;
 Wed,  1 Dec 2021 18:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEE9C53FCD;
 Wed,  1 Dec 2021 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383523;
 bh=dsGSvVwsFDlsp1QgsF8UIKkiq2nz3XnghIlxao0zEmI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lr9RZlOWtzaOZ9pJ+CYQabzYms2JfTPwdZmqzs9GxOMmGj1Tto1bDdtPrBpP5IZLV
 prRPAJxqExT6wM9/mQ4U2wMv9TMFKMG2HXCqHQe4G1Bj726wXg0ea6CeaIvTKiUmUO
 Hqyy2Rh94N3O8leUPVWkmQ489qYWl8FicfqC91NsFGj49oZrM/kqlLWgc/PlHpIbIH
 +x6rs2E8es+sO3lk21RReT8dLa8vwZjbGlV6ER/nhT+c99WuifXxYSviZadWj+1w0/
 7Fj5zobMTF0f4QOYhhDfU0VAIj0nhf/IzirV43gltTqny86gPVcGwLmbKD0U/hSK0w
 ksuPhbmLOgyuQ==
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20211130125633.GA24941@kili>
References: <20211130125633.GA24941@kili>
Subject: Re: [PATCH] ASoC: amd: fix uninitialized variable in snd_acp6x_probe()
Message-Id: <163838352162.2179725.6088119262152318727.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On Tue, 30 Nov 2021 15:56:33 +0300, Dan Carpenter wrote:
> The "index" is potentially used without being initialized on the error
> path.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: amd: fix uninitialized variable in snd_acp6x_probe()
      commit: d5c137f41352e8dd864522c417b45d8d1aebca68

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
