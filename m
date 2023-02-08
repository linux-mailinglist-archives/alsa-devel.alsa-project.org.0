Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB3A68F141
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 15:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E38827;
	Wed,  8 Feb 2023 15:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E38827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675868014;
	bh=RUfI31Jp44rV1IeXbD4t0AsPLNTznicHOFs5hGw+KFs=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q4RZz7aIlsV2qb1mHo763iW1j83qG8hXx16JLHcNpZO/5k7HASp5R6Nat8DJNbTDn
	 A+UoGBVtZec1zGwHNsEYfXpUUsjLTWg2URyifUXjBeskyxLjEuJXbKCceGkk1iOT14
	 ZewdxILhjzyBqoykAS9EoEteonN8bMYUmyYSH46c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D388F8012B;
	Wed,  8 Feb 2023 15:52:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D317FF80152; Wed,  8 Feb 2023 13:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6765AF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 13:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6765AF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bMMO1+Az
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E1A161698
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 12:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5E1C433D2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675859100;
	bh=RUfI31Jp44rV1IeXbD4t0AsPLNTznicHOFs5hGw+KFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bMMO1+Azhs4Km63qgW7MyIf+xqhtlvG35nq7SJSy2pRcyN1Otm0Ye2NpZm65hUFqw
	 g2UXYyZAG7y/GFHBum+Tqvnc08IW/1rKLeK2jUsXxW7365sg7nfY60Nm/b5ecUvZQ+
	 jq+lxc+dnzzsBOH4xyeBMTDmL0feOmwqVdR28/LMrsSb4zQ7MmlEy1CKADHvAJGQ10
	 xpco4MhgWctFyqW7SPENgukrqaHiImxPZNFmW4rTruJqX80YiWBcJ9RCfx9cgGGxxL
	 w+OZLjdQi4usnRrjDZg5ctNF6esi6dZRhb/3dLkvxKIhjpj2Rv5UGltstIpXEGZNZq
	 KJq9yQDIINrkw==
Received: by mail-ed1-f48.google.com with SMTP id u21so20201902edv.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 04:24:59 -0800 (PST)
X-Gm-Message-State: AO0yUKUnsygzIphUyr7A4nIDurRlfkm0rxpmHTIPyQNMH8cgg4fFV7GB
	+ky0lZYtbVmmPslxQD29mMah20Tm7vOmxQTmX3E=
X-Google-Smtp-Source: 
 AK7set/Q+/uOAbYZFM/jkIz+fISRabx3Hr+/BidGERpWGk7aoFNjh3zSLNUNVVzX/I6kZ5ZONaxFoF5vNNtc7g05RbQ=
X-Received: by 2002:a50:ce0c:0:b0:4aa:a4f7:2304 with SMTP id
 y12-20020a50ce0c000000b004aaa4f72304mr1816736edi.38.1675859098335; Wed, 08
 Feb 2023 04:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
In-Reply-To: 
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Feb 2023 20:24:44 +0800
X-Gmail-Original-Message-ID: 
 <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
Message-ID: 
 <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: chenhuacai@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UX2FRHNYBG4XRGITWKDCJWY5QP7KXQE5
X-Message-ID-Hash: UX2FRHNYBG4XRGITWKDCJWY5QP7KXQE5
X-Mailman-Approved-At: Wed, 08 Feb 2023 14:52:39 +0000
CC: Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arch@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UX2FRHNYBG4XRGITWKDCJWY5QP7KXQE5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Emm, maybe this patch has its chance to be merged now. :)

https://lore.kernel.org/linux-sh/CAAhV-H6siOtVkZpkS4aABejgZCqTwp3TihA0+0HGZ1+mU3XAVA@mail.gmail.com/T/#u

Huacai

On Wed, Feb 8, 2023 at 8:14 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Randy!
>
> On Tue, 2023-02-07 at 17:31 -0800, Randy Dunlap wrote:
> >
> > On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
> > > Hello Christoph!
> > >
> > > On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
> > > > On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
> > > > > We have had a discussion between multiple people invested in the SuperH port and
> > > > > I have decided to volunteer as a co-maintainer of the port to support Rich Felker
> > > > > when he isn't available.
> > > >
> > > > So, this still isn't reflected in MAINTAINERS in linux-next.  When
> > > > do you plan to take over?  What platforms will remain supported and
> > > > what can we start dropping due to being unused and unmaintained?
> > >
> > > I'm getting everything ready now with Geert's help and I have a probably dumb
> > > question regarding the MAINTAINERS file change: Shall I just add myself as an
> > > additional maintainer first or shall I also drop Yoshinori Sato?
> > >
> > > Also, is it desirable to add a "T:" entry for the kernel tree?
> >
> > Yes, definitely.
>
> Geert has suggested to wait with adding a tree source to the entry until I get my
> own kernel.org account. I have enough GPG signatures from multiple kernel developers
> on my GPG key, so I think it shouldn't be too difficult to qualify for an account.
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
