Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C905C1A15A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 18:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3162D1892;
	Fri, 10 May 2019 18:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3162D1892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557505415;
	bh=u8a35WoIC35yTrv7bqVB1v6ZjJj720AN/gGjH2k7vRY=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K9Nk+MNkb06YPHUDrgbyMa6BoIy0QPFp4EIjhPRfM5vrPjDNDIzwyk3BvoKnRMlUg
	 jh38f3hIH0JzAiZLV5vlHlouYwgSQO00Bx+upv2no6pZ6SG2u58QjBHkwBxaxiUH3s
	 dLcEk9x1PC9EUdqQAzd8ILM64kMVh5uVIkxnpL7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BB58F89705;
	Fri, 10 May 2019 18:21:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7571F896FD; Fri, 10 May 2019 18:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D35F89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 18:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D35F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NWmEtnOS"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B8FE14C5;
 Fri, 10 May 2019 12:21:41 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute1.internal (MEProxy); Fri, 10 May 2019 12:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=h9KjUX
 7V1CiqTw9fwBZNJrnNldCkWdw1q/9mV7jZbrs=; b=NWmEtnOSByu0hKZDbflLIO
 rjn7Trqgz1fj4zvGvFLK4CQLv4RfP3mbamw6oRPgDBdu/pmqfrvpKe6WrgRbhSZT
 iC0L22Nrcpft328SzX5tIX8NMK19F3utjtt2yxoqHAZncL8TQdLMF/obA7kJEPM/
 4vy6/aXvyW7QfY0aE6/hHIuZRO8cwmvp7QEzQcUGK7ElMYWbKDFDYzUGzzNQbtNz
 faJ6R+/t+kjLDbIzE2A2CIt7Z8XQpgHSwAIi3bDNm+tBrVBj8cNRTVsmoha+q25U
 hwkrc8spUENkqfZcVQII8O7SRsCgtXdsFnaMfF5YUUItXSJmNrwTyVGPoXJ3rS+A
 ==
X-ME-Sender: <xms:FKXVXC9H4gL00QfC9SqWmp4idpRuDG15EcpjwDJwiu8L3T1dSm3AZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeekgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflvghr
 vghmhicuufholhhlvghrfdcuoehjvghrvghmhiesshihshhtvghmjeeirdgtohhmqeenuc
 frrghrrghmpehmrghilhhfrhhomhepjhgvrhgvmhihsehshihsthgvmhejiedrtghomhen
 ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:FKXVXG9-xYhng1kqB1Tf1otF5KiedFa3PbQ_AH8I-hpuuhDncD2KEw>
 <xmx:FKXVXDB8rT1JWaZn2kaw0k1w6ml4iJ3lTL6B7n-TAyNEx0zjYkqOVg>
 <xmx:FKXVXOwJsEtnlhYtt9v3qESg2I_KiOjp9L4so2u-viJPsw2JwJpNCQ>
 <xmx:FaXVXCmtNcj6Ii5y_zhBxLxn-CXerpSm8VcfN3QCKlmG0CwziHEWWg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 61EE07C3DB; Fri, 10 May 2019 12:21:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <3e1a10df-03e8-4b2c-8446-7642526e71e1@www.fastmail.com>
In-Reply-To: <s5hzhnul5w3.wl-tiwai@suse.de>
References: <bce69280-a1df-4de4-ae4e-89de2d464e23@www.fastmail.com>
 <s5hzhnul5w3.wl-tiwai@suse.de>
Date: Fri, 10 May 2019 12:21:39 -0400
From: "Jeremy Soller" <jeremy@system76.com>
To: "Takashi Iwai" <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] Headset fixup for System76 Gazelle (gaze14)
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

Thanks for the quick merge!

-- 
  Jeremy Soller
  System76
  Engineering Manager
  jeremy@system76.com

On Fri, May 10, 2019, at 8:51 AM, Takashi Iwai wrote:
> On Fri, 10 May 2019 16:15:07 +0200,
> Jeremy Soller wrote:
> > 
> > A mistake was made in the identification of the four variants of the System76
> > Gazelle (gaze14). This patch corrects the PCI ID of the 17-inch, GTX 1660 Ti
> > variant from 0x8560 to 0x8551. This patch also adds the correct fixups for the
> > 15-inch and 17-inch GTX 1650 variants with PCI IDs 0x8560 and 0x8561.
> > 
> > Tests were done on all four variants ensuring full audio capability.
> > 
> > Signed-off-by: Jeremy Soller <jeremy@system76.com>
> 
> Applied now (with proper Fixes tag).  Thanks.
> 
> 
> Takashi
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
