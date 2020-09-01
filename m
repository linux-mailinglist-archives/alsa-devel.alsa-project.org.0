Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74327259184
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 16:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1AD917D3;
	Tue,  1 Sep 2020 16:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1AD917D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598971948;
	bh=O1Qz4ZXdiSaMhdkg5TpGlUwTcP3HAsCwly/VMEgw7ew=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fsew9wuMN5VRFZudwQgURGRkRVcvqvrkwfi2ipmSuhT3awNgj4zcU3PC+mXtPBkBY
	 6KZaeVfZS2LaBSGVIa3n7biEtaLBonK8NgFa7PBjcKMrHo2WJ9tPP1bDa5BSJA+mOU
	 CeX177bOoAJGnGONH6vo43T/Wjx3fz7aWi/yer1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27275F801EB;
	Tue,  1 Sep 2020 16:50:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA3A2F80217; Tue,  1 Sep 2020 16:50:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDF29F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 16:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDF29F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JNxv2gi5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39BE3208CA;
 Tue,  1 Sep 2020 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598971834;
 bh=O1Qz4ZXdiSaMhdkg5TpGlUwTcP3HAsCwly/VMEgw7ew=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JNxv2gi5h2pJ4LyuMGOS3XexhJ1U1bx0g0nYlodhdK7d4MKxAJXnlWuKy2rwWZr/2
 JeyCYsFx2NMzZVRzUNT3Sas8HmqL4kuekDflfnj64gSMpRqNzN0QNoQD360x+TZEvS
 0hLvK7uJnHp/C4HFcC9FB6HH9Nl8vBbFCNwgzm8s=
Date: Tue, 01 Sep 2020 15:49:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, lgirdwood@gmail.com
In-Reply-To: <20200827173357.31891-1-s.nawrocki@samsung.com>
References: <CGME20200827173411eucas1p1283200677c5e077c5e07af938934eb5d@eucas1p1.samsung.com>
 <20200827173357.31891-1-s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] ASoC: wm8994: Skip setting of the WM8994_MICBIAS
 register for WM1811
Message-Id: <159897179514.47719.11338166675649379991.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 m.szyprowski@samsung.com
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

On Thu, 27 Aug 2020 19:33:56 +0200, Sylwester Nawrocki wrote:
> The WM8994_MICBIAS register is not available in the WM1811 CODEC so skip
> initialization of that register for that device.
> This suppresses an error during boot:
> "wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wm8994: Skip setting of the WM8994_MICBIAS register for WM1811
      commit: 811c5494436789e7149487c06e0602b507ce274b
[2/2] ASoC: wm8994: Ensure the device is resumed in wm89xx_mic_detect functions
      commit: f5a2cda4f1db89776b64c4f0f2c2ac609527ac70

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
