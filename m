Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB0F4514EA
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 21:20:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 022F016B4;
	Mon, 15 Nov 2021 21:19:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 022F016B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637007634;
	bh=K3pfS4NVMA2CpFVPUUWV/jwChtsYnKjFN0rX/alvMW4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jn5ETeTbJAfT7BSzOLhsLB/SAoDeG21CCUG3Ouy7WNpOg6Hv0QbLcdEY0dG36OvLq
	 YibewgOT/MvqEx/m6d+9+uuHoG4E9hfVY2y2MB82GcQvo0d1aOVzfz5zZdSlk08eR+
	 E2fUiXOPRHruHU40hvn/Ftu0sN+2sBxlcmsJG3ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A91F804EB;
	Mon, 15 Nov 2021 21:18:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 497B7F802A0; Mon, 15 Nov 2021 21:18:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5D5EF8028B
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 21:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D5EF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GnaAa3OM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67C8961BFE;
 Mon, 15 Nov 2021 20:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637007508;
 bh=K3pfS4NVMA2CpFVPUUWV/jwChtsYnKjFN0rX/alvMW4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GnaAa3OMfZjo0cdkgZJPQdMWdKnJe2oF94QBvMIgKUL2AeeNHfpj6tgH7KjefnNWS
 xa16sWmbNMynWx89TRjz0BV529TEsM/JAOYDBAP03ub/AzuBqwt5YSM2Nt5jIXIsg/
 8USGrkghwCn4f3Qqz9z5aSOaTOxz2S4wdIEqHWDYIsXL9+o8AO3xgY2VFol0RmoHj1
 NVD8XVrVN+uCfW32VTTc/STp0+ltHjeFVNMGluPHBwXIPFptNqvNHfgHlar1kJXaIJ
 WRXz4gz/O4sr1flZYelXgBj//rplzrzJ7i+Gxu+rOeQh42qXubmopWE2RP3y4/Wcou
 7bVZhgjZPANDg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, robh+dt@kernel.org, tiwai@suse.com,
 Vincent Knecht <vincent.knecht@mailoo.org>, stephan@gerhold.net,
 lgirdwood@gmail.com
In-Reply-To: <20211031210956.812101-1-vincent.knecht@mailoo.org>
References: <20211031210956.812101-1-vincent.knecht@mailoo.org>
Subject: Re: [PATCH 0/2] Add tfa9897 rcv-gpios support
Message-Id: <163700750616.2049880.11874024359672809309.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 20:18:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
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

On Sun, 31 Oct 2021 22:09:54 +0100, Vincent Knecht wrote:
> This is the continuation of a previous series [1] where
> - patch 1/4 is removed in favor of using pin switch
>   This will be posted independently of tfa989x support,
>   since it mainly require changes to sound/soc/qcom/common.c
>   and device DTS.
> - patch 2/4 is already merged
> so here are reworked patch 3/4 (bindings fixed and example added)
> and patch 4/4 unchanged.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: nxp, tfa989x: Add rcv-gpios property for tfa9897
      commit: 77fffb83933ad9e514ea0c7fd93b28cabcdea311
[2/2] ASoC: codecs: tfa989x: Add support for tfa9897 optional rcv-gpios
      commit: 9da52c39b33e7bd9c1f56175c0466fa468d7f145

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
