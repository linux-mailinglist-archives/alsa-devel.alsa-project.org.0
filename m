Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7610A6D23DA
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 17:19:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5679D1F0;
	Fri, 31 Mar 2023 17:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5679D1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680275989;
	bh=D7eg8ul8cyhL0bbIT690gjKeQHy9WbKpUv87HqP2IiM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R0oxY3H/+mZZmk0YirRoUk8e4rarjJGgGiyiVnGKXStUnWo4vQNLB/iQhUyoeYgbq
	 dgRVdvBgwNOxyHhDkSXzF5xWBc2YhZ4/u/wRn7qYpiKt9IvRzaZIWjHzdUDhVkUX85
	 g7N6JpDyrxSb2xvxm0H2llFmvn7I5HUFQVQL00hA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BEB5F8021D;
	Fri, 31 Mar 2023 17:18:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48143F80272; Fri, 31 Mar 2023 17:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60A51F8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 17:18:49 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 16AB911CB;
	Fri, 31 Mar 2023 17:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 16AB911CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1680275929; bh=BEXFYqDgQzW2LPZSsgpG81FG7c3UoME/2ezYI8kEGP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbktikxFWnzFkFLy9c0NJ0LbIqnVgjxl2hBSPjUbPBfCTYO2i0oD9cCNSP5W0g3Q6
	 ivvitp3zl6uRmQtGyi9w9cilZipsxluRonLxyHcC7k1mg/T85B8g0WsPnYmqs9oOzu
	 ldaDqtDc4PZTVzwdwLDx8mH4FCzT0IeXtlnEzjcY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 31 Mar 2023 17:18:45 +0200 (CEST)
Message-ID: <57ffa8e0-83fa-a982-9f48-abbe5f098732@perex.cz>
Date: Fri, 31 Mar 2023 17:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ALSA: hda/hdmi: Preserve the previous PCM device upon
 re-enablement
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230331142217.19791-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230331142217.19791-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LMEX5U3ZY2IRZXRPLYFPSBSADPVMERO2
X-Message-ID-Hash: LMEX5U3ZY2IRZXRPLYFPSBSADPVMERO2
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Wim Taymans <wim.taymans@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMEX5U3ZY2IRZXRPLYFPSBSADPVMERO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31. 03. 23 16:22, Takashi Iwai wrote:
> When a DRM driver turns on or off the screen with the audio
> capability, it notifies the ELD to HD-audio HDMI codec driver via
> component ops.  HDMI codec driver, in turn, attaches or detaches the
> PCM stream for the given port on the fly.
> 
> The problem is that, since the recent code change, the HDMI driver
> always treats the PCM stream assignment dynamically; this ended up the
> confusion of the PCM device appearance.  e.g. when a screen goes once
> off and on again, it may appear on a different PCM device before the
> screen-off.  Although the application should treat such a change, it
> doesn't seem working gracefully with the current pipewire (maybe
> PulseAudio, too).
> 
> As a workaround, this patch changes the HDMI codec driver behavior
> slightly to be more consistent.  Now it remembers the previous PCM
> slot for the given port and try to assign to it.  That is, if a port
> is re-enabled, the driver tries to use the same PCM slot that was
> assigned to that port previously.  If it conflicts, a new slot is
> searched and used like before, instead.

I don't like this workaround so much, because the devices should be assigned 
from the first PCM device.

The sound server should combine the persistent path only from the ELD 
information for the HDMI devices (if present). The problem may be when 
multiple similar monitors are connected to the machine. It would be probably 
nice to have an unique PCM device name for this usage with the serial number 
of the connected monitor (but I don't think it's in ELD? - it is in the EDID 
spec thought).

> @@ -1399,6 +1408,7 @@ static void hdmi_detach_hda_pcm(struct hdmi_spec *spec,
>   	idx = per_pin->pcm_idx;
>   	per_pin->pcm_idx = -1;
>   	per_pin->pcm = NULL;
> +	per_pin->prev_pcm_idx = idx;

Maybe this line should be moved up before 'pcm = NULL'. The pcm_idx and 
prev_pcm_idx members are related.

For now:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

