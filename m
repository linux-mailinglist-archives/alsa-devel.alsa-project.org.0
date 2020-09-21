Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A16273014
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C02BA16CB;
	Mon, 21 Sep 2020 19:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C02BA16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600707770;
	bh=jBvTMb6BSyyzBMg1bmcGhFcyq8Z54iV6+nKI7nSpAMA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bmE/fjAQADY3gPw7WRgP0iaszJ3U0djxHJL4i0e0EZ3wusR0UtVJghitdbpow+0bL
	 K+657mOs4xw1K8gVwmmbn5DF490ofglWmiRWRHtUcNwIvsnYkyT3qf1gCcMX5YNlhd
	 t7ydabZOFTFarAXjRtEO911A2A9WHQH1Iv/cwZ6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3251CF802DF;
	Mon, 21 Sep 2020 18:59:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67F0DF802E2; Mon, 21 Sep 2020 18:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B154F802DD
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 18:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B154F802DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yg3oJvW5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A662223E;
 Mon, 21 Sep 2020 16:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600707530;
 bh=jBvTMb6BSyyzBMg1bmcGhFcyq8Z54iV6+nKI7nSpAMA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yg3oJvW5Lr1N1++gn6kiiQCbI2x01EE1M4MTbSGe+uk9MqyENcSjxgNUiXMobQE9h
 OzW1kNiO34HzLBVgYO7LCBAH9nZDt6nc8h0wE01TCQE7q1zuQftM6qDn6I+Rq8chFg
 bx+6jFuf4Q2JVd9l8JQlzkTKGsvDWzufQ59vtmNY=
Date: Mon, 21 Sep 2020 17:57:58 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, dmurphy@ti.com, Camel Guo <camel.guo@axis.com>,
 tiwai@suse.com, robh+dt@kernel.org
In-Reply-To: <20200918114025.18205-1-camel.guo@axis.com>
References: <20200918114025.18205-1-camel.guo@axis.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: tlv320adcx140: Add GPIO config and
 drive config
Message-Id: <160070745846.56122.3144589484342330182.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org, Camel Guo <camelg@axis.com>
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

On Fri, 18 Sep 2020 13:40:24 +0200, Camel Guo wrote:
> Add properties for configuring the General Purpose Input Output (GPIO).
> There are 2 settings for GPIO, configuration and the output drive type.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: tlv320adcx140: Add GPIO config and drive config
      commit: 15b3d324c8980022071710b5096b705eb6b74fca
[2/2] ASoC: tlv320adcx140: Add support for configuring GPIO pin
      commit: d5214321498a43558d9ffcce4153775c2c296bad

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
