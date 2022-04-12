Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E24FCBEF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 03:37:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1851701;
	Tue, 12 Apr 2022 03:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1851701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649727470;
	bh=UEW9kzkQ/TWBaj4vvhTEppsomnvWB1SU16LdtQtB7nU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFFmWkSK1QUbxjPgKyU8DuUOUVQ+wB37neJ9fI918waZAg992PdFt/q09KJuWJcUN
	 yXSq7WH4qoanC3RcpB6hcuupK5sGTV+k334TZJ41ufyy2P2Yy/urbtdMjR7yStFbWs
	 VJsFJzE1kb+4rbjTxQ7rRoCuTPpjmtejElzfcHic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C80F2F80245;
	Tue, 12 Apr 2022 03:36:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D65EF80154; Tue, 12 Apr 2022 03:36:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89F9EF80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 03:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F9EF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pqKOYr+L"
Received: by mail-pf1-x430.google.com with SMTP id s8so16099754pfk.12
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 18:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFRvD+s5/CV5Fwvh/2Kxb6y/LQ1QtPgz7+1+S1OLjeI=;
 b=pqKOYr+LXaLecw0bb3DNqMe5E+IhIVzHNhjtZO1lym0KqdJPOKFntKwBTpuaiBTzQO
 fDVd8MCm8Y2D/De+jtEFuZjBJRjPTtB1+A0OhThytabGmrgoE3+7ZbQ3gjzAvkL5OiqT
 kj1+r1xM6lAgXNDoAcyF6S2c8LRJIiw0yHtBRi1rqfv3bxdWIk6NnxGvEvex7fyX90BM
 mzm1BsKvbOw22Mi4ytOyvzyjDUvvf3T+Rb1CphVJZ74sKzVBt3grHwndcAx5vFCgyqdJ
 6iq6UxkE+t27QKQfY4VKpMu0MHtdO/tzlmmv7iEdDhULluaGopxoj1hAUQy+udOxzaDH
 tZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFRvD+s5/CV5Fwvh/2Kxb6y/LQ1QtPgz7+1+S1OLjeI=;
 b=Plq/yDO4awbQET06RW/ICfzKVgIvEevvyFYnQaSy00y5TOd5yZZROJlyW9qHK4pn+v
 8EFo7ufQJAYg9Vji6dBbknn3mvXk7URKDez7yTi5wVUqqmLg0hXMMnMSGWLIyg3RgjtS
 M9AucmfymbskvcytkJX6a7BE3QSP5X0xUJRm+Kudre7yV9UWVAWAkJhLgxlegpZPbMgt
 rzSO99MzYCHSGGW1qPpaP4XgjmO+zYaM5vfxE6kTWneefkGMlrH3/fpYEnSVuCtv6o2Y
 5MhwwKOniI26LnUSCkiUrHCeXfjo+fqiDPheI2JSfkThzJF5KawUwmVz6K4rnfy/zFwT
 4vow==
X-Gm-Message-State: AOAM532ZlN9uJmw1eOCF33FMrtJvH7yz9OmWbv7s3taPZqet+HQ+eRLH
 f5w4xwhq2conlGjfdYxPxNAQ4XrbwfwM5wregQ==
X-Google-Smtp-Source: ABdhPJxOjebZBWztw/YCoC8rhytZT8acARz0zbn9BB5A9VE2qQTyOtE549aCPF8GIsh+UoJKJAW5VnRHIh6cfQSgFGs=
X-Received: by 2002:a63:610:0:b0:39d:300c:ad9b with SMTP id
 16-20020a630610000000b0039d300cad9bmr9563708pgg.113.1649727398350; Mon, 11
 Apr 2022 18:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjm2AdyEZ_-EgexdNDN7SvY4f89=4=FwAL+c0Mg0O+X50A@mail.gmail.com>
 <s5hk0bwcbjh.wl-tiwai@suse.de>
 <CAMhUBjmr_mHcz2G0tQ2qktGFw6XDLJiDTAHvM1yoRWzvtA6MYg@mail.gmail.com>
 <s5ha6csc7lq.wl-tiwai@suse.de> <s5h7d7wc75u.wl-tiwai@suse.de>
 <s5h35ijdiab.wl-tiwai@suse.de>
 <CAMhUBj=yiAtbYmGDuaBrSxNMrxz6S8DJotwTLihcs64JSOQuVg@mail.gmail.com>
 <s5hsfqjbqk7.wl-tiwai@suse.de>
In-Reply-To: <s5hsfqjbqk7.wl-tiwai@suse.de>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Tue, 12 Apr 2022 09:36:27 +0800
Message-ID: <CAMhUBjno-2qCe5FDF0ftuy5aoq=735N4_SeQyQRpDEsurAsU+w@mail.gmail.com>
Subject: Re: [BUG] ALSA: echoaudio: warning when the driver fails to probe
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org, tiwai@suse.com
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

On Mon, Apr 11, 2022 at 11:14 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 11 Apr 2022 12:34:56 +0200,
> Zheyu Ma wrote:
> >
> > On Mon, Apr 11, 2022 at 6:30 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Mon, 11 Apr 2022 11:15:41 +0200,
> > > Takashi Iwai wrote:
> > > >
> > > > On Mon, 11 Apr 2022 11:06:09 +0200,
> > > > Takashi Iwai wrote:
> > > > >
> > > > > On Mon, 11 Apr 2022 10:49:53 +0200,
> > > > > Zheyu Ma wrote:
> > > > > >
> > > > > > On Mon, Apr 11, 2022 at 3:41 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > > > > >
> > > > > > > On Sun, 10 Apr 2022 11:13:55 +0200,
> > > > > > > Zheyu Ma wrote:
> > > > > > > >
> > > > > > > > Hello,
> > > > > > > >
> > > > > > > > I found a bug in echoaudio.c.
> > > > > > > > When the driver fails at the function snd_echo_create(), it should
> > > > > > > > release resources requested before, otherwise we will get the
> > > > > > > > following warning:
> > > > > > > >
> > > > > > > > [    3.262866] remove_proc_entry: removing non-empty directory
> > > > > > > > 'irq/21', leaking at least 'snd_indigodj'
> > > > > > > > [    3.263577] WARNING: CPU: 3 PID: 261 at fs/proc/generic.c:717
> > > > > > > > remove_proc_entry+0x389/0x3f0
> > > > > > > > [    3.267098] RIP: 0010:remove_proc_entry+0x389/0x3f0
> > > > > > > > [    3.269976] Call Trace:
> > > > > > > > [    3.269979]  <TASK>
> > > > > > > > [    3.269988]  unregister_irq_proc+0x14c/0x170
> > > > > > > > [    3.269997]  irq_free_descs+0x94/0xe0
> > > > > > > > [    3.270004]  mp_unmap_irq+0xb6/0x100
> > > > > > > > [    3.270011]  acpi_unregister_gsi_ioapic+0x27/0x40
> > > > > > > > [    3.270017]  acpi_pci_irq_disable+0x1d3/0x320
> > > > > > > > [    3.270025]  pci_disable_device+0x1ad/0x380
> > > > > > > > [    3.270034]  pcim_release+0x566/0x6d0
> > > > > > > > [    3.270046]  devres_release_all+0x1f1/0x2c0
> > > > > > > > [    3.270057]  really_probe+0xe0/0x920
> > > > > > >
> > > > > > > Could you try the patch below?
> > > > > >
> > > > > > The following patch works for me, the previous warning disappears, thank you.
> > > > > > But I got another error, I have no idea about it.
> > > > >
> > > > > OK, that's bad, it's basically the destructor order problem.
> > > > > Could you try the patch below instead of the previous one?
> > > >
> > > > Sorry, the below one instead.
> > >
> > > Err, scratch this one, too.  It's a deeper problem than I thought.
> > > Will post a revised patch later.
> >
> > Yeah, you are right, these two patches do not work, I got the same
> > error message.
> > Thanks for your effort.
>
> Here we go, a revised patch.  Basically it enforces the call of
> snd_card_free() at the error path during probe.

Thanks for your patch, it works for me :)

Tested-by: Zheyu Ma <zheyuma97@gmail.com>

Zheyu Ma
