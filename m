Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5EA70BCC1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 14:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5242B827;
	Mon, 22 May 2023 13:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5242B827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684756819;
	bh=xHnjERT5FZtqzFmkuHvXLeUQSZk5eNe4r7w61xQbd1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iaT4TXyyY4lrkRmLjcCudFH13ttvh17xxbTDmCc8CZ5FOzBCQkTWPFir8EgQd5U0D
	 OdkbEqc31ak6xQpyKDOQa/PGoabEy69azwM/c1m1i42DUt7owFCRYwpMX0MIAnZZeh
	 RLyGlkozTQiZIri30V8cC7eXzALY/JPnJ+xd66RY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA75F80548; Mon, 22 May 2023 13:59:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72794F80249;
	Mon, 22 May 2023 13:59:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B7CAF8024E; Mon, 22 May 2023 13:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50C6BF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 13:59:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DA2C11E3E;
	Mon, 22 May 2023 13:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DA2C11E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684756757; bh=en8cQlQnT+uJt6aE5F5Vu4ts2AgAlAof50FY+z9esDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Syzxsvrv/tgEuyZiNaZMDCfbpIWXEa7A3uE6sltzHRb1FL34FyOP+r65NpYS6L9TA
	 7Nkrj5VdSTVeM0ErmhD1NgSFj3nH5+BOvaJfSnyiQ9yieiWU1A4wFkIF3NCt+ot0cx
	 uDORRm+L5fkxGHTvgZCqqwYiEinsOtJyrgt+hUiY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 13:59:15 +0200 (CEST)
Message-ID: <908275dd-5cc9-75c0-0dde-ab884a7cc58f@perex.cz>
Date: Mon, 22 May 2023 13:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 24/36] ALSA: seq: Add UMP support
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-25-tiwai@suse.de>
 <643cd65f-74f3-97b8-f48a-6cb25772095d@perex.cz> <87jzx0yevr.wl-tiwai@suse.de>
 <87h6s4y7vw.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87h6s4y7vw.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 23X35RRZEO5DA73UVA7F2G2T6O3XGQP2
X-Message-ID-Hash: 23X35RRZEO5DA73UVA7F2G2T6O3XGQP2
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23X35RRZEO5DA73UVA7F2G2T6O3XGQP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22. 05. 23 12:31, Takashi Iwai wrote:
> On Mon, 22 May 2023 10:00:40 +0200,
> Takashi Iwai wrote:
>>
>> On Mon, 22 May 2023 09:34:45 +0200,
>> Jaroslav Kysela wrote:
>>>
>>> On 19. 05. 23 11:31, Takashi Iwai wrote:
>>>> Starting from this commit, we add the basic support of UMP (Universal
>>>> MIDI Packet) events on ALSA sequencer infrastructure.  The biggest
>>>> change here is that, for transferring UMP packets that are up to 128
>>>> bits, we extend the data payload of ALSA sequencer event record when
>>>> the client is declared to support for the new UMP events.
>>>>
>>>> A new event flag bit, SNDRV_SEQ_EVENT_UMP, is defined and it shall be
>>>> set for the UMP packet events that have the larger payload of 128
>>>> bits, defined as struct snd_seq_ump_event.
>>>>
>>>> For applications that want to access the UMP packets, first of all, a
>>>> sequencer client has to declare the user-protocol to match with the
>>>> latest one via the new SNDRV_SEQ_IOCTL_USER_PVERSION; otherwise it's
>>>> treated as if a legacy client without UMP support.
>>>>
>>>> Then the client can switch to the new UMP mode (MIDI 1.0 or MIDI 2.0)
>>>> with a new field, midi_version, in snd_seq_client_info.  When switched
>>>> to UMP mode (midi_version = 1 or 2), the client can write the UMP
>>>> events with SNDRV_SEQ_EVENT_UMP flag.  For reads, the alignment size
>>>> is changed from snd_seq_event (28 bytes) to snd_seq_ump_event (32
>>>> bytes).  When a UMP sequencer event is delivered to a legacy sequencer
>>>> client, it's ignored or handled as an error.
>>>
>>> The internal struct snd_seq_event_cell is also extended by 4 bytes. I
>>> think that it is worth to note this in this commit (the memory
>>> footprint is slightly growing).
>>
>> Yes, will do that.  But note that the size growth of
>> snd_seq_event_cell happens only for 32bit archs (there was already
>> padding on 64bit archs).
>>
>>> Maybe handle !SND_UMP here, but we can
>>> wait, if someone really requires this optimization.
>>
>> Right, I began with that, but I threw it away in the end as it becomes
>> unnecessarily complex.
> 
> Actually the optimization with CONFIG_SND_SEQ_UMP was already done;
> unless CONFIG_SND_SEQ_UMP is set, the old size of snd_seq_event_cell
> is still kept.  The definition of union __snd_seq_event in
> seq_memory.c takes care of the conditional builds.

I see now. All is fine. Thanks for the clarification.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

