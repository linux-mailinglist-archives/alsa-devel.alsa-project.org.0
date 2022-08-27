Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A071C5A35D5
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 10:28:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDA751616;
	Sat, 27 Aug 2022 10:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDA751616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661588933;
	bh=V292CPiZYLCPlFy+QuvQUTCOyunzo0/s8v53ZKO4kqI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pih7yQL2XM4kYo0VCtqatbqSJyAYWI3godOGIu2+yiG3rcqBVGxnBzvO8mR6jYzik
	 OcEqZ2Fe2S0yG4dkYMJJG4u2GoUL2EELQ4E3QierQ5/dejbhl91FZh4rXtW7TfA8Tt
	 TEkOKSLNKuIKu/DyaYlfzqk+rs3FWEhbq/Gqu1aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE32F8021D;
	Sat, 27 Aug 2022 10:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5028F80132; Sat, 27 Aug 2022 10:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97099F8012F
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 10:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97099F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="uQKi9S58"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wNjPGnTX"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5F2593200805;
 Sat, 27 Aug 2022 04:27:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 27 Aug 2022 04:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1661588856; x=1661675256; bh=A2
 8Cfk313QKU66dJNdzNm5NK2UyfUYJ085yrm7GNdFE=; b=uQKi9S58bpsFncR64T
 dhsuCEUNgUSwkMhJLYsGJuh8Y2r4iWbtWmKp20o1kak9Ucddu2LKtVXQKiGlAEl0
 gKx/xmt7Wrg5LGO+jY4AHGTw2IB8vvKGHTRUtooA7GROT7wsGZt/HoEgSDJXEev/
 4Q0eUjII3twNaeFi0MUfLfe7Wu/k2ZCbco+zt74M4E6zZitX0eq+HG8a9zgGM2U3
 4rvrM/SmC7fsmUH06OvvOgrAleEfXvUidpqueplu39vJjQJLHBpEGJ1xhOFUraYP
 2l5udC2k9QtOfzL1ajAAu0uxGo16QbK/EbgivAhUWJPwZm3PqARP7Wh472IUz+g4
 7ECA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661588856; x=1661675256; bh=A28Cfk313QKU66dJNdzNm5NK2Uyf
 UYJ085yrm7GNdFE=; b=wNjPGnTXWh8yXyMB4EhpLABtsiGF1ZjPYDZYbxTjL3SY
 FQ3l0dYGjAj3PttwhB3WxllvnvE9bLbUTiOgCZPNsWaabUglYo3UcIeKyx1gNvUL
 MiMy0JKbiKgf/IQoFdTN/vPvKekAPWohxngF9ucn6upqXg26Jycs8ZI7iWr9CfYH
 dGoE722emdaClHlX8PS8fIQD3VSsanKUpKP6vt2z7MVnFFrtg8QKFDN1OZEbsa5n
 JSQHUtgwYUfYUqznWMPRaJYrD3T9K+fTSVfkB24acUSHlWPxIbknEJFsdFr8Zhmx
 P1CE9y9GnZ3+jF+INnlsiLd/cN1TpodCDWiAZOptXw==
X-ME-Sender: <xms:eNUJY3FagOsiAA9GD7D61eKj7pRA2hXxTewjsXXcsL8MY_t9fHJnQw>
 <xme:eNUJY0UkCj1HBlwd-esbkZrdN8PmluGt7TjCOpSsYF8AWlmW5PDm1T39ZwiE04XU8
 k3a-242yYBfaamh2rw>
X-ME-Received: <xmr:eNUJY5LH41YM_em7ZaEtHB_F_D1szlwBugVsZZBuiCXWw60rIHvOHp_arrHNlapkKE-LFhvgTcrDVv6mKtVTOCy7VqIcHH9K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejjedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhephfegvdfhleefgfduudehvdekudfhkefgueffhfeh
 teeiheekudejudffleekhfejnecuffhomhgrihhnpegtrhgrthgvshdrihhopdhruhhsth
 dqlhgrnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:eNUJY1GRxH_g38fxLZMdHn5j334clm71J3SFo2z8VjEFQoLY9rYMSQ>
 <xmx:eNUJY9VpMHK0nvWQDFhT2UPIAw0ohYSHOdDHQpXIAqHeLqMc8vp3dQ>
 <xmx:eNUJYwMK9eQkSh6Y5JrjdJepJt4pVDBpL3tini5yCN4HBql6m2wfnQ>
 <xmx:eNUJY8cVpPngtXyALSJZBQQzAkBA1Ktgm5KHNAudM9MBvJaA1XZ9Iw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Aug 2022 04:27:35 -0400 (EDT)
Date: Sat, 27 Aug 2022 17:27:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request for setup of new repositories
Message-ID: <YwnVdf+DzjNNXCBE@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
References: <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
 <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
 <Yo95YGyUSSBOipM2@workstation>
 <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
 <YuzwXjaXXtufCTvo@workstation>
 <e8d9c980-11ce-d0cf-6df4-5a6a7ee8b1f9@perex.cz>
 <Yuz38K05IOxVXcnK@workstation> <YwmS1+DnoNbyRafC@workstation>
 <9e83d9ca-ae9f-28b6-c8b6-fc0e16a6d728@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e83d9ca-ae9f-28b6-c8b6-fc0e16a6d728@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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

On Sat, Aug 27, 2022 at 07:29:35AM +0200, Jaroslav Kysela wrote:
> On 27. 08. 22 5:43, Takashi Sakamoto wrote:
> > Hi,
> > 
> > On Fri, Aug 05, 2022 at 07:58:56PM +0900, Takashi Sakamoto wrote:
> > > On Fri, Aug 05, 2022 at 12:42:59PM +0200, Jaroslav Kysela wrote:
> > > > I have no objections for the OAuth access from crates.io .
> > > 
> > > Ok. Just now I sent the request to organization. I'm waiting for the
> > > acceptance notification.
> > 
> > This is just a reminder for the above task. I'm waiting for the change
> > of pending state so long.
> 
> Approved.

Thanks for your approval.

Now 'github:alsa-project:gobject-introspection' team owns 30 crates in
crates.io as well:

 * https://crates.io/teams/github:alsa-project:gobject-introspection

Any member in the team can publish/yank the crates, while is not allowed
to change ownership including its resignation.

 * https://doc.rust-lang.org/cargo/reference/publishing.html#cargo-owner


Regards

Takashi Sakamoto
