Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A990AEC1
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:08:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 791FAB65;
	Mon, 17 Jun 2024 15:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 791FAB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629694;
	bh=qqY4nxzUS6e4uPcN05SP0cbe/4Tnnmkr2yZGSTHAFYA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nnDeUBwQuhk9ZJC4EEBgULimp0av2DuIloFvcr+eT1N/cd9kXCMwt0Pou7Wp0jB9Y
	 gwVfJEK+9+SZswsfzrD6uTibgyDGVcMKSCCsMXFjs9KN5MfKNpR/D7+dFCIu41o0Ow
	 dIZJIPsZTYjCcdgZ7ZpsfRcgF7iyuCPGIBcJrN98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 596B7F805B0; Mon, 17 Jun 2024 15:07:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEA3F805AF;
	Mon, 17 Jun 2024 15:07:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F866F8016E; Mon, 17 Jun 2024 15:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D127F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D127F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LFyV4ApY
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5323240005;
	Mon, 17 Jun 2024 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718629623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0JF6HKOXKhTNZVeUo1apz0svwkul+XXTywSXfd492g=;
	b=LFyV4ApYSGB5+3UrEmUE11z7TJ7jWs5zZa2DyPvPZB2kzs++6WZtO44pk3SPZr8NkqzyA7
	15L5SThBZ2dTviknM79/IXX5qn0x2weG2TvBlCXbT0fGj+lI9L2tKUtCgx0j+kwZ1Vu1Dk
	S9zBPRyHlTriafXYX7P+FG49rLnzVn8zq6ZV9QA3HMs393aXyGoUXVtF6vV62+QG0+qhTr
	UBFM58+EV5kyyanpm46pDwC5OH/XpwVYlFcaqclz/lEzw9S28rOdyL8lLc1jf8+MuEUu6q
	F46dy76m+DPLQ959REHWiAKbi+0Zamf/j2N64c1zThXnbK6fmm6GpRRrVt0rFQ==
Date: Mon, 17 Jun 2024 15:07:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Support
 Opensource <support.opensource@diasemi.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 2/2] ASoC: Constify DAI ops auto_selectable_formats
Message-ID: <20240617150701.49a3248c@bootlin.com>
In-Reply-To: <20240617125735.582963-2-krzysztof.kozlowski@linaro.org>
References: <20240617125735.582963-1-krzysztof.kozlowski@linaro.org>
	<20240617125735.582963-2-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 7MCI47VZ2DNXMLTDXKOPPSW4XY2J6RLV
X-Message-ID-Hash: 7MCI47VZ2DNXMLTDXKOPPSW4XY2J6RLV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MCI47VZ2DNXMLTDXKOPPSW4XY2J6RLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On Mon, 17 Jun 2024 14:57:35 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> The static arrays passed as 'auto_selectable_formats' are not modified
> by the drivers nor by the core code, so make it const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Add missing change to sound/soc/codecs/framer-codec.c (Herve)
> ---
>  sound/soc/codecs/ak4613.c          | 2 +-
>  sound/soc/codecs/da7213.c          | 2 +-
>  sound/soc/codecs/framer-codec.c    | 2 +-
>  sound/soc/codecs/hdmi-codec.c      | 2 +-
>  sound/soc/codecs/idt821034.c       | 2 +-
>  sound/soc/codecs/pcm3168a.c        | 2 +-
>  sound/soc/codecs/peb2466.c         | 2 +-
>  sound/soc/generic/test-component.c | 2 +-
>  sound/soc/sh/fsi.c                 | 2 +-
>  sound/soc/sh/rcar/core.c           | 2 +-
>  sound/soc/soc-utils.c              | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 

At least for framer-codec, idt821034 and peb2466:

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
