Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF77ABA17
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 21:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E6D4DEC;
	Fri, 22 Sep 2023 21:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E6D4DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695410982;
	bh=PJwZweM/qxn0xzKrOgdVPLEbGE7bz46ZA01+diOI8W8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qfYVA655U2epSFfsXzJuSxhTaXgdqwUgq26mPIgSKMT0uWvg1aZNoYiJtpR6rdH9+
	 2mrczNNn66Mmf9CVnr5smpJ9IerT2RcugPvEJqu2H+5UHBvNm4m9xK1oWGdjjNBL2n
	 AznRGWxD34siaEPgS0La7YjNL9kDVO8SkUxIrkK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCD5F8055A; Fri, 22 Sep 2023 21:28:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 542A8F80005;
	Fri, 22 Sep 2023 21:28:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6D07F801F5; Fri, 22 Sep 2023 21:28:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D763BF80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 21:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D763BF80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J2mQSRfV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 108F862355;
	Fri, 22 Sep 2023 19:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D8CC433C8;
	Fri, 22 Sep 2023 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695410909;
	bh=PJwZweM/qxn0xzKrOgdVPLEbGE7bz46ZA01+diOI8W8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J2mQSRfVE5nXJ+OEyvqc9xAUfUN6pshA1cMF3fZ1Kq++BkTJUtrtIgiMjW3X8J0sI
	 e/DOPjqFG5gDMXdpnahS83a3MyHwhRp63mP3avwYQ3WOm58NSuRF4VaolL45YIYr05
	 fiALNy7KMOWCKPy2rCVSrymSWwbZXa1IEyVPczQRWkr43OYjzJve5LM0CZltgISHD8
	 Ns9EGttnIYpqfzHcZ8vUgaOvnBleGZ8iGd5oyCJki760iWXt0xyrR+GrV5NrBibLcb
	 3pJhfH+IEkhCRytREhzgJgPXAfgQnxO9UrLkDG5uqEq9KfM8I7ocx2Es4Z/8+dGG1o
	 yLlis3PgC9Tvw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230921183313.54112-1-bragathemanick0908@gmail.com>
References: <20230921183313.54112-1-bragathemanick0908@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: tfa9879: Convert to dtschema
Message-Id: <169541090782.56212.5542845690705376801.b4-ty@kernel.org>
Date: Fri, 22 Sep 2023 20:28:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: OF6UJX526YLUN6X6BAP7G3EOWK2HQJ7B
X-Message-ID-Hash: OF6UJX526YLUN6X6BAP7G3EOWK2HQJ7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OF6UJX526YLUN6X6BAP7G3EOWK2HQJ7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023 00:03:13 +0530, Bragatheswaran Manickavel wrote:
> Convert the tfa9879 audio CODEC bindings to DT schema
> No error/warning seen when running make dt_binding_check
> 
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> 
> Changes:
> V1 -> V2: Fixed DT syntax errors and doc warning
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: tfa9879: Convert to dtschema
      commit: 39fce972fd7259395663586e59388d702afec30e

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

