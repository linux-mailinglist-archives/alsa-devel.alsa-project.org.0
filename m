Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54971C39D61
	for <lists+alsa-devel@lfdr.de>; Thu, 06 Nov 2025 10:36:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEF0601F8;
	Thu,  6 Nov 2025 10:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEF0601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762421753;
	bh=iV+8wd7c5lCEb/SpfkDZEDWLASquPNXFJ78tK4R1Hls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VjFx0rBPvrwgMKwwnB3ne3aSKu/KgbYAuuxDct9eCFsS9IQ9bDC3adBM7D+8WcHHG
	 0+3xjY1bTsyUp4K7SGdHZVgBAdZx0f2GJ5oeiw9YL2vTgY//UdVaq+gh1erklSHXj8
	 Fz7wEErrByH1NL9eh9YZRZ+p+WIggh8r1LACJfmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1133CF805BF; Thu,  6 Nov 2025 10:35:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8491FF805C7;
	Thu,  6 Nov 2025 10:35:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F629F80272; Thu,  6 Nov 2025 10:34:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B06CF800D2
	for <alsa-devel@alsa-project.org>; Thu,  6 Nov 2025 10:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B06CF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=leemhuis.info header.i=@leemhuis.info
 header.a=rsa-sha256 header.s=he214686 header.b=eH59QBCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=pP5ODjhCdsQzD/63SJd7frcv9El1J4wyTX4yGQ2Ji9Y=; t=1762421688;
	x=1762853688; b=eH59QBCZc3ph38UnUB7mrB7MKSqgyCvdb4xDIUNvsyNSPWvvbnPHxoKH24DGl
	fcDceBmPa670djI6rPpHuZJVJaeoYEut+DJA0HcNMphh1pDbbG5MMprJkPe5JdUM6gxROwH56zpUh
	byQgDQ0bykpgfRYBiMiAMLVZ2qEhoX6uq202beOl7h2cd/hE88CgcxMHPHOK7PplQVMZYbwGQB6dj
	9Wp41bHvS2Es5OGRXl2WXbFlWRU5NvCvP7SZxxa4UNgFJYtNh11ge+YS7lScS2OLKFhS8ZAwBz5zK
	DPe/zggv0F23ws10K/QPHjJRLJkt66dvcMWGkv3PVr65kjraBw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vGwOC-005OXI-2t;
	Thu, 06 Nov 2025 10:34:44 +0100
Message-ID: <e182047c-ed7c-4fb1-bd61-fc0536b12b2e@leemhuis.info>
Date: Thu, 6 Nov 2025 10:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 220109] New: Audio disappears on HP 15-fc000 after warm boot
 again (ALC256 code path)
To: "kailang@realtek.com" <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sashal@kernel.org" <sashal@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 Ruslan Nikolaev <nruslan_devel@yahoo.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <1064773772.509063.1747061777318.ref@mail.yahoo.com>
 <1064773772.509063.1747061777318@mail.yahoo.com>
 <87o6vxuauk.wl-tiwai@suse.de> <946767975.787038.1747111000631@mail.yahoo.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <946767975.787038.1747111000631@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1762421688;72cdf05e;
X-HE-SMSGID: 1vGwOC-005OXI-2t
Message-ID-Hash: UAPU5G2XCHHD6WVUZQUHJQQQOG7GEB4J
X-Message-ID-Hash: UAPU5G2XCHHD6WVUZQUHJQQQOG7GEB4J
X-MailFrom: regressions@leemhuis.info
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UAPU5G2XCHHD6WVUZQUHJQQQOG7GEB4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, top-posting for once, to make this easily accessible to everyone.

@Kailang, @Takashi: The fix for the mainline/6.12.y regression this
thread is about was afaics merged for v6.17-rc3 as f4b3cef55f5f96
("ALSA: hda/realtek: Audio disappears on HP 15-fc000 after warm boot
again").

Greg's scripts despite the Fixes-tag for some reason did not backport it
to various series that contain the culprit. Is there a reason for that?
Otherwise we likely should ask Greg to pick it up.

Ciao, Thorsten

On 5/13/25 06:36, Ruslan Nikolaev wrote:
> Takashi and Kailang,
> 
> I did a few additional experiments. Here is what I found:
> 
> 1. If I connect headphones and ALWAYS keep them connected, then sound does not disappear even after a warm reboot.
> 
> 2. The moment I disconnect headphones and do a warm reboot, sound is not going to come back. At that point, connecting or disconnecting headphones, rebooting is not going to change anything (i.e., recover the sound) until I fully power off the computer.
> 
> 3. After reverting the commit, the above problems disappear for speakers, and no additional issues with headphones are observed.
> 
> 4. Whether I revert or do not revert the above-mentioned commit, the headphones are sometime flaky if I already have an application running that uses sound. I have to close that application, disconnect and connect headphones again. Otherwise, the speaker does not get disconnected.
> The headphones seem to be even more flaky when NOT reverting the above commit - unless I booted the system with the headphones connected, the speaker will never get disconnected.
> 
> Sincerely,
> Ruslan
> 
> 
> 
> 
> 
> 
> 
> 
> On Monday, May 12, 2025 at 11:07:02 AM EDT, Takashi Iwai <tiwai@suse.de> wrote: 
> 
> 
> 
> 
> 
> On Mon, 12 May 2025 16:56:17 +0200,
> 
> Ruslan Nikolaev wrote:
>>
>> Hi,
>>
>> Forwarding my regression bug report for HP 15-fc000 / ALC236 (ALC256 code path).
>>
>> #regzbot introduced: v6.12.2
>> https://bugzilla.kernel.org/show_bug.cgi?id=220109
>>
>> Sincerely,
>> Ruslan
>>
>> Forwarded Message (see logs in the bug report above):
>>
>> There was a similar bug in the past (Bug 217440), which was fixed for this laptop. (I believe the code path is for ALC256, see below.) The same issue is occurring again as of kernel v.6.12.2. The symptoms are very similar - initially audio works but after a warm reboot, the audio completely disappears until the computer is powered off (there is no audio output at all).
>>
>> The issue is caused by a different change now. By bisecting different kernel versions, I found that reverting cc3d0b5dd989d3238d456f9fd385946379a9c13d in patch_realtek.c ( see https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/sound/pci/hda/patch_realtek.c?h=v6.12.2&id=4ed7f16070a8475c088ff423b2eb11ba15eb89b6 ) restores the sound and it works fine after the reboot.
> 
> 
> It's the commit cc3d0b5dd989d3238d456f9fd385946379a9c13d
> Author: Kailang Yang <kailang@realtek.com>
> Date:  Thu Nov 14 15:21:09 2024 +0800
> 
>     ALSA: hda/realtek: Update ALC256 depop procedure
>     
>     Old procedure has a chance to meet Headphone no output.
>     
>     Fixes: 4a219ef8f370 ("ALSA: hda/realtek - Add ALC256 HP depop function")
>     Signed-off-by: Kailang Yang <kailang@realtek.com>
>     Link: https://lore.kernel.org/463c5f93715d4714967041a0a8cec28e@realtek.com
>     Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> and it modified alc256_init() sequence.
> 
> Kailang, could you check this regression?
> 
> 
> And, Ruslan, it's the case without the headphone, right?
> Is the sound still lost when you connect the headphone and apply the
> same procedure?
> 
> 
> thanks,
> 
> Takashi
> 
> 

