Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227E6B98B4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 16:13:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED55D13D5;
	Tue, 14 Mar 2023 16:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED55D13D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678806826;
	bh=sxY6IxxMJjTgL2d12zQJvjYKpWV410MnU3SAB376tMs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uCwZvRbUNgTWa+vSRqOPtOkMRZe8eqyMnb4XMHB6qG/QBm0UwyF9TVOtIdIQtJPCC
	 POZfPaDgfi6wHhtMMAjnjvSVTXeecPWRf54oBgRz9vvehGnR87pSHzplVZs0bRuPPI
	 IG/MbM3Sm9EJXySs9D1Sv0HGWk5TPBf+8KSfnGtU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16B19F80527;
	Tue, 14 Mar 2023 16:12:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66A9DF8052E; Tue, 14 Mar 2023 16:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B850FF80482
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 16:12:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B850FF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BIkvb1tk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4E71617F3;
	Tue, 14 Mar 2023 15:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFA0C433EF;
	Tue, 14 Mar 2023 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678806750;
	bh=sxY6IxxMJjTgL2d12zQJvjYKpWV410MnU3SAB376tMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BIkvb1tkqgaqoJ2kMN88PmRGoAVh+8P8pG/6JwKfvl9aQzynROahhfTno2HHd5E59
	 ZZyHCB7vWo0V9z37KrGHmWuCIZneJf9AeOShmqJTcBhM8qrwwONZPN9slIHfs7EipP
	 sExPbIOu0+9OFrzY7Ks28xOnbPeJIjASYGbZUdxXQOz+ZlsAX0KGPBrNlxsrkJeEMe
	 YgRh0vvcG4UgYKS+ecq1Jjrq5ovc+XHB/Gmq3QMwS1u2CTkxyMBSe/JqXje6JGyqlr
	 dsRlBc3ZjGiksH4muW1leqd1SbYAgVt+NbCVC8QED3Fv+yS7F4Jzw9GXhbapjs6T+2
	 6cGkltsWV09xg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
References: 
 <20230310184201.1302232-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload
 on adl_rt1019_rt5682
Message-Id: <167880674689.43040.10505944947157085015.b4-ty@kernel.org>
Date: Tue, 14 Mar 2023 15:12:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: MO7ZCQEHQXEKTVTMLJFGNTU7XG3WKT2J
X-Message-ID-Hash: MO7ZCQEHQXEKTVTMLJFGNTU7XG3WKT2J
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 dharageswari.r@intel.com, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MO7ZCQEHQXEKTVTMLJFGNTU7XG3WKT2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 11 Mar 2023 02:42:01 +0800, Ajye Huang wrote:
> Enable Bluetooth audio offload for drv_name "adl_rt1019_rt5682" with
> following board configuration specifically:
> 
> SSP0 - rt5682 Headset
> SSP1 - alc1019p speaker amp
> SSP2 - Bluetooth audio
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on adl_rt1019_rt5682
      commit: 12e3b2848bfa8197062b7989eefb7c081d372fb8

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

