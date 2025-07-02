Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55251AF58C7
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jul 2025 15:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1EE6601F4;
	Wed,  2 Jul 2025 15:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1EE6601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751462856;
	bh=5H5cur5mQM3NkzwkMuZXSH92dkQhDbkK6qDYSL4wKc8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mB2d93TN8WU/9qHgt8cA60Mge0RUYp1Z9XPWIR4BapHU80CxAmz7XsNDC7UJ40py4
	 Fb9ZNLUij6axvx2J/yOmFLQeQI5S0cVoL8ZlvXzJyDZf8MYS+iqFQXgWHDDJiSC9qb
	 1JtLVOJefElnfvn5R5/4cAgot6OKWXXKfLT0GcRY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96F98F805C1; Wed,  2 Jul 2025 15:27:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82DD5F805C2;
	Wed,  2 Jul 2025 15:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50B5DF804FF; Wed,  2 Jul 2025 15:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75965F800D0
	for <alsa-devel@alsa-project.org>; Wed,  2 Jul 2025 15:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75965F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r1vPli+9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 129925C6C11;
	Wed,  2 Jul 2025 13:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A6FC4CEED;
	Wed,  2 Jul 2025 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462818;
	bh=5H5cur5mQM3NkzwkMuZXSH92dkQhDbkK6qDYSL4wKc8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r1vPli+9Q18MyMhk8Qy0whlh9leWQpbZbFLgnxMDeETQOmCAIzr5XYd9Tj+N4TC7S
	 3dCU8f1CAwPcBjZDuTdSJb6gqmd+HSk3vvYYAwQ9G/Z/iqjum0oV+wa9bnA4UWEFI1
	 36mTWLJp4lvt9gxJctoO5fhBBq7PUaJB2A2FM4ZF2uH6JIeX8S3kzfnfFThB1vqabq
	 qvMHXfluusV/nWAp/RzEE+SsrXfIw825mBnWeHlV/EsaGCrfBWaeO4yOsQK+HgdrKB
	 WtsYEKCDNPwVjO+7lDClO9IRc/rfbuxPLRZbfBXgauSWsz0EJP5PSMSYpkEytgSsm8
	 uk7pgg33k0fzA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com
In-Reply-To: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
References: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 0/3] Add legacy driver support for ACP7.2 based
Message-Id: <175146281732.53585.1227421054702412422.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 14:26:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: V5JI2H6BG6YGVPEHVGMUTMD63SMWJJEZ
X-Message-ID-Hash: V5JI2H6BG6YGVPEHVGMUTMD63SMWJJEZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5JI2H6BG6YGVPEHVGMUTMD63SMWJJEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Jul 2025 15:14:09 +0530, Venkata Prasad Potturu wrote:
> This patch series is to add I2S and PDM support for ACP7.2 based
> platforms.
> 
> Venkata Prasad Potturu (3):
>   ASoC: amd: acp: Add legacy driver support acp7.2 based platforms
>   ASoC: amd: acp: Enable I2S support for acp7.2 based platforms
>   ASoC: amd: acp: Enable acp7.2 platform based DMIC support in machine
>     driver
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: acp: Add legacy driver support acp7.2 based platforms
      commit: a3b0e80428c8e2aa50d7e3c75721dd7f5c76c4d9
[2/3] ASoC: amd: acp: Enable I2S support for acp7.2 based platforms
      commit: 3549725e0f7823d085403fc4219fd3df347a1ae4
[3/3] ASoC: amd: acp: Enable acp7.2 platform based DMIC support in machine driver
      commit: 0c0ef1d90967717b91cded41b00dbae05d8e521c

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

