Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF80270954E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 12:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D17B1F6;
	Fri, 19 May 2023 12:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D17B1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684493071;
	bh=yFshGwXhhuKSFJBaKJHS3YynRWuQTIGkK7oZ/WIAJDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SpP/b1VQrddBEj7rcrmF6PdisUrpYMX/VpmRd3vYhqhsebh7Xs5k8Azt/0CmoIooy
	 9SmI/ETY1ZsvalBpfLGpej557ox+tYu61xpi+b9Tuj1eVPPRmWin5gtyPMPjIDrOS1
	 jNY0wntCVk1YKWRHaqQbpt9epihVhnEv79qXb0Pk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B571F80549; Fri, 19 May 2023 12:43:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE93F8025A;
	Fri, 19 May 2023 12:43:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D987CF80272; Fri, 19 May 2023 12:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CA73F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 12:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA73F8024E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C93A923F20;
	Fri, 19 May 2023 06:43:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzxa0-okg-00; Fri, 19 May 2023 12:43:24 +0200
Date: Fri, 19 May 2023 12:43:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 5/7] ALSA: emu10k1: centralize freeing PCM voices
Message-ID: <ZGdSzPTMbdRr/FhV@ugly>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
 <20230518140947.3725394-6-oswald.buddenhagen@gmx.de>
 <87ttw9hesg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ttw9hesg.wl-tiwai@suse.de>
Message-ID-Hash: BLMNG4WDGJ4N3AB64ELAJGADS53CXEWV
X-Message-ID-Hash: BLMNG4WDGJ4N3AB64ELAJGADS53CXEWV
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLMNG4WDGJ4N3AB64ELAJGADS53CXEWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 18, 2023 at 04:53:19PM +0200, Takashi Iwai wrote:
>On Thu, 18 May 2023 16:09:45 +0200,
>Oswald Buddenhagen wrote:
>> -static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voices)
>> +static void snd_emu10k1_pcm_free_voices(struct snd_emu10k1_pcm *epcm)
>>  {
>> -	int err, i;
>> -
>> -	for (i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
>> +	for (unsigned i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
>
>We don't use this style.  Declare the variable outside the for().
>
ehm ...
- "we" seems to be mostly true for alsa. but looking at the kernel as a 
   whole, that ship has sailed since the adoption of c11. maybe time to 
   adapt?
- you're noticing this a bit late, after already merging 8 instances.

how should i proceed?

>Also, as usual, it'd be still helpful if you show this is merely a
>code simplification without any functional change in the commit log.
>
right. i don't always remember to pre-emptively amend the patches i 
wrote quite a while ago ...

regards
