Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 785DE7D85B4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6C7B868;
	Thu, 26 Oct 2023 17:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6C7B868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698333197;
	bh=cxODEnMO4778yY18WaIb5R8VLHNJEiwUh5aRzxmJgNc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q+4r5sWThJPx44h0dGemq87O869EuX09sJMXEMdhhWSTI8wVrb7YgqsBESV0Zkq3y
	 vqRbQe8PNPvGJgAQZSeoMXmTTRi0AsXODNRpMNa+AXivmLB2IGjErDPfF347/92B/T
	 dbCNFtGg5xYM1teN4iqIOpQPdZC8Imq+QGr/5Ysc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6D80F80152; Thu, 26 Oct 2023 17:12:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45510F80165;
	Thu, 26 Oct 2023 17:12:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E0DF8019B; Thu, 26 Oct 2023 17:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7954F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7954F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=At/OXXwc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 33303B80BA1;
	Thu, 26 Oct 2023 15:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28133C433C7;
	Thu, 26 Oct 2023 15:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698333132;
	bh=cxODEnMO4778yY18WaIb5R8VLHNJEiwUh5aRzxmJgNc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=At/OXXwcPSr7L5TiGR9U+5gydhYj7ahmCUdWL/Xstax0T8JOoqYsL243KzWxAG+zC
	 WqMB7ebYD2nV7xOVIXthxnYGCyoczvhy8i2slBEs04ZCpwc0oi7UAUeU/QdfYHBOOu
	 CSxn8/JWdvHg7B12oUUpJeuiGTg508YOVawrl0vNBkoZd8XYl4FxEKM+Us5GiytmM3
	 8bLUEx4xZHE0NDIBSJEsJz4P3AeNNvfOOESZO8ysbISeCQb09vqAJMEWPhwDOnv139
	 EH6m7u87kR8gEENrqAumKuLshQiC/UF6NHAGz93TilvoHXQIApdLCAGm0nRmdEuZ/Z
	 Q0rL2hTSpqB1A==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 Su Hui <suhui@nfschina.com>
Cc: zhangyiqun@phytium.com.cn, amadeuszx.slawinski@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <20231020092619.210520-1-suhui@nfschina.com>
References: <20231020092619.210520-1-suhui@nfschina.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: add an error code check in
 skl_pcm_trigger
Message-Id: <169833312844.133649.16742223419669591458.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 16:12:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: RZB2U2N53JHHGK2CEP5DDL6RAWK5LRVX
X-Message-ID-Hash: RZB2U2N53JHHGK2CEP5DDL6RAWK5LRVX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZB2U2N53JHHGK2CEP5DDL6RAWK5LRVX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Oct 2023 17:26:20 +0800, Su Hui wrote:
> skl_decoupled_trigger() can return error code like -EPIPE if failed,
> add check for this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: add an error code check in skl_pcm_trigger
      commit: f5c7bc7a1fad4e1e8d3d29d71dd9f430a3350f42

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

