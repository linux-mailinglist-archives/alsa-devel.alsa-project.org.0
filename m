Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A79BD76A425
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 00:28:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C1E820;
	Tue,  1 Aug 2023 00:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C1E820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690842505;
	bh=eTwdcbysjbn6rcR3c4nOy+ZCFxizPHnkvqF1+9/kS50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eXZRKfwKfgi6Zl2eBP28PzTIXqt2jtZ8UbXsj6ruIsIFftnCJJqIR5D9hFx9mqJ6j
	 JqrWe59PdmwQzpbu6lqCRIR4vuIyIP2mRaCzXXXfASAng8TXwSE38G1uXeoxIpozjw
	 UOK+5S5VhSQ6H0t7edCTHrI+VWLLLjgVRGwDTHrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE39FF801D5; Tue,  1 Aug 2023 00:26:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 466C4F801D5;
	Tue,  1 Aug 2023 00:26:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEBF6F801D5; Tue,  1 Aug 2023 00:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FA11F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 00:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FA11F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hRJrNSJq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34781612D0;
	Mon, 31 Jul 2023 22:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1FEC433CA;
	Mon, 31 Jul 2023 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690842393;
	bh=eTwdcbysjbn6rcR3c4nOy+ZCFxizPHnkvqF1+9/kS50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hRJrNSJq7QiWqgmwZKQpWBDLLeHf0O2BQ9ABQY9Q+KgEjhQhVby5iLD+jjWKU9sZO
	 vvRyeDqib5GuoKP5e7+wLLFWJnvVG8klF48vafQqdc8h/Tt+FN9mSJUNvy7WTHW610
	 J4T6QsMsr/UU4LZz2vP6cAkSLtLxUinOftpJXbp9xEZbp44EfofDcK65HDSKEYH0d5
	 brYiuiWBV5rAr7VFNiazRlFcox9W75pFpIvAZre3Mv5r7ufLZ6AVqwszBZ9xDbgbdY
	 awkP2NBtUG0HIsUFY7+/GK0N48f16ofyPNFoXdAeWmxkpZ1/8GQp1MqAZQsFY0XyhJ
	 Td0APpdpUs+Cg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Yong Zhi <yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>,
 Uday M Bhat <uday.m.bhat@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230731103419.2536036-1-brent.lu@intel.com>
References: <20230731103419.2536036-1-brent.lu@intel.com>
Subject: Re: [PATCH v4 0/1] Intel: sof_rt5682: remove quirk flag
Message-Id: <169084238942.576259.13368835067308367459.b4-ty@kernel.org>
Date: Mon, 31 Jul 2023 23:26:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 3PGDDNAS5G2WGLKLS2GUIH2ER57D5FL7
X-Message-ID-Hash: 3PGDDNAS5G2WGLKLS2GUIH2ER57D5FL7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 18:34:18 +0800, Brent Lu wrote:
> We add a helper function to detect amplifier number according to device instance
> in ACPI table so the SOF_MAX98390_TWEETER_SPEAKER_PRESENT flag and a dmi quirk
> for 4-amplifier configuration could be safely removed.
> 
> Also refactor the max_98390_hw_params() function to use an array to handle the
> TDM parameter.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: maxim-common: get codec number from ACPI table
      commit: 36eb986845a8ca87c1f7f91976fad53ee249ae8c

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

