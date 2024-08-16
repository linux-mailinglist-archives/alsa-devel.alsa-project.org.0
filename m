Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A88954CA1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 16:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05CC2BFF;
	Fri, 16 Aug 2024 16:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05CC2BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723819391;
	bh=7TGuegKZbNzPtsJjymQhdPwGEn/Vab/BwE8qKh95Wgg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ANLamx9hJSL2wXa4t2g9RQHojzniNq204ZALpEiED5kJn+SJVhykDyTPD8gTrAwJa
	 /heQj2aBfFokr/UrGtrFsUfPMGA4suJbKJMJ0dZT45sHQKWBHpPDW/i+H+htMCvyj1
	 tNIYNP5ZaNkderGwXZK8HzO7y2+1SJw/RqxnMEPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 776A3F805AD; Fri, 16 Aug 2024 16:42:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D55C8F805A1;
	Fri, 16 Aug 2024 16:42:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B42F8F80423; Fri, 16 Aug 2024 16:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEAEFF8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 16:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEAEFF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MuUyvOcM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91C73CE1887;
	Fri, 16 Aug 2024 14:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B975EC32782;
	Fri, 16 Aug 2024 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723819334;
	bh=7TGuegKZbNzPtsJjymQhdPwGEn/Vab/BwE8qKh95Wgg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MuUyvOcMDsHWUrm7QvhhQqvro+LQqyCCLtoq7e/dnIDNs7Ge4iNH4ULEHf0WqL9PP
	 O934GIwYW9fDE3Sn9MBNTIQLbOpQUcqdIxzUpXoEzgIjp35TyfizY4kWtPCyBr7QxH
	 C/dHz+7T9ViDG57XAee5lEsvnaY/UG/u7pXQ/L9urDWHfWxPHmdGrdn20JYE97yrmV
	 1Ry5gDafPO9GPQHEBBz897IPJfKF+3HlD2KGTl91fz/HYpAsdFgMDaea1vJUD4YSOJ
	 tmAgqtnuDjihRLcPRwGosNM2BMjg1IyRa4k8fKxK5D+oGSXhomvVOqgbzzYg9zr0Cp
	 vOqm2LAdFNk2g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, cristian.ciocaltea@collabora.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240816070328.610360-1-Vijendar.Mukunda@amd.com>
References: <20240816070328.610360-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Fix for acp init sequence
Message-Id: <172381933148.65490.13739657424123950336.b4-ty@kernel.org>
Date: Fri, 16 Aug 2024 15:42:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 7LRFZOYJP6I7UPBTZNXI5I4DKJR46ZZN
X-Message-ID-Hash: 7LRFZOYJP6I7UPBTZNXI5I4DKJR46ZZN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LRFZOYJP6I7UPBTZNXI5I4DKJR46ZZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Aug 2024 12:33:28 +0530, Vijendar Mukunda wrote:
> When ACP is not powered on by default, acp power on sequence explicitly
> invoked by programming pgfsm control mask. The existing implementation
> checks the same PGFSM status mask and programs the same PGFSM control mask
> in all ACP variants which breaks acp power on sequence for ACP6.0 and
> ACP6.3 variants. So to fix this issue, update ACP pgfsm control mask and
> status mask based on acp descriptor rev field, which will vary based on
> acp variant.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Fix for acp init sequence
      commit: a42db293e5983aa1508d12644f23d73f0553b32c

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

