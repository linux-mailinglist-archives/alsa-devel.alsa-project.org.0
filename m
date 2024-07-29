Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57F93FD70
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 20:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28617E66;
	Mon, 29 Jul 2024 20:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28617E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722278198;
	bh=WZi2WB+ezf+8ZuZSA/9WSVZyOflnes8c4WhG9OHbKSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T5ridAsbZ8LvqgLtZ1eEjE1fAL8NqSFVR+vc0y6BQg5LTmE1lKjJ6WqOYym6do5IH
	 du++ddhEQazY5SGcruXq3oY///CYUivckD7XutsC7V07EnsH2oxHun0qIefedHhoAo
	 PAFFS9osdY/nZfSHOEKBvUaoQr3wC+HDL27LlejI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCA9AF805A0; Mon, 29 Jul 2024 20:36:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C66F805D3;
	Mon, 29 Jul 2024 20:36:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECF3AF802DB; Mon, 29 Jul 2024 19:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F855F80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 19:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F855F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HvqqIwhF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CC6E61B8D;
	Mon, 29 Jul 2024 17:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1495C4AF09;
	Mon, 29 Jul 2024 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273435;
	bh=WZi2WB+ezf+8ZuZSA/9WSVZyOflnes8c4WhG9OHbKSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HvqqIwhFTPi/2O2OcCDM+0ICAi+5ega/pV8ivBwWyVQAvqULngMmL+0Jp6OA6eAJX
	 ecQgYDz7sA1s5YSFLJzzH8+/otov1OWXkn0aMHdhGlrj67W1jT3tUobdI3mE/nJitn
	 BI1VoAnnkbq+UFgGDM2jkYPocf3Rllps4xZgyMYxDMB5qesIXqU8dZqgfRY2qwj4Ya
	 vjiJuNhzLaBQJMjTFcOy98KqyVq6QqoeMfaEXPYg3J3hojPHPiiMX6RItZwhX9saI1
	 HWI4O9UYjL7oa96DdmiFuDESsEz6MQvbX1Xn4oke/VwuYpWAbpPEKB94ytNkMKVGTg
	 3nLBALZiJ7rtg==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 sbinding@opensource.cirrus.com, Chen Ni <nichen@iscas.ac.cn>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240716025307.400156-1-nichen@iscas.ac.cn>
References: <20240716025307.400156-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: cs42l42: Convert comma to semicolon
Message-Id: <172227343251.109775.8280078818149425619.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ASO7CTUBDJ54OGLGIUYKFPBYSPUL7AON
X-Message-ID-Hash: ASO7CTUBDJ54OGLGIUYKFPBYSPUL7AON
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASO7CTUBDJ54OGLGIUYKFPBYSPUL7AON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 Jul 2024 10:53:07 +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Convert comma to semicolon
      commit: 275d57ae441f34749cbf8621441ce2148f83d5e6

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

