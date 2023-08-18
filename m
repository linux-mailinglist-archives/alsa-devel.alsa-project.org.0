Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A7E7815C0
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Aug 2023 01:19:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDBD884C;
	Sat, 19 Aug 2023 01:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDBD884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692400789;
	bh=mwDP6sgqyQByOgYeBKoSsioXrtMdqFsKg1F4z8NHO8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rFV7A/7vQO0tJb8vaDhsqzYTrbRL6s1p4JZ9mN6FCYT/ppPT2gP0VaZmvHVWOBvKm
	 MISvIakyglV+DUxL2en30rwSqBtLOzzyr4OmRwrtNukYcKN1W/ZOhMCzvDVpvv5Iz5
	 dVPCQ3UK380fmnSwL3ZvmTxnjFsCirCE5cocbfEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F06E7F80536; Sat, 19 Aug 2023 01:18:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EB70F8016D;
	Sat, 19 Aug 2023 01:18:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3AB3F801EB; Sat, 19 Aug 2023 01:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8666F800EE
	for <alsa-devel@alsa-project.org>; Sat, 19 Aug 2023 01:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8666F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vkl51uAg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LRQRZPdrv4QI8bQQoUTKBOoMNyJa1LbrbkfjcCc8uZw=; b=vkl51uAgZ2coNgQgP/P4b8/ozl
	CFZbSnec4ohA+rkE1H92ceFU7AiniNCuavWVyoH+RyBPtjuVUujA6tVAn0aKhzlJk5cRfdds56VFv
	yyMQXQO0bhc7s3zU31cE4b8FwZSyl2wQSdKL0PeJhOs/X4xKGhiQcWiWslcEMhB89CeaPQ0bF6qIx
	NOpTOoT34ekpDhGPB/jkuU5NCH9HH0vAdwT13mclegA8ucop3r+npiuv4n5YQ7mb53OC6ld6DFrZ0
	a0d8CX0NKx6XMbylqHUv7n+TK5Df613wD3hawMRTVHw7ALG868QMRyGCCLxRXRAtPH8xLhJ2pZUBC
	ef7BHUKA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qX8jS-00A9bg-1P;
	Fri, 18 Aug 2023 23:18:18 +0000
Message-ID: <e1ca6c2f-92e4-6dad-79ec-71cf66e9a385@infradead.org>
Date: Fri, 18 Aug 2023 16:18:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 27/28] ASoC: codecs: Add support for the framer codec
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <cb734efe2eeb89cb1afbf01d3625181537e2850f.1692376361.git.christophe.leroy@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: 
 <cb734efe2eeb89cb1afbf01d3625181537e2850f.1692376361.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F4MA25B3JTWFQ2KFF66NG5YBO35NOO24
X-Message-ID-Hash: F4MA25B3JTWFQ2KFF66NG5YBO35NOO24
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4MA25B3JTWFQ2KFF66NG5YBO35NOO24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 8/18/23 09:39, Christophe Leroy wrote:
> +config SND_SOC_FRAMER
> +	tristate "Framer codec"
> +	depends on GENERIC_FRAMER
> +	help
> +	  Enable support for the framer codec.
> +	  The framer codec uses the generic framer infrastructure to transport
> +	  some audio data over an analog E1/T1/J1 line.
> +	  This codec allows to use some of the time slots available on the TDM
> +	  bus on which the framer is connected to transport the audio data.
> +

Just curious: what controls the slot allocations/usages?
Is that done in userspace?

> +	  To compile this driver as a module, choose M here: the module
> +	  will be called snd-soc-framer.

thanks.
-- 
~Randy
