Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21F909C09
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 09:15:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B56D0850;
	Sun, 16 Jun 2024 09:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B56D0850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718522104;
	bh=+OZys9MJKjQjiTKcvx4NEmnpvqcjrD585Do8GvjtISA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPR0YYgGCFHp5+WVenIwRUgbbiA5Dgu1C16Xxtnokn5Q5YRpiVYKAie2NQt2KSWYh
	 r7XwKamL/88Nr9X6SnuZbMyHtlXt5XIFZ19F6Wi85bRyb/vFdn88YhNa/c5hVFEU6g
	 dAadqxlL4eJr7SMaaTnbiXdz50bPafGkkTZnFZ5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2978F805B2; Sun, 16 Jun 2024 09:14:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA628F8058C;
	Sun, 16 Jun 2024 09:14:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2B81F8023A; Sun, 16 Jun 2024 09:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr
 [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53351F800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 09:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53351F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=RZExeNms
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id Ik5as8CMcevLqIk5bsMq50; Sun, 16 Jun 2024 09:14:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718522060;
	bh=YP7PkSksy9wMazSXjGajDue5tMT2K7r8fSa1XkSOCMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RZExeNmsKlRnZQBILU4YjwXErTuEql+SaccL2uFBjA6xwDM4IK1gZWon0XfW41Rqm
	 u5MS1+gNoKQaor66VozQF1NM+QzzgBYrfVf64wPAlE46LIdXavKTwO2yd6BRghSbMV
	 eOa/MT3OuABzxJ4Sv0OxMrda82F8Sl2RQFQMe0HO8TtZMCo0azizFdYtlYG0Au1tc6
	 2hIpD3IL6C3lhz5ZqV9hPwUHK8B0tIk470L/qO6oLW703+W09Zwce5vl5sALEf76uE
	 2qKjo4YMTV1HmnLgyTc8EylS+rQG2AEtQrfQeaT1JZvs9QQ+dMjV2ZzFqqEXuC8+S/
	 0O4zOexyhTUqA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 09:14:20 +0200
X-ME-IP: 86.243.222.230
Message-ID: <de75c710-044a-45ff-9477-cf4d57f55ab1@wanadoo.fr>
Date: Sun, 16 Jun 2024 09:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-fiq: add missing MODULE_DESCRIPTION()
 macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240615-md-arm-sound-soc-fsl-v1-1-8ed731c2f073@quicinc.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240615-md-arm-sound-soc-fsl-v1-1-8ed731c2f073@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QLPAXQQT6AHIR3SQYTQ4DDHS3GCLEATO
X-Message-ID-Hash: QLPAXQQT6AHIR3SQYTQ4DDHS3GCLEATO
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLPAXQQT6AHIR3SQYTQ4DDHS3GCLEATO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 16/06/2024 à 08:42, Jeff Johnson a écrit :
> With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-fiq.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   sound/soc/fsl/imx-pcm-fiq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
> index 0d124002678e..5ea6dd4c89a1 100644
> --- a/sound/soc/fsl/imx-pcm-fiq.c
> +++ b/sound/soc/fsl/imx-pcm-fiq.c
> @@ -319,4 +319,5 @@ void imx_pcm_fiq_exit(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(imx_pcm_fiq_exit);
>   
> +MODULE_DESCRIPTION("Freescle i.MX PCM FIQ handler");

Freescale? (missing 'a')

CJ

>   MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240615-md-arm-sound-soc-fsl-c598fb353e69
> 
> 
> 

