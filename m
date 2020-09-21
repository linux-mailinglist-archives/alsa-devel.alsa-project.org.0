Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC05273015
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53A3416DB;
	Mon, 21 Sep 2020 19:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53A3416DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600707780;
	bh=+knWzm3xj2gskwUc9VYhgeLl1eQQ+hq8DGmvHZBEvB0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ohlr3+85D54QiH8XhZ2H1LlGBMkBJkL/P460QbyLKEV6mfb5vclSXbkA5edp0gbhE
	 MZCsf+0nc522M+z0ujGr1kbWNSP7PcJztEyS8DkM8dWMWTqD6Ws0N8HC7xnICJRI7C
	 JEA672R1PHT+Ak+pKoCI/VnJU0cZT7IHuKfZKuGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A2AF802E8;
	Mon, 21 Sep 2020 18:59:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0461FF802E1; Mon, 21 Sep 2020 18:58:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B03BF802DF
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 18:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B03BF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DR67Vkjk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BB8420C09;
 Mon, 21 Sep 2020 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600707535;
 bh=+knWzm3xj2gskwUc9VYhgeLl1eQQ+hq8DGmvHZBEvB0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DR67VkjkH2w8LYQ91CjXT9tVvpO+pyX9G1WD4sFJ/5T2McpNoiwky20+SpLMX6Gsj
 Kv9I3eDtc0/QRK+Yr3NmiTW0pNy+HPzOECEQpPlfsmMfLolofmbWAK2ozffESGYl6Q
 oZWmtT2AwIrkUBmmIRWXCYr0XaJn6QQXLC6y6f6w=
Date: Mon, 21 Sep 2020 17:58:03 +0100
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, lgirdwood@gmail.com, dmurphy@ti.com,
 Camel Guo <camel.guo@axis.com>, tiwai@suse.com, robh+dt@kernel.org
In-Reply-To: <20200916075949.28479-1-camel.guo@axis.com>
References: <20200916075949.28479-1-camel.guo@axis.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: tlv320adcx140: Add GPIO config and
 drive config
Message-Id: <160070745846.56122.15642862327141755501.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

On Wed, 16 Sep 2020 09:59:48 +0200, Camel Guo wrote:
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
