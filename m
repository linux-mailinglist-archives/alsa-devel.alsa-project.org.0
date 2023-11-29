Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D57FDFBC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 19:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7456FE0F;
	Wed, 29 Nov 2023 19:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7456FE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701284031;
	bh=LliqbgxjKYpSYGdZMjsSOOuB0sDOwoVDfmuEIACbwik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L/S34JkA4zAm4s5sYx6NPef/Z1NJk1jLrlBwZcli9EshJRRwkPTFHHrrxKWez4FSX
	 XmreXzmXNxMOfuxtavnHF/eWzW1hQQLmzycpZNAwyGyavQYGzOE+vSjbNGm2Ttm6MY
	 Jlvhm7Gs92qW/EzGZH+E8SsACYvMgTisy9vzEmls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B2B7F805BB; Wed, 29 Nov 2023 19:53:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEF8F805BA;
	Wed, 29 Nov 2023 19:53:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0795AF801D5; Wed, 29 Nov 2023 19:53:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F72AF800F5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 19:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F72AF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nIxjqBW9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0C884B83F7B;
	Wed, 29 Nov 2023 18:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7216FC433C9;
	Wed, 29 Nov 2023 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701283978;
	bh=LliqbgxjKYpSYGdZMjsSOOuB0sDOwoVDfmuEIACbwik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nIxjqBW9nyiCjFaAlME1wSR3Du5UIqzmgUEWsOu7pkPvXbAOdftDqLXrbqPvxEzZO
	 VMmA2zKro4yZnCpdxLN7z4WK5JHyp5zYmFuBCMMglRLDrxuxZ3JX7DjtR16fX5M5W5
	 N4snDmoPhxUkIUojzVlLlJq8LRPEZayULrMEWUCIW7ag4KK9u4rEMVh/oepC9wLOSH
	 G9tqEIbyizebX86HXWWmEdh4Bq0FTimT/GoNEGBvm8Uw6TDLiyx68WsGuZDZG0hnXI
	 JOopuF5eGANQEFZOYz1pLtMqzkDZVzhaG/tDrqKHBx8fWqwVt/bP2NfNTLtaM58sjs
	 Iurym8X42Byng==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 baofeng.tian@intel.com, chao.song@linux.intel.com
In-Reply-To: <20231129122234.14515-1-peter.ujfalusi@linux.intel.com>
References: <20231129122234.14515-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add module ID print during
 module set up
Message-Id: <170128397618.290371.4030404060053783635.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 18:52:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 4UILG2GTQKE3OVO5TY4KHLJH6L5S5CWK
X-Message-ID-Hash: 4UILG2GTQKE3OVO5TY4KHLJH6L5S5CWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UILG2GTQKE3OVO5TY4KHLJH6L5S5CWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Nov 2023 14:22:34 +0200, Peter Ujfalusi wrote:
> This module ID will be used for module performance automatic analysis
> for different modules, module name, module ID and module instance ID
> will be combined as a new generated ID for current module, this ID
> will be further used by analysis tools to identify current module.
> 
> Take below case as example:
> 0x030006 gain.11.1
> 3 is module instance ID, 6 is module ID and gain.11.1 is module name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Add module ID print during module set up
      commit: 8f464a410944650adc8d75c7711d7d56c5506da0

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

