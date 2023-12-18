Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3A817DF2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 00:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DED8E11;
	Tue, 19 Dec 2023 00:14:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DED8E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702941284;
	bh=dwaaajvlQK+RoYnfVG+3t7HenD2yCmVctNtVdSjZIFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iVLWqOtDBktErtQ8wx4EepomwHKuJmPgoUYfEvWLsqLNTlXR4qaA27BtbncZaSQRY
	 TZycTOkzaZhUyA5sltXH0sI9xiOQbT7wU7xe9dOSDWKkDYvVczhIhPi7S/rg6O//nr
	 gCYIcs4akzH5OkequJYh9//HCzN+WkEiQqCFIqKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84097F80587; Tue, 19 Dec 2023 00:14:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB02EF8057A;
	Tue, 19 Dec 2023 00:14:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 967A9F80425; Tue, 19 Dec 2023 00:14:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5EEDF800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 00:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EEDF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qm2qaUbJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3719761166;
	Mon, 18 Dec 2023 23:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A303CC433C7;
	Mon, 18 Dec 2023 23:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702941235;
	bh=dwaaajvlQK+RoYnfVG+3t7HenD2yCmVctNtVdSjZIFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qm2qaUbJ/40YK3uGi4p6xy+nqAu4D9fLiqeMagrlDlDF7ZRg7L0lxIVoTG2KReFN5
	 Jsuh/TkZDy/BRJ6GXf2ntJRXTQ+pCpiJqusas8zrgrF3gTDic+Rjj+gz/9if0Cc4GZ
	 Js/hCp+IhHYn4h61cGPCdS8Rj+ROp6wQyKZMMh7iwTH2gsEDVwP8cQz8x+LYQHul9v
	 ioFq1K3gRY4urp4u8Z4lEVRvXoeHDFxnQQcby7S61TRwMSBKAVOwBJMKL71PaBnqaz
	 hvhAfq46Vw6omYIpWuno2bPBck2g7TlPuZKwVNvQj1su541KAWpQ/n/M8ynS/7nhk6
	 f2kBXWiMEfw5Q==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20231217213221.49424-1-hdegoede@redhat.com>
References: <20231217213221.49424-1-hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: bytcr_rt5640: Add quirk for the
 Medion Lifetab S10346
Message-Id: <170294123437.160555.15530673310757573225.b4-ty@kernel.org>
Date: Mon, 18 Dec 2023 23:13:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: JECZ4464SOGA5SS5JSNN7WEMGJ7RFX3M
X-Message-ID-Hash: JECZ4464SOGA5SS5JSNN7WEMGJ7RFX3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JECZ4464SOGA5SS5JSNN7WEMGJ7RFX3M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 17 Dec 2023 22:32:20 +0100, Hans de Goede wrote:
> Add a quirk for the Medion Lifetab S10346, this BYTCR tablet has no CHAN
> package in its ACPI tables and uses SSP0-AIF1 rather then SSP0-AIF2 which
> is the default for BYTCR devices.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: bytcr_rt5640: Add quirk for the Medion Lifetab S10346
      commit: 99c7bb44f5749373bc01b73af02b50b69bcbf43d
[2/2] ASoC: Intel: bytcr_rt5640: Add new swapped-speakers quirk
      commit: b1b6131bca35a55a69fadc39d51577968fa2ee97

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

