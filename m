Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83B87BFD4
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Mar 2024 16:24:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB7F162A;
	Thu, 14 Mar 2024 16:24:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB7F162A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710429854;
	bh=Nxn5JtOFrYpN0fHpacI2byBmMGBLKNGEX9bKalqA2BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mKwRsXMjdNvDWTvtlDQJxzZ9T6RHMoeD0CfVBj0xOrO9/lwkZbXuUjsd6rYbkuvtx
	 BRaTHWjzpFW96fGm/9EE7Q8sEJi8ajoKOhWcGuglTXYWMNvyxRihM9kktRshIIRrTR
	 goUitPQxBwFTybTuRuFJREzsbfDJra1RqvMr1WXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9B76F80570; Thu, 14 Mar 2024 16:23:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D19F80563;
	Thu, 14 Mar 2024 16:23:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C211F8028D; Thu, 14 Mar 2024 16:21:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D59F8014B
	for <alsa-devel@alsa-project.org>; Thu, 14 Mar 2024 16:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D59F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NJPRTefm
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e6aa5c5a6fso1215778b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Mar 2024 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710429684; x=1711034484;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7sWNt577aBHDyddBZ3kkUFNs3z9eJyKWD9qgLbpckE=;
        b=NJPRTefmi6C7SyZhe+zqMpMI5guLkyqBnlW3TUVosX9iRHDzEuSm9lnvEbRfs6TeLZ
         ppIJNNtbLNShTauHTAzqY7P0bKsaJnbkgHsghTwCoT+s3iHXnoN2z5qQpCVvpJRptfoF
         OLn+j7bLwu+/FjcE6BNAJTxcBmyeMfMaP/DmdxnsDZ4LtWXaMoV03MGL4g4p3en9tR1O
         xeG47xQkzj4sFyqjSOEApvxBFwz+0tA5f5Z3XJde0RRKlCBQTwtjDNDrsu7W5FS0oEnk
         tZFwxXjtiYcHMqZbQ7aG3Hnaa04OAuI26AvzOLE8BFcjAdsf0r/xmZgc10g253i19cHh
         ftOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429684; x=1711034484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7sWNt577aBHDyddBZ3kkUFNs3z9eJyKWD9qgLbpckE=;
        b=leYcZ3xcY1+RYB038NQeSIXFKJpbnOIqAci1YcBkV8JcXIPj6U1pXvxd+IaqFQPYQA
         zj6Fg1fCM5tWBsRJT/uavdaCj8fDrzZRZMhObW5qChqSNKrPgypntCd5clr43QjVljX+
         hoOJMPuaES4WMr7EU/IVxl0+63JA334J3R5UKDBpLfh0VlVObC8SUh8NsDFZ10F4ZkHv
         jPLfyd0u6b/hnPjDdCLGIknu28A9Jy2WKnrbXxRw19yWv2udtZqp8FAkoPev+8haBJ5Y
         Op5nubucG9caDHD/MiKLA9SQISiH9xZyb5rxzEhmpkjKqt27G6NBSGw9TPbMaxJogCFU
         xDnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwHsukJCgA7OFYUCv/GkQ+HKXmxmboJ8DTEGoHPBNupUzHqh2/ntHFmTJNy0Q/1hUhKJL1fEsmv5JX9/H5rQB6j+t3k9lC8ERHrrc=
X-Gm-Message-State: AOJu0YxgR1KNmUl1YCgOkwgPzmSt+F+osz/we+vTuOxSq6lPLhD3xACJ
	kgNcaWtIn9zEJ8FkZmJ6V/svGBqdzz3BCcGJfo3Z/T6IkQqXGc+Z
X-Google-Smtp-Source: 
 AGHT+IE976LiIs3J+wZRKHFMiWO2GPc/z1HYI5pokfTUW/WlvRcrsBtERWAE0daVU3yJUtEiJynjHA==
X-Received: by 2002:a05:6a00:2312:b0:6e5:eab8:4db8 with SMTP id
 h18-20020a056a00231200b006e5eab84db8mr2351181pfh.17.1710429684285;
        Thu, 14 Mar 2024 08:21:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 y1-20020aa793c1000000b006e6795932a4sm1618767pff.80.2024.03.14.08.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:21:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 Mar 2024 08:21:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 07/27] net: wan: Add support for QMC HDLC
Message-ID: <bd7b7714-1e73-444a-a175-675039d4f6e4@roeck-us.net>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
 <20231115144007.478111-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115144007.478111-8-herve.codina@bootlin.com>
Message-ID-Hash: SLAVUIYKQZI6RC2HNFA6VMZRQRQVCVIH
X-Message-ID-Hash: SLAVUIYKQZI6RC2HNFA6VMZRQRQVCVIH
X-MailFrom: groeck7@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLAVUIYKQZI6RC2HNFA6VMZRQRQVCVIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 15, 2023 at 03:39:43PM +0100, Herve Codina wrote:
> The QMC HDLC driver provides support for HDLC using the QMC (QUICC
> Multichannel Controller) to transfer the HDLC data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> ---
[ ... ]

> +
> +static const struct of_device_id qmc_hdlc_id_table[] = {
> +	{ .compatible = "fsl,qmc-hdlc" },
> +	{} /* sentinel */
> +};
> +MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);

I am a bit puzzled. How does this even compile ?

Building powerpc:ppc32_allmodconfig ... failed
--------------
Error log:
In file included from include/linux/device/driver.h:21,
                 from include/linux/device.h:32,
                 from include/linux/dma-mapping.h:8,
                 from drivers/net/wan/fsl_qmc_hdlc.c:14:
drivers/net/wan/fsl_qmc_hdlc.c:783:25: error: 'qmc_hdlc_driver' undeclared here (not in a function); did you mean 'qmc_hdlc_probe'?
  783 | MODULE_DEVICE_TABLE(of, qmc_hdlc_driver);

Guenter

> +
> +static struct platform_driver qmc_hdlc_driver = {
> +	.driver = {
> +		.name = "fsl-qmc-hdlc",
> +		.of_match_table = qmc_hdlc_id_table,
> +	},
> +	.probe = qmc_hdlc_probe,
> +	.remove = qmc_hdlc_remove,
> +};
> +module_platform_driver(qmc_hdlc_driver);
> +
> +MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
> +MODULE_DESCRIPTION("QMC HDLC driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.41.0
> 
