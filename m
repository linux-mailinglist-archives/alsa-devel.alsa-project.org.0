Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31C295C87
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 12:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF19A17D4;
	Thu, 22 Oct 2020 12:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF19A17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603361700;
	bh=Ixyi1WGK8sMvyGF5zWoKGs16z/jpVp35N52P9TlxcE8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWSRaCjqDQWn9FKIVVkElt9ybeIYWYPlXrATGX2a4BnymXCJxA7BwkRx27hCKbf7c
	 CdDkuDwz3Tud9Bq+2Ni9VSRtRTU4VBHwZau+9QeiUCRtdcK39+FYDSgfEI5SNZJ3Z5
	 QZkEqjCHznhc7TXjyqvz9cd8GkoFAykhNw/G/kiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 771E6F800CE;
	Thu, 22 Oct 2020 12:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4569F804AB; Thu, 22 Oct 2020 12:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D8AF800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 12:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D8AF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DRvYtW7g"
Received: by mail-wm1-x336.google.com with SMTP id q5so1402870wmq.0
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NJqpAqFpNiPYE7Vp7Z7OvaFxxCDIRbk2FnhZxE2ASQ=;
 b=DRvYtW7gItgrAUWeIrQLLnC6KlWk1U8oQGDVBtxvB/Y8++AwLQ2zM8pSfWKxlEs1HN
 8Qy7bHTfR5RybHV98jmX8ldy5wpfvUVlfQwJgiqQr8lF9ooVUeUNr2sd/aRb9Kt7cM5V
 sQXMWXHBuQDo4LzRrVm7AgO9h6k68uUZQMtZ8x/hpShqzxfodEuYIsISHLz4nMRB3LEO
 KJBfAL1ti1U8KKHcW4NhojEsJ9CakIt58V2MzjWSmg4jcoKROhnwf4ECY7LNvATcHndR
 Vtp+SHVKhGpAWRegmNWSTf6YEK6LAlAk+n55fRVNIqYIxo6WnlBg9BkwAUF0BJHh/6Si
 kQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NJqpAqFpNiPYE7Vp7Z7OvaFxxCDIRbk2FnhZxE2ASQ=;
 b=aP9cF55aqJLMlyaXlphK5l8WaS07V8pp/sTjKuRJW/1ikhyCf9ohNF/J3qtNicoHuZ
 UeZbnA4qQTcwJTKD9vzBAhXbe7fAOfpl3EppdpJhDFJC+wzKZRXdWutcPwOJIQ5hW8Kr
 VOXx+d57AHsNe0zXnk5GhtnQHZyV535KwVPBZpZXz6WSmBow+EXhKGejCIklY+zJlJsj
 HBPfzvwkjHLq+KF8PiUiYdf0g8L5FUgZd6kDwlzWP5/tLgLsuqfP42lso/++cVwk3qHR
 GAFnuYnmjWbkESvKM/Fhj7S9OLGHUE5x6QWNiI5Tnif0smilhjRefoatShayjwqmxd4C
 hXMQ==
X-Gm-Message-State: AOAM532FwDgvmAqp4HPsd4H0fkcMQnuGCuz9GHAIlTfgAsypPc/oAx/j
 z2lEb9S/somEu61vgoTWmA7o4uzJR0aeMAn99khazmwMGj8=
X-Google-Smtp-Source: ABdhPJwawEGeXpKujfakuKy0XWn2Wkcfx5EAIPiVF38967blzaZe9TKXNwBWixT0S3Ep8a9aR24yCwu4alhHp4Qa35A=
X-Received: by 2002:a05:600c:2905:: with SMTP id
 i5mr1782448wmd.9.1603361634215; 
 Thu, 22 Oct 2020 03:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <CALAz8EWAKP-LaeDyQZW0BauwYBthSbgJgxRT8hypuXEWEOfPhA@mail.gmail.com>
 <alpine.DEB.2.21.2010211554200.22113@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.21.2010211554200.22113@lnxricardw1.se.axis.com>
From: Amanda Ava Koci Pereira <arsoftware10@gmail.com>
Date: Thu, 22 Oct 2020 06:11:23 -0300
Message-ID: <CALAz8EWf8W1xiK4k=dXXqiBrT4Me415h2K-8WWUBNSy=31b45Q@mail.gmail.com>
Subject: Re: How to downmix 5.1 and 7.1 channels to 2 channels
To: Ricard Wanderlof <ricardw@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Thanks for the tip!

Em qua., 21 de out. de 2020 =C3=A0s 10:57, Ricard Wanderlof <ricardw@axis.c=
om>
escreveu:

>
> On Tue, 20 Oct 2020, Amanda Ava Koci Pereira wrote:
>
> > Hi guys...
> >
> > We need some clues about to downmix 5.1 and 7.1 channels to 2 channels
> >
> > for the moment we are using the following code ->
> >
> > It works but fails miserably if all channels have data at same time
> >
>
> Is the problem that you get clipping if there is audio on more than one
> input channel?
>
> In general, if you sum a number (N)( of digital channels which have a
> maximum amplitude of M, then the maximum amplitude of the sum will be N *
> M. So in this case you need to reduce the output amplitude by 1/N if you
> want to keep the maximum amplitude of the sum at M.
>
> So in your case you need to set
>
> > #define AR_K_P_ATTENUATION_LEVEL 1.0
>
> according to the number of channels being downmixed per output channel.
>
> /Ricard
> --
> Ricard Wolf Wanderlof                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
