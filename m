Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4FF11CA0C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 10:59:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FFAE16B8;
	Thu, 12 Dec 2019 10:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FFAE16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576144755;
	bh=4UKxoN+h+58H8wr0GNg/75BWnJhm0MSTPjRGbp9L7i4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GQodGUH42d4mgzBaK85xOdC/3I2i3utB+I1YTbFhU0pacaATCocm+kmO4TAkPJtrm
	 Uk//tQLjpzfxQ7WHRb39MGWLeyQOE1n2Hf4QlBjDTjQ54yySKo+1raidlAPxhLArss
	 T5usQfvlagxnSfDYCb+dinqcJY9e2yuQgj796T84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97667F8020C;
	Thu, 12 Dec 2019 10:57:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A88EF8020C; Thu, 12 Dec 2019 10:57:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14F97F80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 10:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F97F80139
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MTR6K-1iIKjZ3WX6-00TldT for <alsa-devel@alsa-project.org>; Thu, 12 Dec
 2019 10:57:26 +0100
Received: by mail-qt1-f169.google.com with SMTP id w47so1779099qtk.4
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 01:57:25 -0800 (PST)
X-Gm-Message-State: APjAAAXaE7ZPqKIwAtwj+5CFpTavhRtooIjX9pdfZiTGqouRR1+wkI8z
 jUt18zLrvTGCPUYJk/xpEA+8+XzZ/i19PrvRzZM=
X-Google-Smtp-Source: APXvYqySu7GXnA9SrOroD1q2eVTNcjWP56SoafCFroL7BaN9dVrcc8omb3UCvrZHcQjvG3mzebBDmgSbnzSei1XdhZo=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr6678881qto.304.1576144644683; 
 Thu, 12 Dec 2019 01:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20191211212025.1981822-1-arnd@arndb.de>
 <20191211212025.1981822-7-arnd@arndb.de>
 <0e00090ef6fcf310159d6ce23f2c92f511dd01de.camel@codethink.co.uk>
In-Reply-To: <0e00090ef6fcf310159d6ce23f2c92f511dd01de.camel@codethink.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 12 Dec 2019 10:57:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2-5qNsy0cbxmLYfgwtbdSp4e4XXQ+gAAh0X+Kr1F-4sw@mail.gmail.com>
Message-ID: <CAK8P3a2-5qNsy0cbxmLYfgwtbdSp4e4XXQ+gAAh0X+Kr1F-4sw@mail.gmail.com>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
X-Provags-ID: V03:K1:2/M9okMWxoe1dJFizDSq/WuD9hCKvzgkuVmuiGzu8YeBYDiLXdi
 hl7qxXJjlveIKyPmtHT2W1ic1LkKDnwoD+0aRC+98JNlhS9DBddURB42xbzWNPgWYElSqTv
 sk6wvfO/lzH+b/jDvEX54rcqoCSSe3t1IkGwArtXhVAAsnljCOP9kXWAjh2KFxRPXZPOeQt
 ySp70682ali0Qah4qg1oA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iq5IgIJ3PDw=:WGNwTNdN9Twsl5e5oC2Jfz
 IwADwfB+LaL63EilPL9bt3TOl8cLklSYXf3sdmXIkPfnLbH1hFfduoWSV6pA5VALJ+t4MqwfI
 14BonGHiLpYoV6+aQ1Ug5yjHnVKWGuxhC5gul8VEPSDFhihQuHK7nPYcJmHEdEa8XK7FLgV44
 RCghGN3TOPFwQLU0GkEODoB+n0M47YSMaFpcUABMYyjkmYCBwiSPOlChqOjuoP2W27AZEjTUC
 MkhGSPA0uu96WsxWR6yCDMXcPHnQPXxZ/TOgEMhQ5e4NjqL69xjFR7U3scQkUhBI58Xmh8nmy
 1Lun/q4SK5zGmud2R0oZHxH4siCkt0lKfXwtpW5aW8YTGrX9DFJuOTlgtaA9Zg/vw4jOHcFeR
 UpC6+EBxD28V2mAo3FbZu/Fsb0/Gkumo3GVOtBjELzhZdPD5OtOrv5gWBogVt5pHT0ukhVPym
 O/kfvdDFsSQ/E1NiqgqtjkTNOijF5BQK8s83P4K/j8h9QDyk/5etfpRWyB/HSsGqrbtG/PMuX
 mhOMCkmqVOOsKWNg87uacWaAdTsCEzsLDNRz3vvYsAVUgeXDmfzh4X4G8XPtknr3iYkcZ8i1u
 +uSBdFLLPYvOYYqjnBlNQ61n2wAjFsnt0LHnFMSddItKwPk2HgvxWPcYI/x2PKUqIO9uLqD5x
 zqrt2cOa8lpqzJlD76ES0B0piQMUI868OYLnxKZxKeAPXqGeDmOI89t9cmZudk0OrfZTCI6qH
 KilJMZ3DnHY7fVR7WEW89BL7bd4ybPPvG+d1WneBL1RRgV3dCeryKkCcrk03XSnOW01c8tWI2
 bEEITO0C7zU/XU0wDk5tZv6uA0Ylzfq3UGnDqJiWMRbRpSFLFxtU+Sz45KYhhdHsIhw70wr2X
 MXDffzZp/VeEBmoYus4A==
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

On Thu, Dec 12, 2019 at 1:14 AM Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
>
> On Wed, 2019-12-11 at 22:20 +0100, Arnd Bergmann wrote:
> [...]
> > +static int snd_timer_user_tread(void __user *argp, struct snd_timer_user *tu,
> > +                             unsigned int cmd, bool compat)
> > +{
> > +     int __user *p = argp;
> > +     int xarg, old_tread;
> > +
> > +     if (tu->timeri) /* too late */
> > +             return -EBUSY;
> > +     if (get_user(xarg, p))
> > +             return -EFAULT;
> > +
> > +     old_tread = tu->tread;
> > +
> > +     if (!xarg)
> > +             tu->tread = TREAD_FORMAT_NONE;
> > +     else if (cmd == SNDRV_TIMER_IOCTL_TREAD64 ||
> > +              (IS_ENABLED(CONFIG_64BITS) && !compat))
>
> This needs to check for CONFIG_64BIT not CONFIG_64BITS.

Fixed now, good catch!

> > @@ -2145,14 +2202,34 @@ static ssize_t snd_timer_user_read(struct file *file, char __user *buffer,
> > +             case TREAD_FORMAT_NONE:
> >                       if (copy_to_user(buffer, &tu->queue[qhead],
> >                                        sizeof(struct snd_timer_read)))
> >                               err = -EFAULT;
> > +                     break;
> > +             default:
> > +                     err = -ENOTSUPP;
> [...]
>
> This is not a valid error code for returning to user-space, but this
> case should be impossible so I don't think it matters.

Agreed. Maybe it should also WARN_ON(1), as there getting here
would indicate a bug in the kernel.

    Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
