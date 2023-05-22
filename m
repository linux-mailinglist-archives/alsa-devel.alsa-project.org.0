Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C339470B6B6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C8911F1;
	Mon, 22 May 2023 09:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C8911F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684741495;
	bh=nmkyKer55l3i0+JDZNyDHG3PAu4nDZWOiZ4rOIUwdug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GFjwJrgxLaxSvfpc4UFC9Qxhl1qJ+G9cBvkFazPBUxhRYzKURanm4eLW88fF0apZd
	 yzEVssyCau1fqpNpN7JZrKMB2nJwVeX0O6JQPx3ay7oZT1sDA7ezda17f4mq2gN+vF
	 m2PWPt7wnwxSnKergYzMqo7z/TXBJB6ue3LAotvI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADC4AF80548; Mon, 22 May 2023 09:43:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3282CF80249;
	Mon, 22 May 2023 09:43:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20514F8024E; Mon, 22 May 2023 09:43:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BD74FF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:43:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9B8D61E35;
	Mon, 22 May 2023 09:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9B8D61E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684741415; bh=JKZbsYpYXwdD5bI8dIC6ZR15F7m3Z09nuwMP9rUxUE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uvnrS2TBCKZ1oZCgwQn/9yDPpopHvQ9PXxMB21ldN1nKwAWNetH6amYV/JMgSo3Oz
	 WJUgPDZ6IwLdFCZxLiqju+7cYUaN+ONNJe0Jl+f9by6aMrhrgZkjuS/G5RrcFOaZN3
	 cmbiW94EKCg0sTKPlSFTfLCYK7pN3nfkHgjoYpBk=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 09:43:33 +0200 (CEST)
Message-ID: <dccd87be-9607-95fe-f3c1-eac0db2c19b9@perex.cz>
Date: Mon, 22 May 2023 09:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 27/36] ALSA: seq: Add port direction to snd_seq_port_info
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-28-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-28-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NUHRA3FCNLE5BPLQIP7SLK7YHLNHMEV3
X-Message-ID-Hash: NUHRA3FCNLE5BPLQIP7SLK7YHLNHMEV3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NUHRA3FCNLE5BPLQIP7SLK7YHLNHMEV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:31, Takashi Iwai wrote:
> Add a new field "direction" to snd_seq_port_info for allowing a client
> to tell the expected direction of the port access.  A port might still
> allow subscriptions for read/write (e.g. for MIDI-CI) even if the
> primary usage of the port is a single direction (either input or
> output only).  This new "direction" field can help to indicate such
> cases.
> 
> When the direction is unspecified at creating a port and the port has
> either read or write capability, the corresponding direction bits are
> set automatically as default.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

