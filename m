Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696236CC024
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 15:07:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1D21F0;
	Tue, 28 Mar 2023 15:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1D21F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680008840;
	bh=e0on/ajK/K7eTP8ZnOWGHOWj2oiKytDkWpqgnUGOMrw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BBSl6jzoGzsmzvULVn71nT/Yk/zI4j4T+tfwLnnMa1rK3h+byVzizJp1MBWbW+mYY
	 U3BcoHZIpinm1g8if8sAjlTFNldUGF3+RU1sT3WXJZ+Hu8YJNUfcjVXjudY/rf8nP3
	 8rr9922X387w+i/Plo44g0YmfWnbThd0eepPqCL0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9325CF8024E;
	Tue, 28 Mar 2023 15:06:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4ECCF8032D; Tue, 28 Mar 2023 15:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 229B6F8024E
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 15:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 229B6F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WGp5Yvr0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97A60B81C19;
	Tue, 28 Mar 2023 13:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3482C4339C;
	Tue, 28 Mar 2023 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680008781;
	bh=e0on/ajK/K7eTP8ZnOWGHOWj2oiKytDkWpqgnUGOMrw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WGp5Yvr0it8ocFsSmyLLXoiDdqeG7S4/DH7hfALM+uokqcZzD4pMMoVP+4/YNTevc
	 kg13S6Dqtps6hRkv7x7zqUja8s9GPlEkoANhHqoUdfMSI1dDERtKX+prXfw11l0W5m
	 FB6N/tza1DGBJPUIfyaaQ+q/P/eyyWv7Wa9LKiLKjRROMEwzjhmo2aKGG63HVKUQVY
	 S7TSgTrHKDToouEEEIYNsd0NIbmOUn97eyndxwkfVm1d1DeWdb+aq8XApPev36Le1H
	 tuKW8VY6e3ofI41mqfzb4aemeipthPS3pMGZyhxXJU3ql8oCn1bCsE5x2cUVsXxYxE
	 mKJQd1iVctcyg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mt3xg2tk.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt3xg2tk.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: da7213.c: add missing pm_runtime_disable()
Message-Id: <168000877970.3186216.8522973646599551190.b4-ty@kernel.org>
Date: Tue, 28 Mar 2023 14:06:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: 7VCP4DGAVBQ4SWGJRD4MFAF35EL7BGJJ
X-Message-ID-Hash: 7VCP4DGAVBQ4SWGJRD4MFAF35EL7BGJJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Duy Nguyen <duy.nguyen.rh@renesas.com>, Khanh Le <khanh.le.xr@renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VCP4DGAVBQ4SWGJRD4MFAF35EL7BGJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Mar 2023 00:03:03 +0000, Kuninori Morimoto wrote:
> da7213.c is missing pm_runtime_disable(), thus we will get
> below error when rmmod -> insmod.
> 
> 	$ rmmod  snd-soc-da7213.ko
> 	$ insmod snd-soc-da7213.ko
> 	da7213 0-001a: Unbalanced pm_runtime_enable!"
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7213.c: add missing pm_runtime_disable()
      commit: 44378cd113e5f15bb0a89f5ac5a0e687b52feb90

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

