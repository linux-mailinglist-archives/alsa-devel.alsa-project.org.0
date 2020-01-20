Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DEB142D25
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 15:21:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9111F1673;
	Mon, 20 Jan 2020 15:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9111F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579530062;
	bh=Nc9r3Lk0ziAzlr6PjfBYdV+sKqi+93yxIuqBwZmHbgo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItW+NRmH/zNiiOLFpadwQj4jn2Ezoguean1CbvQrZ3TeYg7RJtLY0ndYMca/ia6ek
	 7QLNOQR9RRACvb/QPTxtDN4wStHYhKkLjlg7o68R2l4M6SOOCZYOosU07IloYLgaLD
	 D/hRpxRG0fxEnTxMLQljxpoQBiTe26OBiduOQYI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E7EF8020C;
	Mon, 20 Jan 2020 15:19:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4168EF8020C; Mon, 20 Jan 2020 15:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_59,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0500BF800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 15:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0500BF800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="BhKxtIBU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HJZPZccn"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C4F593F0;
 Mon, 20 Jan 2020 09:19:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 20 Jan 2020 09:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=riUZ9OTgOXQcagCqMc81zzC4Yjs
 vCvigwDBG9cdbAuQ=; b=BhKxtIBUWf+Z3oosety4B1j142BbzuY+5QgRDVZGb3b
 wZtawiELLwiQxHIOOe/5dsZs5pQ7DuZ6mKUAJegybIQ9g3uuRYBezV7fjF3Ri5zm
 kezMRu6xzHHn4NyGX2CS5fPSNXikJl8zuMha9HtW3DqD4AGF5PstlRFjmqe8W13g
 FZZ6jlIwzev9rFMIHmyJ79tZUZVBedHqFvitWwpq4oXu+BVp4CVLMl3mqiFuYMQA
 RKRnOOUmuBcsNA/5gGAq64aUKg/pPYCX1XnqmYy0KGzi1qcr4Y66oDso/Uy/jJYL
 nWJa4f/7yuhPxptJEWurTfEIkdSO3e8S6JBcfjCGL/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=riUZ9O
 TgOXQcagCqMc81zzC4YjsvCvigwDBG9cdbAuQ=; b=HJZPZccnGC6TeslgdlU3Uo
 hi3Ym4WXezpm7ao8blV1EoahaMgqslrD5RUlvkOXvuRGgiYTtY4Dyyvhd5+6/CDw
 V5Hw9Eyr1KD1MJY0DtuEAvHLP+/f5+cXZ5XU9bg3WdetIE3kl76B2sTyaFxrxar8
 N/M3UtyLrEv/Dicq/fgs00ePO3YzC9BiVhG7hTy8Gt38sFWcFwsJDqENMQjvb1bt
 0xagY2KKr9xv/T4ZX5uyVmi7vDEQgTD9HJKtl1zWuSIAKwxWJn5YwVAaqgBhcHgp
 Fjh03NhIH+doMWsNjkTuwRY5zHUnAefuC4nNto/kp1ffH+yTFUCq495rB+992h3g
 ==
X-ME-Sender: <xms:2rYlXijxZvQZU7yMABVJhvgIaxqIM1SoJa7QBztkb4afCEWz8JTiIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinhepudefleegthgrrdhorhhgnecukfhppedugedrfedrjeejrddv
 jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqd
 htrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:2rYlXpvu3jyfgMHugVQc-xcd-iQrXr2dyq81Uj9Fdt5yGveqp2Q2eQ>
 <xmx:2rYlXkSo-hfb9hVSb0H2aDQNa19gVPRvvgSwkg_Sh0EwUqSd6gsJhg>
 <xmx:2rYlXr7am5aP4Nn2sTKq8809WOAK6zU8hH-brgoUQX3-v82Lfrar2g>
 <xmx:2rYlXmelfXUx-QwvowNzg33Ewvj-XBHeT9DhwfxjnqwCwaIWUDEP_g>
Received: from workstation (ae077027.dynamic.ppp.asahi-net.or.jp [14.3.77.27])
 by mail.messagingengine.com (Postfix) with ESMTPA id 040048005C;
 Mon, 20 Jan 2020 09:19:04 -0500 (EST)
Date: Mon, 20 Jan 2020 23:19:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Daniel Jozsef <daniel.jozsef@gmail.com>
Message-ID: <20200120141901.GA32472@workstation>
Mail-Followup-To: Daniel Jozsef <daniel.jozsef@gmail.com>,
 ffado-user@lists.sourceforge.net, alsa-devel@alsa-project.org
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
 <20200119164335.GA11974@workstation>
 <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ffado-user@lists.sourceforge.net
Subject: Re: [alsa-devel] Toneweal / Trigaudio FW66 device
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

Hi Daniel,

On Mon, Jan 20, 2020 at 11:42:34AM +0000, Daniel Jozsef wrote:
> Thanks for the quick reaction, Takashi :) I ran the command you mentioned,
> and your guess was spot on:
> 
> daniel@gibbonmoon:~/opt/linux-firewire-utils-0.4/src$ ./firewire-request
> /dev/fw1 read 0xffffc8020000 60
> result: 000: 62 72 69 64 67 65 43 6f 03 00 00 00 00 00 00 00 bridgeCo........
> result: 010: 00 27 23 00 00 00 00 02 02 00 00 00 00 00 00 00 .'#.............
> result: 020: 32 30 31 30 30 35 32 35 31 32 31 35 30 34 20 20 20100525121504
> result: 030: 02 00 02 00 ff ff ff 00 80 00 0c 40 7c e3 13 00 ...........@|...
> result: 040: 32 30 30 38 31 32 30 32 31 33 34 34 34 38 20 20 20081202134448
> result: 050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................

Yep, it's an application of BeBoB solution.

As a next step, please get responses against 5 AV/C commands below:

(AV/C UNIT INFO command)
$ ./firewire-request /dev/fw1 fcp 0x01ff3000ffffffff
response: 000: 0c ff 30 07 0f 00 14 96                         ..0.....

(AV/C SUBUNIT INFO command)
$ ./firewire-request /dev/fw1 fcp 0x01ff3100ffffffff
response: 000: 0c ff 31 00 08 60 ff ff                         ..1..`..

(AV/C PLUG INFO command for Unit)
$ ./firewire-request /dev/fw1 fcp 0x01ff0200ffffffff
response: 000: 0c ff 02 00 02 02 01 01                         ........

(AV/C PLUG INFO command for Audio subunit)
$ ./firewire-request /dev/fw1 fcp 0x01080200ffffffff
response: 000: 0c 08 02 00 02 02 ff ff                         ........

(AV/C PLUG INFO command for Music subunit)
$ ./firewire-request /dev/fw1 fcp 0x01600200ffffffff
response: 000: 0c 60 02 00 03 03 ff ff                         .`......

If you're interested in their contents, please refer to document published by
1394 Trading Association:

AV/C Digital Interface Command Set General Specification Version 4.2
(1394 Trading Association, September 1, 2004)
http://1394ta.org/wp-content/uploads/2015/07/2004006.pdf


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
