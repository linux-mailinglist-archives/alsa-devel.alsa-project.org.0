Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5FE6AC168
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:36:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADEF910FF;
	Mon,  6 Mar 2023 14:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADEF910FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109774;
	bh=R177uYY6mvxRYbjNCfnnzXRYxdvJ0wojHJvA+A863CU=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gCMNfxbzi8Hueuiyxty5GI71bK41Tivd/lSQznj3yh5eqy38W2XAL7BfIPYr3bNJv
	 ds1JGQ74YDqH9ZES0R484MOKw4uGlY1v7gBs7Mf89GcIZ+qpsuYVH8/deq0SUiRbCs
	 lqgChTX5jxn6b8XXF5D3aOvi1hmkkvhOryCMJbIg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59296F8057E;
	Mon,  6 Mar 2023 14:33:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABC69F80542; Mon,  6 Mar 2023 14:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAD3AF8053B
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAD3AF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kINryn0t
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BEEEB60EB8;
	Mon,  6 Mar 2023 13:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B385FC433AF;
	Mon,  6 Mar 2023 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109536;
	bh=R177uYY6mvxRYbjNCfnnzXRYxdvJ0wojHJvA+A863CU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kINryn0t2eNAfs9p4u+AOuEhSjBg0+++WUaPEHOUglTCBc0Ksx/Ljuqqc7LX3Auvh
	 fbwavwLG4Vn5/+KVfubQzr+DfO0px167fhUR95nocTDBzJNjLjZ/qwBf60YmJKwvZc
	 PT+/+moBSjQlTY/GMD6rRF5Ih53+uKT1tSTpnmQq2D5+Xz4TswbYrYYzcg+62AiS6Y
	 9mPgBSKZhQxfIuDKolO5CR7NJCHU+Wp7mkwgxIs/GzRi76xRfQotUWGjAtl/W8eXiH
	 ukWBiY5XTTXB6rgfGB/x3dkwl8wX8mFFM1JmYeU54HRoj2oziZT9DU4XTISYkEPADF
	 7tezPaIiRDOsg==
From: Mark Brown <broonie@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20230303180457.2457069-1-jacob.e.keller@intel.com>
References: <20230303180457.2457069-1-jacob.e.keller@intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: Use struct_size for struct
 avs_modcfg_ext size
Message-Id: <167810953545.75807.13111430917361237669.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:32:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: XAMBFXCNSLIOWFYXV6JWK4AD4QRT43Z6
X-Message-ID-Hash: XAMBFXCNSLIOWFYXV6JWK4AD4QRT43Z6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAMBFXCNSLIOWFYXV6JWK4AD4QRT43Z6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 Mar 2023 10:04:57 -0800, Jacob Keller wrote:
> The struct avs_modcfg_ext structure has a flexible array member for the
> pin_fmts array, and the size should be calculated using struct_size to
> prevent the potential for overflow with the allocation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Use struct_size for struct avs_modcfg_ext size
      commit: c9ef0fee3bdf8197538aadc728e475fceba113bb

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

