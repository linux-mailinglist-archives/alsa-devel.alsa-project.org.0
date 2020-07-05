Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF60214CB3
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jul 2020 15:23:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DE5D16AF;
	Sun,  5 Jul 2020 15:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DE5D16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593955383;
	bh=RAYbpwc1wjI2tqQOUC7DxRJQDZWuIrUkzuIaIkLnPqw=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VmxMZK27Uxeq5UQtLu+pEHFquLrTTQzv6RXCW2qns1VZz1f7/w2/X8umXuYQnReGz
	 dPdLorckHYvc04zPDEIuJ2+XUVZcjWxd/46DzIOnpVI2M8qgJLAG9WlUpXj3Wk/1HY
	 JEegTfqV016EQsCCoTr+x3y6k9VfFb7VAacOMX5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F7DF801F9;
	Sun,  5 Jul 2020 15:21:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97AA7F80216; Sun,  5 Jul 2020 15:20:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_135, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96F82F800DA
 for <alsa-devel@alsa-project.org>; Sun,  5 Jul 2020 15:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F82F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LKSTO+yu"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rorThBka"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id AACF66D4;
 Sun,  5 Jul 2020 09:20:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 05 Jul 2020 09:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=KGyFyE4zKP/VK8GyaQuvqWP9CwS
 RajlQk1Pw0rDc15k=; b=LKSTO+yu+smBInhU0MSBO6AJ0TXgZe8I/dWbAQcvlHH
 YI0j0kMYmFFo9ERxwOFEc7Izdx+MGvynuClVdVqST+4YMmrOE1in5apZ4Z3tYgcv
 wnDK2bVrafEsBjCfeViooHm8nny+D0VaHzGFGJ1NEnLLOIEJWrcwykjvv6qh/AaA
 dQ8L3UgnrIFGM2sueasvnQ9i8P09waNaUbl9abObdr1uflW7y90Qa6pnXwfgePVn
 tjldfrz187SV74nx29FIoZxa1Hom985ZMTZAz+x/vIvrAYJmh5okNbHmvoxdPNZd
 ZUzBkppUfPJL+WWzEkjIo9N6zVukO6en3oBDtEw3DQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KGyFyE
 4zKP/VK8GyaQuvqWP9CwSRajlQk1Pw0rDc15k=; b=rorThBkaB7cwNSmoD1gxls
 M+EfTtCjmt6Pi/RiYJwYuw3OJrYWeLhFSIWhUp9YRv11Tstv/dHbcRLjGhzoP//B
 14JpFpIBXX0/VgpkWFmJmo8c/vHGoOyQ1VIdwa+hWm9boiYp3cNLh38xOQdhN9YE
 wDlXR9ZQWgj5NJvi6Yxm9sPxYTRPJI4ZhXhIxuRp3ZVe65TC2TaI5w8cLMv/Gy5H
 Go+n9AhFAWHuHPJ0mp/JHoszsV555yukhQWvsDRPqG8MKEtQPuwnp3iukXurPxBA
 JWF5QFRZtMwBN/vMWukPTQF9A7FzofQwaLV9R6X4jCBBw33duZ5gp1DJx7eZUMBg
 ==
X-ME-Sender: <xms:ktMBX65QH-oWxLAAqV4_4Ss3aCJ5dlG9O0-fBEPC3jevyM3rQEvmLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddugdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeiudelleetue
 fhkeetffefffejvdejhedtteefgfeiffffjeelueeklefhtdevgfenucffohhmrghinhep
 rghlshgrqdhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepudektd
 drvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ktMBXz7KL14WRG6e5l2ugpxFi5qHQ0KbwDyr7JFdnHhwlxqFi1R13A>
 <xmx:ktMBX5colTbSEBOZEKid-r80YlCySM2fEz0w_hE3noS1A69G1WfJrg>
 <xmx:ktMBX3JeEeJZn4QpZbvNCTusOt5Vwi4U8IKZJLtsDXvUnXEOSeT7QA>
 <xmx:lNMBXzXjm-ix2Pe8kj0f3tS2qHNHNL1ysgwyoGsYU8hPKnZTn-WKFQ>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C4033069D37;
 Sun,  5 Jul 2020 09:20:18 -0400 (EDT)
Date: Sun, 5 Jul 2020 22:20:15 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz, alsa-devel@alsa-project.org
Subject: Re: Move ownership of snd-firewire-ctl-services repository
Message-ID: <20200705132015.GA104849@workstation>
Mail-Followup-To: perex@perex.cz, alsa-devel@alsa-project.org
References: <20200703164934.GA49779@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703164934.GA49779@workstation>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

On Sat, Jul 04, 2020 at 01:49:34AM +0900, Takashi Sakamoto wrote:
> I'm currently working for the idea of 'ALSA control service in
> userspace'[1] for audio and music units on IEEE 1394 bus under my personal
> repository[2], and the work mostly done for Digidesign Digi 002/003 family
> and Tascam FireWire series[3].
> 
> As well as libhinawa and alsa-gobject repositories[4], I'd like to move
> ownership of the repository to 'GObject Introspection' team of alsa-project
> account, then continue the work. I'd like you to arrange access rights and
> so on, again.
> 
> Besides, as I tols you in previous message[5], the nested team is not
> good in reasons. I strongly request you to leave 'GObject Introspection' team
> and drop 'Hinawa' team, again. Would I expect your arrangement for it?
> 
> [1] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/169141.html
> [2] https://github.com/takaswie/snd-firewire-ctl-services/
> [3] https://github.com/takaswie/snd-firewire-ctl-services/tree/topic/services-for-dg00x-tascam
> [4] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/169141.html
> [5] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/169191.html

Just now I finish the first work for snd-firewire-ctl-services, and move
its ownership to alsa-project project in github.com. I'm glad if you
arrange my access rights for the repository as well as the former ones.

https://github.com/alsa-project/snd-firewire-ctl-services

After your arrangement, I'm going to create the first merge request for
control services to Digidesign Digi 002/003 family and Tascam FireWire
series.


Thanks

Takashi Sakamoto
