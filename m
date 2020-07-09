Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA321AA3E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F4491661;
	Fri, 10 Jul 2020 00:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F4491661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332330;
	bh=AqnzHMtkycd/r+DqUiRAj0rilhO1VPkem/b8qz1IVFs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuVBspyhvQA2PZhJbQetdY3nhUPufl3u8KGs2Gny2ZAUZpT6UL2b+1VyQ4AqCLEPd
	 PvjyJM0GQBzCjdPncIHlTrTchA8nF3jeQSYVu8VL6xGP7NR2D0+dKW+wCmBRaSCXmo
	 prd/NHccyHiA4Rr7n1KIIsdtzxx/LcIxkFyIqV3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA44F802F9;
	Fri, 10 Jul 2020 00:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18958F802F8; Fri, 10 Jul 2020 00:00:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_32,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F14E8F802E7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F14E8F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v93DrKHk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F31CA2067D;
 Thu,  9 Jul 2020 22:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332038;
 bh=AqnzHMtkycd/r+DqUiRAj0rilhO1VPkem/b8qz1IVFs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=v93DrKHkPzY9X5bhd8xywntKJgEnUuse0gtBqgsT5SDChhK8xRTOyCc0+DQDayzAE
 /X2BmRu23cAlTk6FZ5FJqQS4O4Y5Rc7UOx5Cd8nNO8ni0mPHIpDG+2ssvvn8OOfTlu
 vyunLVCKcAax6505mESwHsfO7FexsQQfEguQidIw=
Date: Thu, 09 Jul 2020 23:00:33 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200708101249.2626560-1-codrin.ciubotariu@microchip.com>
References: <20200708101249.2626560-1-codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH v3] ASoC: atmel-classd: remove codec component
Message-Id: <159433200031.57213.7392401769698717985.b4-ty@kernel.org>
Cc: ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
 tiwai@suse.com, alexandre.belloni@bootlin.com, lgirdwood@gmail.com
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

On Wed, 8 Jul 2020 13:12:49 +0300, Codrin Ciubotariu wrote:
> The CPU and the codec both are represented now as components, so for
> CLASS-D we are registering two componenets with the same name. Since
> there is no actual codec, we will merge the codec component into the
> CPU one and use a dummy codec instead, for the DAI link.
> As a bonus, debugfs will no longer report an error when will try to
> create entries for both componenets with the same name.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel-classd: remove codec component
      commit: 1dfdbe73ccf95765135b1b1ee8335ea3cb16bca0

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
