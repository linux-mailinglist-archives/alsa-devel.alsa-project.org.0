Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC553FBE3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F8B6195A;
	Tue,  7 Jun 2022 12:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F8B6195A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598876;
	bh=R+CU8uOFsboE67tcWswALzxrVxNJ9/fwY9T7Z6JoQQE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nt0rKBFhFKVvlNJ9PHduSE4sPVGKfW4y7WhjRe6Ev/uhpQYUWljqPMmJgAN9vsDgD
	 U6SY2WJroTztWe+/29MyQgdzlCm+ubSK4DrFuSAQN4xYEG2KYrRbttkrU+76/U8fVG
	 jtkiSvDPfnAtub+97fO88ClSlGteTYuY6AMBnzbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C1F6F80537;
	Tue,  7 Jun 2022 12:45:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B45A2F80539; Tue,  7 Jun 2022 12:45:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38C52F80536
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38C52F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rUsdBeGH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F9B1B81F02;
 Tue,  7 Jun 2022 10:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6013C385A5;
 Tue,  7 Jun 2022 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598729;
 bh=R+CU8uOFsboE67tcWswALzxrVxNJ9/fwY9T7Z6JoQQE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rUsdBeGHRSqPeYVORNrw4+DZQJhvpktD8/FMpQPXWUdW1GHK3ThE6OvHGqjGRwEPa
 w/1RwMkLUUkuiLJEo8q5bMIf7VxGC916INr9ZaGnV8to+xQMWXUSMwYo8QYi1RmyvO
 bnEvSqpbIEEdnjzHOWaXB/TyE5Nl5eOJG2s0ahFBZew0rCQBZLwrnikPHwoSPaBCvz
 Ol+2/rfIm0lQfpVrlfRZ9oFtr/m3bE7vLNTrCKEwWuysevAXy/MvMTCFRrTqbfCu3a
 TX3bpcHZJhnNrsqPhQwKTfrA0WG1uGIP2DZeQVTItULpdBY+fA1nmm1r6vfDeJjePg
 li9XmSsSkZ+Rw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com,
 shengjiu.wang@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1653456221-21613-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653456221-21613-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: simplify the code with adding
 fsl_mqs_soc_data
Message-Id: <165459872746.301808.3491254402471419212.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 25 May 2022 13:23:41 +0800, Shengjiu Wang wrote:
> Add soc specific data struct fsl_mqs_soc_data, move the
> definition of control register, each function bits to it,
> then the code can be simplified.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: simplify the code with adding fsl_mqs_soc_data
      commit: 063c915502b914a5a621458c763dfc28286f7606

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
