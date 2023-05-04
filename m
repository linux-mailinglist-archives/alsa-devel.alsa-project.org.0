Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A70AA6F671A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 10:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06E8A18E1;
	Thu,  4 May 2023 10:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06E8A18E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683188165;
	bh=Ks1V7pK6ZoJCNI3auURtUft1a1rCPKaNcRXXDhjE4I4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cLthP7L9I5c7KGkQJNcwsOrPI7dgwdhawu9Ji7QTD1M7vZgbtrs9xhYOzYkFrbJhO
	 uhPiM8UpPbygVQedFHqFkl7Weq522unGaRzM8vqRQ9gcv25nZUWCOF0CY6uCBC5x5y
	 RmfX6XQ7TQjynVi6916/u3fkfwJBSntycjN4CQEs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62804F80529;
	Thu,  4 May 2023 10:15:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33E27F8052D; Thu,  4 May 2023 10:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BB2FF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 10:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BB2FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VsHcebXn
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-192cfb46e75so56117fac.3
        for <alsa-devel@alsa-project.org>;
 Thu, 04 May 2023 01:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683188105; x=1685780105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TRqjqGypCs1dbY5LtSok8OFem/0qad71dQ6X2XjX3Og=;
        b=VsHcebXne8/u6ns8QW8lGlDbyIiIoAL3yNzbsLmdke3YF2rJk9h2e9ObFIT9TF913+
         eEnm4oWSz5KAnsFGGrP1YIZ+Epo8/BKHgQaEo/IlHAaPVVFQIOUbCY1JS9DpkQhlLBMu
         jswZPkM4nSKWFJuMLbqD5YoTIHDFZ6bbhJev193qFDlBrs95j26bsnWmmRbkFmjNVKaK
         Uknzbqnopo8aXIxl5ue9/ycF/b+DtZBDeU+Q0zYmrePhFrqal7G+tnscOieDlZE4I5zP
         xlY5ui4SC1nCXiIimFYq1kF1uRvc8m8XPPEaKlF7PM2Elkcmrrw4JxXpb4uMhywbBs9E
         5MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188105; x=1685780105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRqjqGypCs1dbY5LtSok8OFem/0qad71dQ6X2XjX3Og=;
        b=YJjIO4nz7xl3oLtec7vePfiyKA2+dICChAK7DVLXbPjTA2bBVZpA1YASKqgiKuEU69
         a6g3JjcF4zcrcsJ33BbpadgSC2B6eHEXdDDeHHyMTcDUcD1Var/VXPGkLzPGpmuCxZ3y
         xElzhAtHMqQ+J9ZmcJg5xc+g94o+JPKHlteAsv/HPa+27cs2iLMLg2KeEr/q+8JzDFTe
         wLTLMB83SUW+9M1br2P76/Uz1/N5CmN69kAnYPZdThiB0MtqH2YglopSLDxuAXEm6Ozj
         DL7Jo4OfTStl9cOtAMZHr1brFbERKZT4wHJ9SKnDOI5tdcX6xZSRIY4T1WjApoCth0Mf
         xAKw==
X-Gm-Message-State: AC+VfDxKdIs3DM1D/4db3wpp2sCxvqrtDlPdZCWGsw7piHNN0GsTWxCM
	iZSAoh76+TbBIMP8XMmUyqI=
X-Google-Smtp-Source: 
 ACHHUZ4M2FGxSbkBN/iyPC/REUhOdqvp/SrPgPwNoyngiMdUeRawi+niLLZFc2JrkQANVVLpUucWIg==
X-Received: by 2002:a05:6870:e516:b0:184:490f:6a40 with SMTP id
 y22-20020a056870e51600b00184490f6a40mr610811oag.39.1683188105509;
        Thu, 04 May 2023 01:15:05 -0700 (PDT)
Received: from geday ([2804:7f2:8006:42e0:35d6:3084:476c:a55e])
        by smtp.gmail.com with ESMTPSA id
 ay9-20020a056820150900b005255e556399sm3054790oob.43.2023.05.04.01.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:15:05 -0700 (PDT)
Date: Thu, 4 May 2023 05:15:18 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Pioneer DDJ-800
Message-ID: <ZFNplm6dUWKLLRMQ@geday>
References: <ZFLLzgEcsSF5aIHG@geday>
 <87lei4mtll.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lei4mtll.wl-tiwai@suse.de>
Message-ID-Hash: MTNIMNXMRWQHEL5S7WQ4FIF3OVDTIA4X
X-Message-ID-Hash: MTNIMNXMRWQHEL5S7WQ4FIF3OVDTIA4X
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA-devel <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTNIMNXMRWQHEL5S7WQ4FIF3OVDTIA4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 04, 2023 at 09:41:26AM +0200, Takashi Iwai wrote:
> Now I applied it, but ....
> 
> > --- sound/usb/quirks-table.h	2023-05-03 17:55:23.133827915 -0300
> > +++ sound/usb/quirks-table.h	2023-05-03 17:56:29.054827946 -0300
> 
> ... the patch should be applicable with -p1, and here the path prefix
> is missing (usually it's a/sound/usb/quirks-table.h, etc).
> 
> Please prepare a correctly formatted patch at the next time.

Sorry Takashi, I'll be more careful next time.

Thank you,
Geraldo Nascimento

> 
> 
> thanks,
> 
> Takashi
