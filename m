Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C06B0A2F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A63621843;
	Wed,  8 Mar 2023 14:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A63621843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283832;
	bh=1qHDXAPfeIDGfbQZ4Az3OcBZS/pxIN9eaZLE+fEbZrc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GDLLha4DoXa9weD5gMzz6cZ2hpIqyExWVhULurXIcGYu4kXu34f73Npkg7CIr9zvT
	 7RdWSpDdb9G1KeRbluOVVItDoDba9CbLfEOPpNvfrj1871J1qQTFeAGtSydFIhCEst
	 9g2+GdFzr/G9uPURrDXFK2edzRWcEvkRA9LhV0+M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5D03F805AF;
	Wed,  8 Mar 2023 14:53:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0F5CF8055C; Wed,  8 Mar 2023 14:52:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38B9CF80552
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B9CF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aiggGoTo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F602B81CE2;
	Wed,  8 Mar 2023 13:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9286DC433D2;
	Wed,  8 Mar 2023 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283570;
	bh=1qHDXAPfeIDGfbQZ4Az3OcBZS/pxIN9eaZLE+fEbZrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aiggGoToheQOpstoor7siv3+neiMLriC6zNJZYV7nVWgEDErD9XvFC5NMr4bSILRK
	 fPJog+mx65YwXIksPM3DiVG9ySSBO9QnwKFUvvhZFQ1f1NH9Ptm81OsFO8uLbbTgAB
	 G+Nk6V9YPgpu1jnQTWmwVnaVLpWIZND/pJajITTnTv0FYU99J8tOTCWYzIJZctpaUN
	 MLTke7LpocuLdS+c+iGzMt0BJL9e73uWVCIC4Jt3wm2pyqLASk3+AoXOGaMIXEH74R
	 B5s3k1NIRNN+5PL+IJwRuosfqfCdtJfDhFgXbgsYPfUwousnSmRTxBZg9ULU+x7bbV
	 2EbTbgZEoIM9g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
References: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4: Add core_id support from topology
Message-Id: <167828356831.31859.5962788273455058922.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: NJOMA6GR4VKBXEPCI64OAMYIWGUI6G26
X-Message-ID-Hash: NJOMA6GR4VKBXEPCI64OAMYIWGUI6G26
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJOMA6GR4VKBXEPCI64OAMYIWGUI6G26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 14:35:53 +0200, Peter Ujfalusi wrote:
> The following series will add support for handling the core_id token which is
> needed for supporting multiple cores with complex topologies.
> 
> Regards,
> Peter
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: ipc4: Add macro to set the core_id in create_pipe message
      commit: 11f45690b3f6c6a2b5c57dbb036df3f838f7c016
[2/3] ASoC: SOF: ipc4-topology: Add support for core_id for pipelines
      commit: 05ade472278a1a2fccc465ace205d6cfa9b521d5
[3/3] ASoC: SOF: ipc4-topology: add core token in each module extended token list
      commit: 755ddc3acd50ca70e46b032c5c4a078e7b1b7d46

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

