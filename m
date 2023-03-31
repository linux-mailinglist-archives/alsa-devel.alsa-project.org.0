Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC24A6D2431
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 17:41:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3D801ED;
	Fri, 31 Mar 2023 17:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3D801ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680277310;
	bh=yg1lT0RIC2Lu0RSL3/IkRqjc1DA7qi5vE7NrE8i1w78=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b6/tABx3Kp7wUEiCzAnzjb+tTkXb9QWe+Ob8CP5D3LeXxCUmdaX347mL3hvtkFyb3
	 BAI6wN4U7F39lsRUIHIQ+yeD4KBPi5AhNmAM/ZaUyvkD1boiaFa6iFQRWyKm7Jfpn8
	 pJYE1czQ+yXDf/fb1OMhg9fSYp+LRmKVn+RT+axU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2348F800C9;
	Fri, 31 Mar 2023 17:40:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25505F80272; Fri, 31 Mar 2023 17:40:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D1BBF8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 17:40:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4393511D9;
	Fri, 31 Mar 2023 17:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4393511D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1680277250; bh=ThTL4KWgHG/tZfW4AcRY7tHyaaZnZtzFGZJwsneczXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f8KEIcgPtqyj3ApDdIT/suInIwozKjHou9KNQk9ppW38XZMsGRURoqqP8oHXi4wka
	 9B+aj92xS6b9cdKNb9qYi1koPy7O8NXwYvPe8akVUprjY93NM+qJBx3W9JNGxo08rV
	 82deO3veQXUvlqZ2NNXgORFvtMTi/14jHyH+Do/U=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 31 Mar 2023 17:40:46 +0200 (CEST)
Message-ID: <ca19e5ba-efbe-634d-f42d-93d18f27158b@perex.cz>
Date: Fri, 31 Mar 2023 17:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ALSA: hda/hdmi: Preserve the previous PCM device upon
 re-enablement
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230331142217.19791-1-tiwai@suse.de>
 <57ffa8e0-83fa-a982-9f48-abbe5f098732@perex.cz> <87v8ihhr9x.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87v8ihhr9x.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5UYXXURWAL2KP5HCCQZZ5VPNW7RIH7A5
X-Message-ID-Hash: 5UYXXURWAL2KP5HCCQZZ5VPNW7RIH7A5
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Wim Taymans <wim.taymans@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UYXXURWAL2KP5HCCQZZ5VPNW7RIH7A5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31. 03. 23 17:30, Takashi Iwai wrote:

> That said, the slot preservation becomes effective only when multiple
> devices are connected and they are on/off at the same time.  In such a
> case, the device order may be changed at each screen on/off with the
> current code, while this patch allows keeping the order.  Maybe I
> should emphasize about the multiple devices in the patch description.

I though about possibility to remove a monitor completely. Then you can have a 
gap in the PCM device list.

>> The sound server should combine the persistent path only from the ELD
>> information for the HDMI devices (if present). The problem may be when
>> multiple similar monitors are connected to the machine. It would be
>> probably nice to have an unique PCM device name for this usage with
>> the serial number of the connected monitor (but I don't think it's in
>> ELD? - it is in the EDID spec thought).
> 
> The name string appears actually in the dialog.  But the automatic
> switch doesn't happen.  So we need some improvement / fix.

The switch does not happen because PA/PW use the sink/output path which use 
the ALSA PCM device identification. This sink/output path also identifies the 
volume/port preservation. It is not ideal for the hotplug audio devices like 
HDMI, so we should have another way to identify those devices. The ALSA's PCM 
name / subdevice name fields in the info structure may be usable for this.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

