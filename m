Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA558AB84
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 15:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDBF4850;
	Fri,  5 Aug 2022 15:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDBF4850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659705702;
	bh=HMXwjOMiGKcjIRj9VaWB5oAAcM0om1YS65OgfQXe8FA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=es7iU5stx2BS/wQ9NzCZn47BtG8cBW80aJSQmKM3dhCs9bTsquu7s7KVr2JnzpEeW
	 tbHZez1bez1Xfb1p2LZFijiAH7pHpcSB2HdvbA6125D+KLw5Rq3dJBkarnrvQ0izWw
	 Epfhx4xEwY2MuIks8QhgSGTUPP/qs6IMZI5EqYbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4715BF80121;
	Fri,  5 Aug 2022 15:20:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE6F6F8025A; Fri,  5 Aug 2022 15:20:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71B15F80121
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 15:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B15F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FBPvaw0z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64BDC608CC;
 Fri,  5 Aug 2022 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACECC433D7;
 Fri,  5 Aug 2022 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659705637;
 bh=HMXwjOMiGKcjIRj9VaWB5oAAcM0om1YS65OgfQXe8FA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FBPvaw0zo+NvxYYcQWUuTo2sO+ylgxLMv8R38LZFJzQuh08Hp0J8QJzxTyn+vzCDP
 fMqP+nPaVn8sYKJw/yTc0DGG2lFmXILWKaMFoMK00P9AQpFdwHcZr93uYBMM/NWODd
 9FzTdNiGeNl8reVPmSCI5PlA+MAEPXXRFMgfGD57VjEYkRB6CuLpmWmfHZiP6/84dk
 gPiiG+xFVOAUic3rZodlucEq94RGeG4fNZwBdzTIdto8QcVhusK/XMTsxOZGt5Oe8O
 /wATtcMT0n1VEa8/wi+dB71POyLvx3XUO81aoINlAfUSlUq76Q+01k8glGSvk/q7YH
 EmX+FeSnMM2Ug==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20220728092612.38858-1-biju.das.jz@bp.renesas.com>
References: <20220728092612.38858-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: sh: rz-ssi: Improve error handling in
 rz_ssi_probe() error path
Message-Id: <165970563480.1032419.491538826538981135.b4-ty@kernel.org>
Date: Fri, 05 Aug 2022 14:20:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, alsa-devel@alsa-project.org,
 Pavel Machek <pavel@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das@bp.renesas.com>, Heiner Kallweit <hkallweit1@gmail.com>
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

On Thu, 28 Jul 2022 10:26:12 +0100, Biju Das wrote:
> We usually do cleanup in reverse order of init. Currently in case of
> error rz_ssi_release_dma_channels() done in the reverse order. This
> patch improves error handling in rz_ssi_probe() error path.
> 
> While at it, use "goto cleanup" style to reduce code duplication.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path
      commit: c75ed9f54ce8d349fee557f2b471a4d637ed2a6b

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
