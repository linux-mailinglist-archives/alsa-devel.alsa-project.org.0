Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B782BB86D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 22:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 495A4178A;
	Fri, 20 Nov 2020 22:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 495A4178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605908251;
	bh=odmZ1Pk1+WPAemNZJTmEzdXUMyqfjIKCcxSyfa0QEUo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CBirsAzPXyTIBONzn/ccegRD+N4nFBkHR55GOLKl11ns6X+ZrZd3Mjrxj4KATbfvk
	 0r+7sjLmOy6Bhxma5/W7VL4BEhJ47dv0fjL2Y/PVdIb333G2cZX1PY/6ROd/eZ1/el
	 iCW9TnY0hn6sqEqYPCZcV7nEGsfr9O8Z66Z8aYlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C608F80276;
	Fri, 20 Nov 2020 22:35:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41713F80166; Fri, 20 Nov 2020 22:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D83F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 22:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D83F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OcPB06ZH"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F3BF2240A;
 Fri, 20 Nov 2020 21:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605908143;
 bh=odmZ1Pk1+WPAemNZJTmEzdXUMyqfjIKCcxSyfa0QEUo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=OcPB06ZH2cjcMOIGJ4K2aSiQBpap/dxZmw6TyQPG0832dAfGtCoUhmeeplHAwNENC
 zy2n34rkuWTNoMbwlTHlzItb8SM6E8Qi0FXiLl09/RCzg4tlBy1BQv8IXv1CLsDSgL
 NjWAIwF5g8yTl7dB+8NDtGAdsbZHHwpF/m1PGPlQ=
Date: Fri, 20 Nov 2020 21:35:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201120144025.2166023-1-kai.vehmanen@linux.intel.com>
References: <20201120144025.2166023-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: IPC: fix implicit type overflow
Message-Id: <160590773743.47461.7997781753674999815.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Curtis Malainey <cujomalainey@chromium.org>,
 daniel.baluta@nxp.com
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

On Fri, 20 Nov 2020 16:40:25 +0200, Kai Vehmanen wrote:
> Implicit values may have a length of 15bits (s16) so we need to declare
> the proper size so we don't get undefined behaviour. This appears to be
> arch and compiler dependent. This commit is to keep the headers aligned
> between the firmware and kernel. UBSan discovered this bug in the
> firmware.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: IPC: fix implicit type overflow
      commit: 7c1d0e554a359cca77bfabd2a29b06f5322d172d

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
