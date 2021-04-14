Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6435F878
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 18:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD4E1670;
	Wed, 14 Apr 2021 18:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD4E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618416503;
	bh=FcPSUm1S7UwhNdEPm5jgnm0Ht2a7JUnT2B98X3Vge48=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jFwfc6FSPJfZ2kRouhABIQr8vcjDn4Q78xXXem1k4TGav+jPhWTzw+fHRpCLjmPC6
	 V2TGa7CKD9mKaE4nJOZy9Mzi/60d2RfjCMdiEH2bPxy8ZeMD80eUtcOm7dvUnDScKz
	 twD6zKFWm9gBWCoq2CywJwZqPqtaPlLENmLX17hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FA7F80273;
	Wed, 14 Apr 2021 18:06:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01A98F80269; Wed, 14 Apr 2021 18:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AAA6F800EB
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 18:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AAA6F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F7vCbsw9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED16F61158;
 Wed, 14 Apr 2021 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618416407;
 bh=FcPSUm1S7UwhNdEPm5jgnm0Ht2a7JUnT2B98X3Vge48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F7vCbsw9DyIUy5XoTnrnlPV+Ujo0nwtc8XE/3h6H78Z742Bp4SFJNy+JCxCgZsiQ2
 CDvvri73x1EZoRKLV8g/wdFSEa6dUeEcBp86HEzKdeSvhwFlJIOWq9EC5WF44Zf0lv
 pEABdzCckYq+WjYYnfXYK8JhcM98V0dQd2VzRkW6YPoP6X2Yv/E0bJ3PJoga907gwO
 uL4FfhBGOVUr81XNI8oYia/piqQleFByYkEM1ObkSc3eWjriY28w45IbtIxH4tlc6n
 pPG5bEbaiQZkIXi3GQmLjtqx2lSYsOLG56NA93E5J7K/O9TFoHbbPnHM/OXkCXnpMU
 0KTIpTZcECvLg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: rsnd: tidyup Renesas sound
Date: Wed, 14 Apr 2021 17:06:20 +0100
Message-Id: <161841601729.20953.5119986912774167754.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <877dld1jud.wl-kuninori.morimoto.gx@renesas.com>
References: <877dld1jud.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 08 Apr 2021 13:27:54 +0900, Kuninori Morimoto wrote:
> These are tidyup patches for Renesas sound drivers.
> 
> Kuninori Morimoto (5):
>   ASoC: rsnd: call rsnd_ssi_master_clk_start() from rsnd_ssi_init()
>   ASoC: rsnd: check all BUSIF status when error
>   ASoC: rsnd: add rsnd_ssi_busif_err_status_clear()
>   ASoC: rsnd: add rsnd_ssi_busif_err_irq_enable/disable()
>   ASoC: rsnd: add usage for SRC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rsnd: call rsnd_ssi_master_clk_start() from rsnd_ssi_init()
      commit: a122a116fc6d8fcf2f202dcd185173a54268f239
[2/5] ASoC: rsnd: check all BUSIF status when error
      commit: a4856e15e58b54977f1c0c0299309ad4d1f13365
[3/5] ASoC: rsnd: add rsnd_ssi_busif_err_status_clear()
      commit: 691b379cbe348fbead33e49d1c1d0f045a2e3446
[4/5] ASoC: rsnd: add rsnd_ssi_busif_err_irq_enable/disable()
      commit: 15c57ce07ce207069f1cd57ec117b11871f3afa6
[5/5] ASoC: rsnd: add usage for SRC
      commit: 63346d3d2f7cd96746149b9710a4cc5401c0cb5c

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
