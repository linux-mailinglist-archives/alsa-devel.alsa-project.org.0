Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2A66AFC2
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:52:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E19FAAC9C;
	Sun, 15 Jan 2023 08:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E19FAAC9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769054;
	bh=xbDVZSdJA160IUTI1qDinvJt/KERuVEMyP/cUGaXyoc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i5t3/vj8YFLqZguMl22evN1UdbAarxb24bqYTeaAI9Ubw4U5ZJGFkQqhcfLxYQxxn
	 2DqulBs+oHaGEM/Fknu/jB1hmB8nG7IPxcAWtuK6TZxTusg57RD0R4io9WxlCR6qCC
	 3xc8O2f2N+r83uZTs/SdmkxP8GMfOlKBYGfusmeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AA9DF80557;
	Sun, 15 Jan 2023 08:48:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A821F8030F; Fri, 13 Jan 2023 09:26:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC687F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC687F8016D
Received: by mail-qv1-f43.google.com with SMTP id o17so14392546qvn.4
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IGwwX1FWc34aVprY9nV8lSjSaarIXrtB/QPl3dMA44o=;
 b=A8wuR/4K2O211tFH2w2qZdyo3C/ikjUYiiP6IoMKko3rPPe0fTFfq0YE1V4egJoNAT
 Iu2StZ6Q36A/NtlouhtZ2ihY5Kru6T7qvAsFNSTmeH8Ar8z8700I7dTAolfqE7APzjFb
 1X/CEJ2zWZd/yQEvf005z/pAIHssj+OPzU0DdStV6yvhgomWCpsOpeu6nYJ1lhSZvckb
 0JIzkOm89DyEa6YTlAbFgrT/At3WVPUHdDTErrKO6qWMpFB75paYqfH0Y5LRP9PPnwFd
 MSlop0u4BPC1zZ+dD2fWss4aNfcKO4tLuYcZHVBsZI9AulWBcPJNO88WDoQTc6g7ymph
 rZsw==
X-Gm-Message-State: AFqh2kpZfgP47N3Fx4w/ibupBPTOPqFU0jXPjrjN9XGUSyA8SCf9GSZp
 Bn0/Wwbd1crJuJYdbVEU+ImrjKHNATWXzQ==
X-Google-Smtp-Source: AMrXdXuiIprA/9Xo4KmUCDBrE6BpgxZ2Nm3lKzDQJpIQX4y9pag211rQT0YRjVaaRd5j2AJRXqqNZg==
X-Received: by 2002:a05:6214:4116:b0:532:299d:99c9 with SMTP id
 kc22-20020a056214411600b00532299d99c9mr16922818qvb.1.1673598395890; 
 Fri, 13 Jan 2023 00:26:35 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 x4-20020a05620a258400b006fca1691425sm12330646qko.63.2023.01.13.00.26.35
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:26:35 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id p188so21571791yba.5
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:26:35 -0800 (PST)
X-Received: by 2002:a25:7:0:b0:7c1:b2e9:7e71 with SMTP id
 7-20020a250007000000b007c1b2e97e71mr830819yba.604.1673598394939; 
 Fri, 13 Jan 2023 00:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
In-Reply-To: <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:26:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
Message-ID: <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:18 +0100
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

On Fri, Jan 13, 2023 at 9:10 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/13/23 07:23, Christoph Hellwig wrote:
> > arch/sh has been a long drag because it supports a lot of SOCs, and most
> > of them haven't even been converted to device tree infrastructure.  These
> > SOCs are generally obsolete as well, and all of the support has been barely
> > maintained for almost 10 years, and not at all for more than 1 year.
> >
> > Drop arch/sh and everything that depends on it.
>
> I'm still maintaining and using this port in Debian.
>
> It's a bit disappointing that people keep hammering on it. It works fine for me.

Indeed.  The main issue is not the lack of people sending patches and
fixes, but those patches never being applied by the maintainers.
Perhaps someone is willing to stand up to take over maintainership?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
