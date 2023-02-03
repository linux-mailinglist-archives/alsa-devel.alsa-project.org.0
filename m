Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDC68BE64
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:37:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDD01DC;
	Mon,  6 Feb 2023 14:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDD01DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690661;
	bh=fBB/NWvlvHUroREOHDw6YLLGYRCM5i5djYUlj6RNAmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FphS7U/MH6jxeffh2OWF4T6GzaI7Z8YblJn9Jz6Ge4cM84tEIKfo4Knh+KDfcpJ3m
	 0K5cVSKEH3mS6+RPgzp0w1ewRCEYOq+SlT0UGEdrWvXYVTg9R3/dBSH2thMxkec9rT
	 xrgJ4/gB0hFgWRVv6IlXFjUEXJZIF5J6xvrejNlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4642F8055C;
	Mon,  6 Feb 2023 14:35:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D93F80022; Fri,  3 Feb 2023 17:05:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2AADF80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 17:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2AADF80022
Received: by mail-qt1-f180.google.com with SMTP id bb40so5956182qtb.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 08:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7wIYdPVdo9w8wJeFawgcWpGlCHgpXqP0aU2proD/z4A=;
 b=R2r3y8mqWi+a60pjFCjxNGBg3YcqGQuozGGOxDukEWCtG9kgKVwvO2meyZadDgieqg
 JfdnDPWMopypDjzoFT3s4qc0ASb/7WHYl1MNAIgMJIIPU6rTWdPwy3codLoeOVriqmsi
 2Z6GBd6XEV86qzdd6aOpRjrXkjVuJr2Xl9PloOVIkRm3rN6HXvfvSOIGsAiumhFeSvoY
 TNVPG1rJN8bRBSf/LnW6gRz3cOeGJnwV04rjjgrtXkrgreBedD6lOj0+bf+XE6sK23Xr
 JmbuU7zAxLggKHU3A6Js0Q2b0aCZMeKuTWujXjPd1QQxKdMNmsEgOaKmo5JOG4SDHqqB
 Ey3A==
X-Gm-Message-State: AO0yUKVdFnEkOW8RCIe9lxtpJpQGcWWNDC+fEqcibvISxr3shCMBjzBg
 yg+tj7X3mrdUKaMGZBmo/oQWOqo2Iq6TEQ==
X-Google-Smtp-Source: AK7set8e0siRrI8Mo+2w/iAWHXlCdY7aAGYXx0X+Wx135AoDkaWTRoV7pcIAvu/Kvus84HbCmKvZ8w==
X-Received: by 2002:ac8:5c43:0:b0:3b8:6c97:e5de with SMTP id
 j3-20020ac85c43000000b003b86c97e5demr21413868qtj.41.1675440302644; 
 Fri, 03 Feb 2023 08:05:02 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05620a270900b0071df8b60681sm2044463qkp.94.2023.02.03.08.05.01
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 08:05:02 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id g2so6781314ybk.8
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 08:05:01 -0800 (PST)
X-Received: by 2002:a5b:941:0:b0:865:e214:f4e3 with SMTP id
 x1-20020a5b0941000000b00865e214f4e3mr352487ybq.604.1675440301482; Fri, 03 Feb
 2023 08:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de>
 <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
 <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
 <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
In-Reply-To: <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 17:04:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ3XOBewDoU8umAHc6b83hJQge5xjY3Cxx03AvoiR7iQ@mail.gmail.com>
Message-ID: <CAMuHMdWJ3XOBewDoU8umAHc6b83hJQge5xjY3Cxx03AvoiR7iQ@mail.gmail.com>
Subject: Re: remove arch/sh
To: Randy Dunlap <rdunlap@infradead.org>
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
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Randy,

On Fri, Feb 3, 2023 at 4:57 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> Is this "sh64" still accurate and applicable? from Documentation/kbuild/kbuild.rst:
>
> But some architectures such as x86 and sparc have aliases.
>
> - x86: i386 for 32 bit, x86_64 for 64 bit
> - sh: sh for 32 bit, sh64 for 64 bit <<<<<<<<<<<<<<<
> - sparc: sparc32 for 32 bit, sparc64 for 64 bit

No, support for sh64 was removed in commit 37744feebc086908
("sh: remove sh5 support") in v5.8.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
