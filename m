Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA85972032
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 19:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29A6BB60;
	Mon,  9 Sep 2024 19:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29A6BB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725902367;
	bh=mMa4F2Ikpxl+0XWDHV62Rd8ajny+lL3xWQ2nZtgMGXs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kg6qT/+6YIgkV/AvARxzwrw8MRgi+LQmyUSEhfPPCeM2cQyT4usnG41f6pHwCYVGb
	 q0hb9h+i4vJd1RJSot1bnHkbFKc/6SKnawLwg+qX+WGtkHHq7Rb4DYpgVzoI32THkk
	 +VYXTslARH/Qqi9aZgQiI37yR4JClUHcx/7OrcGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B17F805AD; Mon,  9 Sep 2024 19:18:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92FE8F805AD;
	Mon,  9 Sep 2024 19:18:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99D81F8019B; Mon,  9 Sep 2024 19:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1C1FF80107
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 19:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C1FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cKXTNXXJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 34CBDA41B03;
	Mon,  9 Sep 2024 17:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E703DC4CEC7;
	Mon,  9 Sep 2024 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725902328;
	bh=mMa4F2Ikpxl+0XWDHV62Rd8ajny+lL3xWQ2nZtgMGXs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cKXTNXXJ+wCRMVeJpXJUj+lamG1WOtkAxx+hxoIRKIEEPmLUruNOIKNoXVnWIK1Tg
	 nGgi4theZDC1UgqAxfaQ4kvA0ooejTuByshEZ/Fn1Pu1ZE5ISsENdv3KpVzvjOHGrm
	 taEBdx70XuwkT3J+zyt7UnhqX8mrZJf+Q4w1zVfheMX3fnO000nB1meWA86w4aVpSm
	 4XH7B4cygUp77+Nvd+kX6hnTJI9i+1d6q7PbIapvgOlWZPSQALEXUbJj/mAtsUEUE5
	 A7VGRwzcv2FMFhfuAfapWLVvSufq+AHX06oGjJnq/ZvDiCr4Ksy0EPFVxcZ+EXytdV
	 ChcwUDp7jMb8w==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Romain Gantois <romain.gantois@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240906-tlv320-filter-v1-1-6955f53ff435@bootlin.com>
References: <20240906-tlv320-filter-v1-1-6955f53ff435@bootlin.com>
Subject: Re: [PATCH] ASoC: tlv320aic31xx: Add support for loading filter
 coefficients
Message-Id: <172590232308.1707146.7048822902174477472.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 18:18:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: CYZD76RPR4S3EWQPUPWG26AR7LZCNST2
X-Message-ID-Hash: CYZD76RPR4S3EWQPUPWG26AR7LZCNST2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYZD76RPR4S3EWQPUPWG26AR7LZCNST2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Sep 2024 14:20:58 +0200, Romain Gantois wrote:
> The TLV320DAC3100 Audio DAC has 25 built-in digital audio processing blocks
> (PRBs). Each of these PRBs has a static filter structure with programmable
> coefficients. Once a PRB is selected for use by the DAC, its filter
> coefficients can be configured via a dedicated set of registers.
> 
> Define a new optional firmware which can be loaded by the TLV320DAC driver.
> This firmware describes a full set of filter coefficients for all blocks
> used by the various PRBs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic31xx: Add support for loading filter coefficients
      commit: 77b696f489d2fd83bbcffeed363baac8f2f6ed4b

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

