Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A2329145
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 08:50:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE25716AA;
	Fri, 24 May 2019 08:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE25716AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558680602;
	bh=cq9H9ZFDUmMYRUA6V7ntnGLlnlbD+VCgwjnwBAuKsWY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QE/JT21MzQ7V634v9drpxnwUIMLyaNSASiEoXpse2CuETdDAtm6uH/YTrLV6xjyqN
	 nkXDzlyEHOf/k3t6E8BI0+20dlAcTlwUxV3q7jdHJNSW6OE+lTFFI9liXyx9ISQIcX
	 kUIFfQSAX84Fnws2npZyAOTMlQpyd5b/dprU4QFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D33CF8962F;
	Fri, 24 May 2019 08:48:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6745F89630; Fri, 24 May 2019 08:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D358F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 08:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D358F89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="gczKy007"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dGhkQ8Rl"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 08DB321AF2;
 Fri, 24 May 2019 02:48:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 24 May 2019 02:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=vnxgdpir7uIGgdbr7Ogydkw3a0C
 x8td9sJPYofxd23s=; b=gczKy007+LqRw5ECLvDPE1dMziKren0dUhLl7t9nj68
 c0sNQVQaUGDWrRxWf9gz6T3FabX+Hx8UYoP6SpRuieEuDuxrMqMavTUvgwdZqr6K
 OdFqTqke2FYSS1ZnIsY91vlHx3YUovOdp7VaL0yU4qEMUjbOX3+jHorUZKQtGqeS
 xc7vHA+nwdmddugq3E51lnTeF68q/8SPUeHj9X80HTVMq6LHbgLl3zU+bgTRjYEA
 PNq+TP4wTmNwAIFvvg/x5U0hTWKS4gzE40t1XYN7aDM7IAJOn6IFsIQ53An2pdbI
 7D4U8LsAA2l2kpjZHZYqzfCx5WHzyOJPo8weR/YPsHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vnxgdp
 ir7uIGgdbr7Ogydkw3a0Cx8td9sJPYofxd23s=; b=dGhkQ8Rlq+zPV4itJ747cz
 rOvyKWnlqnSI9e44kZ8lEPMEJyZFUXJPHXhaWm6v0Ww4+ps2HvkjxTGUyLmaQFzb
 peTfTWugw/64nWOpfqFAVfkv1yhruI3dmwsna9TT444OGNkz6etPryOYKg2AX0I2
 ExXWtQXFg2ZIjo6wabZTJzsp1F/oMr0r9XQXeJz/BKNzzwrj11jDKl7G3c+y1KyA
 rd5KEq3LAomwbuySvFyLmqq6ERGs1dKWNIFL+2sjU81QQNcroEZGJi+V8Azx4Dsr
 28ur3qUKqVfQ645sw2unnz206KB9j9+qb9D93wpEK1gOPd6mgVgTmn4nz8wvdLwg
 ==
X-ME-Sender: <xms:qpPnXGq537teBTq9V9D7slwKb-kmABJOikaCVT3TQjseBtIXRsDVGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduhedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjfgesth
 dtredttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgr
 khgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehkvghrnhgvlh
 drohhrghdprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppedugedrfedrjeehrddu
 kedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmoh
 gttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:qpPnXPxTCz8-3wR_iibDhKTN29EpJN5uuCI063DTsA8A56BTYE2b7g>
 <xmx:qpPnXAlFISSV60Ss8u1eo7ab2Fz4yckLuDLfFvBeOeblM3-Qb1m2xA>
 <xmx:qpPnXFs6wrjipo6d288SWnuf0tqbJw8cPavZ7OQW4rXJTm2LqBoYzw>
 <xmx:qpPnXDR7slwOqTm4R8rmxaccibVYbaOIF1QQdycA5rQj96TAu5BGkQ>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA375380085;
 Fri, 24 May 2019 02:48:08 -0400 (EDT)
Date: Fri, 24 May 2019 15:48:06 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Message-ID: <20190524064805.GB25133@workstation>
Mail-Followup-To: tiwai@suse.de, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH 0/4] ALSA: firewire-lib: unify handlers for
 outgoing packet
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

Iwai-san,

I cannot regenerate the conflict you mentioned[1] in my local:

On Fri, May 24, 2019 at 12:14:36AM +0900, Takashi Sakamoto wrote:
> Takashi Sakamoto (4):
>   ALSA: firewire-lib: split helper function to generate CIP header
>   ALSA: firewire-lib: unify packet handler for IT context
>   ALSA: firewire-lib: code refactoring to queueing packets
>   ALSA: firewire-lib: use 8 byte packet header for IT context to
>     separate CIP header from CIP payload
> 
>  sound/firewire/amdtp-stream.c | 150 ++++++++++++++++------------------
>  sound/firewire/amdtp-stream.h |   3 -
>  2 files changed, 69 insertions(+), 84 deletions(-)

I can successfully applied these patches onto either e4e07c6cdca8 ('ALSA:
hdspm: Fix single speed ADAT capture and playback with RME HDSPe AIO')[2] or
947b437e1263 ('ALSA: firewire-lib: unify packet handler for IR context')[3]
in fetched your tree.

Would I request you to try again?

[1][alsa-devel] [PATCH 0/6] ALSA: firewire-lib: unify handlers for incoming packet
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-May/149742.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=e4e07c6cdca8a837ab40363fc8002cf62965a628
[3] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=947b437e1263c81bb5d30a84f1a4a35dbb9f6b78

Thanks


Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
