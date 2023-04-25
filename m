Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C66F2ECF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4461768;
	Mon,  1 May 2023 08:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4461768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923384;
	bh=l8qcL7kpJvyP4pXeHScl2BWTlcbxcO/h8Qi96mqjl98=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=BbMTSW6M+9Bto5ED7Aw8QN1vMzE+Avt5UpNexxgpOyyjbN7lUqToUNMNnBw/eB+Va
	 jjbPx0P9xMJcJFfxx9PozKpcOJjt1HptcJ/xevj/3Ufn4kfIfvqh7j858hwDD6cDOD
	 mumhm5nxHIABi8L7BfUN7v+pOhmWOpQxRviGdr/E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD68CF8055C;
	Mon,  1 May 2023 08:40:20 +0200 (CEST)
References: <20230414140203.707729-1-pan@semihalf.com>
 <6d90ad41-bb2d-41a0-8a4a-922b78967a2e@sirena.org.uk>
In-Reply-To: <6d90ad41-bb2d-41a0-8a4a-922b78967a2e@sirena.org.uk>
Date: Tue, 25 Apr 2023 17:58:59 +0200
Subject: Re: [PATCH 0/9] Add Chameleon v3 ASoC audio
To: Mark Brown <broonie@kernel.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REABTXLRABJPW7GCIMXVBMMG36DJFDEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292321973.26.15976047433962727088@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77C48F80236; Tue, 25 Apr 2023 17:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A883F80137
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 17:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A883F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=ll3RRXB/
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so1109488466b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1682438350; x=1685030350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlVv7Swj2O3m3L5cE82fdv0axa/JD3/qF8vAE3hvBOE=;
        b=ll3RRXB/RVF8ksY5feM+iRM7O6hUuJS5r7TOWhZzn0+nzyq/FqkwBI8cPAlpTaR8ia
         GimbgCjjiy6GHHDfIIy92w7aeFKEW9Z/LtX5DUtoNnv6TchZQISjqelJOnriqe4ZRoTI
         wHEyr/Ju7ICpKgS3EhsURxGqSivt94F3p0lIbtrSWA7SZ2QTPtLqKCKtorkdpX1uL4FW
         SRSv4zstbLnKwasiWRiPB67GXc/WlNS2+/Kv016dLdDmMw9Q3jTCgMmyYtvSlWA6dicX
         JHUoOC3q0WNIS1iFKxREMP5DgaznrRjIaG+qQxQQytDeCPrugYODBVIgHX0cnq8hL9zC
         4pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682438350; x=1685030350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlVv7Swj2O3m3L5cE82fdv0axa/JD3/qF8vAE3hvBOE=;
        b=dJdPS9D8R+HDDn723Z3fwzSA+SJsqj1jmjbLqT2yte9iq9J5btY7K5YfD6mCG4ydyr
         11heis0o56B8zVpel/a45QF5mtiJaaiiNbMcidkwn19OUlO3BtomVMvabG3Ps0er9/hc
         Ht88ZKt2Wx3CdG8ZUTTQtK/TOrjze82g+erF2csI7adhzKEKdi47qOaEvr1pJojvcS+f
         mRAs1CE+ycrrh/Nklds3W+eLReqTPuT0/Pk4AjdvbYE9kZ3sK4OqiZqKXoDv6GbsePdr
         AndiN75I6EGn1IQxz/0qrkKoxOtqos1jOUa5Gp/Y8JT/tnaqObZ3OEQ2XA6DtGg4Ompq
         xUTw==
X-Gm-Message-State: AAQBX9dXFIBGY6+C0OCKrX6IJXG5YYsFFHrf7Q5F+4B7rHsgHoZuEinV
	0ikQ91jXcXBCQ41l4JerK2yj1B2QScHiltSMV7B6Ig==
X-Google-Smtp-Source: 
 AKy350Z6xV1W9xmqBRf3W6EJR3Kb2ztwycysTEDFucgDTYqAdWhplAoM2OTMDqL6AmozTFa+wZ/ng98FtyJI1mEGtSQ=
X-Received: by 2002:a17:906:2646:b0:94f:31da:8c37 with SMTP id
 i6-20020a170906264600b0094f31da8c37mr14188025ejc.52.1682438350230; Tue, 25
 Apr 2023 08:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230414140203.707729-1-pan@semihalf.com>
 <6d90ad41-bb2d-41a0-8a4a-922b78967a2e@sirena.org.uk>
In-Reply-To: <6d90ad41-bb2d-41a0-8a4a-922b78967a2e@sirena.org.uk>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 25 Apr 2023 17:58:59 +0200
Message-ID: 
 <CAF9_jYRqr498j=5rgeqELEaZEkMRKqBTiNvRJC2ZduZO+399BQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add Chameleon v3 ASoC audio
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: REABTXLRABJPW7GCIMXVBMMG36DJFDEM
X-Message-ID-Hash: REABTXLRABJPW7GCIMXVBMMG36DJFDEM
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REABTXLRABJPW7GCIMXVBMMG36DJFDEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 14, 2023 at 6:47=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Apr 14, 2023 at 04:01:54PM +0200, Pawe=C5=82 Anikiel wrote:
>
> >  sound/soc/Makefile                            |   1 +
> >  sound/soc/chameleonv3/Kconfig                 |   7 +
> >  sound/soc/chameleonv3/Makefile                |   2 +
> >  sound/soc/chameleonv3/chv3-audio.c            | 111 ++++++
> >  sound/soc/chameleonv3/chv3-i2s.c              | 347 ++++++++++++++++++
> >  sound/soc/chameleonv3/chv3-it68051.c          |  41 +++
>
> Please at least make a directory for Google as a vendor, we don't want
> people adding directories for each individual product. That said
> generally we add machine drivers in the directory for the relevant SoC
> family, is there any reason that pattern isn't followed here?

The board is based around an Intel Arria 10 SoC FPGA. The ring buffer
device and all the routing is implemented inside the FPGA. Is it ok to
put the machine driver in the product directory in this case?. As for
the directory path, would sound/soc/google/chameleonv3/* be ok?

Regards,
Pawe=C5=82
