Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC0909EC8
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 19:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F23FB65;
	Sun, 16 Jun 2024 19:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F23FB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718558834;
	bh=Xm/0Py7i6a9IMqxBVqF8drxyHQMhWCpJiWp2iMkPlSI=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gjyixpeaohE4bI7jcnoj/pREfQKIaULD6GeLt33s21wQy1l7UyQ2qtDs4jyLuvg00
	 l+c82s2YpWcmiZnoFM85wd/hrvL0SVONQA3HDXUnJ9ykZHuwdF0toJF4QcUGX2u7fl
	 7RrobnMJRO+Fr6YxXqUuQyYpJTQ96o7YGvfjscgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4DEBF805AC; Sun, 16 Jun 2024 19:26:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BA3F805B0;
	Sun, 16 Jun 2024 19:26:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09E21F8023A; Sun, 16 Jun 2024 19:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F584F800FA
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F584F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=DiAAoDov
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718558791; x=1719163591; i=markus.elfring@web.de;
	bh=9nBqF5ESlkCFxxxtSfxxafJZFyJpQbDfqjP2Yj1FlIk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DiAAoDov0evEhITeHjo7u35qPLueFX6HSYuYpyisk4X5eKpIHooR7dBk95psSnjB
	 AQdd0Y0o4dBP5/f7V43DJxJSnHNmUH5tDhZvxrR4V2DnXDnz8iec+DZ9PH5Sn2S6/
	 isRjwpx/TkslV7whq9ZP/B2dwQtKAFOU4c/OrcikDIqhnjfflqywSI53aYT5ZesZT
	 ndBVylcwSHNra2fOJ3b7DWC/VN0ONRplVeI3G3PM6Ks1U/ubC4ROK+RBO8fbR2xh0
	 l0ruJxWrNTTxZ6PGXgmO95oRbHXwSBcDIE5yFFGWOqxdD0Kn05e1A5R7W4qpRFU1X
	 MZOCO7WIm6G7yePL2g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6pUQ-1sJTkO3WVq-00Ef4G; Sun, 16
 Jun 2024 19:26:30 +0200
Message-ID: <2660e72f-e2a2-48d1-8571-b738d9739917@web.de>
Date: Sun, 16 Jun 2024 19:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c4qMevEEZoDUqoRZeATp8WmsNJbisvOlM4oORsHrrjrrsyD8K+Z
 nNih8QUYdTTgvUeNfktoQpIH4cAzbc3XB/e+ap8BXKwMBd8CT1AWDHCvs8pbYDpsfDsEmrj
 Y+tzfzcuVENc2x6GJZKi1BpOWh/TUa8Ocii93k1JzP3E8pBxPmHgismL4NvcBDZJcyCgd9d
 kEgzsm+XKdqqsYb7ndUfw==
UI-OutboundReport: notjunk:1;M01:P0:NhWsXH4dfU8=;YdKgy7veYd3vy2o4WUWvR6kCH9a
 IahlDipBDK+K6LYLz6A/eX6whnMhGi7fHhxH1fkkNL4BNBPVi25uGj3OOkoyKWxk7bDRp8y9M
 6PHyxB3iYqN/HqHyKIn5IYaTkMgM5sEP7nc6VvINgSZ/NoLvrls8Fz9LLcUrPZIEkq21YhN2g
 FIYL2JmpoWzB/IgWsTiBFLMzWknPFCsaeacBXhPp7uQwfSIh6f0YRPR96vcMC7vCbQTM9M8tH
 xjUGcSMZxARJ8ePFWN1wIKAbG8D2cn2P/6c9pGIcUTKxuE53RJDe4fT/+iJPRGswLUSYNlqjh
 o9KrXhWRaUX2Fscbuut+AxArU84irUCsOoIv4rElYWrTV620gUegA+McSJ0FRfqbDI7NAQpWj
 3RoJ+T7KMaFQdyBLy9SjeXb/a7zWdMCqGmzJwdWI422XoTV91/Ksinb5JS0jQuqNST4bAqAU1
 rHdTveJ3KV/OAhhFTv+2aYsbD7BO5mGVFO75nSd1cCYnhccju5ZzvoOMFDVRyg3hZ+N+zgDsm
 /cOjSCIlfyFS7gKuMZfh2QRt9ZyVb1sx34iNwNRCPGaHWv9b5FtCAjqj0vbQGy9z0stcqzQ3T
 oqbHwqNVXFVQDyMmXk8JYas7bYPFnwxU1ox6BbBbGvcP6jNz1gF+39aKq6gDJE1LXe5NUAVO4
 7ru0uZ2RZF/OClscS2u++V+JhgSdkQj2hhpNiIjaZ+1H7dyMgDjqO4ewWXcfmsC5ujfEo0zZv
 a6NMbsSTyE6sbrWUmpol+FrIXjIBaiQR4tQ1i7Hjyxt31B+FdwgkM7CdUA32nc8d5hKfb3d8c
 ky9pOQn9kg0Y3xzFs4EqrN6JJQKC7TDx9UJgLxI9/2lkU=
Message-ID-Hash: S6GGPUPC7G7YCEHADD2YNVSTK5IESOZW
X-Message-ID-Hash: S6GGPUPC7G7YCEHADD2YNVSTK5IESOZW
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6GGPUPC7G7YCEHADD2YNVSTK5IESOZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -0,0 +1,1677 @@
=E2=80=A6
> +static bool wcd937x_mbhc_get_moisture_status(struct snd_soc_component *=
component)
> +{
> +	struct wcd937x_priv *wcd937x =3D snd_soc_component_get_drvdata(compone=
nt);
> +	bool ret =3D false;
> +
> +	if (wcd937x->mbhc_cfg.moist_rref =3D=3D R_OFF) {
> +		snd_soc_component_write_field(component, WCD937X_MBHC_NEW_CTL_2,
> +					      WCD937X_M_RTH_CTL_MASK, R_OFF);
> +		goto done;
> +	}

I suggest to use the following statement.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.10-rc3#n532

+		return false;



=E2=80=A6
> +	/* Read moisture comparator status */
> +	ret =3D ((snd_soc_component_read(component, WCD937X_MBHC_NEW_FSM_STATU=
S)
> +				       & 0x20) ? 0 : 1);
> +done:
> +	return ret;
> +}
=E2=80=A6

How do you think about to use the following statement instead?

+	return (snd_soc_component_read(component, WCD937X_MBHC_NEW_FSM_STATUS) &=
 0x20) ? false : true;


May the local variable =E2=80=9Cret=E2=80=9D and the label =E2=80=9Cdone=
=E2=80=9D be omitted
in this function implementation finally?

Regards,
Markus
