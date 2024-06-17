Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B8790ACE6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 13:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3ADAE72;
	Mon, 17 Jun 2024 13:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3ADAE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718623574;
	bh=BiAFqDWMtUBYYL7WNeERH/7QvGS6RZjA1rc5xTNrENo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U47rPmKRCd2WN76fj9vs1Y62XCJp8iMFsT1cYGSGFXpYmwmYwQKDIQRdEcNWyfOGO
	 2rnReNTskjWHUS0U9x47zn3KxSixIW6HAJubOMn/RXFHTxs5rL5EPGNVLPiJWB/aw9
	 /LdszhJlfKThiK8itnawTEdNfyijtQE6amuGBxdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2E1EF805E1; Mon, 17 Jun 2024 13:25:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B82C9F805E0;
	Mon, 17 Jun 2024 13:25:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4C3AF8023A; Mon, 17 Jun 2024 13:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE539F8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 13:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE539F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Uw3wi0Rn
Received: by mail.gandi.net (Postfix) with ESMTPSA id 476B41BF20D;
	Mon, 17 Jun 2024 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718623478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+oaI/YIoihSCT/XzoUgtEbkFRWQb1Z6Coz8KZYx9wWA=;
	b=Uw3wi0Rn2iuwOBAUNNl7q565rusBIKloO/isU7hf7GlumFPLVfvF9Ad5RJmMjReXQE+Qk8
	xtbVKBZ0CDs3NYUGZ3etKgYSMc3ZAsrVX4nFNIobduo5VTXG9DCNGC3HMatpeeuz+gFlZw
	+bhnzYtw5mqQhC0En3/ETef1yiF72bnwpL2v9AV+0V4pfbx53cWWRUyvxiInKLsULFbpLs
	56GQCMYp6In95Kb5S9X41mvcJkjW835YlYuOf9W/lr5ic7OkQCOF64K6FLDdWiX+wDop8w
	1YdPZOIGnPJcT4Sv/mtVz8sBKFI0d5mKwzmppAeDlfnd+Sr7dyoztMLqEVU6Ig==
Date: Mon, 17 Jun 2024 13:24:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Support
 Opensource <support.opensource@diasemi.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/2] ASoC: Constify DAI ops auto_selectable_formats
Message-ID: <20240617132436.640e5310@bootlin.com>
In-Reply-To: <20240617092152.244981-2-krzysztof.kozlowski@linaro.org>
References: <20240617092152.244981-1-krzysztof.kozlowski@linaro.org>
	<20240617092152.244981-2-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: QZCZNDYSD2WTHHQRJGJLWA7Y52M4Y4A3
X-Message-ID-Hash: QZCZNDYSD2WTHHQRJGJLWA7Y52M4Y4A3
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZCZNDYSD2WTHHQRJGJLWA7Y52M4Y4A3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On Mon, 17 Jun 2024 11:21:52 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> The static arrays passed as 'auto_selectable_formats' are not modified
> by the drivers nor by the core code, so make it const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/ak4613.c          | 2 +-
>  sound/soc/codecs/da7213.c          | 2 +-
>  sound/soc/codecs/hdmi-codec.c      | 2 +-
>  sound/soc/codecs/idt821034.c       | 2 +-
>  sound/soc/codecs/pcm3168a.c        | 2 +-
>  sound/soc/codecs/peb2466.c         | 2 +-
>  sound/soc/generic/test-component.c | 2 +-
>  sound/soc/sh/fsi.c                 | 2 +-
>  sound/soc/sh/rcar/core.c           | 2 +-
>  sound/soc/soc-utils.c              | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
> 

I think you miss sound/soc/codecs/framer-codec.c

Best regards,
Hervé

