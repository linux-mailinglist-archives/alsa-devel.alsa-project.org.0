Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7226A4206
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 13:50:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D84C829;
	Mon, 27 Feb 2023 13:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D84C829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677502222;
	bh=bjNcivIuHHwjV31GD/BV21kteFHxvYdKxS6iCSjhZSU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=apz2Ls6m5+Tp0W08ZNKrWHVkUjACECa26do7LELsGr/wxuXWmJAXFeIjexMZXqKlO
	 Ni6JdlxJIjnJ96oDsJoKtvJOyXo7vyrruDWlF47TITZHb0j1PqKnDW2XseD73DWtyu
	 4d9xabYYZWcNwAyDTmgwF79V3ZcO3AXxMsAvW0Co=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FA7F802BE;
	Mon, 27 Feb 2023 13:49:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA0F0F8049C; Mon, 27 Feb 2023 13:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CFD6F800FA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 13:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CFD6F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=eCmMQpmz;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=LMKo8sKk
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A821C5C010C;
	Mon, 27 Feb 2023 07:49:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 27 Feb 2023 07:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1677502155; x=1677588555; bh=Eq
	S+idSS171sl5ym4IciX/DeVIr0POofqgdNAlp+/BA=; b=eCmMQpmzY3R58t6Q23
	6py5de8w/F9GS+89rLtnTUlRUrMvS0gHKEiWD/AP4PmqIIYHLaoOT5Jy5KmJjDhZ
	pz0XqlfK+iwAUdcP5p2OQDRpOmzNi8Oi+wDzfg2O4rjvSR8EbRAm5ahMrQGpoejT
	M5sUI9irfO/WUqiBKxTi2JLcTMX10xHC7/tRqyX3UF9O9pK/V9amZ2vQGXmlg3Jv
	xQhlud8gQ2LVmpxfEypjL0zv/v1ISTzA5LmNCZGlaOYgUrvpwoHOln1ZVJCYRPQj
	CNBPiqFU4bD7yXP9pg3y2UpJQiET3hbg46Uxr13+4rH4PObgsHtv7hNOniKOuMWZ
	hHFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677502155; x=1677588555; bh=EqS+idSS171sl5ym4IciX/DeVIr0
	POofqgdNAlp+/BA=; b=LMKo8sKk7QfAYAO/BQT7tJdHBbybDDpdNoZQ14kWO2l1
	7UzXWeJbI65bGRuawLwLtgcoVafQnkqljVdsM6raJ6rgSxkCq/4aeqfciMJfQhQc
	aBKE4Y7UFPyt+GwxwQOmGrcSvoNIjer2el4tpEPRirIe1uMNuK7FdcwU0h+S76C3
	5uz9DgkriGoT7VIBekLCI4j1fZr3w2hQjeN8Aic5hoimF/xMDtj45a8CxT53cv8y
	77Ajw2+n20fYaWxds3BOtmAJMRW5IherfntOnz04K88pvCMKPA2FOufZVhHlGVHr
	McUHIIEUctTfQptW69wlP6cGvKbBKQQLQD5rV9UDLg==
X-ME-Sender: <xms:y6b8Y7tLm_tGyaojFrGUycOSgnehDFmBMLJSfDRrRjIOFFK5SzyUcQ>
    <xme:y6b8Y8dcg-mAcN-SzfDhxe0oUYCn3YsaPyt6NooBb7qIXzTAi5VKiWdGzjXbsZfQM
    oYhQi-SHTH4M1jlWfA>
X-ME-Received: 
 <xmr:y6b8Y-yiHYP9bTeK4AvdNvau1opou0-oj6FmcMwsFCnMsy_2Vyn9hxwVuIVLsRJJGAXo8ufYdD_czULd1CzG8iHsZwQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeehhffhte
    etgfekvdeiueffveevueeftdelhfejieeitedvleeftdfgfeeuudekueenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:y6b8Y6PScZK-cYHAu8AE8ufjZOD-EPd4cRRH5xl1IH8cWrc-NCSEyg>
    <xmx:y6b8Y7_lPGLHAIsaytJnHe-WGfyCAYifAr7r4UUO8LxeoVmZpwC-9Q>
    <xmx:y6b8Y6UIUnmfWJI1aAx2iSu5Yhcw-Dfz_lAjGWAE88Za28odWficOw>
    <xmx:y6b8Y9JL8Q5yBXHKGKcQIG2-g5CNrrBBYhb-09jITiRYC4fNF5UOkw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 07:49:14 -0500 (EST)
Date: Mon, 27 Feb 2023 21:49:11 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [bug report] firewire: cdev: obsolete NULL check to detect IEC
 61883-1 FCP region
Message-ID: <Y/ymx6WZIAlrtjLc@workstation>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
References: <Y/yOy6Ddz1263Zln@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/yOy6Ddz1263Zln@kili>
Message-ID-Hash: C5CXPTTJ5BWF4IE3WWCFRJW4FR7SUDB3
X-Message-ID-Hash: C5CXPTTJ5BWF4IE3WWCFRJW4FR7SUDB3
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5CXPTTJ5BWF4IE3WWCFRJW4FR7SUDB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,
(C.C.ed to LKML and alsa-devel)

On Mon, Feb 27, 2023 at 02:06:51PM +0300, Dan Carpenter wrote:
> Hello Takashi Sakamoto,
> 
> The patch e699600232e0: "firewire: cdev: obsolete NULL check to
> detect IEC 61883-1 FCP region" from Jan 20, 2023, leads to the
> following Smatch static checker warning:
> 
> 	drivers/firewire/core-transaction.c:947 handle_fcp_region_request()
> 	warn: passing freed memory 'request'
> 
> drivers/firewire/core-transaction.c
>     930                 fw_send_response(card, request, RCODE_TYPE_ERROR);
>     931 
>     932                 return;
>     933         }
>     934 
>     935         rcu_read_lock();
>     936         list_for_each_entry_rcu(handler, &address_handler_list, link) {
>     937                 if (is_enclosing_handler(handler, offset, request->length))
>     938                         handler->address_callback(card, request, tcode,
>                                                                 ^^^^^^^
> This warning is because fwnet_receive_packet() has a kfree(r) on the
> first return path.
> 
>     939                                                   destination, source,
>     940                                                   p->generation, offset,
>     941                                                   request->data,
>     942                                                   request->length,
>     943                                                   handler->callback_data);
>     944         }
>     945         rcu_read_unlock();
>     946 
> --> 947         fw_send_response(card, request, RCODE_COMPLETE);
>     948 }

Thanks for your report.

Fortunately, We can not see the access to the released memory since the
fwnet's address handler is registered to high memory region
(0x'0001'0000'0000 to 0x'ffff'e000'0000). The region does not overlap
IEC 61883-1 FCP region (0x'ffff'f000'0b00 to 0x'ffff'f000'0f00). The
handler is called from handle_exclusive_region_request() instead of
handle_fcp_region_request().

However, the code in fwnet is against the design of address handler
apparently. The callee never release the memory for the request structure
directly. It should be done by the call of fw_send_response(). I'll
correct it for next merge window; i.e. for v6.4.


Thanks

Takashi Sakamoto
