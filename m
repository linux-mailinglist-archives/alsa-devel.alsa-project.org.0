Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0217DCED0
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 15:13:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76DF293A;
	Tue, 31 Oct 2023 15:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76DF293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698761616;
	bh=7AHn0D1uqlhC4ieltS6178uW7y3maQhE6Usa+AuMKCQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lGf1Ao8EWTceXvCPrpm5YlO2Oa3jwT2Sa4D2tFKTx1wbXoqRFPRNwJ4gycXJb8mcW
	 QkRATwNbK3nDx4dSz3kqhz0ZPP+ebdSRkxyvtLNqLA8qfi7RQyXuxY5XI2ogsVeXan
	 XrL4Qkhpqaa4b/SsUuw5rpQccxFNPjLcjAOITIc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6BA8F80166; Tue, 31 Oct 2023 15:12:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1BEEF8016D;
	Tue, 31 Oct 2023 15:12:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 937BCF8020D; Tue, 31 Oct 2023 15:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63CBCF800FA
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 15:12:28 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1D40511D9;
	Tue, 31 Oct 2023 15:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1D40511D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1698761547; bh=5F9hanH9lnYZ43CzsRyuEU+xNXnyF7SJc5Oqz8xFESw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0ee66XEdkTIViSmMvq+v8YPzgxH66u7HmIZ6ZL08KtkCzenVUbkZWzQzbNxjBqrfC
	 xEm7GqLe8GHWdtvgPKtM0TXv7O51FwYK8iua94ftngpF0mLsmSfxbROHpJgXqP5Mfc
	 Jb3A2ebfkluPiJTeIf21CAPJiqmtDsvrNz2ioBTM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 31 Oct 2023 15:12:23 +0100 (CET)
Message-ID: <9cc465aa-fc55-1880-a649-6c13e6005be8@perex.cz>
Date: Tue, 31 Oct 2023 15:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH alsa-ucm-conf] codecs/es8316: Fix mono speaker settings
 from previous boot getting applied
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, alsa-devel@alsa-project.org
References: <20231029145007.24106-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20231029145007.24106-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ER6FJUTCV7O33AD5IMHQWBJUOSIBUMDW
X-Message-ID-Hash: ER6FJUTCV7O33AD5IMHQWBJUOSIBUMDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ER6FJUTCV7O33AD5IMHQWBJUOSIBUMDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29. 10. 23 15:50, Hans de Goede wrote:
> When codecs/es8316/MonoSpeaker.conf's EnableSeq was run last before
> shutdown the 'Playback Polarity' and 'DAC Mono Mix Switch' controls for
> Mono Speaker output get saved and restored on the next boot.
> 
> These settings are undone by the MonoSpeaker DisableSeq, but that never
> runs when an updated kernel switches from the default "cfg-spk:1" in
> components to "cfg-spk:2" for devices which do actually have 2 speakers,
> which causes the ucm profile to use codecs/es8316/Speaker.conf instead.
> 
> Set the 'Playback Polarity' and 'DAC Mono Mix Switch' controls to their
> defaults in codecs/es8316/EnableSeq.conf to avoid them getting stuck
> in Mono mix mode in this scenario.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   ucm2/codecs/es8316/EnableSeq.conf | 4 ++++
>   1 file changed, 4 insertions(+)

Thanks. Applied.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

