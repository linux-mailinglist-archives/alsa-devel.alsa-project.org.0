Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ADB4719CE
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 12:33:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129591EE8;
	Sun, 12 Dec 2021 12:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129591EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639308813;
	bh=TCWc+h/vwWmKtIVqHzrz9eayynXyiKUebxz+mJXPPg4=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azMC6PRf8VZTU5Vpo5/fqw5JAJlfTh9CvaMdQJi03VV1OyL+o7b12RRV5kRB+cTMk
	 7sW2imaThnoKnOj9cVfIov3f7O0+clO20XvYf0PwgytKRz8isaLH1dZTpd7RsUpt+y
	 w1BV99q0YkuxT2m4RqUKrfv1vbNH/Yndt42sgiEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3861BF80249;
	Sun, 12 Dec 2021 12:32:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC903F80246; Sun, 12 Dec 2021 12:32:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7A8F80059
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 12:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7A8F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="k+2lZOYm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kHroChj1"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 65DBB5C009D;
 Sun, 12 Dec 2021 06:32:06 -0500 (EST)
Received: from imap41 ([10.202.2.91])
 by compute3.internal (MEProxy); Sun, 12 Dec 2021 06:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=f+M/+zqwJP7xDBJ/1quT7uhlmDCp
 znvs/CgwEASFalg=; b=k+2lZOYmvFjtW+fuJw8NnN2FNJyxzeb0hGz26uQfKQv6
 PvrfvhvS8MyfYroIzwf3GM8j0svWxDxNvcOOy3vBndA3HkvF1ZYxhzEtQU0xCjW+
 ve3o50h4iJ+xJNQ5/bk2YACFfqSDsM5LaPfGvwLF4BuSebNnQHHYQXzwGuHl0B9W
 ji6+0x2Ke/gLJCObNUNFbKzMXEHXVqKEQEQFlyTxDGY8w/v5zuuYv2O4Nd+4Q4uy
 tMPSge/EB8ljudavvCO/bVohYiFrkZ5dyXOm3zrBD7Xk3Lddb535RSt1as/mPgBI
 KBMJqJID5qbYWtP/Fu3h5oTCloxKwhpnXttiMoXwog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=f+M/+z
 qwJP7xDBJ/1quT7uhlmDCpznvs/CgwEASFalg=; b=kHroChj1gk5qH/ySwpK7CY
 nFle0l2GXbfOuzF4CaQMWcfl5CjFFuEEbpf2g4mnGZnaKDBNTpG3X6V5zisAFSpO
 VmVslA5zib7t3JPvIRatAw8POg6KZ8SLHNi6/Nc9x4GsDWKf4kneRsStAEBO3/P/
 18eHajYF0W2q7UEK4OFG59rNLev/jjyuM99gyGl3WP8n3l6nbv/qbbjSY3eu0oo1
 nJuNr5V3rXH22UXt8QwzYSKdbz0cDdlxZ/mjRwi5hkN5jtcrebYEUlFhuW11251d
 PpSm4jjZ+f+7u8K2Zzo/RH2kYWbsDFRbJENk3ZQ0iXBPHt4RVAqpnL/PpSQsHMpw
 ==
X-ME-Sender: <xms:tt21YRagKIik7MdRKPrt_VMTgIrzbeahIHZqx_9_OCzh7hgcj4ie7A>
 <xme:tt21YYYJXmklwf2tDFirfXWsIA9XLmCgNgUfQH9XEi2FpoF_kdl7ioVsBuoFMZgMN
 G_qwqdTFx15UR_Stfs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeeigddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfvfgrkhgr
 shhhihcuufgrkhgrmhhothhofdcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucggtffrrghtthgvrhhnpeekkefgtdeigffgheefleduveefvdevgeehffet
 jefghfejheffudduieevvedvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:tt21YT_KgEwuJITit0KtjNxonXRJxzUzCj9AxJrR02v6S9VHGFqYZA>
 <xmx:tt21YfoigqE2zqD6tTeW5Gl1mn_jubtF2dKZB9dokOz7QoiBFjHMyA>
 <xmx:tt21YcpEkfadz53yQHJ_7f5BQ9FsoCIFWvM6aYxzYPf9ysWbfTXA9A>
 <xmx:tt21YSGnKwc_cdIHESl5i4fdRt5S2fCUHd0-doCsrblERYrkAoohoQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2F66E3C0246; Sun, 12 Dec 2021 06:32:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4514-g2bdc19e04f-fm-20211209.002-g2bdc19e0
Mime-Version: 1.0
Message-Id: <30685ab6-3347-43ee-b20d-6e11994242b4@www.fastmail.com>
In-Reply-To: <s5heedo3cdu.wl-tiwai@suse.de>
References: <20210529033353.21641-1-o-takashi@sakamocchi.jp>
 <s5heedo3cdu.wl-tiwai@suse.de>
Date: Sun, 12 Dec 2021 20:30:30 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Takashi Iwai" <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: comment about relation between msbits hw
 parameter and [S|U32] formats
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org
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

On Sun, May 30, 2021, at 16:32, Takashi Iwai wrote:
> On Sat, 29 May 2021 05:33:53 +0200,
> Takashi Sakamoto wrote:
>> 
>> Regarding to handling [U|S][32|24] PCM formats, many userspace
>> application developers and driver developers have confusion, since they
>> require them to understand justification or padding. It easily
>> loses consistency and soundness to operate with many type of devices. In
>> this commit, I attempt to solve the situation by adding comment about
>> relation between [S|U]32 formats and 'msbits' hardware parameter.
>> 
>> The formats are used for 'left-justified' sample format, and the available
>> bit count in most significant bit is delivered to userspace in msbits
>> hardware parameter (struct snd_pcm_hw_params.msbits), which is decided by
>> msbits constraint added by pcm drivers (snd_pcm_hw_constraint_msbits()).
>> 
>> In driver side, the msbits constraint includes two elements; the physical
>> width of format and the available width of the format in most significant
>> bit. The former is used to match SAMPLE_BITS of format. (For my
>> convenience, I ignore wildcard in the usage of the constraint.)
>> 
>> As a result of interaction between ALSA pcm core and ALSA pcm application,
>> when the format in which SAMPLE_BITS equals to physical width of the
>> msbits constaint, the msbits parameter is set by referring to the
>> available width of the constraint. When the msbits parameter is not
>> changed in the above process, ALSA pcm core set it alternatively with
>> SAMPLE_BIT of chosen format.
>> 
>> In userspace application side, the msbits is only available after calling
>> ioctl(2) with SNDRV_PCM_IOCTL_HW_PARAMS request. Even if the hardware
>> parameter structure includes somewhat value of SAMPLE_BITS interval
>> parameter as width of format, all of the width is not always available
>> since msbits can be less than the width.
>> 
>> I note that [S|U24] formats are used for 'right-justified' 24 bit sample
>> formats within 32 bit frame. The first byte in most significant bit
>> should be invalidated. Although the msbits exposed to userspace should be
>> zero as invalid value, actually it is 32 from physical width of format.
>> 
>> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
>
> Thanks, applied.
>
>
> Takashi

I can not find the patch in your tree. Would I ask you to review again?

If it should be going to be applied, I'd like you to fix my typo in the subject line;

 * "[S|U32]" -> "[S|U]32"

Regards

Takashi Sakamoto
