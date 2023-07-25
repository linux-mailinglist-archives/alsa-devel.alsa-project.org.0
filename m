Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA799761EC6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 18:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C75CFA;
	Tue, 25 Jul 2023 18:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C75CFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690303359;
	bh=8NuDHU+UwooI+MQUkdnO89GBWgCvSwS3xfEzPScAyOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GLg40vd6Ny3CH3QpMCSWUhQujmrQv2GRt0qcobXvuaK3aJQ+AEhrDtmyAa2HBrQxk
	 4TJl3gpcZr16zqzziws/uZCsTKWIDWM6BN6sDt/9aPdwqh7Jzkb3oOzWRo+PJowPF8
	 JhwUTnDDsrq8v0CEee8uFKWZTZczv4o5ht5qvOBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F423FF8053B; Tue, 25 Jul 2023 18:41:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CA3CF80163;
	Tue, 25 Jul 2023 18:41:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C24E8F8019B; Tue, 25 Jul 2023 18:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D6ACF80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 18:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D6ACF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OE0Yv0C1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=VOpi6FeyBBxDJ9AWuyvGv6z4rjqWqlFn0g7noxTOdPg=; b=OE0Yv0C1dfCRicRWSmNMM59Dgv
	MSlzOqH2FV32nJBQJYdaqktbAXnisAv4pM7CWD5mP9T7qa9mLIz8K9Ttq4APloaqzMCPgRMRhlsS/
	muNPAvD9OZaUubBkxJZvQp1mw6eIdlwtFYM3JoCaGNhX/kBG+VrMhTclgrlCHqbDInmNRjBuZE1rJ
	miJiFycFAZZ8O+qr9Lk/9p72vtqzNt4lDguzRfxt3Kx5aWulYjUwyyPDyD+I+qFRnn/HclzHEHzUA
	UtHYz2xsCpPl/gEJBy/hGRuLEzy4irKjnW8K0JJrZkxj8GlXfp8f9fi4l2nTMdRRrYaQTpTls0+vh
	uXR7iMsA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qOL64-0083WK-1X;
	Tue, 25 Jul 2023 16:41:16 +0000
Message-ID: <ce045e96-e9b6-ae66-dd54-67a958ca1774@infradead.org>
Date: Tue, 25 Jul 2023 09:41:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 24/26] ASoC: codecs: Add support for the framer codec
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>,
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
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230725092417.43706-1-herve.codina@bootlin.com>
 <20230725092417.43706-25-herve.codina@bootlin.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230725092417.43706-25-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DXSKKFRPKS46NJXDOMWXF7QRT6RWLAD3
X-Message-ID-Hash: DXSKKFRPKS46NJXDOMWXF7QRT6RWLAD3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXSKKFRPKS46NJXDOMWXF7QRT6RWLAD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/25/23 02:24, Herve Codina wrote:
> +config SND_SOC_FRAMER
> +	tristate "Framer codec"
> +	depends on GENERIC_FRAMER
> +	help
> +	  Enable support for the framer codec.
> +	  The framer codec uses the generic framer infrastructure to transport
> +	  some audio data over an analog E1/T1/J1 line.
> +	  This codec allows to use some of the time slots available on the TDM
> +	  bus on with the framer is connected to transport the audio data.

	      on which

> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called snd-soc-framer.

-- 
~Randy
