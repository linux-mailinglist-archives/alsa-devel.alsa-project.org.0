Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485651FA490
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A9A1674;
	Tue, 16 Jun 2020 01:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A9A1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264504;
	bh=SQlV530bPjjPvR30LwWFKM4Pz8BNs9PTNsVr0NiaVwM=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G/WEy75/cEolWMyk0x38HMghinYo8KiIQKvCfQcbADdSu8NqEMI4QYT8GrdH1QKtZ
	 KloecTmSdvWnIRdP5tlz5XOT4ndKpv0fUHBugRYGvwuwXb3ZCR82nLEea6DVmeclQb
	 PdIxkatlVOrTTRqVtOOKSjX7dQ0oNj8nyc/u40Fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8953BF80171;
	Tue, 16 Jun 2020 01:40:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAA3F80171; Tue, 16 Jun 2020 01:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB038F800CD
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB038F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zFMg8y0f"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90444207D3;
 Mon, 15 Jun 2020 23:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264394;
 bh=SQlV530bPjjPvR30LwWFKM4Pz8BNs9PTNsVr0NiaVwM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=zFMg8y0fAGwftTta/tytvxkoiu9LWJZQt1Qfg9MninHiG2+X1yuLl/CnsNkDBry9J
 PSKKJ3QnS0PpaLn2+rxYSm2kyHLM8q91kW+0ymlwCEPSv5DkSEuXdRd50Kyy/QBgZe
 3ex/l52wIPcCBJSyu5J/IxAhaX2iCTVbkRS7QAwA=
Date: Tue, 16 Jun 2020 00:39:51 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, s.nawrocki@samsung.com, perex@perex.cz,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org, sbkim73@samsung.com,
 Jonathan Bakker <xc-racer2@live.ca>, krzk@kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, devicetree@vger.kernel.org
In-Reply-To: <BN6PR04MB066019A8783D22F1C4A588B7A39F0@BN6PR04MB0660.namprd04.prod.outlook.com>
References: <20200614202411.27843-1-xc-racer2@live.ca>
 <BN6PR04MB066019A8783D22F1C4A588B7A39F0@BN6PR04MB0660.namprd04.prod.outlook.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Document wm8994 endpoints
Message-Id: <159226439190.27409.3267651095489204522.b4-ty@kernel.org>
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

On Sun, 14 Jun 2020 13:24:09 -0700, Jonathan Bakker wrote:
> The wm8994 exposes several inputs and outputs that can be used by
> machine drivers in their routing.  Add them to the documention so
> they don't have been duplicated in any machine drivers bindings.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Document wm8994 endpoints
      commit: 3f2ec71cb8f5c9605b5d45918ceefcde9b97b672
[2/3] ASoC: Add bindings for Samsung Aries audio complex
      commit: 14ebd62c12dc89a0087bf86e79548ee9a6d93625
[3/3] ASoC: samsung: Add driver for Aries boards
      commit: 7a3a7671fa6c7e90aff5f4242add2a40587b85ef

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
