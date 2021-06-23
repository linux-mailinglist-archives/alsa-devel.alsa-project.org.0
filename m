Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F243B1E65
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 18:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10F1166E;
	Wed, 23 Jun 2021 18:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10F1166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624464695;
	bh=XycGzb/Or5rXgqXxq5Pfdilk0APC+bbYpOpd9WsN+44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUkTSR5qFOtuys1ndicSQ0Q5MeM6kWak62yYTL/oWb6QqwnTwNFfvKd+/V3xrf/H+
	 +p1/FS6wq6bnd1y4FAkmAAkK/1H6FHqmeTRF7ZWtYq9cIezszc8lJcSSqC3bGbn9hC
	 ZW+A3RQA3gDts0cx0nFGgZD77yyH/N7RFiUfT8m4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B1CF80290;
	Wed, 23 Jun 2021 18:09:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5024DF801D5; Wed, 23 Jun 2021 18:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B1E6F8016B
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 18:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B1E6F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y6+OULoo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8DEA611CB;
 Wed, 23 Jun 2021 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464582;
 bh=XycGzb/Or5rXgqXxq5Pfdilk0APC+bbYpOpd9WsN+44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y6+OULooCZkRCYLOck+FarGNR1whZWAjnNUqxQP+vHnmdm9fIh8d320I+xsj5N7R9
 B94VqkbW6XVZRajonlkGv2gaOJT8p/mFoMKw0UM1+nD8531vDy5t/AfsKWaAQievpK
 bbrrlwuL5/nzDJpjMeOBJyGoEng62Brx74mqbVxtsWbmXshGc8KpN69HQJMK3usTbo
 Zm0+HCgd9a7RzYPhWA/6/prSSUxjFi8xWVuiTLgZpGwoFIltvsMIzqPDoPclGZAza2
 MwQPtefUA28lMu9KE4QlL6FuY10IqCifknf6HM6fFcFzSC04WfjTNwoMQ+MSB72/qy
 5X7yZnzfXkHcA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, festevam@gmail.com,
 tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org,
 Xiubo.Lee@gmail.com, perex@perex.cz
Subject: Re: [PATCH] ASoC: fsl_spdif: Fix unexpected interrupt after suspend
Date: Wed, 23 Jun 2021 17:08:56 +0100
Message-Id: <162446397756.55213.7915054235058479880.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
References: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, 22 Jun 2021 20:31:24 +0800, Shengjiu Wang wrote:
> When system enter suspend, the machine driver suspend callback
> function will be called, then the cpu driver trigger callback
> (SNDRV_PCM_TRIGGER_SUSPEND) be called, it would disable the
> interrupt.
> 
> But the machine driver suspend and cpu dai driver suspend order
> maybe changed, the cpu dai driver's suspend callback is called before
> machine driver's suppend callback, then the interrupt is not cleared
> successfully in trigger callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Fix unexpected interrupt after suspend
      commit: a7a0a2feb957e446b2bcf732f245ba04fc8b6314

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
