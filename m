Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A844D7BEF53
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 01:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C40BF00;
	Tue, 10 Oct 2023 01:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C40BF00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696895304;
	bh=rSAKdrCpfdC5Wd7YJBfVSRhzMjTYm6Z0VK74QEMsdkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DmZypBrhuwWfUW5+sIqY0ctZ9iYyRq6aIyRq7gbbr4ZPI38TN7jPcAhcpodPXMfJH
	 nq8wZ/BRjeGm9ZOilA12sHDYpbqfOsQRaBF65SNYmBM0QbPzV7nfeICksX4pScCDu3
	 J2kOCVeuqqU7sMFH5+38wa3vlEhbSDKMpnUppnG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48EBDF80166; Tue, 10 Oct 2023 01:47:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D48B6F8027B;
	Tue, 10 Oct 2023 01:47:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE3E7F802BE; Tue, 10 Oct 2023 01:47:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47FDBF80166
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 01:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47FDBF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=Brk12M5N
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso9043284a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 16:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696895209; x=1697500009;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXbLKS+MxtD32e7DqErJ9Y3Mh+T6J/t2QZRdubLMtiQ=;
        b=Brk12M5N3BeP19HruVENbifMFF/ZJxFltMZ/BzdcLEWNqGtRwkfmovDgFrEMVMEmHs
         h5UnXMRK2wiMdb22Ukr9CTaHt0LbWdlvWPNYgWWU0O7x2UpGswW3yo4N72XbkYxf+Znu
         PNLnjDSIwktt3f3WsG6Pdkj371kwE3hY7n/lcGljv+NQFpapNcsUUNoIc7Xlmodge6mV
         4OTMfhGyE/Oe6Stgocet1UaxAdCVDqOQ2OfK/cB18HM0f88Tp9Y/WPDUexqBNsCB2BZW
         msL6SQmvjk3RHUEl8gD4V9x8g2UlZ9wiTeExppuc+ulE/+VtHnwP/lJLr+DYwDzS5Ryk
         Vm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696895209; x=1697500009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXbLKS+MxtD32e7DqErJ9Y3Mh+T6J/t2QZRdubLMtiQ=;
        b=oR9vgaJmYQYAAM5rYwCMF7ip93oAAmzl4YLlLNLaT2zHfh3T71bqq8PQGfZDOwMSkj
         N149GrmCjInGywsXbEbw2Wr/qYlLoDzrkbTJK8QgH25iuVujU1FiqNcyvaCk7ZPG2cEg
         UR2/pPgwtdF+4GKbnqVoyVJ3RJUMgvNmLgglcnp7N2QwPt7aUBGA7b0ZuRClnhUDPsMb
         XPZCH5zRMkIoRoDf5QJbdE4cWfmxYdghWTrWPscvNj5DWirQQUvn0jYv7k4msb72Ss98
         Yl/DnrvjJR4xNOUrWQmsuQKFS7WLSiIT3PzE3A71ZWKo9UmgD43+41AR3kylJHCIPkhw
         U8hQ==
X-Gm-Message-State: AOJu0YydlRSUA25A5ud+8RjuWNzDj0ZC3seWCltMgYaieh82pxk9mu16
	C0JDTOIJ+mzf/QEL6vdRvoMwyDiPuHtoaiE09ey5tw==
X-Google-Smtp-Source: 
 AGHT+IHxLOxVJsCnD34Qu13Ga8MaOle2QYFCYyhM8gdiqM+aR02mWA0J6BETSOKihrN6QR5kLYk1mEbinX+qyX2zgEo=
X-Received: by 2002:aa7:c541:0:b0:534:2fd8:a9e1 with SMTP id
 s1-20020aa7c541000000b005342fd8a9e1mr14401271edr.22.1696895209185; Mon, 09
 Oct 2023 16:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <ZSRw6RNi3Crhd32H@work>
In-Reply-To: <ZSRw6RNi3Crhd32H@work>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 9 Oct 2023 16:46:36 -0700
Message-ID: 
 <CAFhGd8o=UB5C_RDUHvNLEkW6OJEDn-uB2tCz3ZMnD4KRq3DcCQ@mail.gmail.com>
Subject: Re: [PATCH][next] soc: qcom: apr: Add __counted_by for struct
 apr_rx_buf and use struct_size()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JNM7ILOTVACMSMMVNJOQ5SZCB5SCBIFR
X-Message-ID-Hash: JNM7ILOTVACMSMMVNJOQ5SZCB5SCBIFR
X-MailFrom: justinstitt@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNM7ILOTVACMSMMVNJOQ5SZCB5SCBIFR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 9, 2023 at 2:30=E2=80=AFPM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
>
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Excited for __counted_by to land! This looks right.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/soc/qcom/apr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index 30f81d6d9d9d..1f8b315576a4 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -41,7 +41,7 @@ struct packet_router {
>  struct apr_rx_buf {
>         struct list_head node;
>         int len;
> -       uint8_t buf[];
> +       uint8_t buf[] __counted_by(len);
>  };
>
>  /**
> @@ -171,7 +171,7 @@ static int apr_callback(struct rpmsg_device *rpdev, v=
oid *buf,
>                 return -EINVAL;
>         }
>
> -       abuf =3D kzalloc(sizeof(*abuf) + len, GFP_ATOMIC);
> +       abuf =3D kzalloc(struct_size(abuf, buf, len), GFP_ATOMIC);
>         if (!abuf)
>                 return -ENOMEM;
>
> --
> 2.34.1
>
>
