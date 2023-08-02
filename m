Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A94ED76C63F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 09:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFDEB1D6;
	Wed,  2 Aug 2023 09:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFDEB1D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690960603;
	bh=sTFAglUplzeeK4dWzNwZYvr5ZTCeFNTeGcjDpt4br7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ktu8jlUfrSrxks7zdxKiIqRX5m3iHPTccr7XNbeAQ4GoTZKK54XKlduln1fP6tnk+
	 gEvZUnwdE/wbhUiJSPuZOSxu23InZfuo+8Oztli+QSQm8pHJXEaN5NCBfj/W2IxkRU
	 8ZCxeqF7it6cXCMJVLJbbAR4sxuxaLEkLQBvc1Sk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B200F8053B; Wed,  2 Aug 2023 09:15:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90ABAF80163;
	Wed,  2 Aug 2023 09:15:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50A05F80149; Wed,  2 Aug 2023 09:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1438F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 09:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1438F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=qtEEl1wW
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2681223aaacso428644a91.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690960377; x=1691565177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjxrCLS3cadHatyI0X73qAxEEIoqBtkiSqn6zI48PFU=;
        b=qtEEl1wWBPiXWXTuEIEBv7RZq11mEMXySpGXNhrEJov+ENEjlslfHzDaZO8BGLhlET
         IfqsdtoCbaiiyZrnbLedqJWvnCqNDNgrp7gxgIpSOlznlKmKAytWlfuxVu+g9+ceywM5
         fCghSUNp0w/dxO/SfQk8ktDqtyKd5LBJcNXBQ9S9rhJJ1QU3NyphcHwlcxT4gMpoHZBw
         Oy3WB6DNdl+s64AunvIll966F/KIyu6pOmp0fv4nwjkrETLG+vNloKtMb5kUWl5+0IvN
         fFEGXXnotoE4LW6N1jXQNbOxrB6HD5acYFZRLk/EEv5v8bz9PwNt9t6Oq8Z8Gs1XTooR
         pCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690960377; x=1691565177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjxrCLS3cadHatyI0X73qAxEEIoqBtkiSqn6zI48PFU=;
        b=MQfVVO01WxpJBnJdp9joP7mn+E5tARPg2Gu//B+Xh1Wi6CGQxe55YNwjM2FNObfFOI
         z+u2GcqxPGxg0pQyCtU8BsXOwFC+x1V/0eHr8cf4OQnpjOXKyecIXHhgIyTi9/VA7r6A
         Z9DxMCenpFDspz8pWHjMV4B/sKgwwnDGWFnJY04e+l3LA57LxdshVctkxcPvxtGGp1D0
         6FtZzthG2cgBhm0tQRgqJeI5gDw3GuyX6pycTCcm/geY0XHjDuNrA6et7DeDJYJVuZek
         o7G2e5HaoChZWIWc2LWe3Y8G0sQEeIQiYYCP7fF588afxhGHumsi4hSdiEK26AgnvDSy
         +sqw==
X-Gm-Message-State: ABy/qLadHaSTQhPqxHN5BYFEa+jUYqofOrsA1s5M9kExtzEt7hnyaR/c
	xvA9f4ycBPhOaCksmT2MR+L8wBt/je74/aNGQTc=
X-Google-Smtp-Source: 
 APBJJlHC33MnC4vHRx9ZtDX9wNMk14xZ7mUaL2MW/X8yj9rXRade2j8zWGlUChySW6lC5l5SeDS9LuM99w88FSG53fI=
X-Received: by 2002:a17:90a:e602:b0:268:220a:7080 with SMTP id
 j2-20020a17090ae60200b00268220a7080mr18220320pjy.2.1690960376616; Wed, 02 Aug
 2023 00:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230802052117.1293029-1-chancel.liu@nxp.com>
In-Reply-To: <20230802052117.1293029-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Aug 2023 15:12:45 +0800
Message-ID: 
 <CAA+D8AMY=EG8SYFOb9wmoBcr19qqhMpw9OsTB6nf119G6Li_3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Update the register list of MICFIL
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: T6HZEOV2RDKSTFO34DSW4UCZOSBXMBX3
X-Message-ID-Hash: T6HZEOV2RDKSTFO34DSW4UCZOSBXMBX3
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6HZEOV2RDKSTFO34DSW4UCZOSBXMBX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 2, 2023 at 1:21=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> MICFIL IP is upgraded on i.MX93 platform. Add new registers and new bit
> definition.
>
> changes in v2:
> - rename check_version to use_verid to make it more explicit
> - rename fsl_micfil_check_version to fsl_micfil_use_verid
>
>
> Chancel Liu (3):
>   ASoC: fsl_micfil: Add new registers and new bit definition
>   ASoC: fsl_micfil: Add fsl_micfil_use_verid function
>   ASoC: fsl_micfil: Use SET_SYSTEM_SLEEP_PM_OPS to simplify PM
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

>  sound/soc/fsl/fsl_micfil.c | 100 ++++++++++++++++++++++++++++++-------
>  sound/soc/fsl/fsl_micfil.h |  64 ++++++++++++++++++++++++
>  2 files changed, 146 insertions(+), 18 deletions(-)
>
> --
> 2.25.1
>
