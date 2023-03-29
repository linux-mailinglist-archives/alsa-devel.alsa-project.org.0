Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4426CEFD8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:51:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7136A7F4;
	Wed, 29 Mar 2023 18:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7136A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680108702;
	bh=8PokWA7vbzRuUZwYlu85KkHqJXaMzEsP02sMayeBbW0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VxO96NEn7StMuozvqVgEbGsVQO4DgmrXInG9BMmpgE4NXD6noPrvgPN5+7yrZLEek
	 5ogXDUUyZwIxy2xGNCy1EiQkMRucyS28ZiP0m8W7ugfvxagCyk8GfEEsCrcmjuX4P+
	 WYHZXy5/ZNghMEfkjKLkjqzVgbATq+zmQ+ChX6Ms=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85DF3F80249;
	Wed, 29 Mar 2023 18:50:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28787F80290; Wed, 29 Mar 2023 18:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8EB8F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 18:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8EB8F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=azMSDg9h
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4436A61DC2;
	Wed, 29 Mar 2023 16:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090C5C433D2;
	Wed, 29 Mar 2023 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680108636;
	bh=8PokWA7vbzRuUZwYlu85KkHqJXaMzEsP02sMayeBbW0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=azMSDg9heTi0pw51OiaaMcXxUKKklFzKZz+Dyv1hWKxuZwvRTsfVEdQd62BvAiWH8
	 GRvcIIYs7KPmsTXGtDiod9D7Inyk9VQtJ9JXidoFBKMKMMZAYd9vRNPuMHlHPmnF+H
	 9ojSEW6AMJeOhWArapUORE2ngEcacEmaFJSiF7jiliKfmQtZ7cYGKAr3p8TxqnNFPp
	 Xp0imGUdRCZG9ZrBJweDXwaB2bw8erWVoQHipwf6WVKGlYsPnMiKbRLMrnwEGwJyQQ
	 BmTJQknWEZ5F9DHLYMK2Kqg9Ux+OZI701e2yr7AhR8q7Pk3OiNFt2UiIkT8xHFIxvF
	 gdas6E1/fOZiA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230329113828.28562-1-peter.ujfalusi@linux.intel.com>
References: <20230329113828.28562-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH for v6.3-rc] ASoC: SOF: avoid a NULL dereference with
 unsupported widgets
Message-Id: <168010863363.3244560.3817581008251520478.b4-ty@kernel.org>
Date: Wed, 29 Mar 2023 17:50:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: HK6OE7JYU5CVSPYP5JPPOAVLO2P7JZ3S
X-Message-ID-Hash: HK6OE7JYU5CVSPYP5JPPOAVLO2P7JZ3S
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HK6OE7JYU5CVSPYP5JPPOAVLO2P7JZ3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Mar 2023 14:38:28 +0300, Peter Ujfalusi wrote:
> If an IPC4 topology contains an unsupported widget, its .module_info
> field won't be set, then sof_ipc4_route_setup() will cause a kernel
> Oops trying to dereference it. Add a check for such cases.
> 
> 

Applied to

   broonie/sound.git for-6.3

Thanks!

[1/1] ASoC: SOF: avoid a NULL dereference with unsupported widgets
      commit: e3720f92e0237921da537e47a0b24e27899203f8

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

