Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F73AF59F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EED916B3;
	Mon, 21 Jun 2021 20:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EED916B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624301406;
	bh=7yUZDZlOIzDIa47OFbFJ/39Qwhe/+XOMMOCaPdtaBwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYIFRAiJZLxXJuTy4EXzarh/XiIVXznMju+zyGliE5jk8O4Nksyl5gWhGKCyVrF3U
	 gPGHOU/lju50ymy0fQErzGY611Ozd79K6nZRsCujb/mQQ+DAh/rRT0ud6+TxNWxHIr
	 cUkPwvCkfdPduk+Bg2rMP7g3aDRw3I7QiYb7mDO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B85EF804EC;
	Mon, 21 Jun 2021 20:47:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE595F804E6; Mon, 21 Jun 2021 20:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85EB3F804DF
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85EB3F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lD6c1pBH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FA4D61351;
 Mon, 21 Jun 2021 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301224;
 bh=7yUZDZlOIzDIa47OFbFJ/39Qwhe/+XOMMOCaPdtaBwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lD6c1pBHZwqs5eiQs8buzuuA9BfkqJolhjZ6EDv4VF4us1aV1CC0LUyTsb6VhIGp2
 E/becPsixhGwp4yQaCduiuDSkM/u6NQKgTxxGB+Gb+5l1ACSAQo9z+SUbO6AHK5wU8
 X35Wg2dinDz5gYfjdhPQPAcn+0z5czmkVkny/B828TD9H3VvA47bg9OSPoqp9nQuQI
 coxMZ68+/EyAh4aDiT0zJ68a6InuiFLM4sRM5KzBoYyeVu8s0vqXaciwdbVsUcTxNH
 gEgCasF2SK3G82tGxTq/RjJ854+IlLq7yVQYrjOCUJ9SPpaiBG7JDOM6U0YW5Nx5Wo
 2C7AKlzucp/Cg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, timur@kernel.org, alsa-devel@alsa-project.org,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: disable all interrupts when suspend
 happens
Date: Mon, 21 Jun 2021 19:46:01 +0100
Message-Id: <162430055262.9224.10660705196927221469.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1624009876-3076-1-git-send-email-shengjiu.wang@nxp.com>
References: <1624009876-3076-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Fri, 18 Jun 2021 17:51:16 +0800, Shengjiu Wang wrote:
> There is an unhandled interrupt after suspend, which cause endless
> interrupt when system resume, so system may hang.
> 
> Disable all interrupts in runtime suspend callback to avoid above
> issue.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: disable all interrupts when suspend happens
      commit: ea837090b388245744988083313f6e9c7c9b9699

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
