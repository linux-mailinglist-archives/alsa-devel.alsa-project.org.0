Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71D26C293
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 14:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3AD1169A;
	Wed, 16 Sep 2020 14:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3AD1169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600258373;
	bh=qScRLO8kLseMI6NKcnB6M674mdhaDUEHqHLxLBJsQMk=;
	h=To:Subject:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RqErGG9R3DaVRqyqoKt4xKNY3KNUXq6iuNq5IdOZN00X3r5ZeJUCJ05ZM7ia7xWRO
	 nNW7HKHqY8sYXPy3W27IhVws/CHdDoLSGv+Y6GSFxM63mXJTDb5LDsE0dUU4NqoIdZ
	 DiPWnpiyg7Lf2dozC5iSDuPGie+yJLAPcGdtKb30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B83B4F800E8;
	Wed, 16 Sep 2020 14:11:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BA7DF8015A; Wed, 16 Sep 2020 14:11:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F1A0F800E8
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 14:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F1A0F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="qtruedyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1600258250;
 bh=qScRLO8kLseMI6NKcnB6M674mdhaDUEHqHLxLBJsQMk=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=qtruedyIAoytpQGorRMjDQadRKj+Tcad7TXs3VcVDDdYhHdBW5oCiRlg/s25upv6s
 utYGasSyek1hYjHBxeT3+/CkCKXnNYuBNdDBIfloollYw7qiQ5XEKJpPiiuroLLvJR
 2vz3nH4fB3uOCzs7XdXYf4r3GnaVb6f4qyGmQKq0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.146.165]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1k74CG0ldi-00OydJ; Wed, 16
 Sep 2020 14:10:50 +0200
To: Xu Wang <vulab@iscas.ac.cn>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] fsl: imx-audmix: Use devm_kcalloc() in imx_audmix_probe()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <de79bd45-aba0-e497-4f33-5153ecebc6be@web.de>
Date: Wed, 16 Sep 2020 14:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:J57nP3tFLxyk+UVxx/ZboHnjdtnZ1yXL0hVwQmeo26SqzPMGxDp
 y0AVxTFgM3QPQQ1yysikky+kKNLfXlkt+Pkmprxl9NgTbknD4wUvKOpaAM3UFIBgc0MV0Rd
 q7ij9wypdUNt/VnTVMNbyTjjP65Id2rBh3pTHPAswbLUkeJBnygCe0wtwzRFNv0Y9o4K4vw
 sLld04YUZjThucQPqyqPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XVyHVHg51YM=:1DNKB12FSRPEvYDNpFLo7c
 vvHdv+332Tg/hmGJca/nEBO9jsnG6t2cPCprr0tjkOzdai7ZLX/+Hms84jiJ8D2Fk/cCfOdxr
 H0fndWXUyoyvRJZHcN56cbMJCR9GxdQ3W9suiPOoYMu61PTkh0/clttfyGuxk4PP7Hqc63XAR
 sbHr5zShyL7utBeb7WF8vNBMqsswoS8iNR02fbWlB+M2mCX3ktfUeHDK4P5gLo8Ogh1mgYmvO
 C7S69aMGiFvgI6/jzYAqPr8KSau/oNltIKeYZPrOg3Gd4N2SjTHPi2LUMTZaxF//hsfJFSXAZ
 ul2Nx/Ockaw4j04XlZcHvBLLIBhk2qjkEKBjPPEFFBJZP5ksYA34+p9X9Q7zExTyXV6HC1Uem
 vwtSUaQRsZHxOmPOeZPpeZv7Xaf6t4kEndAGp1F54Df7WNoH23J8wLyjFVWrK7Cff/U+b7RUO
 zbiQjYMMDVb7rRgDo7gcOcxAdOO5IlL29GR1EZNfnKOVp01GjrWergSoq5oKQZRRUnk4u8FQb
 nxfQKV2dBrLorUIFY7bHLbmeYSMICHwTBY05E/KRLzC7NoWoz527Cs1ZHiu/kHiR0+CjkBPpA
 GL9nSfY9CGhQlDergdJ00XRs0K4rVIFUFYtFDI/5cmZ0YgRGQDNIOF/swql9hFVLl8Op6Tp3k
 +MwZygTlhPMSKN0DUAIvYWiiqhZVmVnMJtiwcw6ezLEZGqtALkkYtbO5xfxbqG9ihLKT1FNm7
 J4yP2i9EIw9eTQg1L9YwEhFjyiEWw59pY3TaCu9MnMm0b323WylGL3MLqMUIzgedmBIemVtEu
 Jt5NR+mQT1OaoP5YqyFqREw6xeLkghHRgePKewGTJAIpw4WAlXRah8xJZATX9rg9V6AhUtpfI
 iLHwPC9UF95CmXf68uqJp2xTueLMR8N6ldWEp/qFoDEa5jbjKU+yp69RPxK/oOHgnGJsm/jDn
 IxaFnWsl5hgdWzMDluZFC+GbK2vwiOUhiFkgYvKGmzaMCyax7F0sjwCjtF+/EmCB79zPKLtaX
 TKtwTkGDhUF0W2uTRG6eFvJPBcY9oa3d/k4u4bCFeEjB2TLElNCISZVF3HskDkjRG7IVsFWk1
 hDs8agBVXGsFOlCC15j2ltnOfh9IxvVmAG/uptcOwZZqtua99eXjXqEWO0mbXTmM1/OgtBytq
 R7AekQvFSwT1FVBAXDjwuZQTxKpI6HFMiqTZXdJR2NMaLrtwuM2JtzSrOAa3S4IDbMncSCOwS
 avkWxOMaayiuSaeJsO/MSPtxrMq00vyExOkT+8A==
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "devm_kcalloc".

I find the previous patch subject inappropriate.
Would you like to choose an alternative?

Regards,
Markus
