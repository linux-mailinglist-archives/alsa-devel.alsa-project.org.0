Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9FB3FE80
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Sep 2025 13:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0ED601E1;
	Tue,  2 Sep 2025 13:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0ED601E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756813919;
	bh=xbwszAwF5EtwUlULoGHA6xFuTP3hkuTUDEmkG/8psjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UDOVRlhDLtyBFxXs9ESxxWuDsHoPzpvEeoFdhLJl+k1r3Tl/tjTAUCvLwXEXstI4F
	 q+HQ9VrJkxc8RaUN/ix3ka5gIiBv+ho2oqybMAj17mZ7cZYBDxNZ9QG2iQwJAFtzHE
	 G9wqFbKZbtC9e+XujrkCY0n27XqFxUKAqw93KauA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B4A4F805C6; Tue,  2 Sep 2025 13:51:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE7D2F805C7;
	Tue,  2 Sep 2025 13:51:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38E93F80254; Tue,  2 Sep 2025 13:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1989CF801F5
	for <alsa-devel@alsa-project.org>; Tue,  2 Sep 2025 13:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1989CF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LWPZ53QN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B32B660214;
	Tue,  2 Sep 2025 11:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5298EC4CEED;
	Tue,  2 Sep 2025 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813872;
	bh=xbwszAwF5EtwUlULoGHA6xFuTP3hkuTUDEmkG/8psjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LWPZ53QNI0f91n2vDCuq6Tq/WSJdEx8fcbdOAxOw8uv3+gIR8sWsHlxssleXh2xvK
	 1Rme8UrCQ675NkgMsfaKEAYmWrJPTVtrElLIcaLywabZTUpvSaVbaMUgV0334NdViH
	 c81z5hEHCk5qJEZm6q5Mnjd55H/hRWqhFEhdpEFiyxRzH9rI443tBkNcaMNwe2iAlT
	 icUGEfpeBNUERHI2xJrwPmvrtpowDkmejofrVOyUz3UKJ0g5uzTFXy0NSiGtCq8cgB
	 v8vNF1v+5SloBsygWZro9oWGuPNH/ih+zrv6t3PdTFASeDeJIicgSY6ZmdhGba3ijN
	 J3zgPslzZfMTQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20250821054606.1279178-1-venkataprasad.potturu@amd.com>
References: <20250821054606.1279178-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: Adjust pdm gain value
Message-Id: <175681387008.70970.2403265736805266274.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 12:51:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: KAOOP3IWUUVI543NY5FV3I32A4Y2TY5C
X-Message-ID-Hash: KAOOP3IWUUVI543NY5FV3I32A4Y2TY5C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAOOP3IWUUVI543NY5FV3I32A4Y2TY5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Aug 2025 11:15:47 +0530, Venkata Prasad Potturu wrote:
> Set pdm gain value by setting PDM_MISC_CTRL_MASK value.
> To avoid low pdm gain value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Adjust pdm gain value
      commit: f1d0260362d72f9f454dc1f9db2eeb80cb801f28

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

