Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1331A899060
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 23:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E142CD0;
	Thu,  4 Apr 2024 23:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E142CD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712266209;
	bh=uX/FefJ4JYkPTBG/D2ssJWr5b5+Urj6OYi/6/YubfV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oYC3EeiLZxYDGa4wRlYnicXJOmm2QRCsI6GMLpFT3p7Mo0GROalPczFHpINIxBO3e
	 oDl0T7t7BShhtkyhQRDnNmss03Wzx+vFVTaSFZLkrzTNEDZfdywOrWdDTFAjB/+YBD
	 fH57FngJuLkmWhVHAMjY4WdXXaQbm6gtZVSkRg8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED41F80578; Thu,  4 Apr 2024 23:29:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F84CF805A0;
	Thu,  4 Apr 2024 23:29:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1587DF8020D; Thu,  4 Apr 2024 23:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D79FF80130
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 23:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D79FF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AhzV83xX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF6126175C;
	Thu,  4 Apr 2024 21:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA51C433C7;
	Thu,  4 Apr 2024 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265346;
	bh=uX/FefJ4JYkPTBG/D2ssJWr5b5+Urj6OYi/6/YubfV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AhzV83xXjP0IKWgHm9lZm/vWx+biK1Lv4aZhc7DYrU42bOmgfqiiHsTHLybJpuD5m
	 vuUmvj7lPhock+aZax6SwH0O7jMuk8QkCQLl6cOohAhrIEXD8cqBNghs62RVl0wU6M
	 KUB+Se3qQZDNrPL5c/2oJ2lljG1D7VdZF+uKIlt4hDRSD4ihqkaAiLgHVuWgx8sKN0
	 GpDvnbKTd1Dye0UDI+hkrEK0Kp9fWsE4uwgXlCDM/1PLaP7PgpuOJEmwSQrkloEKyD
	 2QidfZMFIXkNcq1T62fVwyZsS79ppP7bLxTKSLMr0nW6BQOEQvxwfDE6Sb5smOuK18
	 rhFZf8RlC3iYQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20240404184813.134566-1-pierre-louis.bossart@linux.intel.com>
References: <20240404184813.134566-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Core: Add remove_late() to
 sof_init_environment failure path
Message-Id: <171226534441.231632.18370880660879691313.b4-ty@kernel.org>
Date: Thu, 04 Apr 2024 22:15:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: UD3QIZVPXHBBFE3O2SHQK3DQ6OBTEKX2
X-Message-ID-Hash: UD3QIZVPXHBBFE3O2SHQK3DQ6OBTEKX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UD3QIZVPXHBBFE3O2SHQK3DQ6OBTEKX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Apr 2024 13:48:13 -0500, Pierre-Louis Bossart wrote:
> In cases where the sof driver is unable to find the firmware and/or
> topology file [1], it exits without releasing the i915 runtime
> pm wakeref [2]. This results in dmesg warnings[3] during
> suspend/resume or driver unbind. Add remove_late() to the failure path
> of sof_init_environment so that i915 wakeref is released appropriately
> 
> [1]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Core: Add remove_late() to sof_init_environment failure path
      commit: 90f8917e7a15f6dd508779048bdf00ce119b6ca0

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

