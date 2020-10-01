Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE0280A85
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 670EE1B0E;
	Fri,  2 Oct 2020 00:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 670EE1B0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601592600;
	bh=/Fld3Oecs3tTGcAezlLAYMe1AutM5l0b5mJQaJErGTU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyNo1yzGufzz8cfLz9JmPySwLhe59nuMGt1as342TkcscoC1vLJ2tczv4kItaC7C0
	 fmrEAoAoCyXHpHs797rduFsEccXAQubhs4DpLUIkmhs8qIHvrbFEuujXR1bbNTXewi
	 U8snbxJ4xcySEfg6La8b+9EuidiOkR/oL8zg3l0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C394DF802DB;
	Fri,  2 Oct 2020 00:47:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B92F802C4; Fri,  2 Oct 2020 00:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AB39F8022B
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB39F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0bUa94Sf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2759F206C1;
 Thu,  1 Oct 2020 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592444;
 bh=/Fld3Oecs3tTGcAezlLAYMe1AutM5l0b5mJQaJErGTU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0bUa94SfCCvLz4Cx6SJyWA9g719YoiuLRBD3C9Mrt9i1dDV7F29eNY0EzJci19icl
 OqzMujp7oz8LnCOLk8MM6b1kOmmDc/Rqn5Ys2GQmFDklWl7YUCFU00E+uvLdkxjP0I
 bqP27E5gAo0n+FLBUSfpj16dgx6e4e4w9cHxrabg=
Date: Thu, 01 Oct 2020 23:46:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Qinglang Miao <miaoqinglang@huawei.com>
In-Reply-To: <20200929112932.46926-1-miaoqinglang@huawei.com>
References: <20200929112932.46926-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] ASoC: fsl: mx27vis-aic32x4: use
 devm_snd_soc_register_card()
Message-Id: <160159237543.44588.2335297978854378427.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 29 Sep 2020 19:29:32 +0800, Qinglang Miao wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: mx27vis-aic32x4: use devm_snd_soc_register_card()
      commit: 1047bcac2169a05575476774bfd4a88f0a9c787d

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
