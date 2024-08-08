Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90094C6AC
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 00:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1AAB832;
	Fri,  9 Aug 2024 00:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1AAB832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723154640;
	bh=SrCA00LIf/8WOXQ3qcmUmKiAAagWu7ZJgow5VDaam+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J+yGwQ4Xh6Px2jnPocbKHXHgsH+OkhBhWtFlkJUxQqpdpmqNwiI2hEKcZtfTKA+Xb
	 PXdIXJv61vFRD+YoywD1fvFSXDTQBYWBaEw8c6HaaWap5m6z6AT4M2F/Cp93t4Nj10
	 oZklKik12Fa2FjM/D2hChPWK8c/J0k7fjpLtfZ9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B283F805AE; Fri,  9 Aug 2024 00:03:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E047DF805AE;
	Fri,  9 Aug 2024 00:03:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB2DEF800E3; Thu,  8 Aug 2024 23:52:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,TIME_LIMIT_EXCEEDED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11568F800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 23:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11568F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bZ9cjZe0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36F1F615D3;
	Thu,  8 Aug 2024 21:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E72C4AF09;
	Thu,  8 Aug 2024 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153611;
	bh=SrCA00LIf/8WOXQ3qcmUmKiAAagWu7ZJgow5VDaam+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bZ9cjZe0POp4JGOuDLjdD6aQkYB+P7985cL9FZtK88aqOJBK768izyFn6wcwfL5W+
	 XcP0+JAdA8Z+wPTtJjE0mvOQl1w4ZduBXONflK1+08LBQXMDxOzmdqIC01Qc50uacl
	 lr1ORJYjMFgcDuUnw81+w1o2qpPb9PoqlTh5c/dlhppguJbk6e2axJvPwVcG9tC6mW
	 U+2HvWvvIv+Sm7tQytU3ev+8tic3NCGltcOArLUIjhSW+iUVqX+peYhsndOOPXCZhx
	 BQuJlAfsj/ZgK0y/2iqPv/HJRBfXhOytWI4w4Nk10ue+DBjDJ/RZ9wMUmKCoTOj9wp
	 vO/9KY2+tFXZg==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240807142648.46932-1-simont@opensource.cirrus.com>
References: <20240807142648.46932-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the
 default value
Message-Id: <172315360941.480667.13660715615333697845.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:46:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: RQEAJXVBN4MZWV2EQ7TTJHCI5E57IFQG
X-Message-ID-Hash: RQEAJXVBN4MZWV2EQ7TTJHCI5E57IFQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQEAJXVBN4MZWV2EQ7TTJHCI5E57IFQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 14:26:48 +0000, Simon Trimmer wrote:
> Device tuning files made with early revision tooling may contain
> configuration that can unmask IRQ signals that are owned by the host.
> 
> Adding a safe default to the regmap patch ensures that the hardware
> matches the driver expectations.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default value
      commit: 72776774b55bb59b7b1b09117e915a5030110304

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

