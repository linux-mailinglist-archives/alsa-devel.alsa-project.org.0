Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E768E852
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 07:33:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D001C82A;
	Wed,  8 Feb 2023 07:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D001C82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675838013;
	bh=H7mFou3MpPIBRvKR4VbPpHerLTXhHIMaxBUy6vNZAms=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NmuKiPTiE+7s2BFAoktrDJU9BHjv9lP/c+eQHuKXP4AfCj8poGks6QbhDL/dh64ir
	 XG69OtGG5WTZZEQupCjMz7TVpajmUs9dljhpmYyv8ay5zqF5OaMT/Yx2qGp1EZuS1L
	 7rQungrfDMWrogZMpcJUecp6F1QcYYRu+ULwFhr0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBE40F804CC;
	Wed,  8 Feb 2023 07:31:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E387F80525; Wed,  8 Feb 2023 02:32:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2B5BF8051D
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 02:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B5BF8051D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ay2mX2FL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jo71tlA2eEZPdxKjgTvLhMtzKyjxK2QlLMd+t0w/e3Q=; b=ay2mX2FLZ3Pvx6L5UJcyeffPih
	Z2FzC7RnqKsgae3U/fJ+2MREDfNnYcX+7/DIUMs8G3h8JY9UkvYd4HWnOOk7Is6BNTJaTYAZxe1vf
	l8LfWY1qS4pm/xpZ6w6Q4zuQ/rSlOUnCWslbQWOSRIy7DLC8xbsQgRlz+/9U8gmSYKYFTGHng3Won
	9zYe4KLDgG2h5xOK/JslAPD/TMcDxUIDr8Uh+bYJm6gP5/ICWPz84oG5SIr1LjuTibzDMj3s3eZNT
	vAuQJO05IAMM1Vxg5h6AY1cFu3fy6HRqxOeCQZZ0SMxWcVxafZAqAdGTnLRRAF2dInznQN6ckvsDV
	zMkQoO9Q==;
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPZJD-00Dmp1-1J; Wed, 08 Feb 2023 01:31:39 +0000
Message-ID: <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
Date: Tue, 7 Feb 2023 17:31:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christoph Hellwig <hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: 
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 7NDALOOGE22IBOXABPJC3O4SXUZ5WN2N
X-Message-ID-Hash: 7NDALOOGE22IBOXABPJC3O4SXUZ5WN2N
X-Mailman-Approved-At: Wed, 08 Feb 2023 06:31:48 +0000
CC: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NDALOOGE22IBOXABPJC3O4SXUZ5WN2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
> Hello Christoph!
> 
> On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
>> On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
>>> We have had a discussion between multiple people invested in the SuperH port and
>>> I have decided to volunteer as a co-maintainer of the port to support Rich Felker
>>> when he isn't available.
>>
>> So, this still isn't reflected in MAINTAINERS in linux-next.  When
>> do you plan to take over?  What platforms will remain supported and
>> what can we start dropping due to being unused and unmaintained?
> 
> I'm getting everything ready now with Geert's help and I have a probably dumb
> question regarding the MAINTAINERS file change: Shall I just add myself as an
> additional maintainer first or shall I also drop Yoshinori Sato?
> 
> Also, is it desirable to add a "T:" entry for the kernel tree?

Yes, definitely.

thanks.
-- 
~Randy
