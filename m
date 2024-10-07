Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47891993294
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 18:09:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 428DB857;
	Mon,  7 Oct 2024 18:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 428DB857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728317363;
	bh=q7x+MeMH8NJaMP+kd5LXA06qF1b7dWCfxGXmKfmhnT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LPcuOL5yN8/Tx+3K7xjViH1gVf7hKgMU/eNb5aq9AaD/Q9g3kXfyEv6Wze18gMU9v
	 TxMgKsfCEtY7I53/6NHgwnALTBSu82nHSH/abuzZtGyDUbZ38TPYP23XBSeYRZq0E6
	 LRDTxatxHcbj08aHRHjDPMAXUTXS/gkS4MMcJ8kQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F87BF805BD; Mon,  7 Oct 2024 18:08:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB60F8058C;
	Mon,  7 Oct 2024 18:08:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD274F80528; Mon,  7 Oct 2024 18:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14E01F8001E
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 18:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E01F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EpBXoWTc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43729A419CC;
	Mon,  7 Oct 2024 16:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632A6C4CEC7;
	Mon,  7 Oct 2024 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728317320;
	bh=q7x+MeMH8NJaMP+kd5LXA06qF1b7dWCfxGXmKfmhnT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EpBXoWTceQzbIWr1IfCpRcqJGZutVJ6eN3LyBE1bV+sR4F0ydMo8T6uvM9AyZnbkU
	 RfTVL4bTEKjXOCEGCp9Wf2ZXSJjXW6gPNN8aXIktRwnnEMBFNaCePmDc7e/4+/N4C/
	 Ff8LzGfQ25mr0x37+1qNmFaC9dO1nBQCjrifHz9S0vyY/kSrX1sHn/OPu6YHAOH0Ui
	 HxZ7L9sWBeWFgHN+0zMQxIqxUlwOdK0B7q/h4z3dekFEb0HkDJaEMIwu45hUBcYAHj
	 Q2bek9BHpETsBHGf3NcI111JDPkRwGUjPkzzIY9T7e790djRbJYqsna0/GgCGuDo+r
	 Faos5R8O/Cb3A==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241003083611.461894-1-miquel.raynal@bootlin.com>
References: <20241003083611.461894-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupt
 properties
Message-Id: <172831731707.2397838.6276980264553281279.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 17:08:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: WHPTLL54V3TCI7QQNSTT3SOLLCKDVC3E
X-Message-ID-Hash: WHPTLL54V3TCI7QQNSTT3SOLLCKDVC3E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHPTLL54V3TCI7QQNSTT3SOLLCKDVC3E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Oct 2024 10:36:11 +0200, Miquel Raynal wrote:
> Combinations of "tx" alone, "rx" alone and "tx", "rx" together are
> supposedly valid (see link below), which is not the case today as "rx"
> alone is not accepted by the current binding.
> 
> Let's rework the two interrupt properties to expose all correct
> possibilities.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: davinci-mcasp: Fix interrupt properties
      commit: 8380dbf1b9ef66e3ce6c1d660fd7259637c2a929

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

