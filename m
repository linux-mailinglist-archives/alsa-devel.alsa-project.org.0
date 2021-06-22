Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CD63B087F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 17:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB131674;
	Tue, 22 Jun 2021 17:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB131674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624374992;
	bh=tq5W3HglBF9jy+mJvlAU7lrMCvmo4pvk0yjiPuf4/xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4KLtHJzXK4lBh1UFM9hK6GRUx4RbDBEgXLB5FlY3xy7MweyNX9I54RVB6XTxgaw2
	 veNPHWaClfNOOPkQRbJexLrbUsrNKOTNEGIIntgIUGV5hWv6AD01ycOiJoMw3EfTQg
	 wwD4jhjUR1g3YbYt/HVi+CQgjTamQyPiE3WiVXg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CF2DF804C2;
	Tue, 22 Jun 2021 17:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87BA0F80268; Tue, 22 Jun 2021 17:14:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 039B9F800E1
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 17:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 039B9F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XL3S/7xb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 864BE600D3;
 Tue, 22 Jun 2021 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624374879;
 bh=tq5W3HglBF9jy+mJvlAU7lrMCvmo4pvk0yjiPuf4/xk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XL3S/7xbkKgf1TrgRLc11BaBRHJ1nsarxcrvBseoyoZN6FtUM90Eh4mD2gCbdS+th
 SfLvRws8xd8LydAe0yOkyrcNYseRW460yO5xSpUfFu2Jz01guOeNeO1UD61L8aayBi
 n1OQY97sXsY/1Zc7hHDcTAS6m/IS7QjaElauE/L/JuCo/a+H3pWMa45yc2XYAu2P+v
 ztDpx+p4aktwtT/LARiSyQTIlVs40j/+lORZzl9ZAHXtJ1QO2Yml4nxAuD1xRwIZPB
 SoZN5nouq5Su4diURilLDobNThZCwARFE7hz11rgqBssLqmLi3QFrBdjno1Iu6HJ3o
 16CBVm8czFFog==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, Jaroslav Kysela <perex@perex.cz>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jon Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Date: Tue, 22 Jun 2021 16:14:04 +0100
Message-Id: <162437355278.1773.13469789646711861169.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YNGe3akAntQi8qJD@qwark.sigxcpu.org>
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Tue, 22 Jun 2021 10:27:09 +0200, Guido Günther wrote:
> alsa-ucm groups by driver name so fill that in as well. Otherwise the
> presented information is redundant and doesn't reflect the used
> driver. We can't just use 'asoc-simple-card' since the driver name is
> restricted to 15 characters.
> 
> Before:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card: Fill in driver name
      commit: 907f0a3051869a61499905377212500155bd28ec

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
