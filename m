Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC14DBECEDB
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Oct 2025 13:58:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A2A16021E;
	Sat, 18 Oct 2025 13:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A2A16021E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1760788682;
	bh=cQ7DE6REN0yPTSH4eL7ZwkxyXRxlvtAzgRdsqKEfttw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EWm8zgzoiB/AVI99wAs1N1gFnxMxDs1JAxyZcGq0zldO78gokZoFcjyEArDQK97jJ
	 DBad6p6ijAEu2LfKjXviw1166oemmbaufB7La1cXTyKH/7h3r3oP/34FIvhM/DFnJq
	 JD/eRq+i8BLJYjNjngwkb2pKifJaInDZ9E9DVRU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD727F805D5; Sat, 18 Oct 2025 13:57:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD8AF805BF;
	Sat, 18 Oct 2025 13:57:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7DD7F805CA; Wed, 15 Oct 2025 11:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF294F800F8
	for <alsa-devel@alsa-project.org>; Wed, 15 Oct 2025 11:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF294F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ECyxHhE2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DB4A4032E;
	Wed, 15 Oct 2025 09:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C451C4CEF8;
	Wed, 15 Oct 2025 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760521791;
	bh=NJZvW+JYKZcvHAok/gYBcGxTybf9PkX3/50tqo3ey38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ECyxHhE2CgnU38zjNUREyLuuvYEny0b2nr81cS0njxwtyESpV/L2UBdbpXrIZQc2U
	 VRIfjrqMS2wcoXDRsM0Sjf9hXWxLGNpn265UNQYd3b/qVScb79TndN+3dJ8iD8ndjQ
	 8m2HKsaKjAWy9wKmj9w6LndxIePCUkP68jAb/xVdnBRa74zhlsSTh50ccHuG5dHUDd
	 4+0emSWU/aVqPQxP+0rBaKxys17Dwlljx9+/al9l8iBPCxEO3pWXfSjj2dU0KbSpAj
	 +w+07O0iajTCTdtkCiGnmWLZ7K1yxVJv2OaWyI906gChGwuHeTKtxqiH4//FAcEpVL
	 pLgoAS+1q3OZA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Baojun Xu <baojun.xu@ti.com>
Cc: andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com,
 henry.lo@ti.com, robinchen@ti.com, jesse-ji@ti.com, will-wang@ti.com,
 jim.shil@goertek.com, toastcheng@google.com, chinkaiting@google.com
In-Reply-To: <20251002072925.26242-1-baojun.xu@ti.com>
References: <20251002072925.26242-1-baojun.xu@ti.com>
Subject: Re: [PATCH v4 1/2] ASoC: tas2781: Support more newly-released
 amplifiers tas58xx in the driver
Message-Id: <176052178677.20166.7273787337857943286.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 10:49:46 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-96507
Message-ID-Hash: HACVUQNDTXBGSG64LPIBSF3UDUWXOOQX
X-Message-ID-Hash: HACVUQNDTXBGSG64LPIBSF3UDUWXOOQX
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 02 Oct 2025 15:29:24 +0800, Baojun Xu wrote:
> TAS5802/TAS5815/TAS5828 has on-chip DSP without current/voltage feedback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas2781: Support more newly-released amplifiers tas58xx in the driver
      commit: 53a3c6e222836a23e8e0693395584aefc456dca6
[2/2] ASoC: tas2781: Update ti,tas2781.yaml for adding tas58xx
      commit: 7e6cfa3e94cf8278ee3170dc0b81fc6db1287e28

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

_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
