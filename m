Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE2389358
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 18:12:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC64167E;
	Wed, 19 May 2021 18:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC64167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621440775;
	bh=cBo6C+YG1A2+z/9dPpDBcXdTvKA2FG6qEBgHgt1H5MI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6Z3Ygmg1pLEibh0N+fivOPbS3AAzCtD0LOEbkwW7fXsfAIGegSiApEPLDMOstzGm
	 H73mJepfc9uwqVL0qusS+cf8MMHmRMvXeP5nkPJksBRgGSzbHiwq6OyQJ5zvLVDJHN
	 mJZ8xPCgo4DygLRDOSjLFFamGHkA1yb6VLXOnP/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA020F80249;
	Wed, 19 May 2021 18:11:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B36BF8016E; Wed, 19 May 2021 18:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2A5CF80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 18:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2A5CF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iPaGs1da"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7097C611BF;
 Wed, 19 May 2021 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621440674;
 bh=cBo6C+YG1A2+z/9dPpDBcXdTvKA2FG6qEBgHgt1H5MI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iPaGs1da+vKNhtw8z+B0b/PLq7PgrS3MEv8Ylt5VHmunRL/HYJ6M4bsbIQI4fhOnT
 ZwhxGeBCLCIzicN+VJVTDvNsSUSj5vV7dcoc/SN8MzSHbebMX0JJF7SwhN7SKl+jY4
 jNYEmpbj2VG6Mng1Raf6NK7eY3Y6G8ICDMbeyRvvPkXiygQ6aePzI7hqCQZfCt2O+s
 mH/heePSVbSpCvZChpuDXs6ZxQbXoUO3vrdAO3vZECoCD3oSyooZDf0pifzhaM8SKf
 RaR092njomqqNlM0CWWFPlUM9bSj/PB6sDGM2nBBiQZYYa7LCdeu0kuXXY3SXnpia4
 rfHc6t3Gz1T/A==
From: Mark Brown <broonie@kernel.org>
To: Gyeongtaek Lee <gt82.lee@samsung.com>
Subject: Re: [PATCH] ASoC: soc-dai: fix up hw params only if it is needed
Date: Wed, 19 May 2021 17:10:14 +0100
Message-Id: <162144027324.37060.742692065226520457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <000401d748bc$fa466d50$eed347f0$@samsung.com>
References: <CGME20210514123052epcas2p37cb55a80e713340c1f2ee96c31ffa591@epcas2p3.samsung.com>
 <000401d748bc$fa466d50$eed347f0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 'Takashi Iwai' <tiwai@suse.de>, donggyun.ko@samsung.com, hmseo@samsung.com,
 s47.kang@samsung.com, pilsun.jang@samsung.com, tkjung@samsung.com
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

On Fri, 14 May 2021 21:30:51 +0900, Gyeongtaek Lee wrote:
> If fixed hw params won't be used, fixing up isn't needed also.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dai: fix up hw params only if it is needed
      commit: 8b4ba1d31771114ebb717523c2bdb5ea75b4dec8

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
