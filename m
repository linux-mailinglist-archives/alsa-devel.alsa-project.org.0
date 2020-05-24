Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388241E0108
	for <lists+alsa-devel@lfdr.de>; Sun, 24 May 2020 19:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBDE11701;
	Sun, 24 May 2020 19:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBDE11701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590340997;
	bh=flJf6vMV7ZdVO3PEgDBZffw8O0E3LVIhU6EBvweqjBY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ryb0OBouPHbIqfzWw7zgYJkUj+xIzLKMY2vzTiTaz0rXld4VDUJctrQsUrVUWTWyl
	 Un1NsuGMJK/v3qaqv93rrqs1OogxBsRQsUz9w0/9MBArQlZJbH0KTpT1LLwJoPmsEI
	 sA6FNIe1PWV/3uo2gIOudwMelIXhHSgn/XqfrcnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEAF2F8015D;
	Sun, 24 May 2020 19:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3499F8015C; Sun, 24 May 2020 19:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7DDF8013C
 for <alsa-devel@alsa-project.org>; Sun, 24 May 2020 19:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7DDF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p3UMUo+Y"
Received: by mail-qk1-x744.google.com with SMTP id w3so10145259qkb.6
 for <alsa-devel@alsa-project.org>; Sun, 24 May 2020 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yaQbyc25RqKKkOAhEkaw1xc+vmh3Cee1FjzEZxcqNM=;
 b=p3UMUo+Y7cqhA8YXDA1S3xm1BT3lRjqwfEnypkY0sIgdny7gwd91b4PcFlvJTb6XY2
 Gf0Yv9889A41M+udDV5U12ZCN+962b2Gh1shG9QnvX3rSYF+m5wKV8SN4oz0Rg8T1eDC
 SQDoLEMI0Fqv9thyomqohtZoQIlZfuVuP/j/9rhluR9KK2HoVQ2f27KXzYEfpP835n8V
 gVsTq8uvrFQZ/gcyKjz710Q8oaD/hLc5e2rmzw/zl/dl4GOhA3lkTwHjwYmWdGu38bGk
 d1csJgNME0Z1qE8XC5ED3KyMCnDYHmkLsREajfFGWr962I0X6vDsHsJtRjHwIK0OqhJ3
 N/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yaQbyc25RqKKkOAhEkaw1xc+vmh3Cee1FjzEZxcqNM=;
 b=YUnPX9YnEzI1uV8YdjnrohUpNUAunoam8Y9J/xCbOaFQHlDuHLYblJn8X7iuURZuPJ
 JH1nLhgVx+CO++MrDdhGKgg+uGp7vUOdGPVRkXv+D2YCjn69ie/jUoTa/druiJF9gFV9
 gYJgHIDW6FScIJ0uf33JHBtD2qW8JPnfslJaVSk21s8owJbtRP9ADgVDYFMZhLFpUEJd
 JuWhisD1RzA6z3Th5OYxd+rY/8eMkEH30c7FU5rw9FE9nEtN8ARgEX9DabtIkOtkQ8Eb
 dHoKUWzWjHakX6nfO3dBjP+yla9BdiXb7n3VEsTGT9qJKVEuzWvCSF1HTIFu0EjtYzk5
 jJZQ==
X-Gm-Message-State: AOAM531Sk2NLaWrvzbmi5N68vzabPsPuZELSu/6FrVDX20zod8zekWUx
 zNbxZz8nMh0k8BG3ChMIpfKBOO3b1xp+S191HTo=
X-Google-Smtp-Source: ABdhPJzK5UDUD9Z/IcNNHqoev1Fg7LXphylP+EuvxrgJxhiHNqSOfzgI8aG9c3+szRmXbqjbxowCFuQALUCvxmtT9Yg=
X-Received: by 2002:ae9:e901:: with SMTP id x1mr22465025qkf.131.1590340884838; 
 Sun, 24 May 2020 10:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200523174957.6294-1-anarsoul@gmail.com>
 <s5hftbpx1h1.wl-tiwai@suse.de>
In-Reply-To: <s5hftbpx1h1.wl-tiwai@suse.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 24 May 2020 10:20:58 -0700
Message-ID: <CA+E=qVf4kRGV+iwkuVkceumxsPynoEDHCBWsoy3bHWpghte5Hw@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: line6: add hw monitor volume control for POD
 HD500
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@denx.de>,
 Takashi Iwai <tiwai@suse.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

On Sat, May 23, 2020 at 11:59 PM Takashi Iwai <tiwai@suse.de> wrote:

> Thanks for the patch.
> The basic implementation looks good, but I see a few issues.

> > +EXPORT_SYMBOL(line6_send_raw_message);
>
> Let's use EXPORT_SYMBOL_GPL() instead.

Sure, will do.

> > +static const unsigned int float_zero_to_one_lookup[] = {
> > +0x00000000, 0x3C23D70A, 0x3CA3D70A, 0x3CF5C28F, 0x3D23D70A, 0x3D4CCCCD,
> > +0x3D75C28F, 0x3D8F5C29, 0x3DA3D70A, 0x3DB851EC, 0x3DCCCCCD, 0x3DE147AE,
> > +0x3DF5C28F, 0x3E051EB8, 0x3E0F5C29, 0x3E19999A, 0x3E23D70A, 0x3E2E147B,
> > +0x3E3851EC, 0x3E428F5C, 0x3E4CCCCD, 0x3E570A3D, 0x3E6147AE, 0x3E6B851F,
> > +0x3E75C28F, 0x3E800000, 0x3E851EB8, 0x3E8A3D71, 0x3E8F5C29, 0x3E947AE1,
> > +0x3E99999A, 0x3E9EB852, 0x3EA3D70A, 0x3EA8F5C3, 0x3EAE147B, 0x3EB33333,
> > +0x3EB851EC, 0x3EBD70A4, 0x3EC28F5C, 0x3EC7AE14, 0x3ECCCCCD, 0x3ED1EB85,
> > +0x3ED70A3D, 0x3EDC28F6, 0x3EE147AE, 0x3EE66666, 0x3EEB851F, 0x3EF0A3D7,
> > +0x3EF5C28F, 0x3EFAE148, 0x3F000000, 0x3F028F5C, 0x3F051EB8, 0x3F07AE14,
> > +0x3F0A3D71, 0x3F0CCCCD, 0x3F0F5C29, 0x3F11EB85, 0x3F147AE1, 0x3F170A3D,
> > +0x3F19999A, 0x3F1C28F6, 0x3F1EB852, 0x3F2147AE, 0x3F23D70A, 0x3F266666,
> > +0x3F28F5C3, 0x3F2B851F, 0x3F2E147B, 0x3F30A3D7, 0x3F333333, 0x3F35C28F,
> > +0x3F3851EC, 0x3F3AE148, 0x3F3D70A4, 0x3F400000, 0x3F428F5C, 0x3F451EB8,
> > +0x3F47AE14, 0x3F4A3D71, 0x3F4CCCCD, 0x3F4F5C29, 0x3F51EB85, 0x3F547AE1,
> > +0x3F570A3D, 0x3F59999A, 0x3F5C28F6, 0x3F5EB852, 0x3F6147AE, 0x3F63D70A,
> > +0x3F666666, 0x3F68F5C3, 0x3F6B851F, 0x3F6E147B, 0x3F70A3D7, 0x3F733333,
> > +0x3F75C28F, 0x3F7851EC, 0x3F7AE148, 0x3F7D70A4, 0x3F800000
>
> Just nitpick: better to align with lower hex letters (a-f).

Sorry, I don't really understand what you meant here. Could you elaborate?

> > +     buf = kmalloc(sizeof(msg), GFP_ATOMIC);
>
> Is this function called from the irq context like the urb callback?
> I saw that it's called from the mixer put callback, and it's in the
> normal sleepable context, hence GFP_KERNEL can be used safely.

It's also called from podhd_init() to set initial value but I assume
it can sleep there. I'll change it to GFP_KERNEL.

Thanks for review!

Regards,
Vasily
