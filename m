Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F1559BC0
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:37:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 387001887;
	Fri, 24 Jun 2022 16:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 387001887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656081453;
	bh=74PP1QpAQfNRugfHRpmvVEB7YydKaVZbcvTYOTS+sLI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gi1zmeAhbZ9ioHv8jWBzbI9iTzPexMYo5yU/vQ4aJZPdzEyeDzikHp4frmZvuw3GO
	 XrNws1gvDWIzKQ2j1lX6zwDGe2BzY8faobGAlKBa9ebU9hKmYiysF8I1XFoTtmJs8r
	 SWza1ubwSBapWy4UTN2wQ++AtiVUeBrjKqOg5hGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6548F80536;
	Fri, 24 Jun 2022 16:35:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE086F80536; Fri, 24 Jun 2022 16:35:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61AF6F80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61AF6F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eIgpTmR7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BE3262096;
 Fri, 24 Jun 2022 14:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0E6C341CB;
 Fri, 24 Jun 2022 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656081344;
 bh=74PP1QpAQfNRugfHRpmvVEB7YydKaVZbcvTYOTS+sLI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eIgpTmR7MXt8uH7hZAjCIRvNh0K6tDX3sXNird51Joy+22ugbf6lAl8Ru1AZhe02j
 naLaqSSBeGJXsW3m9DuMurJBTVeZDX31juSBsYVRtDuqmCuPsL//mNadI2KClsdfZt
 xk+0nK25E+QP0MBbIJXGZ7VNyzt7r+jzHcSfun2db+e15y9Q9naa5pdVl4s0c+5llt
 6BjOyTzVTHBl7rL2OXTH/wQW6MH1cl8ApnV3agpTXVVK4kKQDraG8Tv8Z9DKg6Prxm
 ZPs5Pg4CAA8hGv2nGZi7Hs16UgskWVFJ/8xPsrXIh0TabQ1lsaSPz/CzZFTgaPjeC8
 ctdIzXZ2tR4cQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20220624092601.2445224-1-s.hauer@pengutronix.de>
References: <20220624092601.2445224-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: audio_graph_card2: Fix port numbers in example
Message-Id: <165608134396.445804.4133237526270110124.b4-ty@kernel.org>
Date: Fri, 24 Jun 2022 15:35:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Fri, 24 Jun 2022 11:26:01 +0200, Sascha Hauer wrote:
> The example in audio-graph-card2.c has multiple nodes with the same name
> in it. Change the port numbers to get different names.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio_graph_card2: Fix port numbers in example
      commit: 2544e936ab2fc030f6d8bfcc5a7ae3ebb9c6dc39

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
