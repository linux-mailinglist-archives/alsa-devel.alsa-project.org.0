Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E33F7C95
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 19:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45601687;
	Mon, 11 Nov 2019 19:46:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45601687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573498065;
	bh=b4XF1Zdz32Nln2K/NkIy8EsK8SIiwoaPi99ANA1um3I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KRvKPA8Mgz8Oyyt7IxwJYhu9Icxc+UlqiYhwOuZk/0qWYeW0arVkoLNaHhMSl/tYg
	 vWvS0ZEmxtSPGQtMn6bC6FATeyLFh/KU4CqyUjUKzLtXyjnNl3LYGJ9unPRuQ8BAJr
	 yZDiQz+D6JLqD6U2X8JcmpTNNyVjKFGbL6qTtC3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E72F8045D;
	Mon, 11 Nov 2019 19:46:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AE11F802E0; Mon, 11 Nov 2019 19:46:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B3C8F8045D
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 19:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B3C8F8045D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="QzFm9ysK"
Received: by mail-qk1-x743.google.com with SMTP id m125so12064299qkd.8
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 10:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tqyA4OYIzgKUBByYmbOcv49izSd6VtL8J5SzcSN+DCk=;
 b=QzFm9ysK5JhMqFfRZ/YNP2Tf3P1gkh3wVpwb7AYtI0N1Xn5SoQFZ5zHLxSYyOrNKzP
 d1e9n+YPeOmoVa/fyismmWwfOfWpdJPFjorpDFcQfoO46ZhrQqoxlI2+UdbHVR4a51AC
 rv3XaOiYU6+zQNyzAXn4FCTLV+tXN7BQcSdQVCvBoAhH1WbT6r9HD97qCQWg2EgWGtsc
 OLzYtAMnoBDEzOLpWXPDROnJKllVMCL9ZSj6MeuNN6L7Mx6x1Ay5qSE0AaNK8nJczv8V
 XaqRw1DRJLVzh3gTyP3b9KGxoc5CQApvu3jcmwtR1N7Ox5ATN/3kc9myi7vge+DE/FI9
 cIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tqyA4OYIzgKUBByYmbOcv49izSd6VtL8J5SzcSN+DCk=;
 b=Al8H1bS+nnLAouhwwutasBCFthCM5muZsks04FM7gOHasudFB/CDimhEW2u7CtuhCc
 LlCp1rFRfuYzifPK4i15jdfYfkK4uxM8RMCHBez+A7Wt4Y1bNCNVUpB9Ned7OuBFY0HP
 813z0U5dYdhnK/g9PNBOCSEDvknjU43J/FgszY4P/pVSJoJyE4jRdtqjxjmRmuX6jzbH
 svNTYP8JVLK0LJpd4LzWX/t0ZS3zDzAR6tQkOp0PKfdqBi6r4Rnc0HdA1CW03STt6Hq4
 6FWotrG/AEMUzKxTQMVgpJFQ5zGmUTnqUAIlpL6E278NRzaR3CmhS6etTkW3lPYB1XUc
 BYzA==
X-Gm-Message-State: APjAAAXDFgc0+ba0Y98adAgqqtX9SJJcsHloaq/oLUEWtraUIU88XxXI
 /k6Y9U6s5Y67Bmfud517ymNVPooy5JzbD0TspLLtyQ==
X-Google-Smtp-Source: APXvYqzLm15GxZXJ+TYP4/Dq6rgdtuC0Rggs/MEZIt3zJ4RY8GL2fVhYpxC8bpi20dYQQGXddHQiJwYq8Z0spHuPbDM=
X-Received: by 2002:a37:8d7:: with SMTP id 206mr11432009qki.238.1573498005749; 
 Mon, 11 Nov 2019 10:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-10-cujomalainey@chromium.org>
 <b46f661a-5363-e80e-fc1e-d4d984f198ef@perex.cz>
In-Reply-To: <b46f661a-5363-e80e-fc1e-d4d984f198ef@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 11 Nov 2019 10:46:34 -0800
Message-ID: <CAOReqxj39iMjidAzoupiAackhU9rRr9pOZYTP7U1BG6htC66nw@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 10/11] ucm: docs: Add SoftwareGain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 11, 2019 at 7:33 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 07. 11. 19 v 2:58 Curtis Malainey napsal(a):
> > Add software gain ucm definition.
> >
> > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > ---
> >   include/use-case.h | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/include/use-case.h b/include/use-case.h
> > index e84f3f8f..ee6ee5e0 100644
> > --- a/include/use-case.h
> > +++ b/include/use-case.h
> > @@ -344,6 +344,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
> >    *      - This is used on platform where reported buffer level is not accurate.
> >    *        E.g. "512", which holds 512 samples in device buffer. Note: this will
> >    *        increase latency.
> > + *   - SoftwareGain
> > + *      - Specify the software gain in 0.01dB. E.g. "20" means there will be
> > + *        0.2 dB software gain on this node.
> >    *   - DisableSoftwareVolume
> >    *      - Set to "1" to force userspace to use hardware volume controls
> >    */
> >
>
> In other words, it's the recommended software gain control? The description
> should be improved then.
>
>                                                 Jaroslav
>
Not the control/mixer, in this case it is a gain value that is
expected to be applied by the audio server (should the server parse
it)
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
