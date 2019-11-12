Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4037F9A3C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 21:06:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32A691666;
	Tue, 12 Nov 2019 21:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32A691666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573589177;
	bh=kOJ2eLAFxs5WGofjregVbWpFj9m+Q6JAoejEWWjrW1g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u0piajEj+dDtWIz56WPhC+otJ3XYNkVD1KQEroS014epVhmGAtiY9fL1KA/43CJsm
	 F8SwVYn6n7xII0h+ocYz/DA2yTtUdn8HtgvsGvecfjfC4FVkGT/JOLG6Ckb5YwaDFW
	 0+YOMHv43XeZA4AEUJfCYfWcwZX++iv2FWasIseo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFBFF80507;
	Tue, 12 Nov 2019 21:04:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7324DF80507; Tue, 12 Nov 2019 21:04:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB004F802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 21:04:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB004F802E0
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MW9zm-1iNZ7B1MoE-00Xatp for <alsa-devel@alsa-project.org>; Tue, 12 Nov
 2019 21:04:27 +0100
Received: by mail-qk1-f172.google.com with SMTP id 205so15663167qkk.1
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 12:04:27 -0800 (PST)
X-Gm-Message-State: APjAAAVYGmTa7lId//8lXKYURUTdjS7pJl5CuT4HXXDq6Gcfn2/9FPTO
 gnRxwKmrK1Qlir7q5+71oEuDvsPyXAH3iWQfdug=
X-Google-Smtp-Source: APXvYqwF6zCN7UoK4NCX+P+fv5ZgMTlEo9NGmNG9WeQfmZDt/6cJ6I9SRcE85RJs9NQDqy893qKZr87BQ4evOBOJUZs=
X-Received: by 2002:a37:44d:: with SMTP id 74mr2503044qke.3.1573589066075;
 Tue, 12 Nov 2019 12:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20191112151642.680072-1-arnd@arndb.de>
 <20191112151642.680072-6-arnd@arndb.de>
 <s5hv9rpnj6m.wl-tiwai@suse.de>
In-Reply-To: <s5hv9rpnj6m.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Nov 2019 21:04:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0esv0T6ALMXJW40B45Qy5BqVSV9rhSD_sVNUc1T+suEg@mail.gmail.com>
Message-ID: <CAK8P3a0esv0T6ALMXJW40B45Qy5BqVSV9rhSD_sVNUc1T+suEg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Provags-ID: V03:K1:/2S4PtHjC9SrSKDWeKYBfkMZlx/9Mg1vvSBBjBr7tIdXpbNFCq6
 Au5CFHT0ozq9/vIRTwIQkqCZSnGOjHayTGBQifjs08sJYddjQqI2yZlHrFzUC6LWOh1g8Uw
 X5a42kaIyQNQtenQpQLlbzkwDrl38o9RldMzU7n8iTSmDdRcbyXGPE+GXwLkZEr0Hqw1DE+
 nnEnRm1mwTvRgiuTdhf7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gm23iB8NS2k=:h+xFZQF9O2Nna+F5dX34KP
 ymjfe6SkS5wyHIWb6h5ZsZwpDjyezvNmS5UwaxI6n2bO7zCv21yiYpAx6ZX+w/+lzblqtk8i5
 29JY8hUnZ29RMyUupTs82zUuRQfanIABOpSImissUvXgfAjlcc0ek1QuaLY/k24LSs5Fh0slE
 x/wNzB5PIo5NwSuRICu24dvrM1IXGnDZWlJlKlW95EC+SPo20Twe/LaEQXQhXOR9aarlB4qhK
 sTXBJrC07gVzybQScYLsGcsoomqtKF4+wVBdlVvBZI5i0Q/SefI5fDjOHgV2UAlMIK/HMy3nA
 eOWzAJVOff6EbDDNit/wWmzFpTAPWwmXf8JR7Qi0WLoItj4dIL/QV7OK97dyfXZEsIH9wApc6
 jLftlSaj2hhNCVm2DSmEgP8GKLqKHI4GxO5tkNrjsP92xCIzKzI+Msc5CpwcCOXngBUyDbtCF
 Cs/OnbkkuLrTCUMLdKOuknHuB3EsWN8Xxfu2rX2DxvcJfyFO2qmwwnCFe8IqjALk2+O04w8vG
 y6d8LqljKSD7BsYp5h24rpMlEPYi6XsLhyXEg0v/oPlE3KcwqWXeESR09PZHkdXYQzE4ZfmRC
 /IkIWAD5rQ9cVFRE0kAKbmSZmJClunceOzPmaQFolBt9St1QQbh+MvdzQFZDTg/khfXd+88q+
 RHBRg3pIQ6Ogq/+soPq5rV9OkxMiDYUHjt3KlAUc0d/hc74cGVM0OSN+uRezNRkz+yce/tCbz
 JN8SNmGGibbWV/3+FCscnAwJWW320/MBs46kMAa6N/c5nVjEYyyErNGneH44t5ZhW/KS+4xmk
 WUr7hJPNoz+l97IHwllgFwjg7TCT9WJ/jc9YRvg4QJnKErnOgZIHt9QXd477BKrQ7746S6Zx+
 EME0G/GLEZT21b8j8XHg==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [PATCH v6 5/8] ALSA: Avoid using timespec for
	struct snd_rawmidi_status
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

On Tue, Nov 12, 2019 at 5:38 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Tue, 12 Nov 2019 16:16:39 +0100, Arnd Bergmann wrote:
> > +#ifndef __KERNEL__
> >  struct snd_rawmidi_status {
> >       int stream;
> > +     unsigned char pad1[sizeof(time_t) - sizeof(int)];
> >       struct timespec tstamp;         /* Timestamp */
> >       size_t avail;                   /* available bytes */
> >       size_t xruns;                   /* count of overruns since last status (in bytes) */
> >       unsigned char reserved[16];     /* reserved for future use */
> >  };
>
> Can we use union instead of padding?  Something like:
>
> struct snd_rawmidi_status {
>         union {
>                 int stream;
>                 time_t stream_alignment;
>         };
>         struct timespec tstamp;         /* Timestamp */
>         ....

I think this would work most of the time, though I don't feel this is more
readable than the other version.

More importantly, it requires compiling user applications with GNU extensions
(--std=gnu89 or higher) or C11, but not C99, so this could be a problem
for some applications.

If you feel there is a problem with the padding syntax, how about enclosing
it in a typedef like:

typedef struct { char pad[sizeof(time_t) - sizeof(int)]; } __time_pad;

This typedef could be used in several structures from the other patches
as well.

      Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
