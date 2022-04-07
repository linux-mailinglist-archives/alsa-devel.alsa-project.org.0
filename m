Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5184F7BE3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 11:40:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B1911849;
	Thu,  7 Apr 2022 11:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B1911849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649324425;
	bh=uIwgR3pVWQ2tLhHj07s4Etx3NDjbjW6eqYEftcbaJ9w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiQreP+pfuu+o+dR2zxUj6N63tjV0uu05m5l96Z+iHF3bAEZHZY93wzChyKM8w8EJ
	 lGoQwspPT1cWsaOjGqlzmgplvqSIgjIFoxWhgcpVtvyuPFwr8tUqFfaFaayKL+kmSY
	 uja7lySprFEj3dTnIGSlYMMzurNkWuvXyAVnl9rY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8365F8052D;
	Thu,  7 Apr 2022 11:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE96DF80520; Thu,  7 Apr 2022 11:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02895F80519;
 Thu,  7 Apr 2022 11:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02895F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ewszGuCn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86FEF61B77;
 Thu,  7 Apr 2022 09:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DF9C385A9;
 Thu,  7 Apr 2022 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649324301;
 bh=uIwgR3pVWQ2tLhHj07s4Etx3NDjbjW6eqYEftcbaJ9w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ewszGuCnjWBBxeWe2aGzoWNNNNMjuHKnmxSX+XWKgZNRjVicp+Ep0zw9knfu4lVdC
 flciZcPQ8r1QqzTVPlfDRekWIPuEd2P1cR6ldDpo4Ve3dLeXr2ITVmLt/gMGrexJMf
 Ssa4x1iRBOPlHg21pxLfbxk5xxyN8+CFAYz5TI5wek43ZpehMNNWfyO68rhXWj0bXi
 7KjYlpMqFhyMFMBMLloAOTVgG+EWWZ8DTFij3snbVsi12vbwMDblHlsmLf1aJhUvXb
 Al+EWZ3ASFhSoy6VhYA44n9D66mrSacxhgOc3WFp8B1ulSwVWVbn97H5hbMpgLp0dT
 ovGl2UlfDlaFA==
From: Mark Brown <broonie@kernel.org>
To: daniel.baluta@nxp.com, Jaroslav Kysela <perex@perex.cz>,
 lgirdwood@gmail.com, christophe.jaillet@wanadoo.fr,
 Takashi Iwai <tiwai@suse.com>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
In-Reply-To: <3bbf03cfd1966bc6fb6dd0939e039fc161078a61.1647757329.git.christophe.jaillet@wanadoo.fr>
References: <3bbf03cfd1966bc6fb6dd0939e039fc161078a61.1647757329.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: SOF: topology: Avoid open coded arithmetic in
 memory allocation
Message-Id: <164932429871.3844153.12183120087286124160.b4-ty@kernel.org>
Date: Thu, 07 Apr 2022 10:38:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

On Sun, 20 Mar 2022 07:22:26 +0100, Christophe JAILLET wrote:
> Use kcalloc() instead of kzalloc()+open coded multiplication.
> This is safer and saves a few lines of code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Avoid open coded arithmetic in memory allocation
      commit: 0a480df0b87a75b315cc6eef62bfb597111ee630

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
