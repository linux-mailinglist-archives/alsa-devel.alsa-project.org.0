Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3A1E0A7E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 11:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D57271704;
	Mon, 25 May 2020 11:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D57271704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590398979;
	bh=awnFbT9PDjr32bGjeSJTX5LFwGvS+qaxOdB2NDN3cFU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZsaQQuqlwAXdsscVsTN+IQ2fNQFJS6fKkDrsFPmkChFZt0vNeQ5KfWygIeG/634y
	 6EOlNzYu2gnCXSRmHvBPZUoPXa0WPxQTKz6ftiiRHr6PGXpxKaarT7lKro7TwBoXYF
	 5UxQlla/gtzGc7aNKsg1d0xsFdGOKKYx2EhfDb7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D3A5F802BC;
	Mon, 25 May 2020 11:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61142F801F9; Fri, 22 May 2020 11:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0DECF80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 11:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0DECF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E0yQyxpL"
Received: by mail-vs1-xe41.google.com with SMTP id b28so3615609vsa.5
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2mq1SiogaI44X8IkumH4BAaJVRu+DHqlM5vSKZxWPF4=;
 b=E0yQyxpL0q7kKLbEmPWmRbtTZWGHfAQGNFDsAf+kqN6igaxa8a8s+rmqT0oXr5guYF
 h4WGeui+FC8oFsxD/IGYVF6R8bIqO44+470WqCeohlz9ocdI9cOZMb2uySGNTDmdywvu
 9jHHJ+oKq40WVnM6w9sl7jAW6AeQpySjKUAcNkbmzNonWZjVxnreUEjzJJ4fHjaF8CZv
 LiwKvFBFMxJzu7Ys42rG8r0Ue3XHo8W3LIEaRYotYJ+0lzeDFOXZQb2zySLvhT2J2FJH
 GPVH6T5KeO4O6H9nkzkucczZmyHD9GMQiPALw8fffqWHWijfiH7fWg70o4E0jqQZc9ki
 sQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2mq1SiogaI44X8IkumH4BAaJVRu+DHqlM5vSKZxWPF4=;
 b=rNdq2ZS0+cqCY8xcbK6SvVoA4uUcbjC8OWFVfmwraeSD68K4hjbe9usQ7sKPhK4n5q
 gRG4YkRi9oN2sIymHKfIokcGBIRygGGCs2/ISOgDR1D0qYjCL9mCpVUcy5t9R5u/Yi16
 pwLibXubiL3K3ol5wPnImrJAwdiwZbk3xkrMU57HosmMGvvhswgEX7LtbwyjtAwA5P+b
 AQLBvKBAMUyGdwRj/QgiMntSG4dQ5JPkkfLScDpNf4xtsSXz6hsBfXV7G7+vzIMQGrEN
 5R5/050OUi8+VnxTdL0yX0mtBLmiBsTbHQkcV3cj9j2Oz/4o5BgrzVTyIKsdPW0JSnHR
 3k2w==
X-Gm-Message-State: AOAM530Cka1sFgcewxmVZ7Es4ziRauYVQeANyfWrV3jboMNXAf3ZoK63
 BcsTD6M61ansZj7WOqtFMV3xuI5A1LFdIObmVo0=
X-Google-Smtp-Source: ABdhPJwLogIGT0hE2PqVRQzKanLxr1PxhMejtbW0JzuLlJbARxrTR9RDTnaSGu97ZgGi0wKn+GG8VRWuksrCXKxQMfM=
X-Received: by 2002:a67:db0d:: with SMTP id z13mr10437928vsj.155.1590138438693; 
 Fri, 22 May 2020 02:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <276893435.728967.1590133905081.JavaMail.administrator@n7.nabble.com>
 <20200522081047.GA105169@workstation>
In-Reply-To: <20200522081047.GA105169@workstation>
From: Pascal Bomel <bomelp@gmail.com>
Date: Fri, 22 May 2020 13:07:06 +0400
Message-ID: <CALic0i3=qUMQxK_E1oFA_=K0+ABk0LJwF3hGZumA0nU8PQV4tw@mail.gmail.com>
Subject: Re: Dice firewire support
To: pascal bomel <bomelp@gmail.com>, alsa-devel@alsa-project.org, mail@mel.vin
X-Mailman-Approved-At: Mon, 25 May 2020 11:25:07 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thank you so much Takashi.
Actually i have a debian 4.9.12 "stretch" release with 4.9.211 kernel
version (uname -v)
This kernel has snd-dice module inside isn't it ?
I am not very familiar with linux, that's why i appreciate your help.

Regards,

Pascal Bomel



Le ven. 22 mai 2020 =C3=A0 12:10, Takashi Sakamoto <o-takashi@sakamocchi.jp=
> a
=C3=A9crit :

> Hi Pascal,
>
> On Fri, May 22, 2020 at 12:51:45AM -0700, bomelp@gmail.com wrote:
> > Hi Takashi,
> >
> > Sorry if i bother you about my mail.
> > Actually, i try to enable a mytek  dsd-192 dac via its firewire port on
> a debian 4.9.12.
> > I saw you worked on snd-dice module.Do you have a step-by-step
> documentation to help me do that ?
> >
> > Best regards
> > Pascal
> > France
>
> Although I don't test the device, Melvin Vermeeren added support for
> Mytek Stereo 192 DSD-DAC in Linux kernel v4.18 firstly. It's not
> available in your kernel.
> https://www.alsa-project.org/pipermail/alsa-devel/2018-May/136194.html
>
> If you can't work with the device just by loading snd-dice module in
> recent Linux kernel, please contact to me or Melvin ;)
>
>
> Regards
>
> Takashi Sakamoto
>
