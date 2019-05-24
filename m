Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A2F29118
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 08:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFB2916A0;
	Fri, 24 May 2019 08:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFB2916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558679956;
	bh=qUQ4qBeimDZdlrD03kKQ5rA/CnzKdvLIgVCtT/AawMw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+jC8ytGE3NLhuL+6jSgy8JcrgrEfwxaa6ztJZIxQWj2UvDw0vnK7UBUvXMSb/BBB
	 /0HagXErxJUBk2M9dZPDbaiKLqu5b4+DSIbCvKDWRB7nDuZJ0vT4ZXK8slnPNDM5Rc
	 sSGInj2HQ1WNP+C4qARDzrJI1T60Dk1lenvevdzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F691F89636;
	Fri, 24 May 2019 08:37:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E62DF89630; Fri, 24 May 2019 08:37:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34E8DF80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 08:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34E8DF80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="uNk4BubC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Z+ta5lLm"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E97221AF2;
 Fri, 24 May 2019 02:37:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 May 2019 02:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/oc8Tj1PUwQftn98ZT97lm6Bl81
 DZEz4M07Kl4JcrkM=; b=uNk4BubCiIIlphnnwkB2plw7mDPaLVY38jr9U1w0VRd
 55RJjpknTpRp6LK39y7p3LVfFWua0Jn32OoWkgqRNWRlZ+Iw5sS4sIczeirBFFZG
 T2r+tKfy0Iw1MkZ4r2rSCImC8jfuQdfPu+cdfp6xvuhptWtxdAUfWENIfzTrcNF9
 nTkGRQcRoG985/DR49RPUMyFztTYTL78FsJKad2SCiAorYbLlEFOd9yhWQ7LHwS1
 ig2Ij42L62dUAcIljwB6FZ54wC0mjEDh4W2yRBYrgZoSeqWLMo6NbnsqAVoce3oB
 gxeXoW7FrE/GlkyQ2zaNo1J0uqJRB3jo17XLTwtHHXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/oc8Tj
 1PUwQftn98ZT97lm6Bl81DZEz4M07Kl4JcrkM=; b=Z+ta5lLmigegpOFa+fgkrI
 xirsr7zl1m/l8WGLirIWY2NdGCtMqCnAWsG6rldPM/RHDO3tEyO9Mfh2vDRVTt7Z
 gHM3R45UpA65ZOzRIWEbmZXK0TpzbvYHRys6FHVdGvsoLTG6Py+Oaum7r/Nd1jbk
 wpxwwoZsQLts8kKS5lXFINqQIPUgW5m7Y4OJZXhEhIveo8PAUfWVaZi8Kphe4GbS
 Qch7To1GPthTQ1Szj7uS56nRKl++QxQAtMBZEaSriw7MIaehWyjHsRAXBVXYnqU6
 nTgPs91jayNwwQ/GN2GrNdPfNmpQm18IIQLNrJ0H3LV6VjBC28LZzJbV5JdmQHYQ
 ==
X-ME-Sender: <xms:IZHnXMesSB1Guq0Uof4nIyZ3_JH9qMW7f6Ol9RJPkA23vAXSV--i6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduhedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghk
 rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppedu
 gedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshh
 hisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:IZHnXKIZ5eWlR1xcoh25XFJOk5TUeUVifdmK2tdqGRSdF5ooeryHLQ>
 <xmx:IZHnXDoSzZcsm7Y-UryEWO8eE5pJtyhR2VHesfvKAvAky14jIwLbQw>
 <xmx:IZHnXIW3zhymFKzrJtRCgp4Q7jcMmsO_1Y5Mnp9Q7KvbQ_1I9N4aoQ>
 <xmx:I5HnXF16smzonjM-sIxTPeEPDCCo_Yf-O9Jm4l6b9RRaieieGt0utg>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 561FE80060;
 Fri, 24 May 2019 02:37:19 -0400 (EDT)
Date: Fri, 24 May 2019 15:37:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190524063716.GA25133@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
 <s5h1s0ofl60.wl-tiwai@suse.de> <s5hy32we6cp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hy32we6cp.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH 0/6] ALSA: firewire-lib: unify handlers for
 incoming packet
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

On Fri, May 24, 2019 at 08:04:06AM +0200, Takashi Iwai wrote:
> > I already applied the previous patchset that had been submitted on
> > Tuesday, and this seems conflicting.
> 
> Sorry, I replied to the wrong thread.  I meant the new one
>   <20190523151440.5127-1-o-takashi@sakamocchi.jp>
> conflicting with the current for-next branch.

It's the latest one:

[alsa-devel] [PATCH 0/4] ALSA: firewire-lib: unify handlers for outgoing packet
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-May/149708.html

I'll check them and resubmit after rebasing to current for-next.


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
