Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DD4F9A44
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 21:10:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B3D1667;
	Tue, 12 Nov 2019 21:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B3D1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573589423;
	bh=rfHkwgQyjC1IGJSy++6tVACbYR39tBR+QF/yYjsNDcE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPG0ZgZkWq+bt2b8JbefKjKBCctNEeUOKNa/k0WA8uMVn6dZhlbrB3Jh8Xf3y4gi0
	 RIEy6b9wCv/Gpy/msGt/ZQtswXi0bRbslEp3gtXejq63cI0p6qxfAJ5hQO30MGYgLr
	 q++fPBw6IcgwFmFQ5l4gbuKp3zFCw5q+zKmH+Oh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC4CF804CF;
	Tue, 12 Nov 2019 21:08:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CF3FF802E0; Tue, 12 Nov 2019 21:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F9C4F802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 21:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9C4F802E0
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MNOZO-1iEjTk20pG-00OlRe for <alsa-devel@alsa-project.org>; Tue, 12 Nov
 2019 21:08:34 +0100
Received: by mail-qt1-f177.google.com with SMTP id n4so16568448qte.2
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 12:08:34 -0800 (PST)
X-Gm-Message-State: APjAAAWI/yV8HeFExxpRdW67O9sWoks/WPH3Fj7kc2ZHkhU7Z+wxZ5+0
 kUl2htCPTlnjKbF5RxFEVHGhgkNpsLz59z7k4E4=
X-Google-Smtp-Source: APXvYqy6WDtN0kyefSVskwvyTaVRgD8eTS4RnVNusDWhrPxsHPli8rDwtqG+OjX/Sb98lfp4nNr3KxTDQp3XRFCTxg4=
X-Received: by 2002:aed:3e41:: with SMTP id m1mr24440779qtf.142.1573589313436; 
 Tue, 12 Nov 2019 12:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20191112151642.680072-1-arnd@arndb.de>
 <20191112151642.680072-3-arnd@arndb.de>
 <s5hblthp0di.wl-tiwai@suse.de>
In-Reply-To: <s5hblthp0di.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Nov 2019 21:08:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1fsC+05i-i77g2aR3bkzprnhbhROLkMPcy=UFfsV3GMw@mail.gmail.com>
Message-ID: <CAK8P3a1fsC+05i-i77g2aR3bkzprnhbhROLkMPcy=UFfsV3GMw@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Provags-ID: V03:K1:4qi9uogIP9vmLQp0aM5fy/wIYJ41XM9YBlE1v+MNvLrPzan9VqH
 HJJA5S83Ty6PSOiHdK8CTBqqIl6V+HZoymrP62ekdyvlkVUy0QaKXf/fXWkQlyIraHGxWuX
 pnkLxlIiOPQmuvxKy4sgVec07DgEqDJs9ayHDXlanB21DD4Z74xaCDuvWpSwj41g3D+c6jy
 igCPAHMotjqmnPEMmmDEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Ey7ro9cYew=:TklyTW84iI/oKPjevMggmB
 TlLuzr6WhRaQ590m5Ii0ZDgaS1vjsOMjP7F4ZnZuQc+cAs0E/babtNWEYlodK4MKzLMqUR1eh
 HkK7GlGXoWWyxvMrvd9SeZbfx9CuI7T0JRSY0Pb7TFfJEap+rbp8rSiL7k1x+PXjve7eCG64D
 7U39m84FUKYtSLblPNmn1e8aQmKnpkVKhYmFIzVJ/k1orl7hPl3U7YS1GXCcVqixEdJKisvg3
 sm756magnpgmoKxeH6GfVjY0T2rqqz7tRUBUR8ndsXYYtr6/ideuh3OPZhsjaT3euVOJPm1yh
 o57W5RQ6eanw/0cNuX2paaSa3aig+f74Uz0bcRtezFcejVXlUtzr6Bx+EbJEeiSJ5Bx2Wu0Jv
 /YgBlD2qNRoTZUs/yyy0yhsupVL+VHg4MI2EhUWyxeYFNB+i1UF/bIyKfFQHNo01UHCfr8hA2
 7yc/3qBoN/m9aQHqZs8dx11PY10f/LdZVFpX/Zv/wg+hdDbeagAzJvg+YIYh3QE3eNlKRFfsp
 0rgY0mTWXyHo9Xs9q0o9gsKU2r8nNCI2sbJG4iKTOtXcZTvyUdCIm+xyM7/PHulfOk05SB9JE
 0vFw3Q0stsHQa1987TBksDF8yScGM5k4x6Tltrr0h7A+piS/IWoTj54pSMWmLCTLUsmYTFhql
 26bGmH+A3wiwIQEEDt1SOUYUPhyD/c5EJLesYCSP3pKVneZlWS4p/kF1TqtRm+RgD72BUPlqF
 pJ3CVGyzAuqeGaXwxZVb7JZHrSyxFqiEhSXh2+SFen2hGUk4StXPeSBVhg0G7NWZxLLV/ieVf
 t2g1wXBjhv5s2U3AO6xXmJgAjzazFAFBpYsL+uchLHRt3mC0m9IMRG5ZsOfPOiHWaaaGafSfB
 gSniSVpkPSROkVQ6ZMDA==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [PATCH v6 2/8] ALSA: Avoid using timespec for
	struct snd_timer_status
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

On Tue, Nov 12, 2019 at 4:42 PM Takashi Iwai <tiwai@suse.de> wrote:

> > @@ -761,6 +761,7 @@ struct snd_timer_params {
> >       unsigned char reserved[60];     /* reserved */
> >  };
> >
> > +#ifndef __KERNEL__
> >  struct snd_timer_status {
> >       struct timespec tstamp;         /* Timestamp - last update */
> >       unsigned int resolution;        /* current period resolution in ns */
>
> Do we need this ifndef?  Is it for stopping the reference of struct
> snd_timer_status from the kernel code but only 32 and 64 variants?

Well spotted, this is indeed a very recent change I did to the patch.
The idea here is to hide any use of 'time_t', 'timespec' and 'timeval'
from kernel compilation. These types are now defined in an incompatible
way by libc, so we have to remove them from the kernel's uapi headers.
I would prefer to remove them completely from the kernel (rather than
moving them from uapi to internal headers) to make it harder to write
y2038-incompatible code, and with the 90 patches I sent this week,
all users are gone from the kernel (this series was the last part).

Interestingly, hiding snd_timer_status from the drivers /also/ caught
a but in a file when I had missed a reference that needed to be converted
to snd_timer_status64.

     Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
