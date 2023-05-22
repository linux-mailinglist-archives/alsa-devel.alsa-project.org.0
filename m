Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC070B558
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 08:50:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00F343E7;
	Mon, 22 May 2023 08:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00F343E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684738213;
	bh=26gHh3vjIxDjs86yDx/sLr5Cn97rZFxVxBeojhWnBGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KrvWlLjDaAbgbVncZDbTogKhB4fY0Cd3gqPhSBAFy4RPxYaUN9BURkKexvKN7iFkp
	 cz01jBrMz1z9JZi9NVNLBVfR9UejEz+IFPWn3z8pWEkfF4/ggUUZIGNjkH/EREvbUF
	 gWTVZl7zRDaSBRpl1NH/T27QeD0siH03vv3V/omk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AC10F80249; Mon, 22 May 2023 08:49:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D7BF8053D;
	Mon, 22 May 2023 08:49:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F9C4F80542; Mon, 22 May 2023 08:49:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 868D9F8026A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 08:49:17 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5AE701E2D;
	Mon, 22 May 2023 08:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5AE701E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684738156; bh=QYCJ5/0W0pIkoS0A9QM6hA193G2GsILrXrlCzpPDQL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AK6uoIvgDcblRd8rXBVM4+/TMDjVENYRgib5+u95ND04DCAVAzKBzcxzF55aYUCnP
	 1eZo64F2neAJ+ocsOMNFEVvy9IRvrYH/V0YbTpqy63QeQc/ojeDsCTHO93+Mj1Mj+n
	 wZsTfcvXBWD7OawM9J1nWWF6SeQbqTnNmlHdg/3Q=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 08:49:14 +0200 (CEST)
Message-ID: <4dd8ac9a-38c7-d28b-8dec-4e71886905d1@perex.cz>
Date: Mon, 22 May 2023 08:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 10/36] ALSA: usb-audio: Trim superfluous "MIDI" suffix
 from UMP EP name
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-11-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-11-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IC3ZTQYVTQHXJAG2ZFIYV562Y2ABXC2M
X-Message-ID-Hash: IC3ZTQYVTQHXJAG2ZFIYV562Y2ABXC2M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IC3ZTQYVTQHXJAG2ZFIYV562Y2ABXC2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> A single USB audio device may have multiple interfaces for different
> purposes (e.g. audio, MIDI and HID), where the iInterface descriptor
> of each interface may contain an own suffix, e.g. "MIDI" for a MIDI
> interface.  as such a suffix is superfluous as a rawmidi and UMP
> Endpoint name, this patch trims the superfluous "MIDI" suffix from the
> name string.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

