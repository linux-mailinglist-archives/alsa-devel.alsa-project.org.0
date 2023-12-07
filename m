Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCB78089B7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 15:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68ED0209;
	Thu,  7 Dec 2023 15:00:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68ED0209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701957647;
	bh=ZuC5Sg0qcx3RtpmbuKgYYlSi24reNt2keYVou/b9iGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t0w9DBj7zv0Aano6Jn6ngj6GDNq1at6gK+fC9igyPG0EhY7LbrCxKq+ETsW2cWdKj
	 PBl30nKYSyIzI3Th5vlmEAt+eBLspnOWfpfwhQRJ7D1y5S4RbIPmOVfp1JlNfPEzpy
	 O4H2XL9jHyTUsndLeMxApb/T4xBPTnipYFooQFPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D21EAF805D8; Thu,  7 Dec 2023 15:00:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6D7F805CA;
	Thu,  7 Dec 2023 15:00:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97AE5F805B0; Thu,  7 Dec 2023 15:00:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A9A9F8059F
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 14:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9A9F8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dF7VDSiE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6EB59CE23FA;
	Thu,  7 Dec 2023 13:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6281AC433C9;
	Thu,  7 Dec 2023 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701957592;
	bh=ZuC5Sg0qcx3RtpmbuKgYYlSi24reNt2keYVou/b9iGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dF7VDSiEmvkU9E45dhqgHWEkwRy7zOwN9AQAmSbRBaNnGI8NWqXL/Mp9BdIL0x9n6
	 QWi3xts7w45kOhz9VWG3DY9yjMBtyvSdTnq4NEa0C//AEtUVf1dPgARlPMIv5hJszd
	 8IeNi6a9uZKsubM1YmySbnPVY8JBrDAPhIDfVB3ZSorV3h/94pMahlBx45UhhU+hpN
	 EETx/x/S2wzncUXiqRWJEi2l+2tmmWphMgqpCvBH74oUEyEm2GU0c+hawqyRLc7ffC
	 8KBAKdLwQqhnsrrDcQ9uahkqXvsWIW4ckFOFob7u7VFi8lxS+o+dNAly7pRZo/vaqY
	 7/a3NJ33QuLYg==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Marian Postevca <posteuca@mutex.one>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231207045505.1519151-1-Vijendar.Mukunda@amd.com>
References: <20231207045505.1519151-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: modify config flag read logic
Message-Id: <170195759012.40629.1653590710406299836.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 13:59:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: WG5YPRNE24DEC42ZK6Z4ZYWMNVLFVI36
X-Message-ID-Hash: WG5YPRNE24DEC42ZK6Z4ZYWMNVLFVI36
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WG5YPRNE24DEC42ZK6Z4ZYWMNVLFVI36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Dec 2023 10:25:01 +0530, Vijendar Mukunda wrote:
> Modify acp config flag read logic from ACP v7.0 onwards.
> Instead of reading from DMI table match entry, read the
> config flag value from BIOS ACPI table.
> This will remove updating DMI table when new platform support
> is added.
> Use FLAG_AMD_LEGACY_ONLY_DMIC flag as default one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: modify config flag read logic
      commit: 8527ecc6cf25417a1940f91eb91fca0c69a5c553

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

