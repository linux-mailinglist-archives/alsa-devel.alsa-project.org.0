Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C47597D296
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2024 10:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B3CB65;
	Fri, 20 Sep 2024 10:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B3CB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726820586;
	bh=60s4AnSUBYLnAs2LLbYv1rI0vTblMwEDXFJ/ddNuHsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qrQ2FI8q5VuvOwQRSVYSJpGmi0Ea/UChkGHoKClmsq6bpNpQDcPM9XnlN9ThZMELF
	 u/e9ONSjcqEXEgrX1C0oTSCwrt7vUooOwdNMqJ6ARJV/Wy2nn3ZFdLPYVG0WQZ4RUl
	 b8vXR0ThHNKE4s0x0jZGCdnD98iJtHdBfS1PxVDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD635F805BA; Fri, 20 Sep 2024 10:22:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CEBAF805B2;
	Fri, 20 Sep 2024 10:22:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF7AF8020D; Fri, 20 Sep 2024 10:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E36D8F8010B
	for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2024 10:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36D8F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DZhVAj8B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABD895C5D1D;
	Fri, 20 Sep 2024 08:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA277C4CEC3;
	Fri, 20 Sep 2024 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726820543;
	bh=60s4AnSUBYLnAs2LLbYv1rI0vTblMwEDXFJ/ddNuHsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DZhVAj8BYAkmamADIlocvxwemPJwwhD4CyyP6ijpNvuHk7ZCF4vAW3FNq6rve53xy
	 bWYRfREFAZX7RguU1G5oYuRJgMKn1IeRmJpBGOfCqcQSMRqxZdFU2HCW2dG7J9wuXx
	 8jTcPK1yQe4bOXfts6S3nvZxxfrSoL2zTGoMeCyG7TOKLggQxUgtsEoq+yRktOHUlL
	 KILvqOdeTDCo2DtvohFVbQ1qNXohDmOOH1nILZGgyxi+NVHUf54YX7/M17p4+dOKhT
	 IqpNfzshK9tIDTAjY5Tehis49p1O3pdb2L2WuFGs5DTUBljEYkYzyyaxK9C3WSXfVG
	 wllctvsFelDdg==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240919151654.197337-1-rriveram@opensource.cirrus.com>
References: <20240919151654.197337-1-rriveram@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l45: Corrects cs35l45_get_clk_freq_id
 function data type
Message-Id: <172682054035.1859092.8371317736754373491.b4-ty@kernel.org>
Date: Fri, 20 Sep 2024 10:22:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: KPUFRKVDD6DDH3EKKH24CMU2B7BEHZ63
X-Message-ID-Hash: KPUFRKVDD6DDH3EKKH24CMU2B7BEHZ63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPUFRKVDD6DDH3EKKH24CMU2B7BEHZ63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Sep 2024 15:16:52 +0000, Ricardo Rivera-Matos wrote:
> Changes cs35l45_get_clk_freq_id() function data type from unsigned int
> to int. This function is returns a positive index value if successful
> or a negative error code if unsuccessful.
> 
> Functionally there should be no difference as long as the unsigned int
> return is interpreted as an int, however it should be corrected for
> readability.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l45: Corrects cs35l45_get_clk_freq_id function data type
      commit: 01e709aeaf913a4d0e04f9957d399cf6fc3b5455

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

