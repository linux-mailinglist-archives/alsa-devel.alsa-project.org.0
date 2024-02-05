Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3284A01F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 17:59:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948C2846;
	Mon,  5 Feb 2024 17:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948C2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707152384;
	bh=KIiF0znJX7pu7g5ceO0tvUe1EFCxoVX/gkYbJJRRHKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AM4eghgeoi7jalS6oj6KzS7qU+d+SOhOEI3ZXkanwtirm0zI3hhBsLLqVsYtLW5Fr
	 IPOkTj/o3lzT8g0fY47kTEhxsdo/r7d+ehcFcCjEO10r5Jyzub/q7jKbDI/8F12exZ
	 PYbZ9pQiwxwlpW4i1EmVedLlKDdTD3trX7hC5p9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F64F805E5; Mon,  5 Feb 2024 17:58:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 551F1F805CA;
	Mon,  5 Feb 2024 17:58:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3DBDF804E7; Mon,  5 Feb 2024 17:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CED0F801D5
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 17:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CED0F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tSR0Uwba
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 28051CE0B13;
	Mon,  5 Feb 2024 16:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377EBC433C7;
	Mon,  5 Feb 2024 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152322;
	bh=KIiF0znJX7pu7g5ceO0tvUe1EFCxoVX/gkYbJJRRHKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tSR0UwbaPhOpSQXBC9TIaf6XsaKaS2DV7Nek+GLRfy+qvfPkfqmzeZkZYz+A0rAWw
	 TDtDxke2RV+Gt9O0AEVSN1/MA+QRog4AYq2lL2Y3sJK2ApeYw9YnrrDRVTKIL0V9Ad
	 2/NCXi6+o3r3N6rmx1cDekNnPdSFDPlhmQoUVmSSM3ecDNqrPSKFfZVPX8ckC+YJIO
	 PnZb8cgpWNO3+1hyJAGGCX6mCvG/joBymfDzJvENt3lLbJyrPZdujNPBBCdILHpVn8
	 CjjZegW1wvImvwpmz+pPORMc0I+tKkdP/g2rO+/vVin/FJ6SnDAw8kySASokwv0C9c
	 bJ7Br/F6SOTyA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240202114901.1002127-1-cezary.rojewski@intel.com>
References: <20240202114901.1002127-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix pci_probe() error path
Message-Id: <170715231987.801804.1736027462162326166.b4-ty@kernel.org>
Date: Mon, 05 Feb 2024 16:58:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 36AVSVV6V7OQ6LYUAGY3PH2NJDNJVJJN
X-Message-ID-Hash: 36AVSVV6V7OQ6LYUAGY3PH2NJDNJVJJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36AVSVV6V7OQ6LYUAGY3PH2NJDNJVJJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Feb 2024 12:49:01 +0100, Cezary Rojewski wrote:
> Recent changes modified operation-order in the probe() function without
> updating its error path accordingly. If snd_hdac_i915_init() exists with
> status EPROBE_DEFER the error path must cleanup allocated IRQs before
> leaving the scope.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix pci_probe() error path
      commit: b5fbde22684af5456d1de60758950944d69d69ad

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

