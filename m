Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4552EAA4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973F3177C;
	Fri, 20 May 2022 13:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973F3177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653045658;
	bh=QI/Wp5OFrg8DZFaDAnxSX717/fIkU2TW5bPmuaN/enI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j6pMgpmJhkmosmxaSIuKgpjdV5WIkR5qCceU/+/4SJLwLL5+1YR3/dhJSBoY2eJrk
	 OaesBxbyhzWizJcKCbhbAnWsQMZjCUCWza59hHh5QV5nwjtlLPZdx8j8JQSlQhTODD
	 Py0Qe4pVj+qh59LaXdmeZ8KnF3I1PaSKRbFw6ZAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B74F80525;
	Fri, 20 May 2022 13:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21641F8051F; Fri, 20 May 2022 13:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E046AF8051D
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 13:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E046AF8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jYol+oKj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A899361D18;
 Fri, 20 May 2022 11:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99908C385A9;
 Fri, 20 May 2022 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045525;
 bh=QI/Wp5OFrg8DZFaDAnxSX717/fIkU2TW5bPmuaN/enI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jYol+oKj0wYTzAeeKSLIkHdNvkNLvTGs/dmcsrT3DNkBcuFpI1S6i28rjXPkhn+nn
 WFsUZRTU/lFzOZIHV7Pbc/Ik2cRvauW0ihACXOX56JR7DlV6VMYHX9fiYDpAuxun3q
 Zv1onFxKi83gn+NdTP/+Djltn3O78M6jh/27rSB8vYrCT+sezTh7HPb6ciamW09rTW
 /IAPUdNgGObNbI1aY//Cr758RF5GpDDONKYAWzWONM80ngpydHk5KvsNJQ4iW6Nur0
 d8M0RFzDX+Sh86lF0RpSeqyaLRXHwEIfBP3JEMGiKRweoV34z302Z021poDR8pa4Ny
 kIV3EXrKpnkbg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, yangyingliang@huawei.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20220514091053.686416-1-yangyingliang@huawei.com>
References: <20220514091053.686416-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: wm2000: fix missing clk_disable_unprepare()
 on error in wm2000_anc_transition()
Message-Id: <165304552434.45439.17487958177424111002.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com
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

On Sat, 14 May 2022 17:10:53 +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from wm2000_anc_transition() in the error handling case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm2000: fix missing clk_disable_unprepare() on error in wm2000_anc_transition()
      commit: be2af740e2a9c7134f2d8ab4f104006e110b13de

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
