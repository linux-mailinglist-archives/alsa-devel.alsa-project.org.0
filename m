Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37563C86D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 20:30:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1685216A6;
	Tue, 29 Nov 2022 20:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1685216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669750258;
	bh=BeE5qc6rSGiPBFfusrT3j3QSsYpDeWtQY7MiM+8hWAU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZGaxwkR+i5SNthLCXWagks9f9NgYj2RM3WtJfqJ/fJesBCoKA3se2YIOxrqf4rT/
	 20eKyN6He4qOminFZmCj+nfKe0yQSZrbhdQRbbB0gt7jdvk4zqbWIbcHlQ6aiQHcGv
	 5CD/XXj7vUX/dJH19IWqp8caeDD2Ixoy8ibkvDEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7B3EF80212;
	Tue, 29 Nov 2022 20:30:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F29DF801F7; Tue, 29 Nov 2022 20:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0D88F80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 20:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D88F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PktF+40B"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F77C618BC;
 Tue, 29 Nov 2022 19:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FF0C433D7;
 Tue, 29 Nov 2022 19:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669750184;
 bh=BeE5qc6rSGiPBFfusrT3j3QSsYpDeWtQY7MiM+8hWAU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PktF+40BshLN2Jck0QY0vQUeGXZQHM8VKgcI/r00WXh43Boq3sDrZjrBb4/ysnUz7
 cG3hIMp0ugJYwIp2DtQMCOod5EHbwAcvZlXbbZs/rIvFVS/Uxeb3dkF8/gbb8xWVf9
 Tupfpb3ukWrw4kIQQ0/bVI9oQJWCaw4z7PhAiu41YhRXtivJezIOIFOqC1x/+i73Qv
 Qy4zlEXUbtNcJYjYn0RN1NS3ElVMsCcnAxZec2FyB+qt5Ke+HivxcRtiviSkiKl6og
 JGT+bXfpKododE95/UryWH5i9exuoQzDgad581+/vgsS1b/zhd4PN8rbDWee/UP6em
 I7++M9MCDxVyA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221129180738.2866290-1-cezary.rojewski@intel.com>
References: <20221129180738.2866290-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: Intel: avs: rt5682: Refactor jack handling
Message-Id: <166975018341.386034.10131503521053753986.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 19:29:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Tue, 29 Nov 2022 19:07:36 +0100, Cezary Rojewski wrote:
> Leftover from recent series [1].
> Following changes are proposed for the rt5682 sound card driver:
> 
> 1) Move jack unassignment from platform_device->remove() to
>    dai_link->exit(). This is done to make jack init and deinit flows
>    symmetric
> 2) Remove platform_device->remove() function
> 3) Simplify card->suspend_pre() and card->resume_post() by making use of
>    snd_soc_card_get_codec_dai() helper
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: rt5682: Add define for codec DAI name
      commit: 19bb7c3053ee54fd7fa7635f680fba3969f4a026
[2/2] ASoC: Intel: avs: rt5682: Refactor jack handling
      commit: 93d519a12a83baa19dae59d121439b04fb9dfded

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
