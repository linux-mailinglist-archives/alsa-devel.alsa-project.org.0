Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BFA7A89C2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 18:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D34EA4B;
	Wed, 20 Sep 2023 18:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D34EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695228758;
	bh=xItVh1dNSBX0qQ1JZj1Ob9JKAzX3hp85sRcvKGIkjf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hStd6LHJKgc8M2nsvX7X1lHLE6CMMaIhbO006v65zhWsemUJi4isZRgNzkjjl9yS/
	 adL8zQnmd1pem+J4NeOVUSYh9+1kNkDNVbXmKaqBW6CXEVy2jQ2S32tjo0NWNUZKXW
	 +JDGXBEWHaVvgf++kLR7iRXlCnaRQ9Pf4YzTGxxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF6E4F80494; Wed, 20 Sep 2023 18:51:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FA1EF801F5;
	Wed, 20 Sep 2023 18:51:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A0A6F800AA; Wed, 20 Sep 2023 18:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43FB0F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 18:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FB0F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=FlLef50Q
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-59c2ca01f27so238167b3.2
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695228661; x=1695833461;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFp4/FBehp7bXIUiukwsVd1VDsGADtdLcprhP9iiGVo=;
        b=FlLef50QJtJ5eIvsi9O+KEPfPRaGV3kAJEpdWzNQpIHSCvRa5pxShB1rdFiz2J7kd/
         +1kSZciTYGG+Qu8wrof04LQ+dyMIEse46U7bg8ZuaVQrNLB1Uqn3SmrVWT4JYzIkJYkh
         Z6Sk265q8+YiF9W+7CfOAYNRtiCxSKil8yPRvGyvkyEze0XlTU3Cpe4sXPCqgKljb0Hh
         XRFK3vuJYUkq9xPQAr52Xff+15B01/hNUC+AsRiCFDhymKhmyE+W8+QDwPBIeeG7ZrkP
         lzP5Q3/4T7n01Flk2f29kq1Iehzi6jTJziO45pXgguGIvH22bpYnz7vZwk7q+IdElZMS
         4OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695228661; x=1695833461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFp4/FBehp7bXIUiukwsVd1VDsGADtdLcprhP9iiGVo=;
        b=RIAB/FtFSJnU8y9dsvZFi/l7IuunKnDVBCri8xYEkKH591veY8H2yU2DqUSZXTFmCL
         uutVyCJWRSxhHa/Vabx70AVCEBue7IX2yDjsIbvFHSrM0IBv/7OeNAK4Abn2qg4yK9U+
         R/er31FctEtFRly4t0or6D4i8ih9G00Zv1mDfyE+eeXJcQ2GY45Z3Gh5re9g4PXzN14J
         Qpa3UyNZWqvwMvFviU/F01rr3mwLuTL/eCqNymLiYg8zfgWzINER5Ay4HTGf7A0tRV8s
         JKMDcHiqi0dhefVtGY5F87/D1xgNQCu1GVT0nA1ShlVQqXU1TsPAsCSnAWre7K+WTj9m
         M1lA==
X-Gm-Message-State: AOJu0Yza9BP/0Sssf9uhp0fU4h2rhRIa1GikwkaNyzgRTjjkeL15gcJV
	TGXF8yEP7JojyIvuooorMn2easATNAwLpqVcga5CIQ==
X-Google-Smtp-Source: 
 AGHT+IEuELX3/Oyy6eRXnIacTDFmEDIXHMrCxW6IPWYkJBUy8R78CaXGS8Piry3NQBq/Ct/oKIOvajA2h1foAouaUKk=
X-Received: by 2002:a25:d0d7:0:b0:d81:5ec1:80cf with SMTP id
 h206-20020a25d0d7000000b00d815ec180cfmr3192253ybg.12.1695228660956; Wed, 20
 Sep 2023 09:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Sep 2023 09:50:45 -0700
Message-ID: 
 <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] device property: Replace custom implementation of
 COUNT_ARGS()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
 llvm@lists.linux.dev,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TOJE6LPM23C6675ORWPD37JEBKRPOFUN
X-Message-ID-Hash: TOJE6LPM23C6675ORWPD37JEBKRPOFUN
X-MailFrom: ndesaulniers@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOJE6LPM23C6675ORWPD37JEBKRPOFUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 20, 2023 at 8:38=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace custom and non-portable implementation of COUNT_ARGS().
>
> Fixes: e64b674bc9d7 ("software node: implement reference properties")
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Closes: https://lore.kernel.org/r/ZQoILN6QCjzosCOs@google.com

Thanks for the patch!
Closes: https://github.com/ClangBuiltLinux/linux/issues/1935
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Of course Linux would have a macro for this!  I should have known.
Trying to wrap my head around it. Awesome

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/property.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 1684fca930f7..55c2692ffa8c 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -10,6 +10,7 @@
>  #ifndef _LINUX_PROPERTY_H_
>  #define _LINUX_PROPERTY_H_
>
> +#include <linux/args.h>
>  #include <linux/bits.h>
>  #include <linux/fwnode.h>
>  #include <linux/stddef.h>
> @@ -314,7 +315,7 @@ struct software_node_ref_args {
>  #define SOFTWARE_NODE_REFERENCE(_ref_, ...)                    \
>  (const struct software_node_ref_args) {                                \
>         .node =3D _ref_,                                          \
> -       .nargs =3D ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
> +       .nargs =3D COUNT_ARGS(__VA_ARGS__),                       \
>         .args =3D { __VA_ARGS__ },                                \
>  }
>
> --
> 2.40.0.1.gaa8946217a0b
>


--=20
Thanks,
~Nick Desaulniers
