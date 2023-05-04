Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1D6F63EE
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 06:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C789C176C;
	Thu,  4 May 2023 06:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C789C176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683173618;
	bh=sVrLPmzQDxx2YHWQ4ndV2++TdlJIKWvNV5OVPHXrFPQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W2GiHQFtp/Wtl/givEvxpU/DwsCFkaV7SqYymZ0fID/QPVgOgpO5TF59lthY/GlAI
	 Ca0tRgWQsP0tZS7jNQU/8citzrW3aW1qaB3xUEqH0H+J/pqN9ttB/lf81xcQsh668A
	 apPIEoUlAxGDBaN6W+POfZXQAJDArWO4zwgcRLxY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF5B3F8052E;
	Thu,  4 May 2023 06:11:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5DE3F8049E; Thu,  4 May 2023 06:11:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E88DF8032B
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 06:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E88DF8032B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VShnAdjx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 359FC6317B;
	Thu,  4 May 2023 04:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FDEC433EF;
	Thu,  4 May 2023 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683173455;
	bh=sVrLPmzQDxx2YHWQ4ndV2++TdlJIKWvNV5OVPHXrFPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VShnAdjxE2/1fReQf2d9pl0Qsh2mqT0ZeqK6nn0pALXULSqCNyAysYB2KJUI4nV0q
	 wSpFDeXkzd7uxD5x+jMIjVfaKUn88RZ57x0rBqICN7pW2lW4Id73eLDjLeNAz5MS2j
	 eVdknOboP2ybGaV/dEdzRcK6y5+8gFWeev308QjNyXXXaqx8FE0WVyK4A6jTm8zXRG
	 AQ2HrnjMUogKw23Ie9e4psPC0jiAQ8nJtdYcXUSzsFwUibFluZ3G52r7zFKmKZcxwZ
	 8AQBdPtG2h2d40cmRKN7B9J6w283EsqDT+B7UHRv24r8nFQzmVGwK/3UJks8+DzLPa
	 /BNYFQ1jcwubA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230429104721.7176-1-hdegoede@redhat.com>
References: <20230429104721.7176-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-cht: Add quirk for Nextbook Ares
 8A tablet
Message-Id: <168317345397.155442.10043087191778048606.b4-ty@kernel.org>
Date: Thu, 04 May 2023 13:10:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: EKYZLUYAN5QQJF3NWUS5PQUYOR42Y4AT
X-Message-ID-Hash: EKYZLUYAN5QQJF3NWUS5PQUYOR42Y4AT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKYZLUYAN5QQJF3NWUS5PQUYOR42Y4AT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 29 Apr 2023 12:47:21 +0200, Hans de Goede wrote:
> The Nextbook Ares 8A tablet which has Android as factory OS, has a buggy
> DSDT with both ESSX8316 and 10EC5651 ACPI devices.
> 
> This tablet actually uses an rt5651 codec, but the matching code ends up
> picking the ESSX8316 device, add a quirk to ignote the ESSX8316 device
> on this tablet.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-cht: Add quirk for Nextbook Ares 8A tablet
      commit: ec6f82b4c63cc68f8dc03316e725106d242706be

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

