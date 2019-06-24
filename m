Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135FC50576
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 11:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FDE166B;
	Mon, 24 Jun 2019 11:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FDE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561367809;
	bh=J1ht9+OcJI+8NJpDbQj8Hlfv840GWOskgVXrwEjwE70=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RGDN+2p39V7GoHbl8rJI9+gm4Nkf71UhIlYFxiGdREvHyWf6+u1/oxcI/RLEZHKjM
	 MEJtbiWvuiT1hYs3NG4tjsxQWjpZFekH/cObaKYkF67NcSgZxOX4pBPga3XM5nSZDe
	 j/gaLxr3/Y8jPL8hBHt50FpttxC6N8d6Lcqxs5kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2033AF89731;
	Mon, 24 Jun 2019 11:15:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6E2BF89731; Mon, 24 Jun 2019 11:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 073A4F89721
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 11:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073A4F89721
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="g8ylYw93"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Sku65r6e"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B28DB22205;
 Mon, 24 Jun 2019 05:14:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 24 Jun 2019 05:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ngX52QuSqq0VOWmDD4NdmvgwgIe
 Q4dfoBxNtZIFjL80=; b=g8ylYw936BxBnKIw5CRV/nqfWNJBhaFTyyXCTs8ynTf
 kShtC9BuATB93o3IimEnZbAUL5s6KMqrsd57v9wuS2qvbk7iALWB2Qmq/iQ+apR3
 YqjOsBO54vaHszEsk/KAlyfcotc8Dt4pNy4yjUFhWaTdR+F5GjR56LIr2SBV6I/D
 86CR3Dj6QXRCPg+KvXlNvcasF0LYG31gcej6l4r9skTfW6jIaAwRn4BmCwJYt9Cs
 cowvnAP4QD5/9Sxk2QmVQChruziMTx4Gg02EE+Y+6tuMRUhsUcWag2Wt9NnLLZUS
 pi3UVEygPxCIkxNgtRQIpAy8xj6uesbX5Xbx/u3Tstg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ngX52Q
 uSqq0VOWmDD4NdmvgwgIeQ4dfoBxNtZIFjL80=; b=Sku65r6eiLj/Vv4NOio1lt
 sVd00PM1OT5eeuDWSanV/1CXT/gueYbq4vVknr0OKb9UC5cwQaVRRh0ZajIlcJpJ
 dSDxxojT1DNRojjDYlUku4zayEkU/XPR9dCeuwJ8/bFKsZGfyWKt4UUKSxFNBjyT
 p1Qi57zEkEqDx0s6LX52owWQN7mrj5RrAMEs0V2TbOpGt0oaP984ECvHYHi0OKto
 3KqiYRY7gdDKmbl0kGSDnwdSslMrJTPmwJI37MkYsM3OEFiFTutJymZaX9t8eBlJ
 2s+KVNAqHc/uS+d70N1JjLtbgU0qn7dyLnc7cBrt9y6OzxF10diFNIBasqbpie4A
 ==
X-ME-Sender: <xms:jpQQXTlg4_n5_D-Fewufje_b3LJipcNi0Mg-YOJTodqPF0uD43C8lA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhep
 ohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiii
 gvpedu
X-ME-Proxy: <xmx:jpQQXSU1pycRdwuTFahsv43d8ESmLXlJixp8cKw8jLKaL8iLXHIXCQ>
 <xmx:jpQQXfqVvRd7rSxL9INHv4h4KgH-NygX7Ps0NSzqn-WdRzbsZ__6kA>
 <xmx:jpQQXZVMd7VfVWGIHLT7k4WOY6BIvQlMrAdPLN4oObLbyNos75te6Q>
 <xmx:jpQQXRrPo7FNHJaZAkYawu_zPbzL54Pxkw53OvDlvhkwqrymwUw3qg>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6BD418006F;
 Mon, 24 Jun 2019 05:14:53 -0400 (EDT)
Date: Mon, 24 Jun 2019 18:14:51 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190624091450.GB7004@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20190623012333.12056-1-o-takashi@sakamocchi.jp>
 <s5hwohbz7ax.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hwohbz7ax.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH] Revert "ALSA: firewire-lib: fix inverted
 node IDs for amdtp_packet events"
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

On Mon, Jun 24, 2019 at 11:00:54AM +0200, Takashi Iwai wrote:
> On Sun, 23 Jun 2019 03:23:33 +0200,
> Takashi Sakamoto wrote:
> > 
> > This reverts commit e703965a129cdd72ff74e248f8fbf0d617844527.
> > 
> > When creating this patch, I compared the value of src field to the
> > value of first byte of cip_header field (SID) in tracing event.
> > But in this test I used a device which has a quirk to transfer
> > isochronous packet with invalid SID.
> 
> Could you give your sign-off and fixes tags?

I'll resubmit with them...


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
