Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9805132697
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 13:40:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D151834;
	Tue,  7 Jan 2020 13:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D151834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578400857;
	bh=4JXJbjVnw1O07kO1D1JLhkdbknmTeLAK8Iu49pkj8Kk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gP2FtXjBa7mNHSvRDhBFT/yrPWMune280DFenmrx2Gga+H2b7idPulpXhVehd9loQ
	 c10XkZeVYpaooqczGMxQToohORIefD8cabs7A0CxuGWHp94U6S86TZJCFojulH9w54
	 +kMTC2P2qT63fYiU77NvlshAK7Vt2kdQudfWHnTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34483F801EB;
	Tue,  7 Jan 2020 13:39:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E654F8014A; Tue,  7 Jan 2020 13:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00B78F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 13:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00B78F80116
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MPXMa-1j2T6n2xpS-00MY5G for <alsa-devel@alsa-project.org>; Tue, 07 Jan
 2020 13:39:07 +0100
Received: by mail-qk1-f177.google.com with SMTP id z76so42822751qka.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 04:39:07 -0800 (PST)
X-Gm-Message-State: APjAAAVfuPFwSob5vY9OCAoqiYbjr5l/a5h/eu8F5zyAfmpVeAgUM/Vn
 TZFwqnlrzVt7VodS0KVGcYS+G25+F8aClHrL1TQ=
X-Google-Smtp-Source: APXvYqxj7f+t9CP5sp/36VUBLMUQTa+e3WyQMflR8nTwCW8t9pJYpNTyr+4ZiOuV0aweiM6aI/SDnWdyvZrQA34+sMU=
X-Received: by 2002:a05:620a:cef:: with SMTP id
 c15mr72172409qkj.352.1578400746409; 
 Tue, 07 Jan 2020 04:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20191218163701.171914-1-arnd@arndb.de>
 <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
 <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
 <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com>
In-Reply-To: <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 13:38:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
Message-ID: <CAK8P3a12NievRVGgcyuPaFC3eKr9c7Y3KiTnFxEaLkDyzCCj1Q@mail.gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
X-Provags-ID: V03:K1:FRqZeW1WvdIkNudEizoFtlZSfa4mSj8Hi+PnQaFCUvXN04kcqYp
 K7lnsKYZfKbV6xTJXkoN6LLd7ZWvLkNCBNUYlg1RCmxgOJpqGKOZfejTqu/VL0+UwE7aXsN
 /2M/zexy7VWC9OTrgurauKKHNWRff3Ex3dhYg+K0RXY3JYWroBcPhDMDTLI9W0CxDACQsWZ
 ML6MTzbiga0kQSxUtDnpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kCYn5N9Og7c=:hna0dXvq3H1M4IZCzMA0yS
 UUPIejReGRKT6HeAX8I7ol3VZSEnpeDXHMA5keDPEQ2HAo1NZ3H2tuouA1bUJDZurncjxUujv
 QaVJBsJhi2549meiN/3ImqvWWnPn3+KOXMLUCYQdKmlE3WXx1tFPR+cYRGs9DPf0g2BkkA90u
 VlVb5KXkiqpmBildvtWiCvihgZtN+bUOA/T+d/oi6sGSda/5ThvlCauLgdGYkR/oeBQKiCepS
 fc/Xh8Sq32ientscwszM+yv+ySk/U/ejiX0iUxBy8lP3UH4oLodC8krYa2k4PVBuOLeenMk0m
 KKJb33P1Lq1TSND3Q3/qMTWw/6V+hc4+O2R8qInJMzQU3kKGVu98k+qEvx2ckVusWqoS/IYFM
 pP13ckpVFH4delZ/+gxJzIDHfc+fudEz3gPVYaLXwIMpyaD+/NorjMbWoAJmGjxqRjMiw5Zv6
 54QJUqiQs0RiX2zvY4RRKspaKCy3lhBbeyn6xcpS+G0HLvkS3mfhxM74D5vSWNNK8EZmD31CS
 C7XeuZ7qWppCMeZKoedMiAldJ8wgVP+V0LMrgpsOgyJFfYqGrrPORaBwLEwLqcWoc8ov+geFW
 2m5jIgvyd4s3e7z7O+Rxo9xY7w18FlWS5EYINzmJIBgKgVsGRgjcber5bZOTzBYXPBxt7YSOT
 k9FG55mngWuzHCSoin25ofKiqDNbENjbZ6Pt+MOMuW5H52Ld6ttlNL2b6wFVi2KyGtKPA/gHR
 viBplxN3MgkFgfONdMVWfcIqurSQWlk780F8Of+QFVlszTIZRxekbR5AVKSoOlaEwD9EmdMrK
 47vB9LFDe0P9Tb41OusRRTdT0OvXUUa2bCxzMOlDS8brdCEPAtv2NJ2ogngSKbpYN+/Osu4CS
 NhcRtfBqGwbz0jnoJbKw==
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] pinctrl: lochnagar: select GPIOLIB
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

On Tue, Jan 7, 2020 at 12:58 PM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
> On 07/01/2020 10:39, Arnd Bergmann wrote:
> > On Tue, Jan 7, 2020 at 10:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >> On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
> >>> subsystem, or if there are still good reasons for leaving it disabled
> >>> on any machine that uses CONFIG_PINCTRL.
> >>
> >> Hm that is a tricky question, they almost always come in pair but are
> >> technically speaking separate subsystems.
> >
> > I think there are a number of use cases for GPIOLIB drivers without PINCTRL, but
> > are there any examples of the reverse?
>
> You could have muxable pins that aren't gpios. For example muxing
> between i2c/spi signals. So a pinctrl driver doesn't imply gpio.

I understand that this is the case in theory, but what I was wondering about
is whether there are any such users, or at least any that also want to
save a few kilobytes of kernel size for gpiolib.

          Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
