Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2F98C4E4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 19:55:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A13857;
	Tue,  1 Oct 2024 19:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A13857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727805310;
	bh=rdu8NL5WsUbn5RMyH5goYyYCtyogitFe8oO28rlRcqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kRMN/K2sD9vqg7feypYgGNkBoepT3LRplGc1//1tNd7unIEsQyRwOIzzbY4vuiYhB
	 25qDDs7pD4h4EQ8dqbS+o4qbH4JW2llTdOyoQt744QqVxcRTm72wzlk/Rca1NQzrJ7
	 9Z//bKOfcpwtpiR/9/ntNUlacIv4oukawKW0UuFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3564EF80684; Tue,  1 Oct 2024 19:53:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4776F80672;
	Tue,  1 Oct 2024 19:53:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE1FDF80607; Tue,  1 Oct 2024 19:53:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1153DF805FC
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 19:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1153DF805FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YPdfC79h
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A3235C5540;
	Tue,  1 Oct 2024 17:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2E8C4CED4;
	Tue,  1 Oct 2024 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805201;
	bh=rdu8NL5WsUbn5RMyH5goYyYCtyogitFe8oO28rlRcqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YPdfC79hXynqOy6fqk+1igGWO6rDMl9Qwbgxz+pLRV+KsqlSINpcEXz8AL3o+DrE1
	 WVjuiPQ7fDK/wT9XH5kFNT6+1uU0JH9eU8U52UbPQ3HGGFL0PsyTvrNf8cCMvAFwvD
	 GGlraLP/Cskkcw1eOqLOrg6WXfR5xUJMNGj9slMQs/RHwXGeDJT2LO4gAxp94vRln7
	 7GRv8VPjkJtpdnpiB1u7WE7rkwvF/bsmc8ojt4G+T7VlWUGcOE5n6QHUj5LjS6rPjZ
	 mcpyesdwEY93ZjPlJIU2Nmw5/0iEprULsI96UVXngjhMqdeqthc06bF/lDwWQpDdKw
	 p4p8UwV0hAIiA==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Hongbo Li <lihongbo22@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
Subject: Re: [PATCH -next 0/5] sound/soc: fix some macro definitions and
 usages
Message-Id: <172780519925.2298697.9944176143649696918.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: BLYU34FV2HO5O2M6AIKD7K3CVV52FXND
X-Message-ID-Hash: BLYU34FV2HO5O2M6AIKD7K3CVV52FXND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLYU34FV2HO5O2M6AIKD7K3CVV52FXND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Aug 2024 15:08:10 +0800, Hongbo Li wrote:
> Many variable in macro are not used as we used macro_check
> script to detect and mamually check, let us address these
> issues.
> 
> Hongbo Li (5):
>   sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
>   sound/soc remove unused substream in macro soc_component_mark_pop
>   sound/soc remove unused substream in macro soc_dai_mark_pop
>   sound/soc remove unused substream in macro soc_link_mark_pop
>   sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
      commit: ac9fc25f114aec07e7f5348606c9702f8377f44a
[2/5] sound/soc remove unused substream in macro soc_component_mark_pop
      commit: 5687851e484bdb22fa565578e0b046a50d502941
[3/5] sound/soc remove unused substream in macro soc_dai_mark_pop
      commit: 7215afbd8c090a3254f8cadabb550adf1c00547f
[4/5] sound/soc remove unused substream in macro soc_link_mark_pop
      commit: 2f12d0de77b99f0f35755d16efeb12e6f45e5710
[5/5] sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC
      commit: 7a01e17e42fe944982acde1dd40bdea177372173

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

