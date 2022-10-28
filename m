Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE7611ADC
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 21:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3338CE0E;
	Fri, 28 Oct 2022 21:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3338CE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666985113;
	bh=ot5Sa9Mlp08Yo/46BwMaqi/qloDRG4Ii89sgfRGOd54=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dkski0uMAmwDH53FU8Q8XLVoKT4NHaLjW9bLphy/2Qq4g045WMZfPryx/1/k/QKYW
	 3xE6dusuw+FAKyEbeQ0/1AEDl1OEU/otCzjcKY0ToQbyxIvwnP6ME+YFvocBvtWN6W
	 9Bnk5p5obiZU4k2LU2aUpstpEPcDAuzaydUFTc+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 798E8F804D0;
	Fri, 28 Oct 2022 21:24:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E0A5F8025A; Fri, 28 Oct 2022 21:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A449EF8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 21:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A449EF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ojd1RVNw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD84FB82BE2;
 Fri, 28 Oct 2022 19:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3EFC433C1;
 Fri, 28 Oct 2022 19:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666985051;
 bh=ot5Sa9Mlp08Yo/46BwMaqi/qloDRG4Ii89sgfRGOd54=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ojd1RVNw6hyaCCrYdsqnQgEpBn6ofM9IfNeBwiFPt1RQXzavRtsRoouFedFSCkv0B
 XF2PFc4N5tLNeNqZKLxMbn0TWFiVJeWF8qw4OCzV/QwioO6f//BlxEBlv941jj/MDj
 NAG0+64eerSXeiwFXtmTJLutHb4G61oEYACGK+TOppuWFA5FCMngtMrXSxvpez7F+w
 xYBvtFp2399YT7/hqBa7BLyhrf9/cuJ3n0uJ3mkL09+iUJPEL1ZENNZEoeDVl6TREk
 pcoif7BTuZgesclLg4cfnuNAxzHcWPNRX5WODORRlgtDsxdrWapBA7+70Kp1vQ+qnM
 VVvjJ09wxESzw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
References: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/9] ASoC: qdsp6: audioreach: add multi-port,
 SAL and MFC support
Message-Id: <166698504930.1386510.17260012636035709007.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 20:24:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

On Thu, 15 Sep 2022 13:38:28 +0100, Srinivas Kandagatla wrote:
> This patchset adds support to multi-port connections between AudioReach Modules
> which is required for sophisticated graphs like ECNS or Speaker Protection.
> Also as part of ECNS testing new module support for SAL and MFC are added.
> 
> 
> Tested on SM8450 with ECNS.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
      commit: af7ed7eb70e8964514c706f8498623a2a3696657
[2/9] ASoC: qdsp6: audioreach: remove unused connection_list
      commit: 5b488e80078f09bbc197d766babf014dd52c30bf
[3/9] ASoC: qdsp6: audioreach: update dapm kcontrol private data
      commit: 1c87d3817b74b895933e9940b9de09b17c674b9b
[4/9] ASoC: qdsp6: audioreach: Simplify handing FE and BE graph connections
      commit: e4977b91cff8b00cdeb310735ef34fa4dee9485c
[5/9] ASoC: qdsp6: audioreach: simplify module_list sz calculation
      commit: 4efb98e9635b9919f2cb72cddae97b7231cf96ef
[6/9] ASoC: qdsp6: audioreach: add support for more port connections
      commit: 03365d6a58c47b3a3f2f964d0777493e293d7da4
[7/9] ASoC: qdsp6: audioreach: add support to enable SAL Module
      commit: a934afdbb022d5a7b1d20251875ecefcaf48536a
[8/9] ASoC: qdsp6: audioreach: add support for MFC Module
      commit: cf0de67d954db21002fd7521364f2ac89aabae35
[9/9] ASoC: qdsp6: audioreach: add support to enable module command
      commit: 6648a6dcfe40ae8c5e7cb5c1d7b9e59f010e285d

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
