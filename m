Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD18728DF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 21:42:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD9A93A;
	Tue,  5 Mar 2024 21:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD9A93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709671371;
	bh=sze64vVYedfBh6VlJbl59BjYZBFydyCqCR9/3XGZ4aQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ey9dTTX46pI3VSy+QBA6Xzl6eCmW0X3JYR85Lecr/NPcxOvTqF2nhsLkFl4yF3q3D
	 kfNhMQmlO9GHOSpXA0AA3IdxDSOXhMTqIQD1OBhUTR7cLPufl3EzqYbZvQWz4ck5kk
	 QPWWx3U5OHJsFRN6EE7cQtSYb45i1lOAgZC+pgPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD63BF805BA; Tue,  5 Mar 2024 21:42:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90402F80588;
	Tue,  5 Mar 2024 21:42:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F37F802E8; Tue,  5 Mar 2024 21:42:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4407BF80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 21:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4407BF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=daopmgxO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8F60CE1F5E;
	Tue,  5 Mar 2024 20:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31243C43390;
	Tue,  5 Mar 2024 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709671318;
	bh=sze64vVYedfBh6VlJbl59BjYZBFydyCqCR9/3XGZ4aQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=daopmgxOkXu0SOaxRTeBhHxdhmk8c+Yz1YxOzGXNhCCqV4YtMHKSP5e5UjtsON6ZL
	 qNyNNAgeCSd/6RZ1W3HvCtvhOm3bD83w8NU9kpfMg1Ieq+O5z9K2GTivRhONV5kQjK
	 jfyPP53vg93JsfIltd9GeBb6h/cI5ouvLS/956ouI9OgFcVeAbT20zrkvArQN/6+R3
	 vIHJdtXkVABHE3G8UH8TsCO+ZfJnlODKCABxsL5SucwaB65Lt4MpbmqIv7GCbH9fdx
	 BSd0oVZMIM7Tt8p2Qa7X6WTfmNp00faeKOaZnaYkDDrKj7w3xiY1mh7wtjmps+G7XL
	 DpAJ0cInPItzw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240304143705.26362-1-rf@opensource.cirrus.com>
References: <20240304143705.26362-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v3] ASoC: cs-amp-lib: Add KUnit test for calibration
 helpers
Message-Id: <170967131688.228819.10804344071690892747.b4-ty@kernel.org>
Date: Tue, 05 Mar 2024 20:41:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: PEVZP3C2CGXKX7MCU3G3HHG3SF77AE26
X-Message-ID-Hash: PEVZP3C2CGXKX7MCU3G3HHG3SF77AE26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEVZP3C2CGXKX7MCU3G3HHG3SF77AE26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Mar 2024 14:37:05 +0000, Richard Fitzgerald wrote:
> Add a KUnit test for the cs-amp-lib library. This has test cases
> for cs_amp_get_efi_calibration_data() and cs_amp_write_cal_coeffs().
> 
> A KUNIT_STATIC_STUB_REDIRECT() has been added to
> cs_amp_get_efi_variable() and cs_amp_write_cal_coeff() so that the
> KUnit test can redirect these to test harness functions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib: Add KUnit test for calibration helpers
      commit: 177862317a98adde284233aee074fc6e6a51cf95

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

