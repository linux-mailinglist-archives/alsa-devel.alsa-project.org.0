Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79089358A4F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3ADE167D;
	Thu,  8 Apr 2021 18:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3ADE167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617900994;
	bh=OYF+n9QeLbvblVfOO5fZLqzRX71dR9uywaBI85DqbE0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J85KUt7vFXR7Hvg+0APgjWo2TbPinew3A/sOsiwCYHN+wWkjaOlESYE+BL5D3ZyCP
	 yFG6axEg4VYJDngsScDw8LlUHDu64iGgw/8K0KwMuw/dLmSpi99P4Z5/mmZtRbvZio
	 T0fk8is5TiB/g14sAl+/TtOCMuf4wYDfaqQoZ9MU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F682F80169;
	Thu,  8 Apr 2021 18:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FE6FF8032C; Thu,  8 Apr 2021 18:55:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13BAAF8020B
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13BAAF8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K/7iXPII"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D212E610A7;
 Thu,  8 Apr 2021 16:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900924;
 bh=OYF+n9QeLbvblVfOO5fZLqzRX71dR9uywaBI85DqbE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K/7iXPIIcIY/jflQChjNH260+XAb3plGm7AQL7PHJgra7zLAoWsBo+CeW/n2BBO5s
 wltc72vDmcr7WNKk079KSFJ3m8vBqQjCClkqoQx+7yHFABZ8qQ1srk00ILKM6TQT9b
 sXUbU1gfF04cob0t9OX49xm+uAr4lS4BU1OtPZLsC9h9Lco4R2sOmedkhbwxIfZYJH
 YWMQKgHPUkCNnhxMwyvuESV8yPL8oiTy/vL19UMoBOCoOKek7NfBvvqHVWAXD3Hje1
 qtVpf43SLrA590m5MfxVyd0RFB66A9twHAoaCtF+z6Jozl/tA+I92ClQ26GKM7Z/Pr
 AiV2DGsHgIX1w==
From: Mark Brown <broonie@kernel.org>
To: Jiri Prchal <jiri.prchal@aksignal.cz>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ASoC: codecs: tlv320aic3x: add AIC3106
Date: Thu,  8 Apr 2021 17:54:36 +0100
Message-Id: <161790012552.16915.743645000066789400.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408135908.125667-1-jiri.prchal@aksignal.cz>
References: <20210408135908.125667-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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

On Thu, 8 Apr 2021 15:59:08 +0200, Jiri Prchal wrote:
> In DT binding is mentioned that this driver is compatible with 3106.
> So added compatibility string and model number.
> 
> -v2: Also added in switches "case AIC3X_MODEL_3106:" to have right widgets etc.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tlv320aic3x: add AIC3106
      commit: a0bc855ffdb55cbb9fbf7fa9611d17f19db889a8

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
