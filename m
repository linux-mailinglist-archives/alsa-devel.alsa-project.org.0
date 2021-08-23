Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E473F509D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 20:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39D1850;
	Mon, 23 Aug 2021 20:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39D1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629744344;
	bh=2fgidUTaBCqDvSun8iP3INM+S2SlvNnuwR0b6Nfz4yU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NsV5+eRABY0lLiBfDK6WhNawVKr83SlV0r9AWHXi68Yf2h2VS5LOUdIL581egQelp
	 UJohBKFPExnqg6ISUobZpeoFrCjoNox27k6Ua9DGqbEe7OzRCmyuOfB7HYsbnrBSKO
	 q6l9lSSiJ/xGUrpt4IhGF6qC6wv6+Bd0d4H1I5lU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB40F8020D;
	Mon, 23 Aug 2021 20:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07505F8020C; Mon, 23 Aug 2021 20:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A7CF800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 20:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A7CF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t1qsvqi0"
Received: by mail-lf1-x12e.google.com with SMTP id u22so39828228lfq.13
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YRhZ8aemOHiv3qohGWvv0dPowMgTLzqAXNDbGqzXvt4=;
 b=t1qsvqi0nLmct9ymg2MP2JrkuPbkckiNHcak1utGkpNFYcLM1XE+sO2X+RBfNLFqoe
 qhcQQ5bT4THLqI1ksbreuwajAYKaUQmrHmxcQgGYNAJjeFRg7Wmc4Q0yowHe0GlMVJKj
 3L42JtyWwwFG2Shj4yEcyR4BpHm1kRbZJ1SZ2dHHnJsGP9k/j4nJ6P1QyT94b+sRPfva
 3P7ROZrJMm/rgeKFptU1Qh+dQgUcM6yME2PbyNHv1EVNr7gUfyPWgZLcRVKruDumssWB
 ZpJfJRxbjwaJxMehUQYTyHKFIYUbDiNI9OnZ1Uqnk1CsiRiwakTZWexdPWhpFWLop16W
 4CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRhZ8aemOHiv3qohGWvv0dPowMgTLzqAXNDbGqzXvt4=;
 b=HG3AATgBGYHbDm+uk8+FOHmjY0R8v3tBvie1fQ+SN/E9iwejmStLv0gzXQBMtgVgUW
 vFoZN80sYW1hAkjtcB7+m2z8UoG/l9TPbvQsX84+m1O5OSFwdAEICJDsEjtSK6HIlF7R
 898oxd99YGgvsMyPVn0pf9uOL/j4CI7pLZOJ6+d6+n6cV97YxjFYgolu5Yngihb/nYEl
 JQsri3gWGm1Pc5UwN6NEyEl5lZz7RK1mUASCLAmMEDmq/0d32Nkjj8inBh793q70Wepr
 AXAmU/eczPIiSkpofcgWT1ZmYASdZUjU9X4dxdKj7Mopg2XC4yd8YpfFrpCYpaKlIA1s
 Exsw==
X-Gm-Message-State: AOAM5314Y1GvBXIhLgPXdfl7HCqtUg1hPT6dfcrBJpBrdeRwQhDHPXlv
 q2HOuMf0TuZpOuKovzS89BVHDlzWiL5t9fAOAzk=
X-Google-Smtp-Source: ABdhPJyuDjvmQc2qBe9FbSo2UUpFlAnLhTL3xOVoZFXrgDRlPZzpJ4QjEQkbecnmejmZZefwvdyMpJmVKCW4le6YPGA=
X-Received: by 2002:a05:6512:2390:: with SMTP id
 c16mr11690003lfv.513.1629744252163; 
 Mon, 23 Aug 2021 11:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
 <20210823170332.GD890690@belle.intranet.vanheusden.com>
In-Reply-To: <20210823170332.GD890690@belle.intranet.vanheusden.com>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Tue, 24 Aug 2021 00:14:00 +0530
Message-ID: <CAAd2w=ag-Hk6COSJt5rg-+faz8FKYxTPig9AGhFWUFzGw1Ynvw@mail.gmail.com>
Subject: Re: arecord is failing with -V stereo
To: folkert <folkert@vanheusden.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Tried with the above code.This is also getting p value negative.

snippet code:

   fprintf(stderr, _(" %s sujith %d \n"), __func__,p);
                if (p > bar_length)
                        p = bar_length;
                if (c)
                        memset(line + bar_length + 6 + 1, '#', p);
                else
                        memset(line + bar_length - p - 1, '#', p);


logs....
//  c=0 case

print_vu_meter_stereo sujith 35  ///value of p is 35
c =1 case

 print_vu_meter_stereo sujith -9227433 ///value is negative//

On Mon, Aug 23, 2021 at 10:33 PM folkert <folkert@vanheusden.com> wrote:

> >         const int bar_length = 35;
> >         char line[80];
> ...
> >                 if (p > bar_length)
> >                         p = bar_length;
> >                 if (c)
> >                         memset(line + bar_length + 6 + 1, '#', p);
> > ----------------//this is the line where it is crashing.here p value is
> > becoming negative at c=1.As we see if we change the p value to bar_length
> > it works fine ..As it is a player issue not a driver issue.
>
> This is puzzling.
> bar_length + 6 + 1 + p and thus 35 + 6 + 1 + 35 is max 77, that fits
> easlity in 80.
>
> But wait:
>
>                         line[bar_length - p - 1] = '+';
>
> p is max bar_length, so we would end up putting '+' in line[-1]
>
> Can you try this?
>
>
> diff --git a/aplay/aplay.c b/aplay/aplay.c
> index cc51dcb..9cfd52c 100644
> --- a/aplay/aplay.c
> +++ b/aplay/aplay.c
> @@ -1764,7 +1764,7 @@ static void print_vu_meter_stereo(int *perc, int
> *maxperc)
>                         p = bar_length;
>                 if (c)
>                         line[bar_length + 6 + 1 + p] = '+';
> -               else
> +               else if (p < bar_length)
>                         line[bar_length - p - 1] = '+';
>                 if (ABS(maxperc[c]) > 99)
>                         sprintf(tmp, "MAX");
>
