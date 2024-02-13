Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B286854007
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 00:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF1BEB1;
	Wed, 14 Feb 2024 00:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF1BEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707866671;
	bh=cVB0ouQDPy5ygm5QzJjPDylrMnOO/mLpWOWbxzBzNww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lP2QX6Uu3+vodS7MXMmu4O2LlY0xUZIxIBxmwKEW7zGiK8Ty6kHY6+sAXyNoi5IVw
	 HB/sP51yhdGgzRVaeUembS2xCP8T96Sz1lVc5uKeGTMY8l/u92xjxgB0ZqqEfxOb+p
	 n5dMFag1ExdCQQQrWyoOvsQKJvabhgNd2J7dqhaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52560F80589; Wed, 14 Feb 2024 00:24:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 951ECF8057F;
	Wed, 14 Feb 2024 00:24:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17D49F80238; Wed, 14 Feb 2024 00:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46496F800EE
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 00:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46496F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aqh09BEg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D231E61735;
	Tue, 13 Feb 2024 23:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9501CC433C7;
	Tue, 13 Feb 2024 23:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707866624;
	bh=cVB0ouQDPy5ygm5QzJjPDylrMnOO/mLpWOWbxzBzNww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aqh09BEgg0yQXxTYlV2WyI6pjKy7CkoypAwcJyEvfQLdWiASXnK6+Snq6zfzrvoJL
	 0q8KSjT5rULNQJn+Sx9NHcBKb6ERq9ihrX6A9lr7ALCvImXcEXRyemEXrNvXnnsJcv
	 mjC2e7AntJkusUy5EI/UVbJvi5l2lzhkSBwsoYLkXL+iogi6Llgn9TgcDYqWRAPyZS
	 cmNis6tjfNbR0ysXSBBkf977KYLJthJodqyK+tBT3a12oiUBnXEcZM5tR09wh0Kqwm
	 HMAl9XIhSTOynMK5t3BEsSZms1FIkuB0GBGY354uOdvgUWl8EC7dbFNdOBhlNsOuNQ
	 effzgn9xXB7dg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240209111840.1543630-1-rf@opensource.cirrus.com>
References: <20240209111840.1543630-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Workaround for ACPI with broken
 spk-id-gpios property
Message-Id: <170786662332.1076782.7482522938030150798.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 23:23:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: 2XTMOSJZYFKZWYKPUXTCT3KITSVR6LGA
X-Message-ID-Hash: 2XTMOSJZYFKZWYKPUXTCT3KITSVR6LGA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XTMOSJZYFKZWYKPUXTCT3KITSVR6LGA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Feb 2024 11:18:40 +0000, Richard Fitzgerald wrote:
> The ACPI in some SoundWire laptops has a spk-id-gpios property but
> it points to the wrong Device node. This patch adds a workaround to
> try to get the GPIO directly from the correct Device node.
> 
> If the attempt to get the GPIOs from the property fails, the workaround
> looks for the SDCA node "AF01", which is where the GpioIo resource is
> defined. If this exists, a spk-id-gpios mapping is added to that node
> and then the GPIO is got from that node using the property.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Workaround for ACPI with broken spk-id-gpios property
      commit: 0db0c1770834f39e11a2902e20e1f11a482f4465

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

