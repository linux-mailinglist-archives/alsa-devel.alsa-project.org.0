Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5FB59E753
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2BEE1685;
	Tue, 23 Aug 2022 18:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2BEE1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661272384;
	bh=0OW8QTWj8leOwIvSI2jUOoZZICwcZkui2kQIaQN1eUw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnP+jUQ5aYgSD21dodeuXojasdkyyJ9IMpMmLBl8qii0RXpjZbvojp/VKjKLUlEeZ
	 6NcFU+oi81EM+gxbjQkRJTgPk2O48JFomLTCjizU86dYpuFiGFnGwVDmQKhZ/jWi6E
	 8q3kMPEO8+O/M4CxckHRXkfi6Py+vqB+HOWLgv2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 298CBF8027B;
	Tue, 23 Aug 2022 18:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A550EF8020D; Tue, 23 Aug 2022 18:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEC39F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC39F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r/Q9NnLh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9E46616C0;
 Tue, 23 Aug 2022 16:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4849C433C1;
 Tue, 23 Aug 2022 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661272318;
 bh=0OW8QTWj8leOwIvSI2jUOoZZICwcZkui2kQIaQN1eUw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r/Q9NnLhKgHnZDH15hdmsXxlREi3PAhN4fMAUd7WvnrzkcYkX0zZ4uMJ1N7QPvUoK
 BP6jdW/tqF0Eoe42IWCReMYN9fkT0arN4kvio/mi41D3Zwaca4m9aqnBDwGZP5tNkB
 Or3PaFCUSQ33r252+rbjKuaJwA1a90YazOnbR9277a3SjC4Mxob2FMllIS9LQZAa2r
 661EHm9mg0PsD4A/GGbcpY/US7uxtrtHwQLyxHJ7MI9yWP5I4ySqs9uhFj2OYGwLsm
 419O1yEeYEZph+Dgzjuer6YrdFb5YppGRwGziZJ0KFIqeEdMxS2OqAI79WPWz21X0C
 ALxVEPWnym87Q==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz,
 nicoleotsuka@gmail.com, tiwai@suse.com, 
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com
In-Reply-To: <1661247308-2650-1-git-send-email-shengjiu.wang@nxp.com>
References: <1661247308-2650-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: Fix supported clock DAI format
Message-Id: <166127231558.397935.4810940436556797260.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 17:31:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 23 Aug 2022 17:35:08 +0800, Shengjiu Wang wrote:
> The MQS works as codec DAI, not cpu DAI. It is
> clock consumer, not clock privider.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: Fix supported clock DAI format
      commit: 1faa6f8274e2b08a38c0cca74113dfb26c6ad7b7

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
