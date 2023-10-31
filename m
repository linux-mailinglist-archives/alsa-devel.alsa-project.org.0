Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 275397DD0BF
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 16:42:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35BC093A;
	Tue, 31 Oct 2023 16:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35BC093A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698766921;
	bh=4xfPpgYty6bg+bcMPioENs7IZ7M2WDxWFdt6BRUD9MA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IuD3LngpB5jAV8QGHZBqm4UeskPgbHHkcitWPvh+2Cx8FwzbtWoCzC79WkJPEY4CR
	 IkaE1HWpug0dtMBHGWY1a9p3JvoCGpNy3uIugKFc+Bqntv6jHZPCUYgudN1D+R3z8t
	 SFdKI7Avp4L3Z3nc0VRpvVx0KguviRamylFwYWM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7B97F80564; Tue, 31 Oct 2023 16:40:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 765F5F8055A;
	Tue, 31 Oct 2023 16:40:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7D59F8055B; Tue, 31 Oct 2023 16:40:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 427EFF80537
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 16:40:32 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6A64911D9;
	Tue, 31 Oct 2023 16:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6A64911D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1698766831; bh=fgZ6/QPrUrSwqLh2TU9guIWN1z7Mch6wv4wZo3j9gSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LhxeoZ5y4pGk88sBjBYue3T+qwiqYUkS0shm+QAbqDNaeEPiLh6jMQnY9BS7NWgbZ
	 keap55Nm5EbB2n4f/DRSRYpa5t4e7DOAZwtYeV6tbmumYYGcYP2wmCukhFygW2rKvM
	 FX2IVFiKHHx7KcY3mBFuFzcg6pv6RAT6GUZGxMMs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 31 Oct 2023 16:40:27 +0100 (CET)
Message-ID: <786d0d1c-958a-fb6f-ff11-59201abd98fc@perex.cz>
Date: Tue, 31 Oct 2023 16:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH alsa-ucm-conf 1/2] bytcr-wm5102: Add support for speakers
 connected to HPOUT2
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, alsa-devel@alsa-project.org
References: <20231021211614.115152-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20231021211614.115152-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L5DLYPNAUEMYOUPOTTNMLNNXL6M3XK3Q
X-Message-ID-Hash: L5DLYPNAUEMYOUPOTTNMLNNXL6M3XK3Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5DLYPNAUEMYOUPOTTNMLNNXL6M3XK3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21. 10. 23 23:16, Hans de Goede wrote:
> On the Lenovo Yoga Tab 3 YT3-X90 the speaker amplifiers are connected
> to the HPOUT2 output pins instead of the the SPK output pins.
> 
> Check for "cfg-spk:hpout2" in the components string which indicates
> this setup and add a ucm2/codecs/wm5102/HPOut2-Speaker.conf file
> for this setup.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks. Applied.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

