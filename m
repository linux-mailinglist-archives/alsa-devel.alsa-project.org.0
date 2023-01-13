Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27F66AFC5
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:52:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2851B3743;
	Sun, 15 Jan 2023 08:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2851B3743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769104;
	bh=NklCLtbWc5WyOgonvZKTPSjAxeAHnIbpUkTWUUnWx+Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eZnWXoqHazCyrkyBZLymx86xzpcqZ/G3bmzF3aMHNRbTXvTGtMfBGWw8Idn7dnt7v
	 XXgDK+3FQXmSF580KwM3Y2EnqDSo4X8v/kAa2uA2L2XLpYCBvotT12UBK2bZhVt5op
	 xMsMt7bx6fBhz6bA4JQIM+nP5uo038pFnjyTPO+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29884F8057C;
	Sun, 15 Jan 2023 08:48:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB548F803DC; Fri, 13 Jan 2023 20:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02E91F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 20:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02E91F8016D
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pGPMg-003M27-Uf; Fri, 13 Jan 2023 20:05:22 +0100
Received: from p57ae5361.dip0.t-ipconnect.de ([87.174.83.97]
 helo=[192.168.178.35]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pGPMg-000Hn8-Jc; Fri, 13 Jan 2023 20:05:22 +0100
Message-ID: <fe09d811-e290-821d-ec8b-75936b6583c2@physik.fu-berlin.de>
Date: Fri, 13 Jan 2023 20:05:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: remove arch/sh
Content-Language: en-US
To: Rob Landley <rob@landley.net>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
 <142532fb-5997-bdc1-0811-a80ae33f4ba4@physik.fu-berlin.de>
 <6891afb6-4190-6a52-0319-745b3f138d97@landley.net>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <6891afb6-4190-6a52-0319-745b3f138d97@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.174.83.97
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

Hi Rob!

On 1/13/23 20:11, Rob Landley wrote:
>> I actually would be willing to do it but I'm a bit hesitant as I'm not 100%
>> sure my skills are sufficient. Maybe if someone can assist me?
> 
> My skills aren't sufficient and I dunno how much time I have, but I can
> certainly assist. I test sh4 regularlyish and it's in the list of architectures
> I ship binaries and tiny VM images for, just refreshed tuesday:
> 
> https://landley.net/toybox/downloads/binaries/0.8.9/
> https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/
> 
> (The sh2eb isn't a VM, it's a physical board I have here...)
> 
> There is definitely interest in this architecture. I'm aware Rich hasn't been
> the most responsive maintainer. (I'm told he's on vacation with his family at
> the moment, according to the text I got about this issue from the J-core
> hardware guys in Japan.)

Well, maybe we can just give it a try together ...

> The main reason we haven't converted everything to device tree is we only have
> access to test hardware for a subset of the boards. Pruning the list of
> supported boards and converting the rest to device tree might make sense. We can
> always add/convert boards back later...

There is a patch by Yoshinori Sato which adds device tree support to SH. Maybe we
can revive it.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

