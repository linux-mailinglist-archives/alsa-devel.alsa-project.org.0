Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6CF6693BC
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 11:08:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA91BA61C;
	Fri, 13 Jan 2023 11:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA91BA61C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673604484;
	bh=pevdLgFV+zlgt+q5J1/S+yY7RevcvWPre69UMNcS/q4=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Frvgc2xb7FQw1lULHXviIBBmo2SnH0x18BsUT5U1xWuvbvVTUyiia93bY72cIEtz/
	 FlUX6Rn66oaBht+QF6JiubzMVAmAP4SWK+guBINTST3H78VupfXyScckTmqT4Qnob6
	 9o/qKPcm7K9N4n8qFio2gvpNAlLc/ImfHCeVeCpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29439F8030F;
	Fri, 13 Jan 2023 11:07:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF062F8030F; Fri, 13 Jan 2023 11:07:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB256F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 11:06:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB256F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de
 header.a=rsa-sha256 header.s=fm2 header.b=jQa0HDmP; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=T9tKOcHl
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 59F1E2B066ED;
 Fri, 13 Jan 2023 05:06:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 13 Jan 2023 05:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1673604412; x=1673611612; bh=wiGd1poFqy
 c19NDgfhWxoziS+5a2ezYepeVzBSacqw8=; b=jQa0HDmPBmL/FfJL+hgRmPsB40
 Y3mC3xChdI36TABN4RG5b4ucaLsZc6+hC+19/zCIm4A4ie1QOoF7GdEwpLDXWLgg
 YS7KkbMyef4z8Yilol0xjO/jcY2PDSzSOyaObnKUz9YejiKar9NRQ/48gMheN8SP
 L9ydOdhClMFMN+laVtMxeJLlISQdpKBcfrhR3HNQLngArqhNZXfmj7B7QaV3Yjlc
 q1pbz3p93X/orY60g/G7bg2Tiz9gOW8CeW5RhiSUeYXFN/oIPHXLd05ewSyQoczy
 YcvZ76uBqZ6njLqUwdbbXb3on9pD3cxdKgfVZ0av7GSfMv1N46xG/nNSra4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673604412; x=1673611612; bh=wiGd1poFqyc19NDgfhWxoziS+5a2
 ezYepeVzBSacqw8=; b=T9tKOcHloTqEvCQgyITgoeWHiCG023yZCoHB8GCNjjun
 JWtWHvJqinTMKxNzOHfWFkde1UNzFYeNjWL4OYuUevGP5ZiDtpX0SAgeRoVmsRqT
 4s4imE9aYV/f9Pvbl/xyCzDnDswOyuD8ceeVeSEppPmXeTdO2UYN2NW+SPkjkx6z
 7AGNecW4IwYIR8h6khoClacES7xN1wBX6oY0XpQ9E/MHHJqDRpFMe5RHSjqUpFHQ
 972R/sDnO/VHBlJ/MZtdHhD4RBw3rwTM6MhJr5iT0G2mUNkzC1EVZ0kt797d6W2S
 fBdJ8aBi3uu6VLi/i8mbcHwOUByNIvAxQvGBru7fCg==
X-ME-Sender: <xms:Oy3BY2x8u8jGs5oav_hETNuy2fGaBGNB7nGV00CwtVI39ajIhtTDrA>
 <xme:Oy3BYyQeI43uOCS5CK49RFBPrQXLvgoH7jyxA1EWEhaXS1U_GFSXnUcOsyByJ4HxX
 7ebslCPuxwL7F72QUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Oy3BY4WFmJ1Wzov0EgMi6qcJljjNqlgJoW7YxZYtni3we9ZcuZJC0Q>
 <xmx:Oy3BY8jDZdOmomBzdPQYugeTKvRs2JAmwJR9qFQ78gYn6oU0QQd3og>
 <xmx:Oy3BY4DQ3Zg11gEbb70JkOCpYbMnoYHqWtdB8svYNbX-CHCrZb2sRA>
 <xmx:PC3BYzV0__Pe1Lv9Yq1qvCTC7InwXhC6SGzQNcMq4ULKQsDh2lBDrgxrUdU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B041DB60086; Fri, 13 Jan 2023 05:06:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <d9c2f760-283b-483c-8512-fdd2c372f26c@app.fastmail.com>
In-Reply-To: <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-12-hch@lst.de>
 <CAMuHMdXYt4dNHUDsTnPa-RP+sdK=35nNa9xQzMChwK54qO44mA@mail.gmail.com>
Date: Fri, 13 Jan 2023 11:06:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Christoph Hellwig" <hch@lst.de>
Subject: Re: [PATCH 11/22] mtd/nand: remove sh_flctl
Content-Type: text/plain
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
 Linux-Arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Netdev <netdev@vger.kernel.org>, dmaengine@vger.kernel.org,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 13, 2023, at 09:30, Geert Uytterhoeven wrote:
> On Fri, Jan 13, 2023 at 7:24 AM Christoph Hellwig <hch@lst.de> wrote:
>> Now that arch/sh is removed this driver is dead code.
>
> FTR, this hardware block is also present on the ARM-based
> SH-Mobile AG5 and R-Mobile A1 SoCs.
> Again, no DT support.

I would generally consider drivers dead when they have no DT support
and no platform in the upstream kernel registering the corresponding
device.

If anyone still uses this driver on SH-Mobile or R-Mobile, they
have clearly given up on upstreaming their patches by now, and
they can carry the burden of maintaining the driver out of tree,
or re-submit a working version.

    Arnd
