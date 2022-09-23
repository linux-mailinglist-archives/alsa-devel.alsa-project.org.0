Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51CF5E81B5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 20:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBBBD8;
	Fri, 23 Sep 2022 20:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBBBD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663957378;
	bh=nHs2AfrvtEk1XxvpH+aLNwlJHpGH5OeAB5BjgaRdNn8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LnjdBJq3wy/Z/4uzzsqu0Q6q2/RJLdAYrgvRUyUzfp+GLrlF3MOFXoLIkuR+2Oj1U
	 jrFak7ibiZwhWrsMPJuSlfs//y6IC3cK2DLwUsV2HM5hvfYhsPsItZwzHLzRIpa3qS
	 Cf4CnmlVfki0hNyyohnA+awuS8IrCF35pjkR/VMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7853EF80431;
	Fri, 23 Sep 2022 20:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F78F80269; Fri, 23 Sep 2022 20:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE991F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 20:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE991F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y7dXJdug"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 441F9B82150;
 Fri, 23 Sep 2022 18:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6EDC433D6;
 Fri, 23 Sep 2022 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663957314;
 bh=nHs2AfrvtEk1XxvpH+aLNwlJHpGH5OeAB5BjgaRdNn8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Y7dXJdughMertrvwxRUGuz8LzjWUTBvV5X48hlDNnHdB1j7npK5z+KTRictpFfUrL
 84VLE38m3G0bW06zvrH4NKm8KuscGbXgmkvR834NV/RuvG9XWmmGj26gWdnmdXYrFr
 a775kFaLzRN+IiXdgDSL3iU2Q03MRLvU93oadp6SNz+iUiL/HaDa23sNB/daKo+ka7
 R01XG81lq9Bhp4sllixfmqsKK/M2/GZrcduG2bzmo4O2tHSI1rxoqOgHxaVOtBmH+T
 cJY3/yEG/SRyqzJ/w/vksueuKOy4TNZbcAi7m12zQ7aL5tPc0eUJIfnSNo7LvhtP9/
 UzP1anJQ9lcBw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, 
 nicoleotsuka@gmail.com, festevam@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz,
 lgirdwood@gmail.com
In-Reply-To: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
References: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl_audmix: make clock and output src write
 only"
Message-Id: <166395731156.751793.9528112393184864154.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 19:21:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Tue, 6 Sep 2022 14:49:21 +0800, Shengjiu Wang wrote:
> This reverts commit 944c517b8c838832a166f1c89afbf8724f4a6b49.
> 
> There is error after making clock and output src write only
> 
> $amixer -c imxaudmix cset numid=1 1
> amixer: Cannot read the given element from control sysdefault:3
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: fsl_audmix: make clock and output src write only"
      commit: 086ceada2107b482df437d76f581062b547eb7f2

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
