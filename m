Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E641F44EE9C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 22:28:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DB21671;
	Fri, 12 Nov 2021 22:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DB21671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636752524;
	bh=HsrloaHy0mKwVGhaJmlPLXBO0LEijxJ1kgXA3MRvdCU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUwX23JBrcFOZ2IjFkLibb1zK+RdfmjBNAGEmxVrU6g/pmLZXtpqyfc7gF7+vxKB5
	 MVd3z7cLCWcRuHh3JNzwxAPYY8FbS8KLRAUkp8symsf5H+J/1/XZTACACxuMBs/nWj
	 64VGg+e/a9JpupiCiyeRIJEp3cVetUWt58k4pXFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D2AF804BC;
	Fri, 12 Nov 2021 22:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9103AF8014D; Fri, 12 Nov 2021 22:27:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E7E7F8014D
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 22:27:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E7E7F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aOcwXl/+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8B3260F5B;
 Fri, 12 Nov 2021 21:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636752433;
 bh=HsrloaHy0mKwVGhaJmlPLXBO0LEijxJ1kgXA3MRvdCU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aOcwXl/+FgOsDmzJHv4560+tWI9BoWdpYXY0RwKLK/HAHAQrE0sCq96LlWlHXax4m
 OkRjyNl1eM8ni9It3ruOwXNnZlMp4aPA9RSH5ebU/HUnHezHXkCmB23m0cnTVnWjxH
 TpXQ44hvP25UwuE4ieC23x90RdTKeJKqmkm2IlM2RBhq8N0qDBKtlAgVNE9MzpYVK4
 JN2W90eYEketnQJxNyQqxNFGlig3KeYw2O5cd5WT61fG+kJtFiULq5grTX6duNYdeC
 +vBTNszrfIxSbfr/C3agB3DPGc7pcdGFsCM0iVjCUvhZx7tAsazKjB7P06vzz5DTBg
 tKSuPdFr6mUaA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mtmfz36o.wl-kuninori.morimoto.gx@renesas.com>
References: <87mtmfz36o.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: fixup DMAEngine API
Message-Id: <163675243262.742274.15174993310352691646.b4-ty@kernel.org>
Date: Fri, 12 Nov 2021 21:27:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 oshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, stable@kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

On 08 Nov 2021 13:22:55 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit d5bb69dc54ec1 ("ASoC: sh: rcar: dma: : use proper DMAENGINE
> API for termination") updated DMAEngine API _all() to _sync(),
> but it should be _async().
> _all() and _async() are almost same, the difference is only return
> error code. _sync() will call dmaengine_synchronize() and will be
> kernel panic.
> This patch is needed for v5.15 or later.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: rsnd: fixup DMAEngine API
      commit: 2ce1b21cb3326e12af3c72c47e1d294b19d73947

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
