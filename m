Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C687930CB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 23:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C011827;
	Tue,  5 Sep 2023 23:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C011827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693948369;
	bh=Q1U6uSWrlH82eN0YVnMByCnfj3MNmP02H9LidepCqWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JM3zCiRV1a1oP+EYEctbd10ImPl00FN4kNk9ktGUWabXW3yJBf7fhsw5VSTnenfSt
	 T+QsRwKY0CClO9bTzCv4n9iUL1iIan6di461wfII6nNf2hEC4UHEwa5ljJ8g4mcxfz
	 MqI13MMX367dHKKgvCAmISxu2dL0UxpFFxuGyouc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35AC6F80552; Tue,  5 Sep 2023 23:11:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B00CCF8047D;
	Tue,  5 Sep 2023 23:11:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0548AF80494; Tue,  5 Sep 2023 23:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D062F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 23:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D062F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eggIkVMh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 15676CE11E0;
	Tue,  5 Sep 2023 21:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630BCC433C8;
	Tue,  5 Sep 2023 21:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693948273;
	bh=Q1U6uSWrlH82eN0YVnMByCnfj3MNmP02H9LidepCqWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eggIkVMh14/fmvJUrs2T0uck51q1Q/NIYpDtVBOOXok6PNF71ivBB9sXumI+hEhNb
	 9zYcOS+JzuJoafkgsYHs6DJ3inCw/PlanCXbsvLndUMF2uFsSpuwWWKeVK9AiQ6KBV
	 AKQ2QI/WufeNEQzTFzafXzZ0T/+lsz7T5WuhmSSFB2DA5P4InpVtM8B5mpIyAkXSJ1
	 CafglTpGMN8TboIR4UxqS6/rATLmVCQWTd6CSMavWM4T0P6aYHcev1mhf56puhVdGr
	 NBF9cNSoVFxqAW2ZJIgJvJjo/7YKtVj1jeDms+xoV6I3xDGhrVn3PN9rEzQEK5SOpO
	 JIucxFtEVBW/g==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230905093147.1960675-1-amadeuszx.slawinski@linux.intel.com>
References: <20230905093147.1960675-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Provide support for fallback
 topology
Message-Id: <169394827210.66320.2567381596027639066.b4-ty@kernel.org>
Date: Tue, 05 Sep 2023 22:11:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 45HDRK2ZXR2KGHELIJRPQEB3V5QJECHA
X-Message-ID-Hash: 45HDRK2ZXR2KGHELIJRPQEB3V5QJECHA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45HDRK2ZXR2KGHELIJRPQEB3V5QJECHA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Sep 2023 11:31:47 +0200, Amadeusz Sławiński wrote:
> HDA and HDMI devices are simple enough that in case of user not having
> topology tailored to their device, they can use fallback topology.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Provide support for fallback topology
      commit: 739c031110da9ba966b0189fa25a2a1c0d42263c

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

