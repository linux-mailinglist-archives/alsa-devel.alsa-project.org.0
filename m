Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472189EB3F5
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 15:52:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB06DB60;
	Tue, 10 Dec 2024 15:51:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB06DB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733842322;
	bh=bjEOgH1mGFSKaUDSOmFLt5GSuoXBCE4SC0dZzXTngqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ARUXDjoG0TGbra30N1+Y9G+7aG1kSSIlx10kq09kRccNm+StnBv7CKb7vkwnbqILf
	 +cxWuMTEuZftimmqpi58oLmTxvZfQMa8+0NLh7bJ5k/h17qVSeZkV9RxfWTfHbQsTo
	 5sfA1IwWkeTkb8X2s3MG3rhkJWh+ySXWqNJr9a6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D25A6F805AC; Tue, 10 Dec 2024 15:51:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C725F805B5;
	Tue, 10 Dec 2024 15:51:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 304C4F80482; Tue, 10 Dec 2024 15:51:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 696F0F8016C
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 15:51:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696F0F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tzFaYQwN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E7445C5C76;
	Tue, 10 Dec 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF58C4CEDE;
	Tue, 10 Dec 2024 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733842281;
	bh=bjEOgH1mGFSKaUDSOmFLt5GSuoXBCE4SC0dZzXTngqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tzFaYQwNuZYa6Uk6LIVcxB4y1YyKNj19103LVaDIcJe3B6YAS9EiX3w/B7YOYQ1ze
	 NIyR+qyM4V/RjbxWm8Zl1tHqzZhrh8E26pEbsQhMtXRczg4MD6yM+Zf8+92JdMlz4t
	 kGpLEQNnKgs23rW/09sTBsdV79EXbHFdZTumYZbtMBXCcFtRiXvKMi6y/9Py/xE3nL
	 AiXAH4MzDESBRozie8AWVQ8ZXNlDmv48ZXeXCu0GVeU9uxfd3UzWLVsGvH7WtAqrjU
	 O2EAoGWp1y7xF0XL++57vrJLFhKS/gxWmQSE7kVy9gLsjDlyPV4lAy/F8bAPGl5MDd
	 VZkFswjWR8v8g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, mario.limonciello@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "end.to.start" <end.to.start@mail.ru>, Jiawei Wang <me@jwang.link>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20241209101320.970571-1-venkataprasad.potturu@amd.com>
References: <20241209101320.970571-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Fix the wrong return value
Message-Id: <173384227739.64342.4224280961659037340.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 14:51:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: QQLODAMZJZNLU5PBYK67IJI7BCVUAFAO
X-Message-ID-Hash: QQLODAMZJZNLU5PBYK67IJI7BCVUAFAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQLODAMZJZNLU5PBYK67IJI7BCVUAFAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Dec 2024 15:43:17 +0530, Venkata Prasad Potturu wrote:
> With the current implementation, when ACP driver fails to read
> ACPI _WOV entry then the DMI overrides code won't invoke,
> may cause regressions for some BIOS versions.
> 
> Add a condition check to jump to check the DMI entries
> incase of ACP driver fail to read ACPI _WOV method.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Fix the wrong return value
      commit: 984795e76def5c903724b8d6a8228e356bbdf2af

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

