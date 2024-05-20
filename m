Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290E98CA2B8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 21:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0038200;
	Mon, 20 May 2024 21:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0038200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716233284;
	bh=heBPNyLYMv8R6LBJX6UZFrWUSwJLJR/VKe8VcBYMUcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mrBtBtw8r7Us/s+/r1zlPZePLABzLnOpTcCr9cu+c0EvZw/h/FFkw8NQpzqB+Sd0B
	 /g0eDDQU4AhrWf/IWZ+FUER/NjGg6kW/8bzipWeFh9n94cxXiyAb3CgFEh08D/vmr5
	 4C4s7wG9+Z9HF6jGJB4QEKe2KlKrjSvEZ4hyKKH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD3EF805CA; Mon, 20 May 2024 21:27:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9E1EF805C4;
	Mon, 20 May 2024 21:27:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9E4AF8026A; Mon, 20 May 2024 21:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FB28F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 21:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FB28F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mnd9u+8X
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52D4CCE0CDA;
	Mon, 20 May 2024 19:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A783CC32789;
	Mon, 20 May 2024 19:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716233227;
	bh=heBPNyLYMv8R6LBJX6UZFrWUSwJLJR/VKe8VcBYMUcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mnd9u+8X4gLHHC/bHqUgzkQRfAcDGrKZRYYz7dyB8mD+yGPsmsrXkT8ZUGngI3jvo
	 hrWWzCAuvOexV30seGB1LAuEyQDED85cKXG1Zzk1zQ6fz04kQOujB2MfamY/QHOkq4
	 QnVnOLmAbtHu/FvQ4ZWqg0WdSRVmh1pPb4HuOdxpTwn0X2bG4YPnqJxGZrt1ex1pZa
	 DGW/oyElu1CIXZNCnvfxKgTofarjCjNZKUbeRfvvE09wddYCcHOL99XS3PpDN0XNAb
	 wE5M0MxPTkOqpjocO0eBc9uvVpP2cTbj2CmVm/bkb1Fe4CEhoVcXCVp2k6qs7HO3qy
	 a5y8PSOckcuHg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, bard.liao@intel.com,
 yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
 cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
 Baojun.Xu@fpt.com
In-Reply-To: <20240518141546.1742-1-shenghao-ding@ti.com>
References: <20240518141546.1742-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v6] ASoC: tas2781: Fix wrong loading calibrated data
 sequence
Message-Id: <171623322336.94469.13172149100331733795.b4-ty@kernel.org>
Date: Mon, 20 May 2024 20:27:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-621fa
Message-ID-Hash: CRQ5UAEUI7XYAJ7OT43K5NTDALLAIBHY
X-Message-ID-Hash: CRQ5UAEUI7XYAJ7OT43K5NTDALLAIBHY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRQ5UAEUI7XYAJ7OT43K5NTDALLAIBHY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 18 May 2024 22:15:46 +0800, Shenghao Ding wrote:
> Calibrated data will be set to default after loading DSP config params,
> which will cause speaker protection work abnormally. Reload calibrated
> data after loading DSP config params. Remove declaration of unused API
> which load calibrated data in wrong sequence, changed the copyright year
> and correct file name in license
> header.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix wrong loading calibrated data sequence
      commit: b195acf5266d2dee4067f89345c3e6b88d925311

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

