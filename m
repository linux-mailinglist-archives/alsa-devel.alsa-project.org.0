Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233B11E1EA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 11:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21F616EA;
	Fri, 13 Dec 2019 11:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21F616EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576232867;
	bh=5L7yauyh3aXxYODQ7La3EvGKQaJpITBZdfe5zdydnY4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uy8+8XjFyFuOsSjBZkzwBaWHx0c4BPFFHtPyWA5axS9EGuXtLkTBU05SunTCetB2A
	 a61TaQReRR2DRffZY4wnro6G2jzHyg9zbGlCn86C0PHiBOuqoKju1WeWcTR3ZQbB9n
	 n7NC/o8iIYrJ4j2tBfKinaNHNiFrihhcr/E7wu90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E5AF8021E;
	Fri, 13 Dec 2019 11:26:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76111F801F4; Fri, 13 Dec 2019 11:26:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99FFEF800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 11:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99FFEF800AB
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5PRT-1igWxM1ywH-001Sk1 for <alsa-devel@alsa-project.org>; Fri, 13 Dec
 2019 11:25:57 +0100
Received: by mail-qt1-f170.google.com with SMTP id 38so1814416qtb.13
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 02:25:57 -0800 (PST)
X-Gm-Message-State: APjAAAVQbZzc7IP6kMnmw2Otmn52mpEiToaBEKHNmcYkI1gBgVEDc52p
 oOPcChu2OMSctm8kzZOtJouHdOkF/thIbSesm+w=
X-Google-Smtp-Source: APXvYqzQbLZzun4UPMcyYud1qq2XcN6i6bQrSev+tzenclZnUxptcZ8EZKr8KndoQJUpiIybOxbQeNJCn8vGS4FD6jo=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr11551312qte.204.1576232756266; 
 Fri, 13 Dec 2019 02:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <20191211212025.1981822-7-arnd@arndb.de>
 <0e00090ef6fcf310159d6ce23f2c92f511dd01de.camel@codethink.co.uk>
 <CAK8P3a2-5qNsy0cbxmLYfgwtbdSp4e4XXQ+gAAh0X+Kr1F-4sw@mail.gmail.com>
 <b937b99c9843ae5daa3bdf84929b325f05ecab8f.camel@codethink.co.uk>
In-Reply-To: <b937b99c9843ae5daa3bdf84929b325f05ecab8f.camel@codethink.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 Dec 2019 11:25:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2BwA-wnxRPLgLrb9e2HpnrhXXyNyLfn4sOpSOjiJ3oEw@mail.gmail.com>
Message-ID: <CAK8P3a2BwA-wnxRPLgLrb9e2HpnrhXXyNyLfn4sOpSOjiJ3oEw@mail.gmail.com>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
X-Provags-ID: V03:K1:tSFlHh/bUHJGyCZOIXacgcz0Yb0i3PCtcY/Dgjzweltx7E4qAAU
 At8YLjURAs7MIx0oCwfRCSQ03AMiiFQv0/9bc5U4pgJT7ejQAOdEZL64Basx8lefWihAxyE
 cHDSQGBv0mK+ZFWTRcHZUOdYWssSrRppHzbYRXtgDr+3zQNkC0NCmwJZWR+3sDUo+fFKgHw
 RM7W43MZuMLw16rn9t8sA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X6qdoxPEOZM=:F1o1ur3+ffcE8k8pbLMrSG
 ctKIIWz3+HAY8+ZfrkkXJK6y4eSWOacQ+/L84of+sRanGh6zXn9rNsendy1DoSLSeqpU5cNEm
 nSGZ/OspzHmNU/JZhFoMf1ISSFk00pxQO+YCOpHsuQNmQBV0V+V52W8fojnyglsDYu+BEZvWA
 fnFOnBS9PMv3I1AApLYiOSGfHnI1+PS/imMF7GClpQKV15D3Mn8HMGzJIy8G1NbeQT2VVzgXr
 STrsNJ4iL3gJ8ybLbfXjqtj2aYJWMAJ60HttOcFNJ88dq7vEEwRiUZlyGmZkRaqnk0YiWr+Sx
 1s2QAPqsEEA4oW+3zr8zHd3DBf5jUNm45bcdrISEUzvsMzeQcYTwtr2uF6k0ffdPwn39vVyc1
 bTJCVqH+4fScA5STWO/IIbP7nW8jJAQLQlRKZDjuMboOxLbWVLVnQrJ7OsoTQNNj6cbg/ttmN
 0w6DvqDlEuFHx+/4AXQmO2hlfZluWD07fBSMup9xFmAgzHm1Ak6ofOz0wGDmlbX59ScSd9bEl
 Na2+2l79eC45cGn1hkHC3bng4tXyhtn8rikNvI8m8yB3TFwOQz5eNvlo7fEZ9ykUCuvUrCkWd
 l2nsW4W+JbJDvTNg7MyNIO0fQIpiAUDfg5zUZbJJ1VHf4Ysw3ItFQD1mXWMaRn7VkqSc8A7Vn
 Nx37RUsKri4Qqei7+rO4GVFquCRYka7MZE56lXcoKmD7lQCguxmFhrn5BUw6msLy7jwICvLDS
 7EpgON1bQ7MsO5Hn2zn3iJ7kwjZEVxXnGVPBeSsvXBZjlDAVTel5xX1TbFVZ2e+nfPKTLL1g9
 5uUuqTYQYG78qHpIoPlgV1IX6L02Z5qpcE2jevXbwEBp+tlvVjliB+6zzirpOwEdBsvAMmTQY
 o7iYfIho0VlwozIPoRBA==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [Y2038] [PATCH v7 6/9] ALSA: Avoid using timespec
	for struct snd_timer_tread
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

On Thu, Dec 12, 2019 at 3:27 PM Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
> On Thu, 2019-12-12 at 10:57 +0100, Arnd Bergmann wrote:
> > On Thu, Dec 12, 2019 at 1:14 AM Ben Hutchings
> > <ben.hutchings@codethink.co.uk> wrote:
> > > On Wed, 2019-12-11 at 22:20 +0100, Arnd Bergmann wrote:
> > > > @@ -2145,14 +2202,34 @@ static ssize_t snd_timer_user_read(struct file *file, char __user *buffer,
> > > > +             case TREAD_FORMAT_NONE:
> > > >                       if (copy_to_user(buffer, &tu->queue[qhead],
> > > >                                        sizeof(struct snd_timer_read)))
> > > >                               err = -EFAULT;
> > > > +                     break;
> > > > +             default:
> > > > +                     err = -ENOTSUPP;
> > > [...]
> > >
> > > This is not a valid error code for returning to user-space, but this
> > > case should be impossible so I don't think it matters.
> >
> > Agreed. Maybe it should also WARN_ON(1), as there getting here
> > would indicate a bug in the kernel.
>
> Yes, WARN_ON() or WARN_ON_ONCE() would make sense.

This is what I added now:

--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -2161,6 +2161,7 @@ static ssize_t snd_timer_user_read(struct file
*file, char __user *buffer,
                unit = sizeof(struct snd_timer_read);
                break;
        default:
+               WARN_ONCE(1, "Corrupt snd_timer_user\n");
                return -ENOTSUPP;
        }

         Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
