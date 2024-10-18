Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE8D9A48E9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2024 23:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A25C4847;
	Fri, 18 Oct 2024 23:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A25C4847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729287080;
	bh=bd7zqGrKt29zOyO1cGYsr3FOMFt4VVqROBGt8oxJNRs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=V6HkbFL7Q80V8yrsE0e6LilxlLjsvlNnaQy5oDqSBsFdEcSzkcfvOjwQlIdYjwnTm
	 3/ml1nxStcu3sD5cc86xc3xSv1Fxi4FUgcDj8WdQq4tqT09FGSB7u85HpHemnAQZRo
	 Tf05g7Zg+9wcO4/WZ4Y3rKJ+TVyRi/c4wLjtNaHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0425CF804F3; Fri, 18 Oct 2024 23:30:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74479F805B0;
	Fri, 18 Oct 2024 23:30:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B13EFF80448; Fri, 18 Oct 2024 23:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E876F80104
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 23:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E876F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VbJ9I6Pe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 626605C59A9;
	Fri, 18 Oct 2024 21:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AD2C4CED1;
	Fri, 18 Oct 2024 21:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729287043;
	bh=bd7zqGrKt29zOyO1cGYsr3FOMFt4VVqROBGt8oxJNRs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=VbJ9I6PeF8RQAviyGZQl6FnjRoFk86rwPMF7ceG5X5rap30uDjPmHrctjo8dQOs9A
	 ytr3HBuo833OgANJwKVsrSxsuWZzPnRY4Rzmm+2Eq43RkNDXHSonfrhWSIZj5XG8y/
	 9Rs/rktl6k24rnPSuXlQQAngwThTgqb7d8m1b+FZxACTOFk5noyIJFX/v4NauQkUNN
	 /UA4meQSQZ6j+Sesj5Q6UsywMOFwiDKtvzeSFBU0bqsi6zPP3XWQoFcJE2f0vSbtKD
	 jD/V+S45WTHPpJN6U4jNGl38Ap1B3xp3IIaDwav0eNf3OPyZx5NraptjV0qy+aAtQG
	 xxQk1RhLc+yiA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20241017071507.2577786-1-chancel.liu@nxp.com>
References: <20241017071507.2577786-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add a flag to distinguish with
 different volume control types
Message-Id: <172928704112.212383.3559380039082750889.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 22:30:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: WVXJQ7JVR7UGI2HWJH5H5BCTJS7NBXA2
X-Message-ID-Hash: WVXJQ7JVR7UGI2HWJH5H5BCTJS7NBXA2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVXJQ7JVR7UGI2HWJH5H5BCTJS7NBXA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Oct 2024 16:15:07 +0900, Chancel Liu wrote:
> On i.MX8MM the register of volume control has positive and negative
> values. It is different from other platforms like i.MX8MP and i.MX93
> which only have positive values. Add a volume_sx flag to use SX_TLV
> volume control for this kind of platform. Use common TLV volume control
> for other platforms.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Add a flag to distinguish with different volume control types
      commit: da95e891dd5d5de6c5ebc010bd028a2e028de093

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

