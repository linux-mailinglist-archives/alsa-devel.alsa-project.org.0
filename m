Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F35D8696C42
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 19:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 352A486E;
	Tue, 14 Feb 2023 19:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 352A486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676397852;
	bh=dUe19tSYbtHHQHGVLNkH/nW0hzw/qJlYedk2XWbjBJw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qbgrNZEVqq5hA+kJCwRKTeLP75c0eYQ7LqpTxgNJwk75UhYJCnOLrNJ7mtglWHyzk
	 ruxI9XjRaeOkxhFUjje+1NrkR+R6Y3RsmWILipbE5lur/JDgrUf7L2l6hSzR13IyMx
	 164sY+oiGIR4P+NqO8HQBJttuUumHz5HVaNkE9NE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07617F80552;
	Tue, 14 Feb 2023 19:01:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC5A9F80549; Tue, 14 Feb 2023 19:01:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F3EDF80529
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 19:01:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F3EDF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h1Zj4zyS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56C4F617EE;
	Tue, 14 Feb 2023 18:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A05C4339B;
	Tue, 14 Feb 2023 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676397707;
	bh=dUe19tSYbtHHQHGVLNkH/nW0hzw/qJlYedk2XWbjBJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h1Zj4zySnc5/E+rL6FcdvKBb8YYd0O26CUY7ZPb/83NeV69MxLpMX69mKZCgSs32M
	 2VBDx3w7EuQowXlpXNaQI636g2ejh1LOrvGA7jmCEayTwusl4LokL6oJu//wjbr8Vu
	 BrP4WwNfO2PoPI4BjFnt3VxMOhSb9nlLH2hoB/rg7FStwxy/9RuXRUNCugUAqzx9mq
	 3Z1zQCOhlB+CUg6OAC9GYmkx63/ElynWnalB80u/E8Js7q7WSmwMwGs0JOZ587+YUs
	 T4me7YSiCCUJaIZQLCry7nbjMSwG5b5C4H3UI+TW27Ygw26uQzjWi/jr0lOsPDxtNo
	 65R3iGwScKETQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230213205223.2679357-1-amadeuszx.slawinski@linux.intel.com>
References: <20230213205223.2679357-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix struct definition
Message-Id: <167639770341.3067697.16431524980433199487.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 18:01:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.0
Message-ID-Hash: DJH3U4R2OV3Z47TDIXEMHGDM6HGNHPYN
X-Message-ID-Hash: DJH3U4R2OV3Z47TDIXEMHGDM6HGNHPYN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Sasa Ostrouska <casaxa@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJH3U4R2OV3Z47TDIXEMHGDM6HGNHPYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Feb 2023 21:52:23 +0100, Amadeusz Sławiński wrote:
> The kernel is globally removing the ambiguous 0-length and 1-element
> arrays in favor of flexible arrays, so that we can gain both compile-time
> and run-time array bounds checking[1]. In this instance, struct
> skl_cpr_cfg contains struct skl_cpr_gtw_cfg, which defined "config_data"
> as a 1-element array.
> 
> However, case present in sound/soc/intel/skylake/skl-topology.h is not a
> simple one as the structure takes part in IPC communication. Apparently
> original definition missed one field, which while not used by AudioDSP
> firmware when there is no additional data, is still expected to be part
> of an IPC message. Currently this works because of how 'config_data' is
> declared: 'config_data[1]'. Now when one replaces it with a flexible
> array there would be one field missing. Update struct declaration to fix
> this.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: Fix struct definition
      commit: 1fd61d018aefc9bf366fd73eddc868163f2ed7da

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

