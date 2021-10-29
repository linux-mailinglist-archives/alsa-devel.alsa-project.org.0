Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BE43F907
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 10:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D648E16DD;
	Fri, 29 Oct 2021 10:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D648E16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635496658;
	bh=huE3a/L0hTacQ3Iv+ctP8xWdsK3hm1sTK1dcjfF3ulc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8QXG54QvycGfmjNDaS5ALvU1wklkjzEuQM+DEzh3TKMdnwdPE26CEDrKgFxiAunZ
	 DWsncGvnNIaixQn7wSK8n3afGJfGCh7BKrUtlDlkOyHeoz+2IdkZ+TWDPH9cQvgdPu
	 EUv+m+KdARBpwislVC1s+ye/oAFN+QEQru9YMzJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CC1BF8025E;
	Fri, 29 Oct 2021 10:36:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B87A1F8025A; Fri, 29 Oct 2021 10:36:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8040DF800D1
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 10:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8040DF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Un9psN4h"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="df3OIgFI"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA2ED5C00D9;
 Fri, 29 Oct 2021 04:36:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Oct 2021 04:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=HGL6AKDbyNH59d4yDL+FS5Xq0JS
 ceZbuc/3ictwkOUc=; b=Un9psN4hPTD3G9/vlaaB2DjAt012dqoeVSXK8J9aQne
 Dx2Tx9zsGfTuzquF483h4DxGdJ3rcCj7CFiVGZ6KOWV/IzuQoV1dxFd2DKCtzio/
 REMmrbxPpv7I7NFYLEw4zoFdjjg5y9o1lDuK3O06CZMhZ+6nOUd/NSPAfxgyfk+2
 x2f0Tmz3azcDaOPSL9YlzWhCfYJu7tyMDh8MCIPZ24VZ3Z34N+zutH3JBT2BeIL6
 fLYzjp2NFdmkHJi49o22VkHp9fG9cm17xxCA9r+WagW0HHnrSn9GXoHaLgWYvtqN
 YZS2lrxEquF6iK3G2qssjLmKpu2fgcICL/bJaH9AgLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HGL6AK
 DbyNH59d4yDL+FS5Xq0JSceZbuc/3ictwkOUc=; b=df3OIgFIwsPXIGHy5MAAD1
 BLDSyZal0TpCaC0njVO2AIYbJCWd7vtxBs1We2y8Avwe7dmdUZzKjLRjATDU4dBH
 tXVjVKAkiA7FKIBQkWKC2DeLw3169VSxWwZwdNmvj4w/SoMAfxFvvgESdGGMSucJ
 ba3Unl2VRpgGGn2i8PyqJz9iyGzeU3zKag4B6mxWS1uyRWtYILwF51AZHScCrYbZ
 48ciETILuZdLTq62tSAK0sBnvDk84RzauIWea6RhgWjN+rhncZ5800m6SnoJDYXM
 r2X3Qh8T2POOniKsKkjI1N99V4imPl+XvgWEoCvzTf9l0yDN55C1hJJklP6BxL7w
 ==
X-ME-Sender: <xms:crJ7YfgDp7H-KAlQk2SjhtC6TcibLGzF_JQWMHkQWRgc0gfT9aPxxQ>
 <xme:crJ7YcCcQ7JK-QF1t3mdlAZktJgd34QbhtqPiq6O0Qso4c0q7RbbBFDEzqRVAJnT4
 S0DJqK-X9PK-SOEekA>
X-ME-Received: <xmr:crJ7YfGV_p3yG3s-UhahsD-JzN8C_H170QXpt2np-T1qW3Imxz-TLQHetHk2jx6Gi_mLhFUM1DDRHAPr4GXKNqKAHQoI4ty7Tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelfeelieekieeivedtffefieehfefhudefieeifffh
 tefffeehfedvveduudfgtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:crJ7YcTJK31WG7JMwAwoapkmZSu3vuwFi5jS2_lvNopdpnBPzLzs0g>
 <xmx:crJ7YczE3tc3rNYIqwN9joTyrdowaXKspdtTqJfoiiYv9NHNjHbisw>
 <xmx:crJ7YS6vn-Pl1BNpbTST8aAQ6GDQGN-LrgNE2FQEnK_h05IiIknjxA>
 <xmx:c7J7YZrJoFVcB74RPlmgiVCmuZWufCumAx8MQT3wv3bg7I6R7A7n3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 04:36:01 -0400 (EDT)
Date: Fri, 29 Oct 2021 17:35:55 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: oxfw: fix functional regression for Mackie Onyx
 1640i in v5.14 or later
Message-ID: <YXuya9l3tIlSgh7j@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20211028130325.45772-1-o-takashi@sakamocchi.jp>
 <s5hlf2dtaqi.wl-tiwai@suse.de> <YXtAnvKI13hQb/ex@workstation>
 <s5hh7d0tgmo.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hh7d0tgmo.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Fri, Oct 29, 2021 at 09:49:35AM +0200, Takashi Iwai wrote:
> On Fri, 29 Oct 2021 02:30:22 +0200,
> Takashi Sakamoto wrote:
> > 
> > On Thu, Oct 28, 2021 at 05:44:37PM +0200, Takashi Iwai wrote:
> > > On Thu, 28 Oct 2021 15:03:25 +0200,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > A user reports functional regression for Mackie Onyx 1640i that the device
> > > > generates slow sound with ALSA oxfw driver which supports media clock
> > > > recovery. Although the device is based on OXFW971 ASIC, it does not
> > > > transfer isochronous packet with own event frequency as expected. The
> > > > device seems to adjust event frequency according to events in received
> > > > isochronous packets in the beginning of packet streaming. This is
> > > > unknown quirk.
> > > > 
> > > > This commit fixes the regression to turn the recovery off in driver
> > > > side. As a result, nominal frequency is used in duplex packet streaming
> > > > between device and driver. For stability of sampling rate in events of
> > > > transferred isochronous packet, 4,000 isochronous packets are skipped
> > > > in the beginning of packet streaming.
> > > > 
> > > > Reference: https://github.com/takaswie/snd-firewire-improve/issues/38
> > > > Fixes: 029ffc429440 ("ALSA: oxfw: perform sequence replay for media clock recovery")
> > > > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > 
> > > Thanks, applied.
> > > 
> > > 
> > > Takashi
> > 
> > Oops. I forget to add tag to stable. It's preferable to apply the
> > patch to current stable (5.14.15) and mainline RC (5.15-rc7) as well...
> > 
> > Would I request you to post the patch for the purpose alternatively?
> > (It is perhaps too late for mainline, I guess...)
> 
> You can inform Greg and Sasha once after the commit gets merged to
> Linus tree by yourself.  Just tell them the upstream commit id and
> corresponding stable trees to merge.  Usually the stable AUTOSEL
> mechanism will pick up such a commit automatically, but doing the
> manual selection is more certain and faster.

Thank you for the instruction. I've rarely used the request path for
the manual selection. Ok, when the stable AUTOSEL doesn't pick up the
commit enough later releasing mainline, I'll follow the path.


Thanks

Takashi Sakamoto
