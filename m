Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6B83B363
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 21:56:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE79C83B;
	Wed, 24 Jan 2024 21:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE79C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706129802;
	bh=EDHQeGWw2KK9XnP3e2EPmCu/YDjFEOll/3JQtrVan0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JWUb/uF6/pjLNIYsZGdPVbMvbN6+1JgjxX7KKx17CPWi47OWXpzLbdcf2Yl9eiBIL
	 axabbd8hCcpX4LAihcNfTBDSq7RUYMwSq2WcpOld2w6s8C1GyjGtf6MrxoMgQn5+DT
	 26CVN2vxT+PdInx3H8R7F4hz5f72DBK9g5YCAZ8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A14BF80494; Wed, 24 Jan 2024 21:56:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ABAFF8057F;
	Wed, 24 Jan 2024 21:56:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A15DF8028D; Wed, 24 Jan 2024 21:56:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61657F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 21:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61657F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j62peIl8
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55a684acf92so6793973a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 12:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706129759; x=1706734559;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDHQeGWw2KK9XnP3e2EPmCu/YDjFEOll/3JQtrVan0E=;
        b=j62peIl8vEhXoX7S0jBieh5W31KJPwuWWad8seGKAmH3aV+aw1vyyGcmLqquVGxzee
         5c2fWRR7D4tX/DV/HyoJRB/IXAo5oy0Xr0AcPG9EXMkLCQEYjj9E2aRDWu/L0achWJS9
         2gX+cerUAUa+CgY92uzYbndad0AhO/dgMH/CQAqBgN4t7dkAPofH41Nhm+xMUeHLMGn+
         kXtOXSSf/xlyca6PqfY70tfclJ2Dkjmb3e3nJ2rUjZsHA4G4oZfcIVlTUDi3MENiIzIB
         7/UBBoXTkaC98zeoY/rZfvJjmgJ2cOiVb6GUCOrXBolInm0E5kURwbVdeNpTPlkLUTUy
         zHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706129759; x=1706734559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDHQeGWw2KK9XnP3e2EPmCu/YDjFEOll/3JQtrVan0E=;
        b=vd/tkDujRsLZdrf22ck3eS2vmQL3DCB+ph6v/zjeb+mE9a8Cq+4g4B051ScWpaebPZ
         33ytVaUSZc7bgpsxPW5HDlExtf42DOparNQEj3gxzpU0n53m+sJcr8R9E4xjTWL4nstP
         O//wOnlRG3FgmnOI5AojqKxozJturbjqrlTi8yARy/IyxWrJEU4+0Ety3DhKqBsuNSXc
         yQz81Rdf+K4tMgbyALxthqa+KSmooMLK3VXa9aHlB9S61EVN8AfNF5lum+CS75UyJS+Z
         j/AaZuhl1VpnrSCG6EXsD29aCtTE2n0NAyk5yDZexkqIb+ZyMLsMc9tGG4yv1yYU7+p4
         Z3ow==
X-Gm-Message-State: AOJu0YyRwgIdFqwPezkrlIQ1eFSOq9+FPRn1IZlhYgPtz54gKiogNgLL
	RIHVpPq/XMjI+3WgcbFdQilhaIJ26di+XXQTAzvgnz5EKEJLAgCytUQlGBbc6w0GdQlxDTm/IFc
	gVgyKIyEr3U0Var2SjmIu/b5YuVg=
X-Google-Smtp-Source: 
 AGHT+IERU1DA/JNy3wLWaxZmghF/4O+PYmGIT9ozpVlxL9VJhq6FopNrevl1H2VZzhjHBqoEvs9zzyKbU3FPk1vY6Pg=
X-Received: by 2002:a17:906:f8d4:b0:a23:7576:3552 with SMTP id
 lh20-20020a170906f8d400b00a2375763552mr778380ejb.45.1706129758888; Wed, 24
 Jan 2024 12:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
 <20240124153016.1541616-5-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124153016.1541616-5-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2024 22:55:22 +0200
Message-ID: 
 <CAHp75Vd2EO97Tn1QapB+dSUhioZo23+6x49q+c5zJ5aAZWY85w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] mfd: cs42l43: Add some missing dev_err_probes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, broonie@kernel.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FX34GMBPGLI4NCS2RM2OQAOOEGCK7TB3
X-Message-ID-Hash: FX34GMBPGLI4NCS2RM2OQAOOEGCK7TB3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FX34GMBPGLI4NCS2RM2OQAOOEGCK7TB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 5:30=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Use of dev_err_probe was missed in the i2c and sdw parts of the code,

We refer to the functions as func() even in the commit messages. It
makes it easier to distinguish that one talks about function and not,
e.g., variable. (It applies to all your commit messages where similar
is needed)

> update the missing parts.


--=20
With Best Regards,
Andy Shevchenko
