Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACA46A3C2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:03:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A9F7233D;
	Mon,  6 Dec 2021 19:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A9F7233D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813821;
	bh=gpgEzgtitb8ZbtTgNSGacdRk0bS0lGGyk4+yjPMNTXs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oq1RKDIPE7ZO8gPwB7xpES3mUG4lkZjOMQke1cGJFBx76H9dddSrMK5fBuQlonnUZ
	 bcSzR2w0zNMJxvdVNbhPzYknkTiI021flwzmENuIxIbdkWqiLKkzrlLhonb7QGebJG
	 iVBVB/7Ixq8ZHwq82Nv9EiC1NPNYe/XMMIGohBk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C650F80524;
	Mon,  6 Dec 2021 19:00:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6FCAF80507; Mon,  6 Dec 2021 19:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17F12F804F3
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17F12F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D5WtIidF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B15AB811A3;
 Mon,  6 Dec 2021 18:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AF3C341C5;
 Mon,  6 Dec 2021 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813642;
 bh=gpgEzgtitb8ZbtTgNSGacdRk0bS0lGGyk4+yjPMNTXs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=D5WtIidFy4blBoZa2JP7SnPul5vQI0db0zKSrraKthjPknYr9a40tzQ/Jn7OR3P63
 EEgKbfiHfeI7v60S4BBxhFp9I1YhF3eJtEA8BRBrLf1TCWEA86XgVakMamN58FSbBV
 po0WZfAPwhUBO8QdGjNJM5ii0pzhh4Dj6dHqQs8LmlkgeHajkAsoj7uV62psbXU44Q
 CNOURxpCBSXHSZj2H9cin/tzWvaKsFnJGGZ/quFCebmlvXuR8c8Ipb8K3Gx9hj36OF
 XInsTmBacISGo7fHHgTFNgqrQ72w8KgjAyp4l40+PS0buAeCUa1L4Llgh/EGOXjARE
 Pzizs53OBVtEA==
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20211204110848.21322-1-rikard.falkeborn@gmail.com>
References: <20211204110848.21322-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp6x-pdm-dma: Constify static snd_soc_dai_ops
Message-Id: <163881363969.2769299.3291648369913552767.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Sat, 4 Dec 2021 12:08:48 +0100, Rikard Falkeborn wrote:
> The only usage of acp6x_pdm_dai_ops is to assign its address to the ops
> field in the snd_soc_dai_driver struct, which is a pointer to const
> snd_soc_dai_ops. Make it const to allow the compiler to put it in
> read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp6x-pdm-dma: Constify static snd_soc_dai_ops
      commit: 7bef00106bc68beddcddcd06e3b02dde5525face

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
