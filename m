Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF570C1EA
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A52484D;
	Mon, 22 May 2023 17:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A52484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767914;
	bh=hlZb/BcL2ZGEAgC342RcyW00zLOd6SfQlB7LY02Pazc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PAtmjwV/hzHPKyYjsLGvF7gksSZZSj56xOiBMrZFi3ubWCsyH45qYaTZX3u8fOCx2
	 OyN3SRlJB3RVAFpv4bPDAkfSPuizmfxRBx2ORLY0CJZuUFLLujPefR5s6Fs+RJeh8t
	 WWrxX7W8DWfD1dWmm9X6tzE88no0nxT3OK5kCggE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D36DEF805D9; Mon, 22 May 2023 17:02:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DC20F805D8;
	Mon, 22 May 2023 17:02:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AF13F805AF; Mon, 22 May 2023 17:02:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBF17F80549
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBF17F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fBYDK/VP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3983623D2;
	Mon, 22 May 2023 15:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20F6C4339C;
	Mon, 22 May 2023 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767717;
	bh=hlZb/BcL2ZGEAgC342RcyW00zLOd6SfQlB7LY02Pazc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fBYDK/VPEZYhjWLSZPqkAqfOdR+jeTQ71/52z1/kLFXbdegenn3u/pHS83nbqrIfy
	 TKkeJIoRizqKQ5PuZy5/QOJutJwP8bJ3+2T6+mREQvdHgoi5T2MLTTlRRc8pmilO/L
	 nPuAoytudjsvm2Uys1tza03C1RbYD9NDLovH0+m2GEWJoCgIhZTo40MGTmLOJVeVtJ
	 7oH7KsXZmf9oYBIfaInnOxxdVGiMnh5rcl1WNhmkofyYxMzfvPtKRBOC3qcc5xknZ+
	 wXu4zm9JVejw7/dneR4iT6GGtZ5lGUw87TZFstJdtOaMcaz+oNailAX5qep161S/bd
	 EU/BD463hKvWg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 David Epping <david.epping@missinglinkelectronics.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230519110545.GA18663@nucnuc.mle>
References: <20230519110545.GA18663@nucnuc.mle>
Subject: Re: [PATCH] ASoC: dt-bindings: tlv320aic32x4: Fix supply names
Message-Id: <168476771538.849172.7248234647913395680.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 5NGCBXTQOY6G2SQD5V3FCJWFW7R7U3KQ
X-Message-ID-Hash: 5NGCBXTQOY6G2SQD5V3FCJWFW7R7U3KQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NGCBXTQOY6G2SQD5V3FCJWFW7R7U3KQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 13:05:53 +0200, David Epping wrote:
> The term "-supply" is a suffix to regulator names.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: tlv320aic32x4: Fix supply names
      commit: 3a2e3fa795052b42da013931bc2e451bcecf4f0c

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

