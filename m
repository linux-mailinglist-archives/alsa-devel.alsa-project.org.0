Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E094A1E46BA
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 17:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF3E17DD;
	Wed, 27 May 2020 17:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF3E17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590591731;
	bh=7nt7f9kH1JqwknAwR7cow5RhBRNUkIwiCI5pxeuJfMU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2RCdmENgaZg5Xy8zSgLWUtBuqoFtr4m84dv/PrNczkxHcK6mxEE450veNBRT0BGn
	 +c+MNheYu6hY8EaeGNnCEPgPaZci10GuvlopHIT/frHOE14oi2TuqyPC1JJ8XTxDYD
	 hJa5hNXUDxF/nMqWyVa/hEc3mSC6aFw8wn87rsV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB2EF802BE;
	Wed, 27 May 2020 16:58:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ACB5F802BD; Wed, 27 May 2020 16:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD560F802A1
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 16:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD560F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nILr3/dq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2EF620C09;
 Wed, 27 May 2020 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590591498;
 bh=7nt7f9kH1JqwknAwR7cow5RhBRNUkIwiCI5pxeuJfMU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nILr3/dqBRQXywLSCiW1dOobDr2JN54eEm4YgnoeHGJQ1lAq/UpU67ZKSFwYe0jTi
 Q/ve9GkzpOUeXZLPnn67itM3pqB0gd9igAqOe+yLKbbqBsUrgSp1+Ev06zNfXXgs05
 /OcTL1YY3zSBoPT71V1YebPuOqkZFx48VSGthckA=
Date: Wed, 27 May 2020 15:58:15 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, Dan Murphy <dmurphy@ti.com>,
 perex@perex.cz
In-Reply-To: <20200526200917.10385-1-dmurphy@ti.com>
References: <20200526200917.10385-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: tlv320adcx140: Add GPI config
 property
Message-Id: <159059147354.50918.139552370821784461.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Tue, 26 May 2020 15:09:16 -0500, Dan Murphy wrote:
> Add an array property that configures the General Purpose Input (GPI)
> register.  The device has 4 GPI pins and each pin can be configured in 1
> of 7 different ways.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: sound: tlv320adcx140: Add GPI config property
      commit: 2465d32bea35d1d56c6cfb08a96ebea3b475d8ec
[2/2] ASoC: tlv320adcx140: Add support for configuring GPI pins
      commit: 3c35e79cead31c3bd79875ae90f9655dc77ad13c

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
