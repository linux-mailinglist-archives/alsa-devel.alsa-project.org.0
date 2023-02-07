Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16B68E414
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:01:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AAD583B;
	Wed,  8 Feb 2023 00:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AAD583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675810899;
	bh=WzSQNiF/P64y+2om0COYsQQqKEyixS/cjtst1UNa0VY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G0l0JbI1XWl3BmQYE5DdfelteQkqPLzLaty5fZX8MXVZtZYFhg1DXGgxDMsHKp23y
	 Dj8u/7Hy4k93AFd+O4OejWuRs19WZMJsvhvG7g2mukLyCu0o9MMVM4CbSR/urzMPzi
	 mrBFTkUmKk6aVoz8tf7PqAldKwh3BjF9ipUgHRnA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 966A7F8010B;
	Wed,  8 Feb 2023 00:00:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32585F8012B; Wed,  8 Feb 2023 00:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DB35F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DB35F800E2
Received: by mail-vk1-f169.google.com with SMTP id r28so1955632vka.4
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 15:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPyVZIpN0FwAdN9R9CTFnTvuWd1/gJoACGAtnhIy+Qk=;
        b=CnqI7HR0QOaSxJdiYT68MCN1/OqULRPYkaL2Wr5CyPJCDsGYL2FO3Y999NUQNgH7wJ
         lgS0H7YBEXe3Jb6RfTIQ5VXbFBjMiZgU6632VbPZZOKhv/m8Cx+pcr7D3mYUqweVGR/v
         95HO7jokaaHKvonYLMPLWwpKQxP1AG+VnElLx1LoC6APoQUmu1V5++rHSw47zReeP0Cq
         cZnXBpZzcj5Mf87GIV8qYiqLpgofQvNKchHGvz3HtANa5GlWjRedr3ueKfoPvRZ1pGd8
         ciqF2mmpYvS+5OCgw5qzjb8NGjs3TzFfPrP2sA6tNHph11/mBS5J9xeio2gT6q6VeSqi
         U+mw==
X-Gm-Message-State: AO0yUKX+yMgPnLspu1CFS9FIFPH5DqvQDkSNc2/2Gt6tk72wlECGNDnY
	TrDEMZGkJrr9kKyTODph5t1RZTx6Mg==
X-Google-Smtp-Source: 
 AK7set+hznFQEHzf2Hr9+9cQLKct1X7nEWhvUZ2fL6DzpfEcUHkveKOh0p3fOokjzyTqibWnuajNVA==
X-Received: by 2002:a9d:7dce:0:b0:670:8cc8:3a00 with SMTP id
 k14-20020a9d7dce000000b006708cc83a00mr2796731otn.19.1675803961677;
        Tue, 07 Feb 2023 13:06:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 bh15-20020a056830380f00b006864816ecd9sm7039529otb.59.2023.02.07.13.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:06:01 -0800 (PST)
Received: (nullmailer pid 4153448 invoked by uid 1000);
	Tue, 07 Feb 2023 21:06:00 -0000
Date: Tue, 7 Feb 2023 15:06:00 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add the Infineon PEB2466 codec
Message-ID: <167580395997.4153388.12039194229273966008.robh@kernel.org>
References: <20230206144904.91078-1-herve.codina@bootlin.com>
 <20230206144904.91078-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206144904.91078-2-herve.codina@bootlin.com>
Message-ID-Hash: Y4A2SLC2HG4I5FZS6I7RXZLLUJJ3KJR3
X-Message-ID-Hash: Y4A2SLC2HG4I5FZS6I7RXZLLUJJ3KJR3
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4A2SLC2HG4I5FZS6I7RXZLLUJJ3KJR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On Mon, 06 Feb 2023 15:49:02 +0100, Herve Codina wrote:
> The Infineon PEB2466 codec is a programmable DSP-based four channels
> codec with filters capabilities.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/infineon,peb2466.yaml      | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
