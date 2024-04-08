Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF9489CBE5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 20:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D9E923D7;
	Mon,  8 Apr 2024 20:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D9E923D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712601913;
	bh=QsSIkayfit71CMzo2MxJNsqu2tSFf5gVAt8k/a4Lmp0=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MiH5LBq4JrbdZWMb20TGpWqhWeEErypRGAxzVNzwb81Vamw34K+zBkSrT/RVT7ccZ
	 +3D1bjb6x3lXDfQjwDmaBsz/UYYHgA/AfGe3b3G8KWI1QRpbpxKszZ4IuKmOCk+/Sh
	 jetqiKt0SxYabaYEIJfBf7fcfo8Q+R+ugXU9HO0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41173F80579; Mon,  8 Apr 2024 20:44:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89A46F80130;
	Mon,  8 Apr 2024 20:44:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCAB2F8026D; Mon,  8 Apr 2024 20:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A353F80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A353F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=doMmCmhn
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2994843f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Apr 2024 11:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712601871;
 x=1713206671; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=PhxFWGtJcYu82R8UeAJlsE6XDeHCwucqCh4MxZcEi6Y=;
        b=doMmCmhnHBi9dRs7EAXALOUfTB5lvfngkyXJZg2eXdU8nEg1UxaB1T1bJ8+qlNlGbs
         pEyL7R7ZDoBFDky+tQOyIhUoMrknASVbcShkLtxJURgiBokJjM0BLTv4ftea+MEecfHd
         qiUzLXgEcHMApw2NTK75Q7J2BLrfGEHgQlRBrpgrvAPU9DxF1aHEaqpGwQrTPUyou5re
         /nSwm7ZE49CSeq5KNFjYYBO83Go3exKq3lyx89YmUHzv9N2KAA0e8IgRRZPuyOvXlNte
         +jyBx7QCIOI8QdFHTpaH61uLOKP44BUoRUSN+51qS2R251Dr6QNYqQtlrAG42SZgEgHk
         09+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712601871; x=1713206671;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhxFWGtJcYu82R8UeAJlsE6XDeHCwucqCh4MxZcEi6Y=;
        b=KCS8Bp6z2OK4ogh7oY4yTBMFUmsjk4YNIIs2BdyRzWeZ7hHPz3mpxo+a25scJM8qzi
         ELFQ9H5tGCMwEWnCa81nb7d3EzGBM/NJ2avcHkNrTNJ+IX9W1+/mbKP2CWx2zc0MGQhk
         wraHXQ1jyu5S/OFngV1EwwYUhYvFDUEP0r68et0ykwdf7lXxQLpcxWAsmzAy7ajbJ4ms
         vOaPOe1ye0vedhw8N3LgblApJmdwxYd/kIBzZmknI2T7pLrB8+0SwqPxoA/o+b/SGAOk
         X0lSTtNQ5VC2g3OfVupxcqsNzbvDICXKkyh32BVIhLHSUBNuf6tX67aLQBMjGSs2NQl/
         XKvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmDYq1+849gawjyFVTHBcbJBHDKZKTX6tCVfUiu/gVWqa3J+J+h7/TmBcYYdA2fRrIdZZDQOpKQv9rwgKeQpRpJi0F0JB3CsIm9J8=
X-Gm-Message-State: AOJu0YzLZoT19v40i3APxCzxP1LgTyJba+Iklt2GTxzvkHnSShv+7Uf7
	j4gqEhENZ3L0JjSJPWOWBTEr5+beGtwqCggzmX6k+Yg/cVziqgqCMA6VD4JT6iU=
X-Google-Smtp-Source: 
 AGHT+IFs9R4mz6UqK5BlaXGtELLYaVlJZoW6nTa0CMEXjr6omfui96tuEN/xbadb9qr3EQuod/33ww==
X-Received: by 2002:a5d:6e56:0:b0:343:4727:d11e with SMTP id
 j22-20020a5d6e56000000b003434727d11emr6395149wrz.47.1712601871525;
        Mon, 08 Apr 2024 11:44:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id
 c9-20020adffb09000000b00345c2f84d5asm2736320wrr.10.2024.04.08.11.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 11:44:31 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, neil.armstrong@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 tiwai@suse.com, khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Date: Mon, 08 Apr 2024 20:42:22 +0200
In-reply-to: <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jwmp7ofsh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: LZLNXTTXKHIQFHHOCBGCRZYBMZ2H4BFA
X-Message-ID-Hash: LZLNXTTXKHIQFHHOCBGCRZYBMZ2H4BFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZLNXTTXKHIQFHHOCBGCRZYBMZ2H4BFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 08 Apr 2024 at 20:15, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>
>> The 'link-name' property presents an optional DT feature that empowers
>> users to customize the name associated with the DAI link and PCM stream.
>> This functionality reflects the approach often employed in Qualcomm
>> audio cards, providing enhanced flexibility in DAI naming conventions
>> for improved system integration and userspace experience.
>>
>> It allows userspace program to easy determine PCM stream purpose, e.g.:
>>     ~ # cat /proc/asound/pcm
>>     00-00: speaker (*) :  : playback 1
>>     00-01: mics (*) :  : capture 1
>>     00-02: loopback (*) :  : capture 1
>
> The example above is exactly what you should not do with link names, at
> least with the amlogic audio system.
>
> Userspace pcm, otherwise known as DPCM frontend, are merely that:
> frontends. What they do is entirely defined by the routing defined by
> the userspace (amixer and friends)
>
> So naming the interface in DT (the FW describing the HW) after what the
> the userspace SW could possibly set later on is wrong.
>
> Bottom line: I have mixed feeling about this change. It could allow all
> sort of bad names to be set.
>
> The only way it could make sense HW wise is if the only allowed names
> where (fr|to)ddr_[abcd], which could help maps the interface and the
> kcontrol.
>
> Such restriction should be documented in the binding doc.
>

Thinking about it further, even this does not make a lot of sense.
The information is already available from dai_name, prefixes and all.

Please use that instead if you must rename the userspace pcm, not DT.

>>
>> The previous naming approach using auto-generated fe or be strings
>> continues to be utilized as a fallback.
>>
>> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> ---
>>  sound/soc/meson/meson-card-utils.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
>> index ed6c7e2f609c..7bae72905a9b 100644
>> --- a/sound/soc/meson/meson-card-utils.c
>> +++ b/sound/soc/meson/meson-card-utils.c
>> @@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
>>  				    struct device_node *node,
>>  				    const char *prefix)
>>  {
>> -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> -				    prefix, node->full_name);
>> -	if (!name)
>> -		return -ENOMEM;
>> +	const char *name;
>> +
>> +	if (of_property_read_string(node, "link-name", &name)) {
>> +		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
>> +				      prefix, node->full_name);
>> +		if (!name)
>> +			return -ENOMEM;
>> +	}
>>  
>>  	link->name = name;
>>  	link->stream_name = name;


-- 
Jerome
