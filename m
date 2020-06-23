Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 363792050E1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 13:37:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C654617CB;
	Tue, 23 Jun 2020 13:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C654617CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592912223;
	bh=uAkyLDpx2dxpU3/B1xBtFFUKt2SQEgfqYrmc8N0VVaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kuWb1084jdtsBt4cJu17VksKasn6fd1j2uSs36no0/HYTEyj2i+aB8V71mhgSHdxj
	 1MuXbdeVSWNmv31tpAbZ0dD1VR0NGoPPJPshgwzm4ieLwm+w4FVp5Q1631UdWHjKAY
	 KoH0QWPRVxxKQGPBtUTLchn1DdgN/gsSImVtVEOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B27E6F80218;
	Tue, 23 Jun 2020 13:36:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C971F80234; Tue, 23 Jun 2020 13:36:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53BBFF800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 13:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53BBFF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HyMlCpMD"
Received: by mail-qt1-x844.google.com with SMTP id d27so15067888qtg.4
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4pFgJBI5OCUGefSIcYA75cTva8JFYmUiXoqYx+WyG9c=;
 b=HyMlCpMDocjfKKBdCi+o40gBFKbEJLUZrOAhvFFx4oLGKFgYQ+huI9As79YT6CAjOa
 z2C/Xdl9JZ0KjIxf0z+fW6ABlByiQ5bya+k/eGUH/aF4IHdwR1bTNNip68uuIJe7WlpH
 YMSHIlyZqfTwCdwD010jH6B7e3ALpCGY4ELBk3/yM9GQQH47+gIQ0ImwuYYE2D+5Njhv
 0ym+2XuFqxH3sJwOokUV7b1thTP7Nbqy0B6kLt7X61WBzB3zDn8HOkMNTidrlrHhGmhe
 bjqpiyKJ8IZ+hJ6oXMGZZc8CVPLZSl1qwaaUZry6fOksDMILHtAjkq1qVnFnpIWu5FzY
 mlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4pFgJBI5OCUGefSIcYA75cTva8JFYmUiXoqYx+WyG9c=;
 b=dHmzr36WE5Cfwdf6B07N6zbLwSm7h46WnHQfkRW+NapORUK7TXluE7MlVed3O05YvB
 95vsdUQ4XHRpfdZTd2GzCMbnMzM0MErD3FxozGP3Tif7XrVNUbKnSz3FcHFYeUXH9oYY
 R2NqsJkMHsrtdA2KASgBmXjLdKKxmFncJX+qTXWZkXMj89xBuhWZsPMYRbaEKp9FUN5f
 EUcnIGLsBw6u8kkOrF7nnybRAE+S8wAGH4dZ7+/PYm0npNW+kNdWjTYMc62LwoM7PiBS
 SQTFSQRWnmUdH1L34gFC2Rn+57Nuw0D//9YmSGhmt9HOqWRkACmuoE5xaz2dq0eZ3rGV
 kCpA==
X-Gm-Message-State: AOAM532cCi7imn3Lb8XglB1RFbRpm2EIDexS1K55+KLWO4WDgDvRrHSd
 t6U6yhrJkmR6/L7a65IA1c5Cvup0Bu0abZdm1cZS3Q==
X-Google-Smtp-Source: ABdhPJxO61T03lcfmOJXo9ryxEyKF6k7r6xNQ5tVWce+sBxYQ2LVJuylLY2ZNsYXy4zLvna194XXAG3+GxjVNzCv12s=
X-Received: by 2002:ac8:41c6:: with SMTP id o6mr15036092qtm.292.1592912162502; 
 Tue, 23 Jun 2020 04:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
 <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
 <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
In-Reply-To: <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Jun 2020 19:35:51 +0800
Message-ID: <CAA+D8AMSVCbJtcDoCbsMeV6ygrSdARpn3_PWE83mitcnkA1Tog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before
 calling clk API
To: Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jun 23, 2020 at 4:55 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >     clk_prepare_enable and clk_disable_unprepare check the input
> >     clock parameter in the beginning of the function,
>
> These functions call further functions which perform null pointer checks.
>
>
> >                                                       if the parameter
> >     is NULL, clk_prepare_enable and clk_disable_unprepare will
> >     return immediately.
>
> The interpretation of these function implementations seems to be reasonable.
> Would you like to achieve any improvements for the corresponding software documentation?

Which document do you mean?

>
>
> >     So Don't need to check input clock parameters before calling clk API.
>
> What do you find imperative in this wording?
>
> Another wording alternative:
>    Thus omit extra null pointer checks before four function calls.
>
> Regards,
> Markus
