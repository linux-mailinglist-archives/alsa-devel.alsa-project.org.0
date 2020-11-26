Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B712C5CDC
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:09:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BADAD1805;
	Thu, 26 Nov 2020 21:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BADAD1805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606421348;
	bh=UklVA1LH/Kbt7UtCaRn39x9hXxYPjhMvm7//ZgnTsJ4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0vXtcPZuYQrTRwsbw4G0JNeFpFYklT44woQaAZqy5FMX+zcPowZjyMmG6hzcG7AA
	 hiBS73KPWEH0K1KbQCUl7z9nCEagl3vAV64FLFTqnb+T5f7/uGWPtEXJTfW4FYMUiu
	 Xj3nJmfF/Sgr2gHeMWXeiXfDQzoBah7pP7B8KA2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46784F804E5;
	Thu, 26 Nov 2020 21:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06DCF804E1; Thu, 26 Nov 2020 21:06:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04139F804D2
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04139F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TN1iWHrk"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C98A221F7;
 Thu, 26 Nov 2020 20:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606421170;
 bh=UklVA1LH/Kbt7UtCaRn39x9hXxYPjhMvm7//ZgnTsJ4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=TN1iWHrk6XnR5ZEC6uubc2A4YImQvUpQ9jE6tvCBv8MfJ8HfubHXBRsOZWa+p3ElQ
 D5yM76MZFfVJj6Ry9yeZ0jCrUl8L2qVb+zpe3sP7lqH27mGRgtPwCNzbNlEjwus51N
 8T5t9Hfh5vfPvWaFDhayzjdZcVFebs3Dvc5oTlHA=
Date: Thu, 26 Nov 2020 20:05:45 +0000
From: Mark Brown <broonie@kernel.org>
To: "shumingf@realtek.com" <shumingf@realtek.com>, lgirdwood@gmail.com
In-Reply-To: <20201126092759.9427-1-shumingf@realtek.com>
References: <20201126092759.9427-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: change SAR voltage threshold
Message-Id: <160642112479.9090.10011334176435039154.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 flove@realtek.com
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

On Thu, 26 Nov 2020 17:27:59 +0800, shumingf@realtek.com wrote:
> To fix errors in some 4 poles headset detection cases,
> this patch adjusts the voltage threshold for mic detection.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: change SAR voltage threshold
      commit: aa4cb898b80a28a610e26d1513e6dd42d995c225

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
