Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84C3F72F4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 12:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6BD4167C;
	Wed, 25 Aug 2021 12:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6BD4167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629887118;
	bh=tL7vzePFTdLCCmodujY/NanR9r8e1EVRA9OUWU++xVs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CaJWOPO8Jqd1Wce1/ydby3kTv04FzYOIfYPo3KSqw/yfezKq33Cn83/tbhm3HLQPF
	 5I89EHpIt1Y7qfcxfdHu75YqIFMy59B3Pm/GFoal0dRP37IQK8goHqj3r96CI2vCLF
	 M4RSlzmruuQAWxB+EaZLUk/gze2Q0yyLxQvVjXH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD12F804E3;
	Wed, 25 Aug 2021 12:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C473F802D2; Wed, 25 Aug 2021 12:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B196CF8003C;
 Wed, 25 Aug 2021 12:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B196CF8003C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DkMlb3x1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C07EB60F58;
 Wed, 25 Aug 2021 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629886993;
 bh=tL7vzePFTdLCCmodujY/NanR9r8e1EVRA9OUWU++xVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DkMlb3x15kaHAS5yBC0QcWkok6jr2m8aKitWs2fJ1cynennGpTOdO2D9WyftZpOjN
 6DhBQhwiwnZ7PJ0Rul1S8KYYHiUaut07duUFPBxRn1BWZPaWmkXMoF2suZAO51jY+i
 uM8I4cC1Vszj4WcPGx4NdzD7L7UTEbNxxcqEYMwd5HiNJv5ZbhljOkfMtcYDTwGFYe
 e8jKZNZ5shMo9ntlEj/sfnJmTKI5C/wKo5tN6QNOqW3+GpNeOrvfLIFKLN7gNgzTBR
 K1QwO6PVbIuD0H3nbOULPakzQ/q39tutsO3upYERzs6rj5c99dTczFtAJrHAQni8jt
 xXZKJvSkRRxMw==
From: Mark Brown <broonie@kernel.org>
To: CGEL <cgel.zte@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH linux-next] ASoC: SOF: intel: remove duplicate include
Date: Wed, 25 Aug 2021 11:22:38 +0100
Message-Id: <162988521424.7213.4488311947948918308.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210824030015.57267-1-deng.changcheng@zte.com.cn>
References: <20210824030015.57267-1-deng.changcheng@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>,
 sound-open-firmware@alsa-project.org
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

On Mon, 23 Aug 2021 20:00:15 -0700, CGEL wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Clean up the following includecheck warning:
> 
> ./sound/soc/sof/intel/pci-tng.c: shim.h is included more than once.
> 
> No functional change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: intel: remove duplicate include
      commit: 0be10d7122ceb8f322086283420a59ee89c1947f

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
