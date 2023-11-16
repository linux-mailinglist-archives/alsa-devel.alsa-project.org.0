Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C007EF2A1
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:29:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 438F984D;
	Fri, 17 Nov 2023 13:28:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 438F984D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700224153;
	bh=8EIEvY//QnP7FHYGTBlprZTcDayJtV4xDnxYXKxN66E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X31Z8tGTgqRx4YOvWQYDDMIuf6FJ5A8OFBci69pR6C/q8n02esfBrvjAykXRqbmOp
	 kZ9JmBYf8Gm+KovMoA82JOv6bl/Io3ieGQZC0UvYixzmxa6ZbqsfFGLPk32C1UaIeu
	 SeHf8PG6y1RB9MeNzw66cY9s3NMX04RiwLHdLVFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EF6CF80249; Fri, 17 Nov 2023 13:28:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 215E5F80166;
	Fri, 17 Nov 2023 13:28:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42DADF801D5; Thu, 16 Nov 2023 19:36:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BB62F80152
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 19:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BB62F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FAumbqZo
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c5039d4e88so15415261fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700159763; x=1700764563;
 darn=alsa-project.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yIlFonLjzCyWNPF0XSY5in6JQp88jtw/YSTV9e8ZqPA=;
        b=FAumbqZow+GmMxOuPHu7xzr5DVaIhkTABGJR61LeJE7A8qZk9H42/CpBL7/XdlS3mn
         a4BycDTZDULo/ykoOSCWGqMdXBF1BD3w62tq5J0cecW9BEOJBBzN+tAlaS2TqmFW9dkK
         uqV8BB2R6E4VXV6m56m5yHpjdeRbjDy6nuh5KJld45fsoIaFW5jr5zStmQk+NqNs9+O1
         bFxfr+unNklRFQlur+9ZV0ta+xX3/LkPHW/mMjuES9/wOn+dvP8OCKP35hDG3crAfkGR
         Ur1YNqKKhe0zMS2mkEuoy8HKszj5n521n7ok1xHg6QaQFkO/00QEn1l9cLd6mnBtPaQG
         mXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700159763; x=1700764563;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIlFonLjzCyWNPF0XSY5in6JQp88jtw/YSTV9e8ZqPA=;
        b=t+qTbyswVByLH+3v9NpiPMbWSRa+cCfWWbwL+XKn0hbOtXgP9hL39T0Tf+VO8zVxne
         ajnL57gHqFKB2rkZl0hi2rN7PaCsFU7pChvo2F2fdMZw7uAkxUvA5IVrafgy/fO2aEf7
         JRzEL2srSVk7bNHaqRZYg1aerBBWxmmqlGjyHt1FMHsBdHzLxXp7rpqIHH1r2x+vB5tw
         EWGfE1GxxCaZBp7oDIt1HQU1/7AN58BXS0Mgf4WaUQDjrOUf25odLRGJJMPjSiDGsKI4
         lZveywYQzpuzsayUEaflF3i52ysCNGyHbTATvI/XDKZq2mNOWhnlDoGvsYRXCsZLsUil
         MkOw==
X-Gm-Message-State: AOJu0YwuQtc7QSZWEKvnE4bHJQrTmbAudSHjB85zpqsYkCPzZyewqBEy
	YhoQDN8GdktYl+XeFxsh9oQ=
X-Google-Smtp-Source: 
 AGHT+IEzRlLFe78bRabXn1LUASTNO6XFVl0tfBEgWnytfpAWKq4drUqkv+OpUg6r2dZj8GiO3ZvlZQ==
X-Received: by 2002:a05:651c:86:b0:2c5:9a5:a1c2 with SMTP id
 6-20020a05651c008600b002c509a5a1c2mr8291927ljq.30.1700159763121;
        Thu, 16 Nov 2023 10:36:03 -0800 (PST)
Received: from ?IPV6:2003:d3:8f2b:ca00:a8b9:be5c:5958:4eb3?
 (p200300d38f2bca00a8b9be5c59584eb3.dip0.t-ipconnect.de.
 [2003:d3:8f2b:ca00:a8b9:be5c:5958:4eb3])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c450d00b004094e565e71sm127178wmo.23.2023.11.16.10.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 10:36:02 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------8RvdfuZ5GyNIBIsC5wTYBJDm"
Message-ID: <251c1bea-8250-40dd-bdea-1cd739d1e77a@gmail.com>
Date: Thu, 16 Nov 2023 19:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: acp3x: Missing product ID for Thinkpad T14s Gen2 AMD Ryzen 7
 PRO 5850U
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 Linux ALSA Development <alsa-devel@alsa-project.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
Content-Language: en-US
From: Oliver Sieber <ollisieber@gmail.com>
Autocrypt: addr=ollisieber@gmail.com; keydata=
 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
 Mi8tCaN/OlNrmLQZ1vgYMQ==
In-Reply-To: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
X-MailFrom: ollisieber@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SKU7LBCQA3UDQS2DR5IAOVGCGZKVBVKN
X-Message-ID-Hash: SKU7LBCQA3UDQS2DR5IAOVGCGZKVBVKN
X-Mailman-Approved-At: Fri, 17 Nov 2023 12:28:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKU7LBCQA3UDQS2DR5IAOVGCGZKVBVKN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a multi-part message in MIME format.
--------------8RvdfuZ5GyNIBIsC5wTYBJDm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thanks for your fast answer. I added my proposed patch as attachment.

Please be aware that this is my first kernel patch.

Thanks a lot!

On 16.11.23 12:10, Bagas Sanjaya wrote:
> Hi,
>
> I notice a bug report on Bugzilla [1]. Quoting from it:
>
>> Hey,sound/soc/amd/renoir/rn-pci-acp3x.c has a hard-coded list of quirks. It seems like some product IDs may be missing. In my case, I am using a Lenovo Thinkpad t14s gen2 with an AMD Ryzen 7 PRO 5850U.
>> My audio output is fine but my internal microphone cannot be found.
>>
>> Running `dmidecode` yields:
>>
>> Handle 0x000F, DMI type 1, 27 bytes
>> System Information
>> 	Manufacturer: LENOVO
>> 	Product Name: 20XGS1KT02
>> 	Version: ThinkPad T14s Gen 2a
>>
>> Could it be that one may have to add the product ID "20XGS1KT02" to the hard-coded list of quirks in rn-pci-acp3x.c?
>>
>>
>> It seems as there have been similar problems in the past, e.g. https://bugzilla.kernel.org/show_bug.cgi?id=216270.
> See Bugzilla for the full thread.
>
> ollisieber, can you send the quirk patch?
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=218148
>
--------------8RvdfuZ5GyNIBIsC5wTYBJDm
Content-Type: text/x-patch; charset=UTF-8; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hbWQvcmVub2lyL3JuLXBjaS1hY3AzeC5jIGIvc291
bmQvc29jL2FtZC9yZW5vaXIvcm4tcGNpLWFjcDN4LmMKaW5kZXggYjM4MTJiNzBmNWY5Li43
NTRlMjRkNTVlNmYgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9hbWQvcmVub2lyL3JuLXBjaS1h
Y3AzeC5jCisrKyBiL3NvdW5kL3NvYy9hbWQvcmVub2lyL3JuLXBjaS1hY3AzeC5jCkBAIC0x
OTksNiArMTk5LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBybl9h
Y3BfcXVpcmtfdGFibGVbXSA9IHsKIAkJCURNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRfTkFN
RSwgIjIwTkxDVE8xV1ciKSwKIAkJfQogCX0sCisJeworCQkvKiBMZW5vdm8gVGhpbmtQYWQg
VDE0cyBHZW4gMiAqLworCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9FWEFDVF9NQVRDSChETUlf
Qk9BUkRfVkVORE9SLCAiTEVOT1ZPIiksCisJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJE
X05BTUUsICIyMFhHUzFLVDAyIiksCisJCX0KKwl9LAogCXt9CiB9OwogCg==

--------------8RvdfuZ5GyNIBIsC5wTYBJDm--
