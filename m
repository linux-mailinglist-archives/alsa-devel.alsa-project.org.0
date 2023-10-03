Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D04187B6F49
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 19:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADC9283E;
	Tue,  3 Oct 2023 19:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADC9283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696352981;
	bh=z0khdQB11BoA0tQ40lKmz5sxH1m9xC78cFe/yLn2g6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C3Vdz/ztfBUuoTFfDSYsAizH6xS33gmMUMMJXDVmBZz0soeUkyKgfWBo2cJaq7wXY
	 Y0Z8NJTTJ1273fnKbG+MYIoR6udRhjZWtbtRtArRwf54gdY/T0Uw6SDqj+6q7QMWob
	 72dMB6CiIW62R/iojnhlg7OleesRXvTf1eOFjULU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A68F80552; Tue,  3 Oct 2023 19:08:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2455AF80310;
	Tue,  3 Oct 2023 19:08:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B7A2F80551; Tue,  3 Oct 2023 19:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FE58F801EB
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 19:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE58F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oIucdHji
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4516612DF;
	Tue,  3 Oct 2023 17:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67FCC433C8;
	Tue,  3 Oct 2023 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696352915;
	bh=z0khdQB11BoA0tQ40lKmz5sxH1m9xC78cFe/yLn2g6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oIucdHjiAoMeu9S2B2ofb7H1+u6bLJgvxIzwxoJhO5ggZBy5WKoRWI6T/dVPA55vU
	 x8abIexv0M0heossk7yTWtHBnA4FXmaLLqsN/ypGorLlRpzY/2oIhdHjnnYE9ZA2Lb
	 csq7Di/OPv8lTrB5UVU91m3/6IZZAm3RFPP/8yZz2ayqOCntxWpkcrnlkxbe1QrnFb
	 PF2LCKBuCD2tEvmvRi6YpVntehrK9uC1+TOjXNPaSerqQfzDcfDD7YC2uMLnZufN2D
	 6kbBR+Q67GVa9Ca7sv3l6UWKsCgY+/LRZC1iE3aHXM11qu5OXJDU5kJoAEfOUJKDWJ
	 I20U96sourupg==
From: Mark Brown <broonie@kernel.org>
To: Weidong Wang <wangweidong.a@awinic.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
References: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
Subject: Re: [PATCH v2 0/2] Remove reset GPIO for AW88261
Message-Id: <169635291227.42044.6654746210996061480.b4-ty@kernel.org>
Date: Tue, 03 Oct 2023 18:08:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: LWGSZB6Q3NFCCBIMHOBXL57JORJ4FZRK
X-Message-ID-Hash: LWGSZB6Q3NFCCBIMHOBXL57JORJ4FZRK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWGSZB6Q3NFCCBIMHOBXL57JORJ4FZRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 02 Oct 2023 16:00:10 +0200, Luca Weiss wrote:
> The AW88261 chip doesn't have a reset gpio, so remove it from the
> bindings and from the driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: awinic,aw88395: Remove reset-gpios from AW88261
      commit: c7b94e8614e35f1919b51c23fe590884149ae341
[2/2] ASoC: codecs: aw88261: Remove non-existing reset gpio
      commit: 4eed047b76fa8f56af478ca7e6d56ca7e5330cf2

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

