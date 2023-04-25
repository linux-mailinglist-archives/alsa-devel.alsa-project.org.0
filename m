Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 319516F2ED3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2986179F;
	Mon,  1 May 2023 08:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2986179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923447;
	bh=od3/dlqRJnbe47WE9srY2fsIulNj1I1XqZnK9nD1Nu4=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=TUeHeDeQr8GMFpMlF95kNRIeS19y16sYUL0eBsBQLvQaVk7SmdVc8C0fVdwjJC7UI
	 MFlYLrT4rs3SI4BmxwtRYPq5oP4mB53k1reP8a6B1UORjE1uuaCCneTQbxUC7s1K9C
	 +YkUvMOG3dJhzwvnrnckdKZqu0Qy0u1xka3JD6Rs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E6AF80580;
	Mon,  1 May 2023 08:40:28 +0200 (CEST)
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-6-pan@semihalf.com>
 <cb35f3f2-4dc9-4d56-96bd-bcffb33b7aaf@sirena.org.uk>
In-Reply-To: <cb35f3f2-4dc9-4d56-96bd-bcffb33b7aaf@sirena.org.uk>
Date: Tue, 25 Apr 2023 18:02:20 +0200
Subject: Re: [PATCH 5/9] ASoC: ssm2602: Add workaround for playback with
 external MCLK
To: Mark Brown <broonie@kernel.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKIX7E3WIHNZ7TDSAPOBUEGMR3HGYL2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292322694.26.4836127673285703612@mailman-core.alsa-project.org>
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
	id CB458F80236; Tue, 25 Apr 2023 18:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A31DF80104
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 18:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A31DF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=SZpt8wqa
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94f3df30043so942850866b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1682438551; x=1685030551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U1FebJ48rmYLrZgvW/d5KNeRthnVpxmVYJl0x+IboA=;
        b=SZpt8wqa8NJlghs5ohxeUYKrUK3e5qaBbISMNAUU7pnC3iaMHqd7nqyEcNT+BDOyBt
         1geT8uih1tSgnaWI28XbTpctzi18GqGLhVVqfrw751+OPckIolkRoZAgSZS96kR7DD9h
         JPqfzqBviknKwU3i8KOHJ0aGr66a5uH4g29EcqI/t9sklKcLTsJrwZkpcjd0D3OfIy+N
         4wwhDd6diQsPzabc1fAOf4hJnMh9qPSva95M5IhHyXlOEyfUNXZv6ZXr09smgdmzEzVk
         9sDyiECHmJyBnTMRmU9JiyvPcuThz6RVaDNvTJEFK3H5woJQDUKIjv5f9veNBLGMPkQT
         zuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682438551; x=1685030551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5U1FebJ48rmYLrZgvW/d5KNeRthnVpxmVYJl0x+IboA=;
        b=H77oh6OCb00mj+0y4BnC30pFTLF7HB7wHKFu3HG1GSt8kQcY/FH0Yw7Ou2IvKdS8mP
         1FvWQlsATfeYVWyWgK2jVhBfnLLTT6HIhxTIzoKP6gjyHc1YeM+XNRs5ePfjEMbK06iK
         6WxxaOTrRMIrCNeBggMp1rvxvVCExlysNJscKk///r8KA853jpfD2KiHseoFnc1la20r
         5P42I74BN7jpV9c2Zc8JOU9xH4rdu8fT7M+6XaW00laY0vyAN3bz1tmRBrFZcCH9ghzy
         +/apECQSP1WOkLYO5EReM2IGdbwa5vOOF724v3UCOrW4etvppKZLSRWGVdoNFIu/ySxM
         1U/Q==
X-Gm-Message-State: AAQBX9eM88Ki5xLul4zsRWITIDrEUFpiRCGOFkIryr8cqAzJbJt6U4bU
	00uwsE4CGJwbGDmEbBifsw/61ITEJl8pOs9KXO9yzQ==
X-Google-Smtp-Source: 
 AKy350ZyQQXlExOYMD/D3YT7w+OnXYHx8fNk7AhdjTIc0H2Av/6728FCr95KZnQpnj//tjszaXVJ90/Hm4NZ1m7PoVw=
X-Received: by 2002:a17:906:6009:b0:94d:69e0:6098 with SMTP id
 o9-20020a170906600900b0094d69e06098mr15526256ejj.45.1682438551364; Tue, 25
 Apr 2023 09:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-6-pan@semihalf.com>
 <cb35f3f2-4dc9-4d56-96bd-bcffb33b7aaf@sirena.org.uk>
In-Reply-To: <cb35f3f2-4dc9-4d56-96bd-bcffb33b7aaf@sirena.org.uk>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 25 Apr 2023 18:02:20 +0200
Message-ID: 
 <CAF9_jYSMieE=GP3T-gsXe+SDjuWKGVy9LjhMHKB9_hW7czuZmg@mail.gmail.com>
Subject: Re: [PATCH 5/9] ASoC: ssm2602: Add workaround for playback with
 external MCLK
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YKIX7E3WIHNZ7TDSAPOBUEGMR3HGYL2V
X-Message-ID-Hash: YKIX7E3WIHNZ7TDSAPOBUEGMR3HGYL2V
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:59 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKIX7E3WIHNZ7TDSAPOBUEGMR3HGYL2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 14, 2023 at 7:35=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Apr 14, 2023 at 04:01:59PM +0200, Pawe=C5=82 Anikiel wrote:
>
> > Apply a workaround for what seems to be a hardware quirk: when using
> > an external MCLK signal, powering on Output and DAC for the first time
> > produces output distortions unless they're powered together with whole
> > chip power.
>
> This doesn't seem coherent, these are multiple register writes so
> clearly can't be done at the same moment as initial power on.  Clearly
> there's some other constraint here.

The "at the same time" part is done by writing multiple bits at once
to SSM2602_PWR. But before that, SSM2602_ACTIVE has to be set, and
then the chip is reset (SSM2602_RESET) to power everything down again.

>
> > The workaround powers them on in probe for the first time, as doing it
> > later may be impossible (e.g. when starting playback while recording,
> > whole chip power will already be on).
>
> It doesn't do that, it powers them on at component probe.

Yes, I meant component probe.

>
> > Here are some sequences run at the very start before a sw reset (and
> > later using one of the NOT OK sequences from above):
> >
> >   ssmset 0x09 0x01 # core
> >   ssmset 0x06 0x07 # chip, out, dac
> >   OK
>
> I can't tell what any of this is trying to say, especially given all the
> magic numbers, and obviously no actual use of the driver should be
> writing directly to the register map.

These are shell commands run from userspace (with no ssm2602 driver
present in the kernel). ssmset is a wrapper for the i2cset command:
ssmset() {
        i2cset -y 0 0x1a $(($1*2)) $2
}
I definitely should have made that more clear.

Do you think these logs are worth adding? If so, I'll improve the
explanation what these mean.

>
> > +     /* Workaround for what seems to be a hardware quirk: when using a=
n
> > +      * external MCLK signal, powering on Output and DAC for the first
> > +      * time produces output distortions unless they're powered togeth=
er
> > +      * with whole chip power. We power them here for the first time,
> > +      * as doing it later may be impossible (e.g. when starting playba=
ck
> > +      * while recording, whole chip power will already be on)
> > +      */
> > +     regmap_write(ssm2602->regmap, SSM2602_ACTIVE, 0x01);
> > +     regmap_write(ssm2602->regmap, SSM2602_PWR,    0x07);
> > +     regmap_write(ssm2602->regmap, SSM2602_RESET,  0x00);
> > +
>
> The rest of the driver uses symbolic names for register values, this
> code should too.

Ok, I'll correct that.

>
> This also seems buggy in that it writes non-default values to the
> hardware then does a reset, meaning that the cache and hardware values
> will be out of sync, and since it only happens on probe there will be an
> issue after suspend if power is removed.  It looks like this would be
> most comfortably implemented as a register patch applied as soon as the
> regmap is instantiated.  See regmap_register_patch().

I haven't considered that. I will look at regmap_register_patch() and
try to use it.

Regards,
Pawe=C5=82
