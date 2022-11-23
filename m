Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80541635B4E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 12:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04582166D;
	Wed, 23 Nov 2022 12:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04582166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669201903;
	bh=rrNxR5ISeIq3KhbFFVYi0iH63rB1BwTTTqojMGQk8PM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stJ61ovaHrImu1UONSTImq0Uio1EtTZQ1MdgVbup5D4upwu19szkUWovmzWz4YLso
	 jkUicKLlQLAKHCVMbzzqjAKM7GsPnHItXv+Paowsw6f/9KiB8pjouREXKtX7yrHQZm
	 LhqbGCn/eNsf/j7J4DsSePwtNjhcC4zJlsQovpHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817CCF8030F;
	Wed, 23 Nov 2022 12:10:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20A4DF8025D; Wed, 23 Nov 2022 12:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD82F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 12:10:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD82F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qFpMkvQ5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69B62B81ED5;
 Wed, 23 Nov 2022 11:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09057C433D6;
 Wed, 23 Nov 2022 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669201838;
 bh=rrNxR5ISeIq3KhbFFVYi0iH63rB1BwTTTqojMGQk8PM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qFpMkvQ56AKM/1Px34GDWKYWVpbXRslWiPgdBX6SOE69yUc4strz8UZ7V/Tiq6+P/
 ZQ3cCzFR2QvqC9mbV2RGuXYv6JjCe19RHSmvx7wzbeQ8Fy7+rjLOkCDN7lGVOU3+Nr
 CzVGXWf9uas/nfZZ9S75saWcEn1AkPO3TLo5PixReOs6mxtWdXzEP6c24EQS1Flo58
 n+PhaHxiQwr/HE+SJl6RxoWxuy1avHnwZALaCnvBQRnRGFBjQfnCZ7OijM9AzaY4yC
 aM3cD7N2OuNuRPHGOgnMuxe6NdURwA9VxpCWXEUdOdoOIHjYK67Imh3jZjjbqXv8JK
 P6H5PBxftJV0Q==
From: Mark Brown <broonie@kernel.org>
To: Alicja Michalska <ahplka19@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <Y3wHyJ/EcsLRHGr3@tora>
References: <Y3wHyJ/EcsLRHGr3@tora>
Subject: Re: [PATCH] ASoC: Intel: avs: Add missing audio amplifier for KBL
Message-Id: <166920183573.41208.573078873604313006.b4-ty@kernel.org>
Date: Wed, 23 Nov 2022 11:10:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: cezary.rojewski@intel.com, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On Tue, 22 Nov 2022 00:20:40 +0100, Alicja Michalska wrote:
> KBL platform is missing the definition of 'max98357a' audio amplifier.
> This amplifier is used on many KBL Chromebooks, for instance variant
> 'nami' of 'Google/poppy' baseboard.
> 
> Reported-by: CoolStar <coolstarorganization@gmail.com>
> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Add missing audio amplifier for KBL
      commit: 0848e94c3954051e1a52bb088240ed63758b309b

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
