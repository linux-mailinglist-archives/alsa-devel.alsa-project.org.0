Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB5691074
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:39:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D2A6DF3;
	Thu,  9 Feb 2023 19:38:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D2A6DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675967960;
	bh=HrpKAMSDmyqGpv909f4Wp0VRsW+bh5HO23xF+LPWN/I=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PH/dudfoGgJ/wanD7LBBY81PtQzYLpdhT0qAf8DQ7QCpqILjoT1dhDNQFCPcdIfP7
	 bwPzOwr3gfFpuvX2XxWeRUp2Gw7I3f6ComBUs5j8WTSKBm/+kGmltzv3GrO4O+C2/O
	 CTIZm3Z7HhDN+woov8TaFUI/rtE1pwBk/ii73TeY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5E0F80564;
	Thu,  9 Feb 2023 19:36:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9924DF80553; Thu,  9 Feb 2023 19:36:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F824F80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F824F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rfRQOYmO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A29C961B7C;
	Thu,  9 Feb 2023 18:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D511C4339C;
	Thu,  9 Feb 2023 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675967785;
	bh=HrpKAMSDmyqGpv909f4Wp0VRsW+bh5HO23xF+LPWN/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rfRQOYmO9XCI4v3FoSpeQjG36syBE8DO/87YATHQyQmZT0IdNLp5Rc1zJm90xs/Kc
	 YV52OPC5GJNR+iIOEEXeCiTyT1Nc8KDyJ2VMfKlXhNPg/9E7fKMJ77lWw2zDzdAr/3
	 Rvma0Hb/oJUoKVpwiTp5HB7v7ExxSDwGrOnkeKBJ37Q+xHmmfNsYJ/A0XwOpPAQZ/5
	 0HQRIThufx+pKN6+PXEZyLZHw3v8IciFqzmiN0MmIX+jlq9gT+3WaAG9VkTjP9nsKz
	 kQXf6cl6oNy0Bi2NkABP2oeA3tqSdzdEAJ2L4RByOLcsyr/E0BAi6FoAysC7OMuNA7
	 nWKYcZJIhNO/A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20230207090946.20659-1-shumingf@realtek.com>
References: <20230207090946.20659-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and
 Amp topology
Message-Id: <167596778330.879652.10581871492810651320.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 18:36:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: VJJVPTRJ6W457JVZJFFH5MEUBFFGUDNK
X-Message-ID-Hash: VJJVPTRJ6W457JVZJFFH5MEUBFFGUDNK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJJVPTRJ6W457JVZJFFH5MEUBFFGUDNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Feb 2023 17:09:46 +0800, shumingf@realtek.com wrote:
> This is the initial codec driver for rt712 SDCA (Jack+Amp topology).
> The host should connect with rt712 SdW1 interface.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp topology
      commit: 6c39710da75caabc5f459a3f73fbb7435b4000aa

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

