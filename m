Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB474FB658
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 10:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3491916F9;
	Mon, 11 Apr 2022 10:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3491916F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649667075;
	bh=/AJQIfiMuJyXhyIJ1wtE9EyxO2oGzKkdN/IHzYZXY2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GVzc9UDBaHjzaNBNhYq+rcJv3kJ3fuxjIfu+4NfoMWZDKpzFdzPVZoGErFwnj7m31
	 sg2oAs+/AX5rlKIUd1lBBOWKc1nvtNUKIQ3YKSx0zMi3GCjUlkhLChMhHH8KlJyq+l
	 FukUcgXFxwpFMz11fef4K/MVJihkbIcN74anFK10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99632F80249;
	Mon, 11 Apr 2022 10:50:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D44FF8011C; Mon, 11 Apr 2022 10:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A126F8011C
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 10:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A126F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m87SqfcX"
Received: by mail-pl1-x635.google.com with SMTP id v12so297385plv.4
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 01:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sus1ijjnwPPCnYQ+nnL26keJCikVTpXCEs0tGfvDY+c=;
 b=m87SqfcXEo1wITNT0zsEMApqinJ/eME2w9uxi3fBMnAgFLeUvFE89erTEVKqTM+5Zh
 jOfOx0MfB01iEc/YOMYt42WFNzOWIRKA7TxVVmbHS/cOO+BoOJ16P9OwI3ERjF9ZPJna
 Jfid7p3vxTRNERj/EFBoT2HZMO1e2Q+Crq22/mcaO7fILST0bpBHt0XB/H8hkQjFkxat
 kX7h5aZOu9nJiFXpkDpuFEqE5QGNdwC0K++U5lgIKO+pQKc3aNQHWqr6zhporcOuFaYO
 eWTR/zFWJxBBq8wyrLoxmxAAxL2ikJpeBWz5iflukpR/0wTUlpJ+Qbbm587hUQsypbed
 5jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sus1ijjnwPPCnYQ+nnL26keJCikVTpXCEs0tGfvDY+c=;
 b=eOlAlW7fRpReKTTqGgFKoGgAo6p+/LR6biTMjshrrRDCWxbRNAg2le1EMq1XgsDloa
 hrxumhHhZG4od2epaTwJ5AotWchQHBXTJJLRcbVUg96ckNckNQQ1cMvCo4tAbA8B6GnX
 sQojtYBqUPkK5te6qER/mf2lPbgqjzCNLtS5Y48RA96D4R6A5ghEvS5TFkvUAiAA3DJJ
 kElzNu93JrN0IegL3//91JxeEQkqbvypSYBQL6iqxdjTPaPSnFo9VLP69uME+bMrpvzL
 HuI/iXNilMGaEcKPCGOfHOJVX5ibLi94zJZ4wKqW/zC0TYsB7T6EzxMPmhCO3Pt+hSg4
 /8SQ==
X-Gm-Message-State: AOAM53334XOkrRgrLYnLvSk+6pEj8iy4oouuYZcSPqdXsj1HuqLm0JpP
 QTDcq7WZ9yq+RT4tqPJ+SnqbtdJsq/TYIemBPQ==
X-Google-Smtp-Source: ABdhPJx6DRw4IDsGYrLBmw6A9PqReHiO6wvi0esUQduYsRKc96s6AxX0ib2LtF+QvbSEOr3QJvhDocMOSY7cBJF89Ao=
X-Received: by 2002:a17:90a:5407:b0:1bf:43ce:f11b with SMTP id
 z7-20020a17090a540700b001bf43cef11bmr35665065pjh.31.1649667004582; Mon, 11
 Apr 2022 01:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjm2AdyEZ_-EgexdNDN7SvY4f89=4=FwAL+c0Mg0O+X50A@mail.gmail.com>
 <s5hk0bwcbjh.wl-tiwai@suse.de>
In-Reply-To: <s5hk0bwcbjh.wl-tiwai@suse.de>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Mon, 11 Apr 2022 16:49:53 +0800
Message-ID: <CAMhUBjmr_mHcz2G0tQ2qktGFw6XDLJiDTAHvM1yoRWzvtA6MYg@mail.gmail.com>
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

On Mon, Apr 11, 2022 at 3:41 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 10 Apr 2022 11:13:55 +0200,
> Zheyu Ma wrote:
> >
> > Hello,
> >
> > I found a bug in echoaudio.c.
> > When the driver fails at the function snd_echo_create(), it should
> > release resources requested before, otherwise we will get the
> > following warning:
> >
> > [    3.262866] remove_proc_entry: removing non-empty directory
> > 'irq/21', leaking at least 'snd_indigodj'
> > [    3.263577] WARNING: CPU: 3 PID: 261 at fs/proc/generic.c:717
> > remove_proc_entry+0x389/0x3f0
> > [    3.267098] RIP: 0010:remove_proc_entry+0x389/0x3f0
> > [    3.269976] Call Trace:
> > [    3.269979]  <TASK>
> > [    3.269988]  unregister_irq_proc+0x14c/0x170
> > [    3.269997]  irq_free_descs+0x94/0xe0
> > [    3.270004]  mp_unmap_irq+0xb6/0x100
> > [    3.270011]  acpi_unregister_gsi_ioapic+0x27/0x40
> > [    3.270017]  acpi_pci_irq_disable+0x1d3/0x320
> > [    3.270025]  pci_disable_device+0x1ad/0x380
> > [    3.270034]  pcim_release+0x566/0x6d0
> > [    3.270046]  devres_release_all+0x1f1/0x2c0
> > [    3.270057]  really_probe+0xe0/0x920
>
> Could you try the patch below?

The following patch works for me, the previous warning disappears, thank you.
But I got another error, I have no idea about it.

[    3.326686] snd_indigodj 0000:00:05.0: Direct firmware load for
ea/indigo_dj_dsp.fw failed with error -2
[    3.327474] snd_indigodj 0000:00:05.0: get_firmware(): Firmware not
available (-2)
[    3.328077] snd_indigodj 0000:00:05.0: init_hw err=-2
[    3.328496] snd_indigodj: probe of 0000:00:05.0 failed with error -2
[    3.329965] ==================================================================
[    3.330525] BUG: KASAN: use-after-free in stop_transport+0xa5/0x4c0
[snd_indigodj]
[    3.331122] Read of size 4 at addr ffff88800943f010 by task systemd-udevd/255
[    3.333226] Call Trace:
[    3.333426]  <TASK>
[    3.333595]  dump_stack_lvl+0x5a/0x74
[    3.333888]  print_address_description+0x7b/0x440
[    3.334264]  print_report+0x101/0x200
[    3.334558]  ? _printk+0x54/0x6e
[    3.334818]  ? stop_transport+0xa5/0x4c0 [snd_indigodj]
[    3.335231]  kasan_report+0xc1/0xf0
[    3.335513]  ? stop_transport+0xa5/0x4c0 [snd_indigodj]
[    3.335938]  stop_transport+0xa5/0x4c0 [snd_indigodj]
[    3.336346]  snd_echo_free+0x8c/0x410 [snd_indigodj]
[    3.336741]  ? snd_echo_interrupt+0x4b0/0x4b0 [snd_indigodj]
[    3.337183]  release_card_device+0x7d/0x190
[    3.337519]  ? snd_power_wait+0x80/0x80
[    3.337829]  device_release+0x97/0x1c0
[    3.338127]  kobject_put+0x144/0x1c0
[    3.338417]  __snd_card_release+0xe4/0x140
[    3.338744]  devres_release_all+0x1f1/0x2c0
[    3.339079]  really_probe+0xe0/0x920

Regards,
Zheyu Ma
