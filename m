Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 758AF149315
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 04:22:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038A4166F;
	Sat, 25 Jan 2020 04:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038A4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579922529;
	bh=hxmcbE3XChq0OE1zZwZPLY8ckPXmrUPRRLPUEVym6Ak=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U44Ke6WM5Vtat6RUTR81bDjEbqGQrGSorApE7OKuEMzeh0Ujcudn1/gKskGJchBq/
	 lIR6V9gWfFlu758SJmIrYe7ZeFxCy5yKI6HN5R8fLJECR/HlRywh983v2K04SySIH9
	 /ekVuXrlaro+tLcTdD48KxiZsgKx6isiaWqYyRd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CCAF801D9;
	Sat, 25 Jan 2020 04:20:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C9D5F800F5; Sat, 25 Jan 2020 04:19:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35541F800BA
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 04:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35541F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XmbNRxix"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YqK8mH6T"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EF6C21FE0;
 Fri, 24 Jan 2020 22:18:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 24 Jan 2020 22:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=gVq9FxlgCweGL7sHRV/q6afWtq8
 E2uZ8P16S4C4nuog=; b=XmbNRxixqD1y+jn2rvbfXu1dLUwogtzT7nRUb8wF5c9
 oSKrqChuxDXVkjIZYI3uq6sd+w8qq9xKVueuDUkLqRitC9q1AuyoUZP2S8nyqxqC
 NhNQ4PL5/m/JqKMTmcJccDjYhdE47BbP4VO+M/TCfjHJznpiaxEvMR4etBN+RjQC
 kt0YvmJWpaptO77YfYPVSbF1/61pS2tSeQQrdLtX0w7+b87qk0IayWDbEEHdtjrh
 dmRPq+XjH14O1hkpyk6ePiCrN3YZu5wIuhlwJfqpGbqxxKiUq0C4VGgqGqV7swyK
 XUEI/5lLAQiVezkVg0uL0YHB+xLvlgORhMYXNjkXeEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gVq9Fx
 lgCweGL7sHRV/q6afWtq8E2uZ8P16S4C4nuog=; b=YqK8mH6TbzxZAfCT8eSKEN
 C+dmu1EQkQfRid3ze33JW490BQkCAL48b6IILCz2VYQ/24LyI7G7HZ0GhCi9NVc0
 PAzOcXMcPAuwHWPYv4piezbM0bAIivkQ9GKOWYf+BAlNJEMeeIoW+U0Yynb+yPHE
 2U2Yanq0dUByky1YAHPsqOTynfE91ubcaJvPt8pV1B7fXEeH2/n9MWKV1YVGo6ee
 /tdIHfX9dqnmlZ/kECTcyOIquaLIsSUTDxyEQEZSOD4xcBrpKxkM4g2MKyY9VUVu
 evmBdlFVw+ieLBQIA5RSGrpyASVY4wKVuopXOhRGAtxm8k57KStcRFDX4LidaZAA
 ==
X-ME-Sender: <xms:bbMrXqzlR_AYBjwcOs4N1p-fHiwBbduwxwjSnZRiBRuVcPdnpP1GzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdeigdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucfkphepudegrdefrdejgedrudeikeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhp
X-ME-Proxy: <xmx:bbMrXvFfP0hSS77N1x2CDqbr149M5hpArD1m32NLUsZxFLlEq76ZYw>
 <xmx:bbMrXtoQLMGikXRQ3TJG7cRVOeOGodcPylptDWWK20HOJxv9nQq-_A>
 <xmx:bbMrXlwNDgd0hhKFT-69yRhz8TIYeEPbOZZfQjtEBwe_8eTvFb_I0Q>
 <xmx:bbMrXpUGGq1HmkV-EUAyZUY-_TlRQY2LgypNSJb9e-eF5fzjnh0vvQ>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21B493063DE5;
 Fri, 24 Jan 2020 22:18:03 -0500 (EST)
Date: Sat, 25 Jan 2020 12:18:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Daniel Jozsef <daniel.jozsef@gmail.com>
Message-ID: <20200125031801.GA5554@workstation>
Mail-Followup-To: Daniel Jozsef <daniel.jozsef@gmail.com>,
 ffado-user@lists.sourceforge.net, alsa-devel@alsa-project.org
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
 <20200119164335.GA11974@workstation>
 <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
 <20200120141901.GA32472@workstation>
 <CAK5Eu=tX=87xD0xt-UdrDWTsxw9Y4xOrvAV8pHKyYC7tau==XA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK5Eu=tX=87xD0xt-UdrDWTsxw9Y4xOrvAV8pHKyYC7tau==XA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ffado-user@lists.sourceforge.net
Subject: Re: [alsa-devel] Toneweal / Trigaudio FW66 device
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

On Fri, Jan 24, 2020 at 10:16:53PM +0000, Daniel Jozsef wrote:
> $ ./firewire-request /dev/fw1 fcp 0x01ff3000ffffffff
> response: 000: 0c ff 30 07 0f 00 23 27                         ..0...#'
> $ ./firewire-request /dev/fw1 fcp 0x01ff3100ffffffff
> response: 000: 0c ff 31 00 08 60 ff ff                         ..1..`..
> $ ./firewire-request /dev/fw1 fcp 0x01ff0200ffffffff
> response: 000: 0c ff 02 00 02 02 04 03                         ........
> $ ./firewire-request /dev/fw1 fcp 0x01080200ffffffff
> response: 000: 0c 08 02 00 04 01 ff ff                         ........
> $ ./firewire-request /dev/fw1 fcp 0x01600200ffffffff
> response: 000: 0c 60 02 00 06 05 ff ff                         .`......
> 
> From what I gather from the reference you linked, this seems more or less
> what's expected, though I'm not entirely sure yet what it means for the
> device to have 6 destination and 5 source plugs on the music subunit... :D
> (If I read the specs correctly...)

You got it correctly. Here, let's back to FFADO log:

> Error (bebob_avplug.cpp)[ 237] discoverPlugType: Plug does not implement extended plug info plug type info command
> Error (bebob_avplug.cpp)[ 120] discover: discover: Could not discover plug type (1,1,0,0,1)
> Error (avc_subunit.cpp)[ 189] discoverPlugs: plug discover failed
> Error (avc_subunit.cpp)[ 131] discoverPlugs: destination plug discovering failed
> Error (avc_subunit.cpp)[  99] discover: plug discovery failed
> Error (avc_unit.cpp)[ 283] enumerateSubUnits: enumerateSubUnits: Could not discover subunit_id =  0, subunit_type =  1 (Audio)
> Error (avc_unit.cpp)[ 177] discover: Could not enumerate sub units

It's my mistake to interpret the target subunit to which the command
fails. It's 'Audio' subunit, not 'Music' subunit...

> plug type (1,1,0,0,1)
1 = node ID (=0xFF01)
1 = subunit type (=audio)
0 = subunit ID
0 = direction (=input)
1 = plug ID (=0x01)

The EXTENDED PLUG INFO command is one of specific command for BeBoB
solution and its specification is closed. In your case, 4 plugs are
detected as destination plug and 1 plug as source plug in Audio
subunit by AV/C PLUG INFO command for Audio subunit, thus below
commands are expected to return valid information as long as
implemented correctly:

(4 destination plugs = 4 input plugs)
(AV/C EXTENDED PLUG INFO command for input plugs of Music subunit)
$ ./firewire-request /dev/fw1 fcp 0x016002c0000100ffff00
$ ./firewire-request /dev/fw1 fcp 0x016002c0000101ffff00 (<-)
$ ./firewire-request /dev/fw1 fcp 0x016002c0000102ffff00
$ ./firewire-request /dev/fw1 fcp 0x016002c0000103ffff00
$ ./firewire-request /dev/fw1 fcp 0x016002c0000104ffff00 (should fail)

(1 source plug = 1 output plug)
(AV/C EXTENDED PLUG INFO command for output plugs of Music subunit)
$ ./firewire-request /dev/fw1 fcp 0x016002c0010100ffff00
$ ./firewire-request /dev/fw1 fcp 0x016002c0010101ffff00 (should fail)

However, some vendors seem to implement the above with less care of
compatibility, as long as I know. In your case, below command might
fail:

$ ./firewire-request /dev/fw1 fcp 0x016002c0000101ffff00 (<-)

I'd like you to execute the above commands and share their responses.


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
