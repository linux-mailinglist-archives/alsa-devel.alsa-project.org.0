Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B78DB72105C
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Jun 2023 16:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8582A208;
	Sat,  3 Jun 2023 16:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8582A208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685801402;
	bh=488FeqUf5gD8LUkycLorAx9qEClxfV6UEE/TEJFd+xI=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iNDt5Oq0w9FG8eapLrFsBbAx7bspNIwJIBc2ehuhBJ2d4QC6a3sTduHSS7FmEKy5F
	 RzRlCyef483AtyQHgctDtBWAOXr67DYlj1De2d5BGtMQHawjrteB6pbJFWwmBSwaO0
	 /gvMiyRFav6ZK4Ew9h43JLPlSQmN/F664psyL3iQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D758F80527; Sat,  3 Jun 2023 16:09:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBF04F80149;
	Sat,  3 Jun 2023 16:09:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09E8DF8016B; Sat,  3 Jun 2023 16:09:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
	SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 484FCF80149
	for <alsa-devel@alsa-project.org>; Sat,  3 Jun 2023 16:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 484FCF80149
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 026c733a-0218-11ee-abf4-005056bdd08f;
	Sat, 03 Jun 2023 17:07:44 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Sat, 3 Jun 2023 17:07:43 +0300
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 6/9] ASoC: soc-dapm.h: Add a helper to build a DAPM
 widget dynamically
Message-ID: <ZHtJLxNReoc4Yjqj@surfacebook>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
 <20230523151223.109551-7-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523151223.109551-7-herve.codina@bootlin.com>
Message-ID-Hash: RYBWOUGUB7ONJUEM44SVDUOHYPOFWLFI
X-Message-ID-Hash: RYBWOUGUB7ONJUEM44SVDUOHYPOFWLFI
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYBWOUGUB7ONJUEM44SVDUOHYPOFWLFI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Tue, May 23, 2023 at 05:12:20PM +0200, Herve Codina kirjoitti:
> The SND_SOC_DAPM_* helpers family are used to build widgets array in a
> static way.
> 
> Introduce SND_SOC_DAPM_WIDGET() in order to use the SND_SOC_DAPM_*
> helpers family in a dynamic way. The different SND_SOC_DAPM_* parameters
> can be computed by the code and the widget can be built based on this
> parameter computation.
> For instance:
>   static int create_widget(char *input_name)
>   {
> 	struct snd_soc_dapm_widget widget;
> 	char name*;
> 	...
> 	name = input_name;
> 	if (!name)
> 		name = "default";
> 
> 	widget = SND_SOC_DAPM_WIDGET(SND_SOC_DAPM_INPUT(name));
> 	...
>   }

Maybe instead of adding a helper, simply convert those macros to provide
a compaund literal? (See, for example,
https://elixir.bootlin.com/linux/v6.4-rc4/source/include/linux/pinctrl/pinctrl.h#L42)

-- 
With Best Regards,
Andy Shevchenko


