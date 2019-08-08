Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FB85DCF
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 11:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2086415E5;
	Thu,  8 Aug 2019 11:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2086415E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565255162;
	bh=5kAFk0PY0eWe2pqUH2TD/zbkTXOLGlNFSZryPB41IDQ=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0yNQE4xkyyTaaPppReW2G2g6zxya2eMniWt5Z6O2tguGnrjn42aSsnrn1XC+8kVN
	 5FSj/6jCP3T7Pz/VFlBIXMQ2/fakWNTCmJAGzVx1XjgR4q/ZLQoHHQnBJglxgGwack
	 pya2vMf7PrCUTH9MST9B2KB1tPXcuF1UkmKAedIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D8B6F803F3;
	Thu,  8 Aug 2019 11:04:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1357BF80534; Thu,  8 Aug 2019 11:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1376EF800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 11:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1376EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ba5wD/BC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EDP/Uh9d"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0EA5821FB7;
 Thu,  8 Aug 2019 05:04:09 -0400 (EDT)
Received: from imap5 ([10.202.2.55])
 by compute1.internal (MEProxy); Thu, 08 Aug 2019 05:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm2; bh=UDxY0biEKiJkV/eKq0+tBQBLPV9S
 8cgzUqiVh5nUXFg=; b=ba5wD/BCWuz96s1vBnUw02p43fsiVJqc9YiKZHXlKyXT
 jhvCdrJE6pWbvtHiXtLsQOCH98bkZa7ZOVT9j3TP6h34tRGYBHn68g7JZ3hp8uwI
 mczBVUM1FLlSWv9XMGES3MT4Gqp3lB273sAUkkrwBEe8fjcgBy9OVB+51ClJTFGp
 ehY2fyuZhEPRsvfC8xZs7V+UF4N2kEKW9znbWzXE7zstfGVQIZULspIr126Vftvk
 AqlAECJ5BNQFieCwAepTdcdexWZPccyH2vU52E7TNMOtEa1OCKA/iCPltMy5o7As
 oQD/rBm/IpxaeJLYEvQVWbnscZhl93o+I2qNXiVg8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UDxY0b
 iEKiJkV/eKq0+tBQBLPV9S8cgzUqiVh5nUXFg=; b=EDP/Uh9dw/lSheM3sSOAmP
 HJLsLx02h9jie8yk25vTAWmYiM2MDTi+gSYrBt1JIWdZ5CLyFgO6/9m+TWZrNeAP
 wlhoZowI+nghIOUHn3lvtwbBGyrlEOMyR5ivC+taAGZs5w53RTgm3jYhIMOKRjJk
 mO1gD+fYmiyyaZMB4lBR6m/OATJ0973MfI/BjNTeu/UgXZYPO3l02MjiTWvLhdWD
 VgJ0SSglAZRSRPrX6mG34WZCNq9+G0MmA4D9LBGpN5bT5uLhz/mOKGyuVJFQ7EHg
 Uw2oMOO++zbGeUbOOcoUStW/bgr8BUvMTYIe9CO89QOGDHnIPV0ik0lAn1OJk+HA
 ==
X-ME-Sender: <xms:iOVLXcG7rA_7M_zbi7RPGRYVs7GxU1Vyo5FFfo5Ewm2ggeRKeMGlRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduhedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfvrghk
 rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjpheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:iOVLXcxO-QKzYQu_bfF8Wvp_KxmO9L0qkNpsMYGI16PQOoRj9AYu4w>
 <xmx:iOVLXTjdfwG_pxjoP4g4CPrhI-PDb8cqedn0cNZcD2fjjRHwMGm6qg>
 <xmx:iOVLXXwEnOwruQjMo3b9l0Yy4gZ1yMeeuHBn_Yqa1lcLeUT1AfMS7w>
 <xmx:ieVLXd4qCunCQt9EOheq6iVPOAiHbBhvLs7D9QSGGG3K6MxTe3TchA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 413805C0099; Thu,  8 Aug 2019 05:04:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-808-g930a1a1-fmstable-20190805v2
Mime-Version: 1.0
Message-Id: <ce36089b-7061-4cd1-8262-eb3393c753af@www.fastmail.com>
In-Reply-To: <1565243458-2771-1-git-send-email-wenwen@cs.uga.edu>
References: <1565243458-2771-1-git-send-email-wenwen@cs.uga.edu>
Date: Thu, 08 Aug 2019 18:04:03 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Wenwen Wang" <wenwen@cs.uga.edu>
Cc: "moderated list:FIREWIRE AUDIO DRIVERS" <alsa-devel@alsa-project.org>,
 Clemens Ladisch <clemens@ladisch.de>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: firewire: fix a memory leak bug
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

Hi,

On Thu, Aug 8, 2019, at 14:53, Wenwen Wang wrote:
> In iso_packets_buffer_init(), 'b->packets' is allocated through
> kmalloc_array(). Then, the aligned packet size is checked. If it is
> larger than PAGE_SIZE, -EINVAL will be returned to indicate the error.
> However, the allocated 'b->packets' is not deallocated on this path,
> leading to a memory leak.
> 
> To fix the above issue, free 'b->packets' before returning the error code.
> 
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> ---
>  sound/firewire/packets-buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

And this bug exists till its first commit for v2.6.39.

Fixes: 31ef9134eb52 ("ALSA: add LaCie FireWire Speakers/Griffin FireWave Surround driver")
Cc: <stable@vger.kernel.org> # v2.6.39+


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
