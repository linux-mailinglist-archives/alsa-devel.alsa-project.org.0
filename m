Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCF860474
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 22:11:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC7B827;
	Thu, 22 Feb 2024 22:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC7B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708636290;
	bh=MjyxgOR9Z/1Qv4zVUL+5Z9co3oChDavf9ax4CCR1GYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SV3y/o3so7HyZ6ozpdd/IwPWz+vEvcbBfCN5eI/ToQFkje/aMecSAG7hrPWadcbmJ
	 ubAsnSAYd4qyCwXjaa1s8aEG0/d2I5sHeKjWn26ZlR0nKwP+WHKijsnmUFDjggh4eo
	 AMq9oicE81YdTlHdYGscE0GM/uLf1BvlS3VWynIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE49F805D3; Thu, 22 Feb 2024 22:10:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 051A0F805C9;
	Thu, 22 Feb 2024 22:10:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BBCF8047D; Thu, 22 Feb 2024 22:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A44BCF800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 22:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44BCF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OhmUJICK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 970D5CE28B1;
	Thu, 22 Feb 2024 21:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DD2C433C7;
	Thu, 22 Feb 2024 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708636217;
	bh=MjyxgOR9Z/1Qv4zVUL+5Z9co3oChDavf9ax4CCR1GYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OhmUJICK3sxYcnt6jfVX3f2ODrIcLWZQgqGcttIJv3jyYFoWJdHGWbWTlYfDlmeod
	 vqhpIMtRHQm1+Uj4S3ZKuTR+UCLV7bPlpPTVgY8t9HzrqKOyM5krKylIRalPUyIDeo
	 ABuuEWQcELEVmgU6iUHEDOzWdOD8Lw4QOo67D3K1m37dcC4P4YOnUlX3OmALQ+KhRC
	 QnbM+pv100cVkUsbyMlrAHqY4yKW9b0VqoK8YsLueGb3YEAs7tnzVPx5nDMXmPxCrY
	 SsrOIyHACLb1YGcS1mL1YSrYBUwJFIDHiCN6JgoODcM+xNs37Ei/cBeFAWjIJdz1iR
	 HzCUWunNbs77g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, arnd@arndb.de
In-Reply-To: <20240222102656.631144-1-Vijendar.Mukunda@amd.com>
References: <20240222102656.631144-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/2] ASoC: amd: ps: update license
Message-Id: <170863621521.109182.12917169383809652232.b4-ty@kernel.org>
Date: Thu, 22 Feb 2024 21:10:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: ZRTCGVGGGY5KTTOGMVQCAZ2T7EWFFBGL
X-Message-ID-Hash: ZRTCGVGGGY5KTTOGMVQCAZ2T7EWFFBGL
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

On Thu, 22 Feb 2024 15:56:55 +0530, Vijendar Mukunda wrote:
> To align with AMD SoundWire manager driver license, update license as
> GPL-2.0-only for Pink Sardine ACP PCI driver and corresponding child
> drivers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: ps: update license
      commit: 4c75493833a6e2095f03639f66aed5fbf2683c73
[2/2] ASoC: amd: ps: modify ACP register end address macro
      commit: 253ce07d2a091e98ef53e700e7fa221b28c4f964

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

