Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239C91E4D8
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 18:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5B6E7F;
	Mon,  1 Jul 2024 18:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5B6E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719850145;
	bh=xo/lQLEgp4T9tOodEdYdrv/WFpbI3LH5AIIdorooP/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UT2lrmE2+nZiWxDnPOFrRE5yBIRdcCSu2pLMDw4RQDoyU8a28wWAGMgH6hRLYjBfk
	 4U7FLYHJewTR6tFKdmjPca3WidPJCZCoVe0+EtuY8Su9ZjbwKPm+SUIzw56WW0EywW
	 NfbyM24ln8f4AyKUijwBUj86R2LJP6pErXqpLaGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC3E3F805AC; Mon,  1 Jul 2024 18:08:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 475A1F80578;
	Mon,  1 Jul 2024 18:08:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C355F8028B; Mon,  1 Jul 2024 18:08:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A061F8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 18:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A061F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cwoLHCTK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8F4D614C9;
	Mon,  1 Jul 2024 16:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2B2C116B1;
	Mon,  1 Jul 2024 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719850100;
	bh=xo/lQLEgp4T9tOodEdYdrv/WFpbI3LH5AIIdorooP/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cwoLHCTKrl1c3Bo7IVHu2E2rOLxdFCDLCz/fiqC1Hr0UDY4sSn6KYiUb68E2mjhVt
	 rF0RhoL/ILqR+JCyKuh0rWrXGmnANCeJ9ZstoFhfmA7toz8lqXpTG0i1W4JEXVTBtF
	 Wvi2Lsl6H4nyTLFvo70y0rmPeo3wnQkEp8dfQor1iB+YOAiTJaWmjKf5E8FP5nTkUR
	 ksfg3lq/t3pJymPH/n+qclsoWakdXXRuy3AUjwkXbSSWBBYkZbavN29UcrVJ8W2DA3
	 5RliJ7TXYPLUg4zoyKunLW+/pjhkg0LjCotqsC28eGr0UJo5fEuVTuOftAif5o6iko
	 fAf8ebBmYoSOQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240627141432.93056-1-rf@opensource.cirrus.com>
References: <20240627141432.93056-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] firmware: cs_dsp: Add check to prevent overrunning
 the firmware file
Message-Id: <171985009864.89113.4517197771955831374.b4-ty@kernel.org>
Date: Mon, 01 Jul 2024 17:08:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 3MDNJ5SE3P3XHHYP5NUH5VVUPHNGCNP6
X-Message-ID-Hash: 3MDNJ5SE3P3XHHYP5NUH5VVUPHNGCNP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MDNJ5SE3P3XHHYP5NUH5VVUPHNGCNP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jun 2024 15:14:28 +0100, Richard Fitzgerald wrote:
> This series fixes various missing length checks when processing
> variable-length data from the firmware file. These could have
> caused overrunning the end of firmware file buffer, or wild
> pointer accesses.
> 
> Richard Fitzgerald (4):
>   firmware: cs_dsp: Fix overflow checking of wmfw header
>   firmware: cs_dsp: Return error if block header overflows file
>   firmware: cs_dsp: Validate payload length before processing block
>   firmware: cs_dsp: Prevent buffer overrun when processing V2 alg
>     headers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] firmware: cs_dsp: Fix overflow checking of wmfw header
      commit: 3019b86bce16fbb5bc1964f3544d0ce7d0137278
[2/4] firmware: cs_dsp: Return error if block header overflows file
      commit: 959fe01e85b7241e3ec305d657febbe82da16a02
[3/4] firmware: cs_dsp: Validate payload length before processing block
      commit: 6598afa9320b6ab13041616950ca5f8f938c0cf1
[4/4] firmware: cs_dsp: Prevent buffer overrun when processing V2 alg headers
      commit: 2163aff6bebbb752edf73f79700f5e2095f3559e

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

