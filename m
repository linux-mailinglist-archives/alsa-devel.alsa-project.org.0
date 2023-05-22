Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE670B555
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 08:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A33826;
	Mon, 22 May 2023 08:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A33826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684738116;
	bh=TUKti4OQezqJ3TOQn7Yu1ElRayvW1GE/jaa2XzEe6p0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sa9vLuG7OM7eNX4bSVnkZFPKckGkjo+mV+HFyLhbYPLsxKani6btZRAyqiVYTYZpE
	 vwwOjdB5WeWYK+LO2DJno5br5HSwt6eI/uwbGbmmmGl94tpt7mjhGgG6KpEu5obD/Y
	 7fZK2upiBTX5RJjPu7FIAwRVSaIncHnP9E4aJ5oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94CE8F80544; Mon, 22 May 2023 08:47:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A3A3F80249;
	Mon, 22 May 2023 08:47:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E1FDF8024E; Mon, 22 May 2023 08:47:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 880B0F80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 08:47:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 721841E3C;
	Mon, 22 May 2023 08:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 721841E3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684738029; bh=EUZHkByS3yAgs0/ZlnbGmF6goxGGwEutzJPOLR7G26M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A3R2sWVnvupfsCoMl9N2pLWf6XAL2n48FqSSa9nju28jLj74gyFeMDxYUY9ASLHc7
	 aq8xIUjZ6l70+KmTEi0waJQ84mFHDmMw9zePLz1aBtAlULYReqEJcWFZLgTppZFBq5
	 sAGyol7hMxOA2CT1LAPiCuuEoCc2Xc8EHtNKvD8w=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 08:47:07 +0200 (CEST)
Message-ID: <74dbe9c4-f759-df1c-ebe4-7a5aa6fdd4f3@perex.cz>
Date: Mon, 22 May 2023 08:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/36] ALSA: usb-audio: USB MIDI 2.0 UMP support
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-9-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-9-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QBME7NLATG4EGYOQBE2RBNFTGUWA3NSM
X-Message-ID-Hash: QBME7NLATG4EGYOQBE2RBNFTGUWA3NSM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBME7NLATG4EGYOQBE2RBNFTGUWA3NSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> This patch provides a basic support for USB MIDI 2.0.  As of this
> patch, the driver creates a UMP device per MIDI I/O endpoints, which
> serves as a dumb terminal to read/write UMP streams.
> 
> A new Kconfig CONFIG_SND_USB_AUDIO_MIDI_V2 manages whether to enable
> or disable the MIDI 2.0 support.  Also, the driver provides a new
> module option, midi2_enable, to allow disabling the MIDI 2.0 at
> runtime, too.  When MIDI 2.0 support is disabled, the driver tries to
> fall back to the already existing MIDI 1.0 device (each MIDI 2.0
> device is supposed to provide the MIDI 1.0 interface at the altset
> 0).
> 
> For now, the driver doesn't manage any MIDI-CI or other protocol
> setups by itself, but relies on the default protocol given via the
> group terminal block descriptors.
> 
> The MIDI 1.0 messages on MIDI 2.0 device will be automatically
> converted in ALSA sequencer in a later patch.  As of this commit, the
> driver accepts merely the rawmidi UMP accesses.
> 
> The driver builds up the topology in the following way:
> - Create an object for each MIDI endpoint belonging to the USB
>    interface
> - Find MIDI EP "pairs" that share the same GTB;
>    note that MIDI EP is unidirectional, while UMP is (normally)
>    bidirectional, so two MIDI EPs can form a single UMP EP
> - A UMP endpoint object is created for each I/O pair
> - For remaining "solo" MIDI EPs, create unidirectional UMP EPs
> - Finally, parse GTBs and fill the protocol bits on each UMP
> 
> So the driver may support multiple UMP Endpoints in theory, although
> most devices are supposed to have a single UMP EP that can contain up
> to 16 groups -- which should be large enough.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

