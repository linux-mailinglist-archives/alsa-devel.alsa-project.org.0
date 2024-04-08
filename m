Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A25689CC26
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 21:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1D6D218E;
	Mon,  8 Apr 2024 21:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1D6D218E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712602866;
	bh=MmTPLttEIByz3LcD95QHq50+7IMTnEiOpGvyK2OjXoU=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YiZAMh/y3KsDwqckgjA6Hwj76DxL59kWp3BsP30o3eByhjsh1uhwHpnbGX5HPnZrm
	 cSzkzn+vEmfH5I6dcUN9NyLk7T4YWQuqCCAUnT+q6vXBC4c7wzkK9ZznYo9Ch9UB6B
	 GGjVPK/JUsQZH9Iurm19AFOFNNLtJ3iBMuD8tuKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87ECCF805A8; Mon,  8 Apr 2024 21:00:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B2DF8057D;
	Mon,  8 Apr 2024 21:00:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB774F8026D; Mon,  8 Apr 2024 21:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C73EF80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 21:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C73EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=zSTMMLxv
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4163de295f9so10979485e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Apr 2024 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712602823;
 x=1713207623; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=H+B+dIHSb8yRhnSvIGZyYqGXJXmpVr8yjlKl3yu6l4I=;
        b=zSTMMLxvE4aOhAZlPRpnmjOu4qPj6KEZ1POQe+mh4D0Hu68L886FgzOrlxsW3sgi6I
         +QVlf9JGetkeyhevI74wq1cSFO9TZHQlJEZIJrlEEUMo68kJaMEgqmoB/A94hU2K90OO
         TlOvxqgX0CUIWnnbLBw1t2oMCdOgd0QFSJ3Qj8XLd6FC0tpAoHV+C+VAShixOcFV2S9n
         EwFGs5MydCULGvwRZLJfXqIHzQ1Yp/GpvLnfW56N0PiUBkKKKbgdRB78DMtgnxOchnPf
         YEQjfeeukyiFBM8QeaoWXUPrGIcm/RI1jXdz0MgT7Jr3CPH+bGG7Oxdt8ThrqRQPcdvH
         IXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712602823; x=1713207623;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+B+dIHSb8yRhnSvIGZyYqGXJXmpVr8yjlKl3yu6l4I=;
        b=TAscKe92n3V9ErBFMYKZDIvRrKZOK3oN/TJPYPi3MihOxq4q1PcS5k8Gx5kDFoX019
         g0tUzGJJp1wcOcVGe71qHgaGt0wInP933QdzHz/Jh7aDiTvsGi1WukfesfyDolU14JRD
         6eWYP2gxeyGP8fRMTZb4DfEADln3TvxptUkRFhkzP+WIouQ1bYYp7DcfHvF6b4olZkiR
         B2ql0AyZp3BWHBiitv50b3+9u6JxsHCSzy7NgJ0lUSmA3x3KKYz8rh+TkyU0XrIOTgIz
         Ph6UWwUP1uBYyM1EvPmAVwZ09SLyUk0tadO4TtKmq2RDKHFPfC4mbJZi+nA4jiJh1ZTP
         XW3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGMgyYEQjVcKFRJBfClEHsMKuP3iM1yw/RoCHiof+4QVH4+Y1nVBEiMX70a3ZZusjDNmJQCh/Ss+puYe5CVpaErx4iSaSrX8Ty1us=
X-Gm-Message-State: AOJu0YzSZ2MwvNURaQkxxxcwGznxYaV2v0IrjyIVIoX8zKJZAnZSMW+e
	FBhIX+B9PGecNO6/uBLpY/zTrLBOBI9FnFYjCXx2aZlRha8GvFEP+CFCKya/upw=
X-Google-Smtp-Source: 
 AGHT+IGP2XX1WCI1/h92HKpEVxqSPYGzlO2h896WkQD9sJo7lY2DOrCu08c0YYaiv8QAmxpQYmTAyg==
X-Received: by 2002:a05:600c:1c8a:b0:415:666e:9438 with SMTP id
 k10-20020a05600c1c8a00b00415666e9438mr7600760wms.3.1712602822639;
        Mon, 08 Apr 2024 12:00:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b004165315d885sm7177799wms.11.2024.04.08.12.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 12:00:22 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 tiwai@suse.com, khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Date: Mon, 08 Apr 2024 20:53:42 +0200
In-reply-to: <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
Message-ID: <1jo7ajof22.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: AWRVGGRFJIQR35FGSW7PBCONMHJRHOTO
X-Message-ID-Hash: AWRVGGRFJIQR35FGSW7PBCONMHJRHOTO
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWRVGGRFJIQR35FGSW7PBCONMHJRHOTO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 08 Apr 2024 at 21:40, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> On Mon, Apr 08, 2024 at 08:15:54PM +0200, Jerome Brunet wrote:
>> 
>> On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>> 
>> > The 'link-name' property presents an optional DT feature that empowers
>> > users to customize the name associated with the DAI link and PCM stream.
>> > This functionality reflects the approach often employed in Qualcomm
>> > audio cards, providing enhanced flexibility in DAI naming conventions
>> > for improved system integration and userspace experience.
>> >
>> > It allows userspace program to easy determine PCM stream purpose, e.g.:
>> >     ~ # cat /proc/asound/pcm
>> >     00-00: speaker (*) :  : playback 1
>> >     00-01: mics (*) :  : capture 1
>> >     00-02: loopback (*) :  : capture 1
>> 
>> The example above is exactly what you should not do with link names, at
>> least with the amlogic audio system.
>> 
>> Userspace pcm, otherwise known as DPCM frontend, are merely that:
>> frontends. What they do is entirely defined by the routing defined by
>> the userspace (amixer and friends)
>> 
>> So naming the interface in DT (the FW describing the HW) after what the
>> the userspace SW could possibly set later on is wrong.
>> 
>> Bottom line: I have mixed feeling about this change. It could allow all
>> sort of bad names to be set.
>> 
>> The only way it could make sense HW wise is if the only allowed names
>> where (fr|to)ddr_[abcd], which could help maps the interface and the
>> kcontrol.
>> 
>> Such restriction should be documented in the binding doc.
>> 
>
> The link-name is an optional parameter. Yes, you are right, it can be
> routed in a way that it no longer functions as a speaker in most cases.
> However, if you plan to use your board's dt for common purposes, you
> should not change the common names for DAI links. But if you know that
> you have a static setup for speakers, microphones, loopback, or other
> references (you 100% know it, because you are HW developer of this
> board), why not help the user understand the PCM device assignment in
> the easiest way?
>
> Ultimately, it is the responsibility of the DT board developer to define
> specific DAIs and name them based on their own knowledge about HW and
> understanding of the board's usage purposes.

Speaker and mics are NOT statically tied to a frontend. They are tied to a
codec (... possibly). The routing from the frontend to the backend is
dynamic, even while streaming.

So defining FW names based on usage in wrong.
As Mark pointed out as well, DT is not the place for this.

>
>> >
>> > The previous naming approach using auto-generated fe or be strings
>> > continues to be utilized as a fallback.
>> >
>> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> > ---
>> >  sound/soc/meson/meson-card-utils.c | 12 ++++++++----
>> >  1 file changed, 8 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
>> > index ed6c7e2f609c..7bae72905a9b 100644
>> > --- a/sound/soc/meson/meson-card-utils.c
>> > +++ b/sound/soc/meson/meson-card-utils.c
>> > @@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
>> >  				    struct device_node *node,
>> >  				    const char *prefix)
>> >  {
>> > -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> > -				    prefix, node->full_name);
>> > -	if (!name)
>> > -		return -ENOMEM;
>> > +	const char *name;
>> > +
>> > +	if (of_property_read_string(node, "link-name", &name)) {
>> > +		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> > +				      prefix, node->full_name);
>> > +		if (!name)
>> > +			return -ENOMEM;
>> > +	}
>> >  
>> >  	link->name = name;
>> >  	link->stream_name = name;
>> 
>> 
>> -- 
>> Jerome


-- 
Jerome
