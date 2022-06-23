Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D014557562
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 10:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BCB41B0C;
	Thu, 23 Jun 2022 10:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BCB41B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655972790;
	bh=aEn/bLBxRhUb/n9SeVEOAA7rEhdPlgyoU3XZ2uEbT7A=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3VomRbcX8Tp4eZTtATOaBnvp2TbJBn61Oa69XAxYjQJW41KovzfeepLJtmV2QnNY
	 T9McxIriLqxh422toBLLS+ERKB61Cfsgn8zrISLTmAde/HXO4GwA7xfe5vwiKrYZnM
	 cKbRgmR90ud3E2OuOkTN5D5YApNLQMiRgMnx+W+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C035F804BB;
	Thu, 23 Jun 2022 10:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 478D5F804C1; Thu, 23 Jun 2022 10:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 178DCF800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 10:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 178DCF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XXP69S83"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="euZRutP3"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2192732005C1;
 Thu, 23 Jun 2022 04:25:20 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 04:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655972719; x=1656059119; bh=15
 nRgtENRDsC0ckj8/r63benyMs21Du6VN4s1Es73l8=; b=XXP69S83FUIB/6fkZA
 9BzV7yhN+JAiLly4tieD80F8cX3DAmsUZ1R5bZ1b+YC8UPlvCeS10EZ+dRGWuVh3
 V4bnpuhTu85jS2Hjg5on6Tnst70wgBOxmY0YGxvdtufKsoxGUquEZMXQd5dl8l/S
 ct5sThsl/Bwpcgu3pocdiDXWZ5tFbrrrCsFUwFmW0QsYrNI5qJMlWrwMwHhqzxvM
 mWr5YOpbGva0LxQL2w/4xI0fN1WNqc22MmFqLC8Ox/ddO5ANlEmua1jGWwbMr1R9
 0W0h2K0g9OEDGH1NV8HaDNoDOE76bFMFJIxYyU+901s6zYT51WJut629ttyIMgzO
 C8uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655972719; x=1656059119; bh=15nRgtENRDsC0ckj8/r63benyMs2
 1Du6VN4s1Es73l8=; b=euZRutP3EPlL3kULujsU2HNVXT2y/gb+t+CphbW1umrj
 zCH2OFWuNkMZMw+w/JwLcDb5tr7Zsq/FUJ4KcX4qT7fKIlvvyS90a1VUvps6dviK
 CWNeZwXr+J5kAuBrXaVBRxJ6BM9nGgerzscKkmRYaNOovOM4eg5JoTLtILCxvbNI
 y61O5Y9KET98KH7txytIhu9pze2/90pIPPduk+B5yxXjpgyD2fKYxxYsD6Pjaizn
 xyL4+zQ7Lz4tt8mKvj20T/qvLKQebdqfNfO4yfjydsRqQMamt8JIu4Z0V96/v82w
 ALDZ5VKHr5TgHFUgxrOEmoa+Gfj82FzyuOrTQct02w==
X-ME-Sender: <xms:biO0YpcXDCsNLtiwDXc__tAMlPdniLswfQ81zhqypp6ANPQPTMph6g>
 <xme:biO0YnPRgSotyobD7YN_QwTeqVijSPaF9v7VjGJXN3jr8hDtVOyBlOj-7PTPzxIoJ
 9GRmMSBCGWcSudrPBI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfvfgr
 khgrshhhihcuufgrkhgrmhhothhofdcuoehoqdhtrghkrghshhhisehsrghkrghmohgttg
 hhihdrjhhpqeenucggtffrrghtthgvrhhnpeelfedvveevveetjeeikedtgefghfeigfek
 leefkeekieehiedviefghfeltdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:biO0YijY14JaqxENJiceJehczfP7mpfxt40rZ64hbUiBlEYcRYhtBQ>
 <xmx:biO0Yi9l3tvkRh-fcRHfZq8FtRsvtHuFelxzhRk6iNdJHk9BHa89nA>
 <xmx:biO0YlsTMbKLQ0q0ZmgD6Ty2WYG8IfacCwe21Ts9LWO4I3UdHkLBTQ>
 <xmx:byO0Yu4QS4F8NdhQ9nY-EyNHpCOrVse3WGQMCHiBb5MwI4Qtmf3Exw>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B226136A0071; Thu, 23 Jun 2022 04:25:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-713-g1f035dc716-fm-20220617.001-g1f035dc7
Mime-Version: 1.0
Message-Id: <298967f1-841b-4b39-9a6e-8bf22c49181d@www.fastmail.com>
In-Reply-To: <fac65634-a702-84c4-da8d-60e01d309c7c@perex.cz>
References: <795d8e1a-8fc7-2302-613e-ff1743de5c16@pelago.org.uk>
 <878rpnncov.wl-tiwai@suse.de> <fac65634-a702-84c4-da8d-60e01d309c7c@perex.cz>
Date: Thu, 23 Jun 2022 17:24:57 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.de>,
 "John Veness" <john-linux@pelago.org.uk>
Subject: Re: Quirks for MacroSilicon MS2100/MS2106
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Hector Martin <marcan@marcan.st>
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

Hi,

On Thu, Jun 23, 2022, at 16:18, Jaroslav Kysela wrote:
> On 23. 06. 22 7:58, Takashi Iwai wrote:
>
>>> Even with this patch, there is a remaining problem, which is not present
>>> in the MS2109. The sound sample values range from 0x0000 to 0x7fff, with
>>> silence around 0x4000, i.e. 15-bit-ish audio. This actually sounds OK to
>>> the ear (although half as loud as it should be), but looks odd when
>>> looking at the waveform, and makes volume meters always think the sound
>>> is very loud.
>>>
>>> To convert to s16le, I can bitshift one bit left, and subtract 32768.
>>> I'm told that this isn't something that can or should be done in the
>>> kernel, but should be in userspace. Any more advice on how to fix this
>>> remaining quirk would be very welcome.
>> 
>> Ouch, this is painful.  We haven't had any devices that require a
>> 15 bit unsigned format, and maybe we don't want to add it to the
>> common standard format just for one funky device, either.  Such data
>> processing could be done in alsa-lib, but for the proper interaction
>> with the user-space, the kernel should provide some information so
>> that user-space can process the data accordingly.  However, we have no
>> proper way defined for it generically, so far.
>> 
>> Maybe an easy way would be to create an alsa-lib external plugin, and
>> apply it per device.  Jaroslav, could it be done via UCM?
>
> I agree that we may start with a special plugin for this format. The UCM can 
> use any alsa-lib configuration now. So PA/PW should work with this very 
> specific hardware when properly configured.
>
> Note that we have SNDRV_PCM_FORMAT_SPECIAL for such cases. It will imply that 
> the applications will fail when the special conversion plugin is not used. The 
> minor issue may be with the silence routines (which is already with the 
> improper format).

I think the combination of format/subformat is available in the case.

Actually the odd frame format is within 16 bit slot, so SNDRV_PCM_FORMAT_U16
or so is available. Then we can define new subformat to notify userspace; e.g.
SNDRV_PCM_SUBFORMAT_MODEL_SPECIFIC.

The cons is that we need to add new subformat, thus update asound.h. On the
other hand, the pros is that existent userspace stuffs still handle the odd format
and user can hear playback sound at least even if the loudness is not expected.


Regards

Takashi Sakamoto
