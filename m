Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263B72F8A4
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 11:04:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B125E1EB;
	Wed, 14 Jun 2023 11:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B125E1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686733496;
	bh=hj1PRwrbQraBmolvWqDRN87go96j3nhbdtvpkyTJMWg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZOYHKu/aBh1Ktf3QFmwc/yprqT1UmCP+Kt5qCL4E9OhPvbozGakr/3OpNJluJo3P0
	 cnwTvyDGL7GMfFZ0B2R5BTdkb+zhmdHWQlF7dV5avEKk4g+0L2HaICVyJuDhRxg6Lf
	 xELDEkLxZn0Lqrpw+6FoR89Fq9XJo0TgoQNrDMwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8184EF80301; Wed, 14 Jun 2023 11:03:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9664AF80132;
	Wed, 14 Jun 2023 11:03:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9477F80149; Wed, 14 Jun 2023 11:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4EE7F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 11:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4EE7F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=p40DY8X6
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-75efdacf490so166194585a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Jun 2023 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686733413; x=1689325413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDK3MtavhJ0jc2b3czgJlDdUH3DaBksRE0QNj22csxA=;
        b=p40DY8X68mMMSWH7Na3IbMci2T/wHM1fKkXD2sWO//syp2d1yF7L5RE8aH0vU+FrOq
         Zo9oBHbKT3PmXCwrhMf9BAPfX3sRI+36+HRBtuu36drPIfSEcAdF6WZbhcSrjNjNKnNu
         xdioIu9o98eVYz1qbrIqR8KuAq7lwgp9cvjCCBC6sK1b0eMnsJJ9Hwypy6WfwI3PKnEA
         CSEWZhGqTcCtStAM/yQO8oMye3tows9ykJWP6cZumoDqXVm9M9UATXAADCFUQPvlhpJt
         aR+3Pqn14iOPgicXjqKbVzJ3iVHMLuCuhDxY9Hhl8G9k1dNohPzWH6CPHX6gKDx77Yma
         lbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686733413; x=1689325413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDK3MtavhJ0jc2b3czgJlDdUH3DaBksRE0QNj22csxA=;
        b=bgL9/2FNWKny9QNJ/3UmodA1E7tb2dBU5gbGyBulbbZDHRMXcu+R1PAUuE7sMtTowc
         +SEJRt+bXR7/KcFp6V7qxVaVdHOQN9bRXyarcGHRD+eVQ1sXNiStp3pZ4IkfN+tcdAjw
         46ARLRaGpb0W1CMMrsSqKTsMg39BHhts6e6xZ5CiWxptjB6DfU8d9GqxHUi4zAyRtuoy
         JFXOlbrQtyVGcRmK5R6hnZLk8kikPdcdOTwYp+p9JeCtZdssc0eXQBHx2Bw3vg6eVeB9
         R/ad6f6M0FOY2JTOCf/hKVaEw28pPrdXS3/CVXeOMSz/ySYjHfMn4uX3jw1aD+wFWcsm
         0Tqw==
X-Gm-Message-State: AC+VfDzvHTlj6Tkx5keLV0ei2ucEqXBbR6gBilNJ81I0sxaB5IfYFrSm
	P0HRc3WEu1HVR4nbl5bC6P1xaBdZKxwgfI2OTow=
X-Google-Smtp-Source: 
 ACHHUZ5bkfEjM3AcaOuo5Gno79KcyMddDSjkjdBXFLGx1NPVfqe242XBa8ULTPvF0YTkS+HS3HMoif6acSrEcNQRQhU=
X-Received: by 2002:a05:6214:c87:b0:62d:ecdb:ae17 with SMTP id
 r7-20020a0562140c8700b0062decdbae17mr8847887qvr.48.1686733413056; Wed, 14 Jun
 2023 02:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230614074904.29085-1-herve.codina@bootlin.com>
 <20230614074904.29085-8-herve.codina@bootlin.com>
In-Reply-To: <20230614074904.29085-8-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 14 Jun 2023 12:02:57 +0300
Message-ID: 
 <CAHp75Vcur=H_2mBm5Ztuvd7Jnvmr6+tvCbEkFtmaVLsEjXr8NQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] minmax: Introduce {min,max}_array()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JN2ZUISURFVO5DP5ENNPLWVXAG4XSDQZ
X-Message-ID-Hash: JN2ZUISURFVO5DP5ENNPLWVXAG4XSDQZ
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JN2ZUISURFVO5DP5ENNPLWVXAG4XSDQZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 14, 2023 at 10:49=E2=80=AFAM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> Introduce min_array() (resp max_array()) in order to get the
> minimal (resp maximum) of values present in an array.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
See a remark below.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  include/linux/minmax.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> index 396df1121bff..2cd0d34ce921 100644
> --- a/include/linux/minmax.h
> +++ b/include/linux/minmax.h
> @@ -133,6 +133,42 @@
>   */
>  #define max_t(type, x, y)      __careful_cmp((type)(x), (type)(y), >)
>
> +/*
> + * Do not check the array parameter using __must_be_array().
> + * In the following legit use-case where the "array" passed is a simple =
pointer,
> + * __must_be_array() will return a failure.
> + * --- 8< ---
> + * int *buff
> + * ...
> + * min =3D min_array(buff, nb_items);
> + * --- 8< ---
> + */
> +#define __minmax_array(op, array, len) ({                      \
> +       typeof(array) __array =3D (array);                        \
> +       typeof(len) __len =3D (len);                              \
> +       typeof(__array[0] + 0) __element =3D __array[--__len];    \

Do we need the ' + 0' part?

> +       while (__len--)                                         \
> +               __element =3D op(__element, __array[__len]);      \
> +       __element; })
> +
> +/**
> + * min_array - return minimum of values present in an array
> + * @array: array
> + * @len: array length
> + *
> + * Note that @len must not be zero (empty array).
> + */
> +#define min_array(array, len) __minmax_array(min, array, len)
> +
> +/**
> + * max_array - return maximum of values present in an array
> + * @array: array
> + * @len: array length
> + *
> + * Note that @len must not be zero (empty array).
> + */
> +#define max_array(array, len) __minmax_array(max, array, len)
> +
>  /**
>   * clamp_t - return a value clamped to a given range using a given type
>   * @type: the type of variable to use
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
