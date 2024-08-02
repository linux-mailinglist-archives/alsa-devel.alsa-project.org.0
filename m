Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858594659E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 23:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDCC7471E;
	Fri,  2 Aug 2024 23:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDCC7471E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722635638;
	bh=xPpOgoirjlpTp6dIkK1onCx8bz+DwC/ESltou7nhPII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T0CrOLgidaDqKiFrxPvfN1Lcx2uA6OX2l6uKhZqPRzkoCZlDaJKzspzWZcmGqy69I
	 qVfPeLy4p9F25UeVSEkpoMa6L0/o/Tv17wVzvZ2SD4qsT09rSKQvHV7tBcgE8UBf8j
	 GXiTVEtshUmdLrI5mog5aXyS9gzpvm+JiOfZZ9Lw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C450EF805B1; Fri,  2 Aug 2024 23:53:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C4CF805AD;
	Fri,  2 Aug 2024 23:53:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907DEF80269; Fri,  2 Aug 2024 23:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E611F8019B
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 23:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E611F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uBTeeDqD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98276628BC;
	Fri,  2 Aug 2024 21:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B85C32782;
	Fri,  2 Aug 2024 21:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722633999;
	bh=xPpOgoirjlpTp6dIkK1onCx8bz+DwC/ESltou7nhPII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uBTeeDqDk4FJpBnvh59txdULuMSlyeHec0h17tIktJckFKxW5lGA1LsUv5q8datEn
	 vFbeDNsRKmwhWtSiPA+Gc7HBXQXO+h13ky4cfKFiW3bWe6tN+a1luI5DfI7ZkqpQ1j
	 JeElDwqCv7SCS/rADZeGTsRGVFkdNzA8pHI86aJR9GXuc6SB9HJo14z+vRHb3vQ6sR
	 yDRyn3ECafo1GyA/4L8cjqZPiGCGsK16jDMtUCcZHoeCzVu2ROS77XgVNqpEUe3/eD
	 7v9m5pknjQCVsMF4aNmoG3Le9NqzEHqT9DH3oB/nfQvqTERXOKsXyOW0KK7FC+0Aye
	 ESyU5lJntzVCA==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com, javier.carrasco.cruz@gmail.com,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
In-Reply-To: 
 <1f04bb0366d9640d7ee361dae114ff79e4b381c1.1722274212.git.christophe.jaillet@wanadoo.fr>
References: 
 <1f04bb0366d9640d7ee361dae114ff79e4b381c1.1722274212.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: cs43130: Constify snd_soc_component_driver
 struct
Message-Id: <172263399662.130801.3172998123321447676.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 22:26:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: PKLLXWL772NENFFUX2FLIUTZITYUTBYV
X-Message-ID-Hash: PKLLXWL772NENFFUX2FLIUTZITYUTBYV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKLLXWL772NENFFUX2FLIUTZITYUTBYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jul 2024 19:36:05 +0200, Christophe JAILLET wrote:
> In order to constify `snd_soc_component_driver` struct, duplicate
> `soc_component_dev_cs43130` into a `soc_component_dev_cs43130_digital` and
> `soc_component_dev_cs43130_analog`.
> 
> These 2 new structures share the same .dapm_widgets and .dapm_routes
> arrays but differ for .num_dapm_widgets and .num_dapm_routes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Constify snd_soc_component_driver struct
      commit: 839e231a53b824a62bc3696ad3ba1dcedc4f4167

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

