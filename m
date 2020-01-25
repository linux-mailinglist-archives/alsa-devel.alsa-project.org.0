Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7EB149619
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 15:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49DE7166F;
	Sat, 25 Jan 2020 15:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49DE7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579962969;
	bh=jUi8nGkG78QA8U9W35RVnAFdyyCo4KPUm1P2VzJ8ocA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OOLwMyYw0n9eWXIO/HBGIqc9JDwqO7gpchzqLQgCmZub6DBwAYwvuQWv+CX7rROl0
	 jNEFE43MLzjVrYaKVBP+Jm+ItqDVTFVDIg8127XYgZjAyDIvGKlmJU9hKhMEDb/uKu
	 zXzJa6/GLRnltvBiD2QiQP8L+tizz+OLyCnI0HE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9837EF801EC;
	Sat, 25 Jan 2020 15:34:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 019C4F801EC; Sat, 25 Jan 2020 15:34:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5F60F8012E
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 15:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F60F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XhlTBI5J"
Received: by mail-lf1-x142.google.com with SMTP id 203so3118375lfa.12
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XfNgSSZhToPK19TfjlRWxxRg/+EAlHIVVRmlr4faNJw=;
 b=XhlTBI5JTNy3CTPBh/nl16EwfIKqbpDyXFst5GbBDTCn4KgZXMziM24A3iN2di20BW
 3vfP9OzSYGIaWSoY/Hz9toOQ+Pm4SgljSty4wzR4dpYR5k38/Js4EKU06UjOFSX9x102
 gKrZnwoF9hnDnCczx/6ZpRlPcxQLhwQKRfJ7f4Xr3Cc6r9W+UiTYKy3ltPxFtRcU6zKi
 QaSMIeP0pc2RoL3fFNBeMqE3QMFlZD/sOb3m6EYrH7duuYtN0ifeeUzVKrTKXBrq5IKh
 UzJphkXxgnC4ICWdhMs1xjo/+CRcGadQ1fWUYv5Ffw23VVwlF3Tz55s76Opynyqjnmla
 2ejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfNgSSZhToPK19TfjlRWxxRg/+EAlHIVVRmlr4faNJw=;
 b=fR2LKv3lT7h3rYE3ESlxZ38gul6mdG3Cox4No1LRnKRZJm8noeY+6bqqPNtTafE14h
 Val/9PvU7YKzY6DLo8rXkAJ6bAuSX3HPo1wP7z4qgZC+E9ORKelxAvwfYNRUpHm1rYha
 JFBI5l7d8KQ7uJs9/7PgLyADO6S4tjcOm/5ADjvxIEFkZI1ls119iY2ETYsVmwsJmGd7
 vReHK4pgLafjPdU06jdFO43L6OtugyYsW+jvm5kvtnTT9yK5z0/loGjT05Xa9Y0HNR6H
 ypotUpiK9VkKVcuMvsaizeyZwh7RbooNWuoHp1vn0Fyey5hiyvqJJ3mGieeWQRURmccv
 D49g==
X-Gm-Message-State: APjAAAU7n6d0NZlwZzctGAs1vemfEa/iQSkS2p6YNloaXKpWnrALUvRC
 djwYi/kAAFWwRLq+9w7Kp2CJemmgQuGcZFOEk1o=
X-Google-Smtp-Source: APXvYqxyazheg0ByWCJyJQPlbpkgHIuPG6Lx4Y5AQF8CiO1pQlt1RBK1pnTrtEfzPpGkmhEHvWDLYrgpQZSCI2BNR/Q=
X-Received: by 2002:ac2:5979:: with SMTP id h25mr4099514lfp.203.1579962858271; 
 Sat, 25 Jan 2020 06:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20200125132226.31277-1-nick83ola@gmail.com>
 <9b997da2-a292-9e4d-764e-ef3dedf0ce14@jensverwiebe.de>
 <s5hd0b71v0o.wl-tiwai@suse.de>
In-Reply-To: <s5hd0b71v0o.wl-tiwai@suse.de>
From: nick83ola <nick83ola@gmail.com>
Date: Sat, 25 Jan 2020 14:34:07 +0000
Message-ID: <CABPh3UM=R0UwbRGDPWn3_14abVm7sE7dFYxVZMqxV0Pfg9=MaQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Carlo Calica <carlo@calica.com>,
 Jens Verwiebe <info@jensverwiebe.de>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: add quirks for Line6
 Helix fw 2.82
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

Hi Jens

On Sat, 25 Jan 2020 at 14:16, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 25 Jan 2020 15:12:48 +0100,
> Jens Verwiebe wrote:
> >
> > Hi
> >
> > Why this incomplete patch ???
> >
> > I longer informed you that with fw >= 2.8 lot of helix kind devices
> > got a new ID:

Yes you told me but you didn't give me a list of the ID nor confirm
that you can test something.
The reason of this patch is that I created a post in the Line6 forum
when you told me that and the only user that
confirmed that the patch work with newer firmware with Helix is Carlo Calica.

I sadly have only access to an hx stomp and I don't want to put
patches that I cannot verify.

If you have access to other hardware instead of sending email to me
you should submit something yourself.

Cheers
Nicola Lunghi

> >
> > So this patch should include at least the well known/collected data:
> >
> > case USB_ID(0x0E41, 0x424a): /* Line6 Helix LT - firmware >= 2.8 */
>
> Oh, so the patch doesn't work as is?
> Then I drop it again.
>
> If anyone can resubmit the comprehensive one and give the tested-by
> tag, I'll happily apply it.
>
>
> thanks,
>
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
