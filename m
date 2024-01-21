Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B1835604
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 15:10:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E48682C;
	Sun, 21 Jan 2024 15:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E48682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705846218;
	bh=ZCSwpFCu2Kk9gHwJffNKn2nTd7HHbLwfWhc3ecSkZEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gCfRjJPr6qPivBrQ1d6HZPL0AcwKDLLbdIcIK67kdee1GQ+TH0qqNYwb/CMOnvUpL
	 hXGzz3vUjuo2PjD+185hNcDJkPMhjMG94dZvRRaJGRfvQ9c1U3AM9wHA7B3qRw9Oa2
	 39e1op76/UPjbfVcGDxMwF+95hljQNl/GsP37VbE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F51EF80578; Sun, 21 Jan 2024 15:09:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB1BEF8057D;
	Sun, 21 Jan 2024 15:09:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29A21F8003A; Sun, 21 Jan 2024 15:08:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08F78F8003A
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 15:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F78F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=fYpxxRyZ;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=yZuz3IHg
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D9BD05C008F;
	Sun, 21 Jan 2024 09:07:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 21 Jan 2024 09:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1705846074; x=
	1705932474; bh=Q2sgiorOlyQkcO57YPMByXghEmXGoq74vVn4Hxm/D2w=; b=f
	YpxxRyZl5/ZcX4egzlCvONIlKjz5r4A0IZDHNWbt3q9fUDUa6nvGkiM+ufaiVCNr
	IRV2yyFak91vGpbfJdASlK9Htbah6wu1R5bU5jhyvk3O6ACj0oTiy+gar6RCBuO0
	33PbP9Wv7X8xkZJj4bN28qlh2Eyw8WrNgLFJwCV80pvEH2T1RhldHcJdEoyh7XqC
	OgCN5z6Sm7CX/nRmOIlA9cLvz4TWGF/vEagzqwNGrZ9UWJUClbSEg9mF4ZAzy8NZ
	6Zb5sYUa4H4codbfxqVSFiMsChdpvB34EJ/R8VUCIPit7oLMyYTDn+5yC8NPjno7
	YCvY0LQnGnXOigeVWxu8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705846074; x=1705932474; bh=Q2sgiorOlyQkcO57YPMByXghEmXG
	oq74vVn4Hxm/D2w=; b=yZuz3IHgtpyTwAhaj/9N8jCgESD740L/ZVUa8YsH6Nq6
	2zma+C0Q32Krt4SgBozdHl03QrAXbAvQCcf3G2Rkdz3dyZbst9VkZMf7E+TWconj
	bT4kzcXli9rEONNnZ1K9eFIsG0HPAYb+fEnfew6JbkQYB2aYC1/+qhQdAdqavDMI
	mXxJedOSE4Kp0vU2RzbLz6vs4EAa83jU66eNRCqfPyj1NIlg9nIN0gEmxXNQ5LXx
	M6axPdqr5PVYl+ANB/zB8uNGoAwLeV4OqIYwv2G2+Uhs6Hic+9VnX19mQrb3rwD4
	KULMiOPOUX3CdtxwQIrNG/U3hCBNAJGpn/omOvN10Q==
X-ME-Sender: <xms:OiWtZVBfmtQJASUxz0zC3VHjAKJhfXAGtVaZJiyKS3A9hQ6AfQ2Kdg>
    <xme:OiWtZTiREr3hdGkJhDD1RsLzlNPgm39wyvmmlIcbHlyTipWdYE63cvJaOxMTC1E3I
    B35nbKgSIGw_jaXYL4>
X-ME-Received: 
 <xmr:OiWtZQl9YJbIocEae4P8re60yg92hQdf0l_zfIOIsL6ZGl0O6Io-NLIZ0IVSp5uAGfQXpcpq8HRK4DuxBtdknqC3YeFBO4yRnw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrvdekgedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepfffhveellefghffgleehfeehhfevtdfhvdfhvddv
    feelgefhgeefuefhgfeiieetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdprghvtg
    drrhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    ohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:OiWtZfy-mg4vijnIxeyQK62eQYRM-EjXxtlfofnImbs2VWy6WQb3Lw>
    <xmx:OiWtZaR9DRT0gkbm8UXiT85Va7aFWpvVY0NeBb9CHzdeOO7Q2kJ7BQ>
    <xmx:OiWtZSZztjSg4Jaqi1zT8MuMo_izemMoS_UVlWLzFy_vw0x-9dgP5Q>
    <xmx:OiWtZdItVDinfWEyU51MEE79C94x0gJSQQ5lj9t2Orj_QN_WksAjbQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Jan 2024 09:07:52 -0500 (EST)
Date: Sun, 21 Jan 2024 23:07:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>
Cc: alsa-devel@alsa-project.org
Subject: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream format
 parameters for Weiss devices)
Message-ID: <20240121140748.GA189921@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
Message-ID-Hash: ZUBAHM5JHBTGEAEKGB7AADXFSMHBST7Z
X-Message-ID-Hash: ZUBAHM5JHBTGEAEKGB7AADXFSMHBST7Z
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUBAHM5JHBTGEAEKGB7AADXFSMHBST7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michele Perrone, Michele Perrone,

I restart my work to support Weiss models[1] as I have enough time after
some tasks. After implementing control elements for your MAN301, I have
some questions about internal routing. Would I ask your advices about
them?

I think the model has below inputs/outputs.

* inputs
   * spdif-opt-input-1/2
   * spdif-coax-input-1/2
   * aesebu-xlr-input-1/2
   * stream-input-1/2
* outputs:
   * stream-output-1/2
   * spdif-coax-output-1/2
   * aesebu-xlr-output-1/2
   * analog-xlr-output-1/2
   * analog-coax-output-1/2

And at present I guess its internal routing is like[2]:

```
spdif-opt-input-1/2  ---+
spdif-coax-input-1/2 --(or)--> digital-input-1/2 -----------------> stream-output-1/2
aesebu-xlr-input-1/2 ---+             |
                                      v
stream-input-1/2 --------------------(or)--+----------------------> spdif-coax-output-1/2
                                           +----------------------> aesebu-xlr-output-1/2
                                           +--analog-output-1/2 --> analog-xlr-output-1/2
                                                      +-----------> analog-coax-output-1/2
```

Then I have some questions.

1. The signal source designated for stream-output-1/2
I think it is any type of digital input designated by control element
"Digital Input Capture Route", or source ID block which generates
silence.

2. The signal sources designated for the outputs
According to the manual of MAN301, the sources are selectable somehow.
There are two ways at least for pre-amp and player modes. I guess that
any interface is defined to configure internal router for the purpose.

[1] https://github.com/alsa-project/snd-firewire-ctl-services/tree/topic/weiss-support
[2] https://github.com/alsa-project/snd-firewire-ctl-services/blob/topic/weiss-support/protocols/dice/src/weiss/avc.rs#L12


Thanks

Takashi Sakamoto
