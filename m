Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4507F1D3E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 20:19:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C2F5BC0;
	Mon, 20 Nov 2023 20:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C2F5BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700507970;
	bh=j06BuuFm+JMAFgBv4pra+sWaWElq3RAU0IqrIOtdgg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lQmgJh3FKz81ln0VwkYGHIO6Zz44BSScLplb6pKfLdEjt+0oEUV2k+dKIumWDVp26
	 2J5+Hl57GCLNAsc81avRu3+RUqA4FWKNk9sqVAOqxu4xVL2XlXGokCekFTQzVPwD1b
	 TNQBm9CpuP9bv0C5MT59UeGPkO8rtutmJLM4rozQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F643F8057A; Mon, 20 Nov 2023 20:19:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC27F8055B;
	Mon, 20 Nov 2023 20:19:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03DCDF80310; Mon, 20 Nov 2023 20:19:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F6F1F80249
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 20:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F6F1F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TSlNZY5d
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA66361480;
	Mon, 20 Nov 2023 19:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DFAC433C7;
	Mon, 20 Nov 2023 19:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700507933;
	bh=j06BuuFm+JMAFgBv4pra+sWaWElq3RAU0IqrIOtdgg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TSlNZY5dLL0aWTx5yWgFDonGBMRY4LB9UryaSoU+Ae0/2k0AFYBJd9Ix60IuPHPPQ
	 eZh6zdjsJ/ZoeshQFbfLPRmf9LWKCodu6lJ/zbcN8mJRsrlqtJu8aZx9LyrDM0ox3X
	 k/okPit3L7AJcWCRiPND0FFDqYhD2WAlh94vLQ2T+xObb6tPNtm4jpJLR3CDNpRzA+
	 3dYFpywA88gU4Ckv/4TAcUG7968ZFnyX4gyhJIHiPDw63XkRHvmHMiEfLa8OMXSPSA
	 hDKVMT6mO5VMvJIKp5LDymu2KK+hwlJo08pjQ1aY3BO7flV8MtAPqUhQZPhjqmKJFR
	 vNoCQFQS0M3qw==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
References: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-Id: <170050793178.1294254.1258854570735859586.b4-ty@kernel.org>
Date: Mon, 20 Nov 2023 19:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: GBAJMSGW46W2EVIZ6OKQDWVGDR6KSQNQ
X-Message-ID-Hash: GBAJMSGW46W2EVIZ6OKQDWVGDR6KSQNQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBAJMSGW46W2EVIZ6OKQDWVGDR6KSQNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 Nov 2023 14:17:34 +0000, Maciej Strozek wrote:
> Add a polling mechanism that will keep the driver operational even in
> absence of physical IRQ connection. If IRQ line is detected, the driver
> will continue working as usual, in case of missing IRQ line it will
> fallback to the polling mechanism introduced in this change.
> This will support users which choose not to connect an IRQ line as it
> is not critical to part's operation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Allow driver to work without IRQ connection
      commit: 009eab8baa4d46c2b20d0c2c1cbdba61c81829e4

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

