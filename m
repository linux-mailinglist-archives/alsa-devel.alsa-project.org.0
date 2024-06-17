Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349A90BB1D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 21:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F361A4A;
	Mon, 17 Jun 2024 21:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F361A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718652682;
	bh=N8H94RCXX5YWmY4bchJl16LRzX71/Gf5z7MQzkptBOQ=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bSljadzstpvKJpYV8v+aozEsaHybGXtmUh4UqUPGFg8dosOtCte/yTaYJ1El9WV9L
	 i5ki/tK9A1XeRJYDOcdCI+93qhlwjHPzQed+SOwAFS9TaVOQ3/F/oX0+m7sElZdxZ+
	 U7ubwX8KaLvA+xNRPzWs8FHFeGS6+XEv08+BrvEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 581D4F805AE; Mon, 17 Jun 2024 21:30:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88534F805AF;
	Mon, 17 Jun 2024 21:30:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78ACDF8023A; Mon, 17 Jun 2024 21:30:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FFD5F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 21:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFD5F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=lxK6l8qH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718652624; x=1719257424; i=markus.elfring@web.de;
	bh=3SqP/MMqLPtLI6/aIyy4H8OAKdv545+Ewr3toVxYkx8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lxK6l8qHCP4V1dzgSMS0KoLyJcIOqUqxTPlHRybAA5du8RWKPdPKrbDwqryvbaA+
	 ku6Q70PsujUK2P/VJPb19+vva241tw40t5Gozdp7kZlVN3IajMWiE63z5mdFvlhpd
	 4JAL61sw/vzLZbTvIc+05/scPEIr/91nQJ/PmywfVGfaCQpwgYbYIRSlCu/CMt9d8
	 l6bfRFqb+kzLU/O/z5xYn768epuQhVhFHuPwYAZaA37bmhTS+nY+ueL8Epqh4B/QV
	 41JZHoaSLCc3YwhpYxg1uHLIpA90hAyvPjTrwlpZZVRgvH/icgPfkUPugCDnFIQFq
	 YORSTWRQUR4/w07htw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3Gkg-1sSbPm0CNW-00tTYm; Mon, 17
 Jun 2024 21:30:24 +0200
Message-ID: <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
Date: Mon, 17 Jun 2024 21:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Chancel Liu <chancel.liu@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Jonathan Downing <jonathan.downing@nautel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Takashi Iwai <tiwai@suse.com>,
 Vladimir Zapolskiy <vz@mleia.com>
References: <20240614163500.386747-5-piotr.wojtaszczyk@timesys.com>
Subject: Re: [PATCH v3 4/4] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240614163500.386747-5-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5WMvwVJ2f6aoUtr+Iz89hHXdsaVQ1zgvfdIEvfLMhBHDYIBbpe8
 kWz8j5Flzg276xCuQhuOfkGfjJ1JGGY3ujMyZc1pPd3x6QKmrtdsQqX0puZR60X7t0lHxCa
 yn6PJPgg+aEg447/N0AipP2n+YrYMaefQ7ZzL7N5WylGgwQ1/vOzILgz7mqlOpdJg0hrWyK
 EoJrGwmfCJ2IviYQn3jgw==
UI-OutboundReport: notjunk:1;M01:P0:pVQb5So6FAw=;pG6zPJf8wb9vzA5LF4jNtqDv5o9
 /wfXRJYnT2hL1wOkqCS6+05DfJyBbhU/xgs8pdwSkRtjLcqlmPcGEtlDB1Z0f9afby7Q7cl2r
 fjDwU4ET68ARBeeByqSmPSEdoR0v0HLJvckBTcabIUuIIQ4UO3LEvZt+Fp7IsW4OaYeciDyqI
 +A2MX/lbwSNdSR94Qbm8V39m0dirWA1dpq4S/XjtTXhpSH/Zx6JIGMmOlYqyRs8QCr5b8FHyu
 Ft5j1tESNqOW3hsjtghA9HBQlLk0Hvky3Jpwe4LmbkMwrnH/AT9KZSk4B15cEtdcPciaY7jo1
 bllphSeyrZggD/vn81zh9Vjk5bXg5TyA/Z6gRkuqYbkOvvIMOtHf+0JZ2HhrIqxwdT44p5QaW
 91T8VQNQpl38vjRziItj2ATMM19SFvZYkiLYib/QjEcHXVMmInPRGpz+7YxZaVHX1MBOXHegb
 ocJWpJczl2/h1Z8tjlLRJcrE9J7a6uGm56DywHHcdErGqLZVgfiwvusvyWCaoKjVvjcCDKWN8
 g6Ks6/qjqbA5Q9OT+Yr0mh1+stw1jiWiTFoHwpgfD54jcvW7rHhK4OzDV5hFOyzXxFd5xKa8Q
 z+urECA15gba149mNdOnz9VeFUTExRUzylb/SzuhzVhy4rk0Wil531qrfrficv97vSTiSYSO5
 2xPSxWHhUshXUiksmYiRVbFVXxjy1PFOcAG+O6MyXKYdH1tQaa2zymjTABfb+Mo2WgRKxxlDj
 2cX4jB9fM1IhJ1Ej4T5s5jvCHT9ctWrw5NbFrQ51/kAmJg0pWeO3iyMWAHmBxSDod5pryVvfS
 Sb7KS14QZHcngaaeSBfJ6YZFYLOay+D8GPM9Px+5EvgMU=
Message-ID-Hash: 4T4TMECOPVONH7EJFKCSB4Q2URSFTDUV
X-Message-ID-Hash: 4T4TMECOPVONH7EJFKCSB4Q2URSFTDUV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4T4TMECOPVONH7EJFKCSB4Q2URSFTDUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I suggest to specify email addresses for message recipients not only
in the header field =E2=80=9CCc=E2=80=9D.


=E2=80=A6
> +++ b/sound/soc/fsl/lpc3xxx-i2s.c
> @@ -0,0 +1,393 @@
=E2=80=A6
> +static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, str=
uct snd_soc_dai *cpu_dai)
> +{
=E2=80=A6
> +	int ret =3D 0;
> +
> +	mutex_lock(&i2s_info_p->lock);
=E2=80=A6
> +lpc32xx_unlock:
> +	mutex_unlock(&i2s_info_p->lock);
> +	return ret;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&i2s_info_p->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L1=
96

Regards,
Markus
