Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F67A2CF6
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDA4EE98;
	Sat, 16 Sep 2023 03:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDA4EE98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826959;
	bh=pykjoQuGQaVivMRRrqZi4uwsGsGeIzi9rCjAbb4C5mk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t7lvgQQGE8qkUtGLG+e/H6YHVGJFRsU47QVkalaRsJ0UY9hoG5Dl4LkXF64UnPbo+
	 m6EQ85lAUSh1ow7TNm4T6Ne5e63DafsHkQguXc9htBcqAvHFkqFm4dbOO2W80O5c3v
	 Jm0hvhzltpybbzW0zIqG/C3XLyp67MLZ3+/bzpqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB676F805FA; Sat, 16 Sep 2023 03:12:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E44F805FA;
	Sat, 16 Sep 2023 03:12:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46CB2F805D3; Sat, 16 Sep 2023 03:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 903CEF805A9
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 903CEF805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TCkj7Cc1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 125E2CE2E4D;
	Sat, 16 Sep 2023 01:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC131C433CA;
	Sat, 16 Sep 2023 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826708;
	bh=pykjoQuGQaVivMRRrqZi4uwsGsGeIzi9rCjAbb4C5mk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TCkj7Cc12MrrEfJZWFqQvPTM3mJuBssh4oPX8K9zSkxkGTO4ahVWl67tj2OuECfCc
	 4LbAVhbl6M8lgSZLRSMGJDMkfoZA5l7HO13BmO+Z/YskgUcHYUaQcRBwvOttEXsCyF
	 xAUZ3deVXTTIJog1Ej9wLHn3f7eC98U8IABMUoOtY2AX5jVkFtJ9hL/Gfd7b1wDZrL
	 qOSWRTD8wsPrpPWF82q8TEgLIzunt/ruaz+cvGN0wvMxoBQxiSZOodWk/5rD5yWW6D
	 eNbGpPYfGd2gvPzI4IPYqzvhE9wPumOTLgN1F/cfiwLVMuPUspyAPq9Jh5kyZzw9at
	 K9d3gBkzMHfcA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20230915134153.9688-1-peter.ujfalusi@linux.intel.com>
References: <20230915134153.9688-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: MTL: Reduce the DSP init timeout
Message-Id: <169482670668.606223.14208020206388216636.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: O7OKJMLDNHOC3ODKULZ2QHKFDG5KMNNC
X-Message-ID-Hash: O7OKJMLDNHOC3ODKULZ2QHKFDG5KMNNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7OKJMLDNHOC3ODKULZ2QHKFDG5KMNNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 16:41:53 +0300, Peter Ujfalusi wrote:
> 20s seems unnecessarily large for the DSP init timeout. This coupled with
> multiple FW boot attempts causes an excessive delay in the error path when
> booting in recovery mode. Reduce it to 0.5s and use the existing
> HDA_DSP_INIT_TIMEOUT_US.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: MTL: Reduce the DSP init timeout
      commit: e0f96246c4402514acda040be19ee24c1619e01a

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

