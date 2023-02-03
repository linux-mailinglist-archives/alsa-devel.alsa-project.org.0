Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7129B68BE5F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:36:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868551EB;
	Mon,  6 Feb 2023 14:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868551EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690611;
	bh=UCEprBJ1CzjNtbwWOZDsh9YxKCj8n+lShBbADcZ3r/c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AMasM39pAXQH8gPVIyz5VxQNZSXioR3dXWYYwo5fUCjP0Sar4nOMAxPEMzWJFQCIy
	 G5xI03KtrMRz3S3j51ChNIne1ibh2XaXw24b5kP7djnXhq0xE3YcJnPwaGzK9Yq+ZL
	 nLUzZHaxNq/Oq8ZCM+hLOXpIjkD3uJoOP+PJJfl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D962FF80538;
	Mon,  6 Feb 2023 14:35:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E10F8032B; Fri,  3 Feb 2023 11:33:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49A74F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 11:33:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A74F80169
Received: by mail-qt1-f169.google.com with SMTP id m26so4904241qtp.9
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 02:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7A9k4QSf8av6qzMk9PJKNV90s0Q4PXBSAXyaJlyJVU8=;
 b=uart23rdDIQoQSN/Ei9ybQFBXKA4B6PPZQw6hujPHz2DTBZOjZHQ9LnhYcY5D4IoKT
 dtYScXWlnbrkOv3mMqd7dSyeMp9uoJBSG2GZOUvWM/zG6zR++hnjhHBZlzacitP31q9x
 WCZm/N7o4LWy2ch2gulEO5dpaWyLS9ATPu7ARIpYyFsvUmKix7I3vH7QHhAZXyvkBIHN
 /kGyXIj+wg8zMPlhYc7NWb6leI1j2tChafGfY6/qBjhG25kkSFkViCdLn49ltgEyWh14
 k2pzYTT3SZQ1lilRS1kXAYyenA7NyJ7tujfezCG7T76cTG19YqeopeQ2+5iikRHrAW0L
 Nglw==
X-Gm-Message-State: AO0yUKUfcQ559griLDDLctTqtSIxrg7qNrjxUeHp5niM3xzBkToHsqxU
 LZMkyLt4JgqaiM4ScAHzV4OnfGiVcgEx5g==
X-Google-Smtp-Source: AK7set8kJtBpRmgfn8QtMyLGlCFdT1f6P7ZQdeim1NLTnZLay5nUMdH/NNWyPOU8A01OfJXpW5Yqzw==
X-Received: by 2002:ac8:5849:0:b0:3ae:4e47:52d7 with SMTP id
 h9-20020ac85849000000b003ae4e4752d7mr15729298qth.38.1675420406401; 
 Fri, 03 Feb 2023 02:33:26 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05622a1a9a00b003b62e8b77e7sm1325192qtc.68.2023.02.03.02.33.25
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:33:25 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id g2so5698904ybk.8
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 02:33:25 -0800 (PST)
X-Received: by 2002:a25:9c83:0:b0:7bf:d201:60cb with SMTP id
 y3-20020a259c83000000b007bfd20160cbmr900933ybo.365.1675420405273; Fri, 03 Feb
 2023 02:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de>
 <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
In-Reply-To: <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 11:33:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
Message-ID: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:03 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Adrian,

On Fri, Feb 3, 2023 at 11:29 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2023-02-03 at 09:30 +0100, Christoph Hellwig wrote:
> > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
> > > Since this is my very first time stepping up as a kernel maintainer, I was hoping
> > > to get some pointers on what to do to make this happen.
> > >
> > > So far, we have set up a new kernel tree and I have set up a local development and
> > > test environment for SH kernels using my SH7785LCR board as the target platform.
> > >
> > > Do I just need to send a patch asking to change the corresponding entry in the
> > > MAINTAINERS file?
> >
> > I'm not sure a there is a document, but:
> >
> >  - add the MAINTAINERS change to your tree
> >  - ask Stephen to get your tree included in linux-next
> >
> > then eventually send a pull request to Linus with all of that.  Make
> > sure it's been in linux-next for a while.
>
> OK, thanks for the pointers! Will try to get this done by next week.
>
> We're still discussing among SuperH developer community whether there will be a second
> maintainer, so please bear with us a few more days. I will collect patches in the
> meantime.

Thanks a lot!

If you need any help with process, setup, ... don't hesitate to ask
(on e.g. #renesas-soc on Libera).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
