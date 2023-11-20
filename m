Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6593F7F1D41
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 20:21:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B879BDF0;
	Mon, 20 Nov 2023 20:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B879BDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700508102;
	bh=7l/BJemceh+NKK3sSMzDbS+2RzVYcr6sgFQMzStHspU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qpzNzQkjacjtV70fxisa36OFbOvetZ2Y1TaJKeK9Ns0BFAy9FAS14i9d9UXEcLgs1
	 WB0aDIIPKOiPM6S6EBsMQYQj6h4Tgg0AUkJWPDk3bRAqHOD+9XvVxavOZvZ2qK1Amf
	 Tvs5iP8zsLY4o0lBJd0y3LISe10Fnl//FbEASRks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C539F8047D; Mon, 20 Nov 2023 20:21:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D82DFF8047D;
	Mon, 20 Nov 2023 20:21:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38B90F802E8; Mon, 20 Nov 2023 20:21:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C488F80254
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 20:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C488F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KTUjuRog
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46767CE1692;
	Mon, 20 Nov 2023 19:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05A4C433C8;
	Mon, 20 Nov 2023 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700507931;
	bh=7l/BJemceh+NKK3sSMzDbS+2RzVYcr6sgFQMzStHspU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KTUjuRogANol7OYCdPyp7ohz8lnqc/2AsUFiCtytA6PVPb6xDLTlsKHiEdVGaYnkV
	 OpCB+CLx/yhopSc7sgbvGlk9LUu4AGp+qnp9NxfO4Qe/7/zMqyNlyafre1aPb8tKOJ
	 lgLl5+JWl6PohkmCvaIQUvXdcqVw7g3Ed+PRwS8QIKG2Wd4vWFrsI3BoZFU7MmoB1S
	 drWAxY+46M5W5RaDa8p0n1cAcR1gy3gV0Rf1jWX6+Mo2PzqlnMTlo+5JGt34NfNziL
	 Qv2I1Mriclg0NTXbA68HjMgwQOMj+ezvYHE09HJpR4pjlNoN6Rd0pBkoZAw53JyeL9
	 YSToaWCcFKj4Q==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
In-Reply-To: <20231120084227.1766633-1-CTLIN0@nuvoton.com>
References: <20231120084227.1766633-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8810: Fix incorrect type in assignment and
 cast to restricted __be16
Message-Id: <170050792951.1294254.14784272204812613089.b4-ty@kernel.org>
Date: Mon, 20 Nov 2023 19:18:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 6WPFGDD67QJHHJZAN3F2I52ELSH3W6LS
X-Message-ID-Hash: 6WPFGDD67QJHHJZAN3F2I52ELSH3W6LS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WPFGDD67QJHHJZAN3F2I52ELSH3W6LS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 Nov 2023 16:42:28 +0800, David Lin wrote:
> This issue is reproduced when W=1 build in compiler gcc-12.
> The following are sparse warnings:
> 
> sound/soc/codecs/nau8810.c:183:25: sparse: warning: incorrect type in assignment
> sound/soc/codecs/nau8810.c:183:25: sparse: expected int
> sound/soc/codecs/nau8810.c:183:25: sparse: got restricted __be16
> sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16
> sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16
> sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16
> sound/soc/codecs/nau8810.c:219:25: sparse: warning: cast to restricted __be16
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8810: Fix incorrect type in assignment and cast to restricted __be16
      commit: af524e9dcb43f5914cecb3a3f4b79081d2e3f7f8

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

