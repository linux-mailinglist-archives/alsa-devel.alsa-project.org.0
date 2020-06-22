Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8B5203A38
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 17:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8512E16EE;
	Mon, 22 Jun 2020 17:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8512E16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592838124;
	bh=P0JZAAqs0S8OCGGldXjKh98Y7NXE//Q2TeZytcU0B6g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZsiEn+DezDEsyybWgCol5U8rjS5D8I3yVTgdKotpFdSUzxRIIs1AsMkf7Id0ELbQA
	 nFl4q6yckmIIk4tSrD4jc2I5w4fvyg5683CEDGNyPP8RQ3IKQh3Ga/wLYKhgLpuRx/
	 RZ+pDELbktjsBpc7It6yKKeoea00rpAAGTTkEcZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D74F8010E;
	Mon, 22 Jun 2020 16:59:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79D9EF8010E; Mon, 22 Jun 2020 16:59:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B735F8010D
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 16:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B735F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J92GmYTl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A82C20708;
 Mon, 22 Jun 2020 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592837961;
 bh=P0JZAAqs0S8OCGGldXjKh98Y7NXE//Q2TeZytcU0B6g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=J92GmYTle+sMY3wMeRQo70bBl1ajQSV9hvdZlFRoTL/A5ZqN7rAF2e0c6OuEE4FcU
 ebjdXhGDTQ6iMclb9NOcRFc+f771C0fSUYhZaWiACKUFgAVSx+Zgnzzj3hgGuQWqwz
 WQ4XTpe/xWLreHyfqXJmZz37apyB3h/aXWc0ShTM=
Date: Mon, 22 Jun 2020 15:59:19 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, David Rhodes <david.rhodes@cirrus.com>,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com
In-Reply-To: <20200619212651.2739-1-david.rhodes@cirrus.com>
References: <20200619212651.2739-1-david.rhodes@cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Add controls for calibration and
 diagnostic FW
Message-Id: <159283795950.27481.13807604446079724474.b4-ty@kernel.org>
Cc: Vlad Karpovich <Vlad.Karpovich@cirrus.com>
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

On Fri, 19 Jun 2020 16:26:51 -0500, David Rhodes wrote:
> Exposed additional mixer controls to select calibration or diagnostic
> firmware.
> 
> 'Calibration' --> chip-dsp<id>-spk-cali.wmfw (.bin)
> 'Diagnostic'  --> chip-dsp<id>-spk-diag.wmfw (.bin)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Add controls for calibration and diagnostic FW
      commit: d6fea46e086bba24640fb78ae992e90518e63580

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
