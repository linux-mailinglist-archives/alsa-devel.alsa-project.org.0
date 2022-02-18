Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679964BBA9C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 15:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9945174E;
	Fri, 18 Feb 2022 15:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9945174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645194591;
	bh=QIhhSf+LNnFkR0oPqDauJgbg11+0+JGmV4ABpoWiHVg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNbVyEdZaqdc+jxAPi/BFBdPcluUAC9hSLOdzjCHNs8yHfv5qn4VBORXbp1//e48z
	 t7rUC090OWOQPkZWrUNHjGL/Onxjd+Zkd8ZvWUv2EUi6+LHtiILTeVWimv7ugqHxny
	 /PJ7G80o6ZJJKFIzoX6/CYjhFjY1f5dksvstda7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 450F8F80154;
	Fri, 18 Feb 2022 15:28:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C7FF8013C; Fri, 18 Feb 2022 15:28:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A36DF80118
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 15:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A36DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="asICOcEc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEF79B82657;
 Fri, 18 Feb 2022 14:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AE3C340E9;
 Fri, 18 Feb 2022 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645194509;
 bh=QIhhSf+LNnFkR0oPqDauJgbg11+0+JGmV4ABpoWiHVg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=asICOcEcJc0EYX8Pm0VJqHru/j2mEDfmmf7UF5lkNEREMyQ/KTtmNyg+E2jhCPTov
 B8WZF4sfK9nrMFzv2niVzfyDHN8GG5nkvz0WqK1hfB+Km0SvYFwl3LPJfYb231Hpj/
 NOfomnM6LHPJFB/BBOVc2uz69WIES5yKKfkkKXBz36nTPRmdWVGy4HW1bAG2kWMPUz
 iI26wPcVWWW7qHggyxVmH3Vr/tiPG75Q1ETPq0rxU4Lq87FGtBzxOgbJDdzpN+9Y5u
 EQvceqCUm3dhyKFk8oxCy0gdd52c/XxJHrq8cvKX1+qMY/TqHb5X5hjdrsgsj4NSJO
 S9WGi/0uoyQRw==
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cover.1640351150.git.mchehab@kernel.org>
References: <cover.1640351150.git.mchehab@kernel.org>
Subject: Re: [PATCH 0/1] sound: add quirk for Huawei D15
Message-Id: <164519450743.1836505.3912962145996830275.b4-ty@kernel.org>
Date: Fri, 18 Feb 2022 14:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Huajun Li <huajun.li@intel.com>
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

On Fri, 24 Dec 2021 14:09:48 +0100, Mauro Carvalho Chehab wrote:
> Based on my tests, Huawei D15 (Intel) uses SSP0 on es8336.
> 
> Add a quirk for it.
> 
> Please notice that, currently, only the internal speaker is working.
> The topology for the internal microphone and for the headphones
> is wrong. Enabling/disabling the other two quirks (GPIO and/or DMIC)
> doesn't cause any audible results, nor change the devices listed
> on pavucontrol (tested with pipewire-pulse).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_es8336: add quirk for Huawei D15 2021
      commit: ce6a70bfce21bb4edb7c0f29ecfb0522fa34ab71

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
