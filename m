Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A870B69D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B68653E7;
	Mon, 22 May 2023 09:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B68653E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684740946;
	bh=0fusPBJ2CjhYHRDxQhy42Jmfze4SYGNmmgsyrJWXSB0=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=liRAZKcdpZw6+lyhKJdO489shIQ1QEQxKDyrJCR+FqZnaM9CibD3/RTWDYBT3iilN
	 zlUOzVuvEzPC2Vse3AoQdGkpUa7DYfiXQVXz+F/Z86ZWnQFI3mSZPAcR7muOwfC3LF
	 GfNrp/aF34B25Rcsxte0hh+IjAK5lJkad2zJw2xo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D6D9F8026A; Mon, 22 May 2023 09:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C88F80249;
	Mon, 22 May 2023 09:34:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12FB4F8024E; Mon, 22 May 2023 09:34:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 205ECF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:34:49 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EF2F81E2D;
	Mon, 22 May 2023 09:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EF2F81E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684740888; bh=xm5yCm4HxhG53ZaJN83kBR3DB0UtmDE91ShrEBTViEo=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=nIzweIStkmkWmxma8xBwKMWz9cgbyTL6ueyYMo50PLe7qjhrfubLVlHG8Z3ez86K/
	 cSOc9zSA9dGVb5CWpGxA1Mu4A52Fvmcz8R9vw5QwwQlVUEuef5gFz6MqPtk8EIboN0
	 35oqCMS76b0sIz7EDHQXahlbrlfggtPQc/Aznezc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:34:45 +0200 (CEST)
Message-ID: <643cd65f-74f3-97b8-f48a-6cb25772095d@perex.cz>
Date: Mon, 22 May 2023 09:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-25-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 24/36] ALSA: seq: Add UMP support
In-Reply-To: <20230519093114.28813-25-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 43OTDD3DHKMS7N6IHFK3HEQMFSNPLW43
X-Message-ID-Hash: 43OTDD3DHKMS7N6IHFK3HEQMFSNPLW43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43OTDD3DHKMS7N6IHFK3HEQMFSNPLW43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> Starting from this commit, we add the basic support of UMP (Universal
> MIDI Packet) events on ALSA sequencer infrastructure.  The biggest
> change here is that, for transferring UMP packets that are up to 128
> bits, we extend the data payload of ALSA sequencer event record when
> the client is declared to support for the new UMP events.
> 
> A new event flag bit, SNDRV_SEQ_EVENT_UMP, is defined and it shall be
> set for the UMP packet events that have the larger payload of 128
> bits, defined as struct snd_seq_ump_event.
> 
> For applications that want to access the UMP packets, first of all, a
> sequencer client has to declare the user-protocol to match with the
> latest one via the new SNDRV_SEQ_IOCTL_USER_PVERSION; otherwise it's
> treated as if a legacy client without UMP support.
> 
> Then the client can switch to the new UMP mode (MIDI 1.0 or MIDI 2.0)
> with a new field, midi_version, in snd_seq_client_info.  When switched
> to UMP mode (midi_version = 1 or 2), the client can write the UMP
> events with SNDRV_SEQ_EVENT_UMP flag.  For reads, the alignment size
> is changed from snd_seq_event (28 bytes) to snd_seq_ump_event (32
> bytes).  When a UMP sequencer event is delivered to a legacy sequencer
> client, it's ignored or handled as an error.

The internal struct snd_seq_event_cell is also extended by 4 bytes. I think 
that it is worth to note this in this commit (the memory footprint is slightly 
growing). Maybe handle !SND_UMP here, but we can wait, if someone really 
requires this optimization.

> Conceptually, ALSA sequencer client and port correspond to the UMP
> Endpoint and Group, respectively; each client may have multiple ports
> and each port has the fixed number (16) of channels, total up to 256
> channels.
> 
> As of this commit, ALSA sequencer core just sends and receives the UMP
> events as-is from/to clients.  The automatic conversions between the
> legacy events and the new UMP events will be implemented in a later
> patch.
> 
> Along with this commit, bump the sequencer protocol version to 1.0.3.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

