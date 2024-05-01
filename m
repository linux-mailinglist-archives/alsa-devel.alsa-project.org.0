Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6758B8B70
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 15:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04556F50;
	Wed,  1 May 2024 15:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04556F50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714571089;
	bh=TkInIQ2LBuICjPUJzoUZLuS/i0Pe8RU9a1IrIQyiQTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l2LAm4Z3iQqQFWMEnVt9OZ+Dg2OEIj7mPWSkYRWMjlVICcvYErPY6r6jsLql45DFt
	 M3dFh884kOwhb1JCKproylmwDCdtVf8LvMnvmv1N8o+SgKgDgole8wLiVh71cNRCJq
	 z88WHqZFuAgktDAdlAOM5znIE6mZ6SfFKENiMJgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16BD3F805F7; Wed,  1 May 2024 15:43:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E73F805F9;
	Wed,  1 May 2024 15:43:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32A2BF8058C; Wed,  1 May 2024 15:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E8F2F80269
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 15:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E8F2F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TxeuHYro
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5037ACE12DD;
	Wed,  1 May 2024 13:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7132C4AF14;
	Wed,  1 May 2024 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714570998;
	bh=TkInIQ2LBuICjPUJzoUZLuS/i0Pe8RU9a1IrIQyiQTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TxeuHYrosur0Zzw3zWeNT1Nm/4di2ITwb9K5PtUyKT49Le1lDVn5t3zoV9hWB5uU6
	 GH6TWN9pzGyjDH2MmvCS3ptSxKF6voJFKPftOJhCYt/yJOY9xqz53eAzn06U6yzVWo
	 zXu6+XPajtP4zdzxnVGpmM8nDLfDey29PD5g4AyVYASZ7YIAzA38Y3Wgt3+f8BxDAl
	 KY3THJan+y7+ZpCOHvqSZGxSEZFOaqvl73w3QlXNrSVyi4rUVZUi+ClmVI9nb0veB8
	 0zKBS9ezpVWsz+S42fFkZsnGNcwrYy0YaPDZaKgPKIV+r6bWcf0Jw1UFz1QL++WI7q
	 ugAqyg2qk0kEg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: avs: PCM code cleanup
Message-Id: <171457099714.1888704.1435214977574502288.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 4E4K5OGUNRGIMNA7H2AWA55LUFW3CFVI
X-Message-ID-Hash: 4E4K5OGUNRGIMNA7H2AWA55LUFW3CFVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4E4K5OGUNRGIMNA7H2AWA55LUFW3CFVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 11:57:25 +0200, Cezary Rojewski wrote:
> A set of changes that aims to improve readability of cohesiveness of the
> pcm code for the avs-driver.
> 
> Start off with a change that synchronizes DAI open/close - DAIs are
> started up in ascending order yet their shutdown does not follow the
> scheme - it is done in the ascending order too, rather than desceding
> one. This patch is a dependency for the next one in line.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: pcm: Reverse iterate DAIs when shutting them down
      commit: 31a70a71b3a730aa703bbd05713d21115dd6d33a
[2/8] ASoC: Intel: avs: Relocate HDA BE DAI specific operations
      commit: 140df6d4d5f541e950a35cad2e3dffb49186ed74
[3/8] ASoC: Intel: avs: Remove redundancy around DAI shutdown
      commit: b9d59f970ea7772957f6da02ca1ba272ef4495b8
[4/8] ASoC: Intel: avs: Store pointer to adev in DAI dma_data
      commit: c303a994e5d0f7d297cb6ac56052dce8f412ee67
[5/8] ASoC: Intel: avs: Remove redundancy around DAI startup
      commit: 3a48d146aa761bc591272bc453eda64743128a31
[6/8] ASoC: Intel: avs: Remove redundancy around DAI prepare
      commit: 0f8843ca4f6cbf0efb8c2d5516a3b92fb2771a04
[7/8] ASoC: Intel: avs: Store pointer to link_stream in dma_data
      commit: cdcb770a60e8e6b9fbb737ebe21b2daadaba1744
[8/8] ASoC: Intel: avs: Clean up hw constraints initialization
      commit: e85e75b67993c1fb0c80306783c31266261170d4

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

