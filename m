Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92614E20B3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 07:50:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546BE1699;
	Mon, 21 Mar 2022 07:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546BE1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647845408;
	bh=kSUK1C/2n1F2//1hkNBK4WX3S4EeiEJ8g3MJmTJT8eE=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBj/QGziY90z/9+qsheQn8JuK/cMALPfELqsv/jXtvoQhw7XrwJr+1ovcpPtkv8kd
	 0XTutWI3zhNqiZ5Hbs/l1sX401IBzFwhn3nYBDIMUW5L4JWlL18E4d5Ajr90g2psdN
	 O8cTZVH3vYW9fsK8qmHYqxU5KlyeREUJAjEKZSy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB1A5F801D8;
	Mon, 21 Mar 2022 07:49:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B0A3F80227; Mon, 21 Mar 2022 07:48:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7C6DF800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 07:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C6DF800FD
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nWBqR-0005fY-Nd; Mon, 21 Mar 2022 07:48:47 +0100
Message-ID: <420bd395-10e7-b5de-97da-56d90fb82654@leemhuis.info>
Date: Mon, 21 Mar 2022 07:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [regression] Headphone output gets unproperly powered down - Mi
 Notebook Pro 2020 (ALC256) (fwd of b.k.o bug #215484; starting with 5.14.14)
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info>
In-Reply-To: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1647845333;
 442e6ea5; 
X-HE-SMSGID: 1nWBqR-0005fY-Nd
Cc: "kai.heng.feng@canonical.com" <kai.heng.feng@canonical.com>,
 alsa-devel@alsa-project.org, itsbytebites@tutanota.com, kailang@realtek.com
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

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Could anybody please finally look into this bisected regression from
5.14.13 to 5.14.14 (f8d3c17e1c37 ("ALSA: hda/realtek - ALC236 headset
MIC recording issue")) that according to a recent bugzilla comment from
reporter is still present in recent 5.16 kernels?

Ciao, Thorsten

On 12.01.22 08:15, Thorsten Leemhuis wrote:
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I'm forwarding a regression reported in bugzilla.kernel.org to the list,
> to make sure all parties interested in this are aware of it. The
> reporter is CCed. Not CCing the stable list in this case, as 5.14 is EOL
> already.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215484
> 
>> With headphones (or an auxiliary jack) plugged in, the audio output
>> is fine when anything is playing, but when that's stopped a loud pop
>> can be heard after some seconds and if the jack is connected to an
>> external amplifier it gets really noisy. Everything gets back to
>> normal whenever audio playback is resumed, although with another loud
>> pop at the start.
>>
>> This has been happening since kernel 5.14.14, whereas 5.14.13 is
>> fine. I suspect it has to do with the ALC256 mute logic implemented
>> in that version
>> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/sound/pci/hda/patch_realtek.c?id=v5.14.14&id2=v5.14.13)
>>
>> OS: Fedora Linux 35 Kernel: 5.16.0-60 Vanilla Hardware: Xiaomi Mi
>> Notebook Pro Enhanced 2020 (i7 10510U, ALC256)
> 
> Ciao, Thorsten
> 
> #regzbot introduced v5.14.13..v5.14.14
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215484
> #regzbot from: Emanuele Melzi <itsbytebites@tutanota.com>
