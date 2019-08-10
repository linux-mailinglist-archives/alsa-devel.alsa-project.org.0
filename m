Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B9888B39
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 14:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7E21664;
	Sat, 10 Aug 2019 14:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7E21664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565439134;
	bh=onFf8/rrSRoOjlrB7Ru0PEc0e7bunFCy/7jBpCZZEwE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGQSZLAZzvFuqT1PmWn2REVwvOPEsy8fBBzKrR5tKLcYu9xoa+NZTHmweFuf9s8SB
	 eJEmcxk/tCx+kQES2IFVsGqxlyOgQpD5LArpQ/MoHlMCXYNIohB6l3wClfSYwaTk99
	 zjvCpAj0emfgLWHARlsesXhYgaGYi9lSqd/kMqMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12816F80506;
	Sat, 10 Aug 2019 14:10:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F696F80506; Sat, 10 Aug 2019 14:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A8A6F801A4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 14:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A8A6F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BI0e53h7"
Received: by mail-ed1-x542.google.com with SMTP id k21so98480957edq.3
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 05:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dis7z7CKeaJIH6/9XpNsXDGPeyjfocLYTvKKppWIsAg=;
 b=BI0e53h7TLbWb15bHbVirTLi9w8VJ3JtSeJCzhTE+fhmlm8iMLM5P+ftfRJxITLwjm
 MkRLBwnaX0IKeFwbOP0/TjZLAwIXvl7BUgTa0DXczv6CMu7yPlc7cDtI8nbAe7Td+yfo
 Xq5opDX9hE2la6DFZcIde6UbHpH+jwxVjlm1uqVmq724plPpjuULxrWEClr1jQfbMrlp
 0ILo8uYPDpC+OiulojZ6ibiDJ16B0Lzj8vNA0rmJOY7mRlQxDuXKw9WLsL0ERE9tnnnm
 a5N224vAQnuAvYEkTxUacV8muchFEK+MaR1zh15GQno3iP2izgHRi8nP0Y0jxK22QMEz
 8jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dis7z7CKeaJIH6/9XpNsXDGPeyjfocLYTvKKppWIsAg=;
 b=M3gusMZxtWvmKz6UPHKkXD+gJxO5TQq8BGRaiaog/Xvwsf6ZyEN1yjtuvqQlIQtc2J
 Z0q6s1QrQUFBiBkXhtG+KDoTSiu8lBFVTXBMAYKWQgn4ZQtzSO3SOkZDJr09VLUgjvxY
 5raSteBo6zll83UH6wlOW+6KkSYeb+AIdtqPWehY/xUmgs5u3GRzy/rBbYDYKtHA6/4z
 e3ZWh75uSHHgZnrfJ2IXeU2R9n8wldj664eGFLRJe2sLS6Up+iqqF5gS3thKkhGdwMOq
 5PbkhUXr7UJ49K4npTzgkcYH13E77329SSQRRxV1kzmU9z8uzEQ12+/Yv/Ll3QV8vplX
 iUTA==
X-Gm-Message-State: APjAAAXESUSvwQvVAbOjoVkoye0OiYQYyRZFb0/TSyKNkg6TXi0BBaHM
 oVjA8RyMQDajOLwgEowjj4QnocI4cfkMmYV2bY4=
X-Google-Smtp-Source: APXvYqyQRyc8Tn1oRO6rm7JAxTZhlC0HDggzSCUn3X7v6aV4yxERODBlCIGwJOfFy2XSMdQRmy/JQ8GKHavhQu8Td1w=
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr27012051edy.101.1565439025643; 
 Sat, 10 Aug 2019 05:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAKSqxP-f+4KCUU79prHaLi2--3H8jAA9iXYxK-EoA8oQKNv=XA@mail.gmail.com>
 <s5htvaumudc.wl-tiwai@suse.de>
In-Reply-To: <s5htvaumudc.wl-tiwai@suse.de>
From: Paul Pawlowski <mrarmdev@gmail.com>
Date: Sat, 10 Aug 2019 14:10:14 +0200
Message-ID: <CAKSqxP-dJJAFigGgUQRww1va4uAeVQv=hQu2EMaWSmbGE2gLaQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Writing /usr/share/alsa/cards/ files
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

Hello,
I am writing a driver for a device with the following PCM outputs:
- Speaker
- Codec Output (Headphone/Jack)
There's also Loopback, but right now I'm unsure how does it work, I
don't think it's something I should be concerned with right now. There
are also two audio inputs (an internal Microphone as well as Codec
Input).

Thank you,
Paul Pawlowski

On Tue, Aug 6, 2019 at 1:00 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 02 Aug 2019 14:53:52 +0200,
> Paul Pawlowski wrote:
> >
> > Hello,
> > Is there any documentation on writing /usr/share/alsa/cards/ files?
>
> No documentation, unfortunately.
>
> > I painfully tried to create one in order to enable 2 separate audio outputs,
> > but I ultimately failed to due to the lack of any sort of error reporting.
> > Is there a way to enable any error reporting when parsing these files? It
> > seems that the error output when parsing any hooks goes to nowhere.
> >
> > Also, is this the correct mailing list to get help regarding alsa driver
> > development and configuration?
>
> What kind of "2 separate audio outputs" do you need to create?
>
>
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
