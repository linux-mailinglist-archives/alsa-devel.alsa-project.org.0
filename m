Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 984029BE4D0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 11:51:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116FD14E0;
	Wed,  6 Nov 2024 11:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116FD14E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730890317;
	bh=91xyZJvrOWAyzLR65JD4tI5hHPkKw1Ximo0E5o5L5LA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tjd80US8yK7oeJ0PbJnItM8VgEPLP5pYRI0MhJZBGxQiWvrwTMm4oQk96b5Kx1LPV
	 yg+hqRsgtCH4/mv7f9fmkcQsjJ7txPRe+QHpa/2sYSfd24YEbdi9Dej3eY/0VxbY1E
	 KSuBvspjqjXlU/KTCCUEwavE8vsGNF0+3oQbFspI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B70AF805BE; Wed,  6 Nov 2024 11:51:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D517F805AD;
	Wed,  6 Nov 2024 11:51:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69CA4F8013D; Wed,  6 Nov 2024 11:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,TRACKER_ID,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E2E9F800C8
	for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2024 11:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E2E9F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com
 header.a=rsa-sha256 header.s=default header.b=pWTGuSqQ
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 0217A2FC004A;
	Wed,  6 Nov 2024 11:51:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1730890277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUxM+TDhBc4tT25gDHBZmTz+F++cFnGwVx5y8aqIjCc=;
	b=pWTGuSqQQLWNggA8vgbxSAtEiLPvgwCqK5toesG0Ekg7Xr9b2qPT1+S/rKHjWFpZdtv354
	PRouOLBLvU5wxdS5HwcSGEDYDEDWR3z7GGxFJWxtIOsnveHO1NldvMwK1U+nKLw19L64W4
	1ProqEjkrHT71+KGPdMocqneSH8Jr2o=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b768433e-c146-46af-a077-3e2631a4c292@tuxedocomputers.com>
Date: Wed, 6 Nov 2024 11:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1.y] ALSA: hda/realtek: Fix headset mic on TUXEDO Gemini
 17 Gen3
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Christoffer Sandberg <cs@tuxedo.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20241106021124.182205-1-sashal>
 <20241106094920.239972-1-wse@tuxedocomputers.com>
 <2024110606-expansion-probing-862b@gregkh>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <2024110606-expansion-probing-862b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MOPHC3KIGSCOCLYLURF64RB573SREH6Q
X-Message-ID-Hash: MOPHC3KIGSCOCLYLURF64RB573SREH6Q
X-MailFrom: wse@tuxedocomputers.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOPHC3KIGSCOCLYLURF64RB573SREH6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi

Am 06.11.24 um 11:42 schrieb Greg KH:
> On Wed, Nov 06, 2024 at 10:49:04AM +0100, Werner Sembach wrote:
>> From: Christoffer Sandberg <cs@tuxedo.de>
>>
>> Quirk is needed to enable headset microphone on missing pin 0x19.
>>
>> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: <stable@vger.kernel.org>
>> Link: https://patch.msgid.link/20241029151653.80726-1-wse@tuxedocomputers.com
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> ---
>>   sound/pci/hda/patch_realtek.c | 1 +
>>   1 file changed, 1 insertion(+)
> What is the git commit id of this in Linus's tree?

0b04fbe886b4274c8e5855011233aaa69fec6e75

Is there a specific format/tag to add it to the commit? something like 
"Mainline-commit: <hash>". Didn't find anything in the documentation.

>
> thanks,
>
> greg k-h

Kind regards,

Werner Sembach

