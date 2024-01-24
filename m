Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB783B4A8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 23:28:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01D12823;
	Wed, 24 Jan 2024 23:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01D12823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706135294;
	bh=89crywnmr1xs48BOI0V+iC4WXYruG9vOY9OOlKZaWIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h3aE8DnK4nr9ppXlzPipTYw/6XMEQv9RQo1hrJF8aayHf/8Bdv6uLcNK82BiTklzh
	 AA39NcndmAkeDkNASGgFqncppSw/YCliAasWXiXm2g/g4waILR+radylqhxYJbPHCK
	 CG19pOKaGZxg7UtzDRPm5heFAFC3YfkokQ1mNdbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B594EF8057F; Wed, 24 Jan 2024 23:27:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA54F8057F;
	Wed, 24 Jan 2024 23:27:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B62D0F802BE; Wed, 24 Jan 2024 23:27:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0576F8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 23:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0576F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lE6jsS6D
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55cd798b394so288627a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 14:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706135243; x=1706740043;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89crywnmr1xs48BOI0V+iC4WXYruG9vOY9OOlKZaWIs=;
        b=lE6jsS6D8Y824cp5kDIcY8qFQ6TPhgGp6sMmg7HnPjw7G+/ofFUAiO05hbB+GMxsQq
         Qizir6u57ARe8rstpjh92NZcQkkZVtMiRoBS00F7MBv7coB46Fi/xdRWT8uQX4noxiCh
         7RaWBohFS+WZo6PZQCCM8+oCpX78xCssvdzwEy9N6oc8aADfQlO1Cr8RkGfQ2LRSptsK
         FsrS5ajDxyxQNEvinP9+/67rewqtCnUeSScKWmrWef6V+XiV2s9AkWyoEOWv8Jso2sVL
         TD/gTHzwh+pa8bPWTOe39c19D4xFcWat3TWpTe69YJLo9HlTzRGlAq644j6KWL/qY3F1
         N1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706135243; x=1706740043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89crywnmr1xs48BOI0V+iC4WXYruG9vOY9OOlKZaWIs=;
        b=rvU/Z3EeGrMkYlleGHOkiRWWL5I9QIJBmnetn/NO7YREgM+FbHeI4rnfBEvizUtyh0
         HveXja9vpSfiiMWswRyCIiBTe6VScqLvcbUk1eCVQP2i5PRWYewbVnGlpd2GXK6MIor3
         LbbKCUd1IeVxDMMiNKSg0Hc23II4o1lwED00/VuGCWX5lGFZs+aQzzY3F4H2nIN/uzd8
         Mnb9IXuFTvK043gOR1QyUOZEX6mDC4ks3TUxjpljU7PsQwk36kF/Si+qSND9E4njnq/z
         BlYMai6WpkGlIXUsOPH7h3NrGnyP4qfEn4HU1fTMYo3vDFEpN3UQrHYSF8P9+aap23Qg
         t5/w==
X-Gm-Message-State: AOJu0YzFz/VBVWSnMjSXS/hahvYq9cBoEWvn8EGmvM4tm1ess9wchjUt
	fB9WlkHZpyaKajkcBT55VJDJdRpMDE2llNn+vDNxsnvuJ6uS+4fM/95S4YZNAqXZIScEdZEL4uX
	7UyLTtjhIP6MQJ/lg1Rfh1oa02X4=
X-Google-Smtp-Source: 
 AGHT+IEKFP+9CdEJ6ZlaragyzLH1oN6tQOkJ1h/InCTD5c/jvcIyPfEiQKx84pxSzv6bhBSGH9GJDx9T65nEbYAPVnQ=
X-Received: by 2002:a17:906:c44:b0:a23:62fd:e2f6 with SMTP id
 t4-20020a1709060c4400b00a2362fde2f6mr33964ejf.30.1706135243371; Wed, 24 Jan
 2024 14:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
 <20240124165558.1876407-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124165558.1876407-3-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 00:26:47 +0200
Message-ID: 
 <CAHp75VdPP=wv7azY_Zi2VNAd-iiMDLpek7tcjTPMPL00xdD-3Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] ASoC: cs42l43: Check error from
 device_property_read_u32_array
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BZ27KXV4S5R2VX4LV62TMZVOG3DVSPES
X-Message-ID-Hash: BZ27KXV4S5R2VX4LV62TMZVOG3DVSPES
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZ27KXV4S5R2VX4LV62TMZVOG3DVSPES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 6:56=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Whilst reading cirrus,buttons-ohms the error from
> device_property_read_u32_array is not checked, whilst there is a

..._array()

> preceding device_property_count_u32 which is checked the property read

..._u32()

> can still fail. Add the missing check.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
