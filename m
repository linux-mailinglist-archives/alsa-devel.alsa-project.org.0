Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8986BC31
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 00:29:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55A8A4B;
	Thu, 29 Feb 2024 00:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55A8A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709162952;
	bh=fhq5Ezgrr+Zr2ow+EA3jetDZRE03wiF6/JHJQ27p0jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TRo5XiagpoSWb2cxYCDLcJA+wJQBvtiNgKH3QGDkXuuocdzJSjueQw+KssBSwpZii
	 8MgTyMr6Lsln22/qejcRgbKjAb0rFA4T08vLunY9oX32ej0TRi1WYf7Om115YF0rNn
	 dvxMncThcvLj9S9n5wnHbahrEW3EhfiDmCnu2/ac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF0A0F805AB; Thu, 29 Feb 2024 00:28:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCEEDF80587;
	Thu, 29 Feb 2024 00:28:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A9D6F801C0; Thu, 29 Feb 2024 00:28:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 213B9F80104
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 00:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 213B9F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=GiZ+E2+P;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fV8C+uAb
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 01F783200AEA;
	Wed, 28 Feb 2024 18:28:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 28 Feb 2024 18:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1709162898; x=
	1709249298; bh=ilLcBJScDANRSJdHtV29yd+TdeSbu7P0l3EY7K727M8=; b=G
	iZ+E2+PASUnBQ/yb+ve0om1i3wDxbZg0DqlobbdKRnF81s7wqHBT6k1fs5BbWjFf
	ya3uFLM9gsczOAEX4xiqbBqf0xpJqYaHnLyVsbAiCmd7oEcQv4Yd5t6o+/DBsHuf
	HSe+GYP2mY+kcyHHnDJ2MWbj6YhWRbN99nC4gnvhaRLmVTvW7Jf1dv04S6PYouRF
	7G+d7oXNzQhOFTLuG07V7zlFyfjbFY3SRWPcO1SB8hzzqFq9AqThGIYBxP3vCwHG
	sMBlLXO4KunpCd8aLlYgHYiq+97gyCngfqDg23Wi5sAgUoIQqRA6v5QUMOYpi1OK
	n/kgmAt6s7LNhtwIiel4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709162898; x=1709249298; bh=ilLcBJScDANRSJdHtV29yd+TdeSb
	u7P0l3EY7K727M8=; b=fV8C+uAbR3yB64rc1Knz1dqfo3XHFFgwbuTaljNUYReU
	ck1fqeTlveWTs94wZgPQJDhCKTOkdWASupNbrikbqifIGmECl6ECATliKUGAvS3K
	+kFXc4uGUsm0nNB+McPRiEms5NiUD7XaO2TYVvnqKgV2m/YzNl1PpzLN+oNOeokE
	R6qhPYp6mdb9IoO8K/Cyf9SFGOyt6rsl/TP4qzZVR6SMBWo5BzuC8y5HewT4u4M7
	wuozkIiSrxRi3+oQk90w9mLS5qJu1zeuZfDiFInkBEcB2eKY57Tfys2Wgox3yard
	R8snRdQGM5VbVAyhcB+nk7JaR9eA3xxlDAYSc9jP4A==
X-ME-Sender: <xms:ksHfZSFcZ6ub8npV13pMaUB8LWuuFmyA1Z0OCyXwg-IBMEriR59qMg>
    <xme:ksHfZTX8KawY4zL3LA0viDubD_fV2nXi_Tq6ZRqpAoHZ4Hxdn_EhoAGlhYJnR-fg0
    YSoJoqUZhq3iXNUtNA>
X-ME-Received: 
 <xmr:ksHfZcJYtHRTvX4t_0Elmu_L0hXVz4I3905WS8LofraSuopGS-S8nREJqnN9xLBoisUPoB1MwA40R8O13X0dMPsJre3KgLOolA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrgeekgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeelteeuteefveeuieegleevhefggeegueeiteehfffg
    veelheevhfekleekveevieenucffohhmrghinhepughotghsrdhrshenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
    rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ksHfZcGCQwxZTNhpOGZpew1p7fjJ-ygNhBcVRev_8X8tucz3FwGlVw>
    <xmx:ksHfZYXWZwR0NzuxelPwKJOd9KC60fty-g65yKR7TutnxgzeaCVBYA>
    <xmx:ksHfZfNwdMT_P9ISHnCd8WOX2_TVs2i6TLvceaqkKLYSIT9J4Bq67Q>
    <xmx:ksHfZTfFJWNB0taz8AGNVFNftNNqxGROtQ2JY2PI5JM_5SrQL7-qnw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Feb 2024 18:28:16 -0500 (EST)
Date: Thu, 29 Feb 2024 08:28:13 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Rolf Anderegg <rolf.anderegg@weiss.ch>
Cc: Michele Perrone <michele.perrone@weiss.ch>, alsa-devel@alsa-project.org
Subject: Re: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
Message-ID: <20240228232813.GA3532@workstation.local>
Mail-Followup-To: Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>,
	alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20240121140748.GA189921@workstation.local>
 <17a48bbd-6b2c-4977-89f8-03f3385d3a56@weiss.ch>
 <20240227235446.GA70770@workstation.local>
 <e8795263-1412-45b0-a69f-52e77f297390@weiss.ch>
 <7e5f5a65-89d8-48d6-b68f-b6c7059124e6@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e5f5a65-89d8-48d6-b68f-b6c7059124e6@weiss.ch>
Message-ID-Hash: DW7XLWPSXCMNLZWLYKN4BYS2KTNIWOMO
X-Message-ID-Hash: DW7XLWPSXCMNLZWLYKN4BYS2KTNIWOMO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DW7XLWPSXCMNLZWLYKN4BYS2KTNIWOMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rolf and Michele,

On Wed, Feb 28, 2024 at 09:32:45AM +0100, Rolf Anderegg wrote:
> Hi again, quick followup:
> So basically it's like this:
> 
> ```
> spdif-opt-input-1/2  ---+
> spdif-coax-input-1/2 --(or)--> digital-input-1/2 -----------------> stream-output-1/2
> aesebu-xlr-input-1/2 ---+
> muted ------------------+
> 
> stream-input-1/2 --------------------------+----------------------> spdif-coax-output-1/2
>                                            +----------------------> aesebu-xlr-output-1/2
>                                            +--analog-output-1/2 --> analog-xlr-output-1/2
>                                                         +-----------> analog-coax-output-1/2
> ```
> 
> And all potential mixing (e.g. volume processing) would be done in userspace on the firewire host.
>
> On 28.02.24 09:14, Rolf Anderegg wrote:
> > On 28.02.24 00:54, Takashi Sakamoto wrote:
> > > [...]
> > > 
> > > I assume that the actual source selection of 'digital-input-1/2' is done
> > > in the router function of DICE chip as well as the selection between
> > > 'digital-input-1/2' and 'stream-input-1/2'. The mixer function of the
> > > chip is not used as I expected, thus the selection should exist as the
> > > source of audio signals for the outputs. However, in the above description,
> > > I cannot find such selection.
> > > 
> > > Or the device has a fixed route between 'stream-input-1/2' and
> > > 'analog-{xlr,coax}-output-1/2'? The user can not hear the audio signal
> > > of opt/coax/xlr digital input ports in the analog outputs?
> 
> Exactly, this is fixed as you can see in our DICE routing method.

Ah... OK, now I got it. I had assumed that the audio signal to any
digital input interface can be dynamically routed to any of the audio
output according to the preference selection, however it is not. Unlike
the equipments for the studio recording, the feature so-called as 'direct
monitoring' (without multiplexing) is not implemented in MAN301. As a
summary, the captured digital audio signal has the long trip to user's ear,
like:

```
spdif-opt-input-1/2  --+
spdif-coax-input-1/2 -(or)--> digital-input-1/2 ---------------> stream-output-1/2
aesebu-xlr-input-1/2 --+                                                  |
muted -----------------+                                                  |
                                                                          |
(Linux system)                                                            v
pcm-playback-1/2 <------ (software digital audio processing) <-- pcm-capture-1/2
       |
       v
stream-input-1/2 -------------------------+--------------------> spdif-coax-output-1/2
                                          +--------------------> aesebu-xlr-output-1/2
                                          +-analog-output-1/2 -> analog-xlr-output-1/2
                                                    +----------> analog-coax-output-1/2
```

I've already uploaded `firewire-dice-protocols` crate v0.3.0 to crates.io
with the diagram including the selection[1], but it should be fixed. I'll
do it later.


Thanks

[1] https://docs.rs/firewire-dice-protocols/latest/firewire_dice_protocols/weiss/avc/index.html

Takashi Sakamoto
