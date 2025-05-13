Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC356AB7F9C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0E3623A1;
	Thu, 15 May 2025 09:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0E3623A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295626;
	bh=g6uAgBmdRVJ/MmwO0dYNS5uypb5EK9FZJwFt76vIoQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dz1LfY/wAF3kOo5tEtn2Hf7fD0c6nETODxKzoI9KEow86Ll46iE6pskjBMDnAb39T
	 0u+p48dCbprC43Su7/KWx1gpwyIquiwbghTyh2GqMnz4tS8v6omQ3LqBNrwbpX6iBF
	 5uunOt8naKa1PkKJgbk4c7+GqerVBfyqqPk4VZqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA03F89B40; Tue, 13 May 2025 18:34:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EACAAF89B46;
	Tue, 13 May 2025 18:34:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65ED8F80737; Tue, 13 May 2025 18:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7453AF8055A
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 18:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7453AF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A8xAZAx9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 585405C6B03;
	Tue, 13 May 2025 16:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09464C4CEED;
	Tue, 13 May 2025 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154090;
	bh=g6uAgBmdRVJ/MmwO0dYNS5uypb5EK9FZJwFt76vIoQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A8xAZAx9JKl8AvNozmvyqowTBtujipU9DMjfnPjdd9rFMcOsMQNpR/du/X6dIl3Uz
	 MZ9yB/n6jEvjBh+iMXbkVIi9yV0OlxzJwmMQkWW/Ust5PU3be6YDok8mQTRMeA9WX4
	 QcEVkUKsnERfqti1xirG/YleYzlXVnJDDBnW+a3/pY6yQxoeQvFzzJ9I4WYjSc9WCJ
	 kBAEo5WwOR3gDn/3zyo0eElh32X/dENgY7GL1I9T+yQWRSlXpKkAcDWro+H7j+vtp+
	 yJVSXdNduMKMzbleIKgVHma95KYwuciSjE3nzANkGEPqZxTTFuHh2JWtv5ZzsMLOBu
	 xXwQB8D1ajO2w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20250512185739.2907466-1-nm@ti.com>
References: <20250512185739.2907466-1-nm@ti.com>
Subject: Re: [PATCH] ASoC: tlv320aic3x: Use dev_err_probe
Message-Id: <174715408662.98239.15738351990112374855.b4-ty@kernel.org>
Date: Tue, 13 May 2025 18:34:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: RGRLXTIJYS4ZF6R3EIF4ZQDFSROWWZ46
X-Message-ID-Hash: RGRLXTIJYS4ZF6R3EIF4ZQDFSROWWZ46
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGRLXTIJYS4ZF6R3EIF4ZQDFSROWWZ46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 May 2025 13:57:39 -0500, Nishanth Menon wrote:
> During probe the regulator supply drivers may not yet be available.
> Use dev_err_probe to provide just the pertinent log.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic3x: Use dev_err_probe
      commit: 85f8c2d56caf56aa3379bbc5f1a19fef9aabd23e

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

