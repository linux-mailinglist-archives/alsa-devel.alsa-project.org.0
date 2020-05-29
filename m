Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D071E8424
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 18:56:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8AAB17A1;
	Fri, 29 May 2020 18:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8AAB17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590771418;
	bh=jKG+5WL5Zz7Oc177GyWEevQ9Pkd1eVJDyNJVuDzt2SU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9WpnTEIO8W9loAxUwY13777sEtLVaEp+eSUwKFKLrmXiqfd+nJ8sOpEz7r/7cfh1
	 p6vsmC5oVsU61qr0WrkK5PHaYrIWZWeT3D+2t9Zyo6zREoehk5IfpVCxX+07sQq9ze
	 vKEhs6z1U/PU+1kEenWRzof/dfvKeliWjpYeDUKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DF2F802E7;
	Fri, 29 May 2020 18:51:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83BD1F802E3; Fri, 29 May 2020 18:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E9B4F802DF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 18:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E9B4F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pKHsDS2Q"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 945C32077D;
 Fri, 29 May 2020 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771105;
 bh=jKG+5WL5Zz7Oc177GyWEevQ9Pkd1eVJDyNJVuDzt2SU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pKHsDS2Q5gl+vblIPVNdkkz0MICmKAsHj2pAZ3S66PNQW1dcJSQluuI+YJgH7Wep2
 Jv4Nlr/hvBR/m7Nr/92YCoC1vK/SmBBrBncdtl/nel1Pv5PfX+rTJY+iNN9FMGWFi8
 Nf1xcBf2S0YcBD4M/WF5CJt55czRi1glkmEeZMDk=
Date: Fri, 29 May 2020 17:51:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
In-Reply-To: <20200529012230.5863-1-dinghao.liu@zju.edu.cn>
References: <20200529012230.5863-1-dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] ASoC: img-i2s-out: Fix runtime PM imbalance on error
Message-Id: <159077105220.28617.10412316877041225353.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

On Fri, 29 May 2020 09:22:28 +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img-i2s-out: Fix runtime PM imbalance on error
      commit: 65bd91dd6957390c42a0491b9622cf31a2cdb140

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
