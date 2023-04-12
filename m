Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 057D46DFF51
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 22:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACF79101F;
	Wed, 12 Apr 2023 21:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACF79101F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681329636;
	bh=LvKXJKVNhxMvGBYuMwMT57KEE+v2L3jWxznZmgKxsEA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mSXmHY2/VDhee1oAG2dEoPfL7TwztYVORHUoBDIX5Rzm2MRJ5D2N0nCfpVIQgqt1U
	 SIDDQC73AQDuGRPvakopnDUYmCFPNsU5rvMom2F3ZHB6aPh2MlT2ZAQVlGz1cJQm/F
	 PYfiOvqf8xo74zmPceVm3FoQfVXLjVJBoww7jSBY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F4CF8025E;
	Wed, 12 Apr 2023 21:59:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AAA4F8032B; Wed, 12 Apr 2023 21:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EEDCF80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 21:59:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E19A811D5;
	Wed, 12 Apr 2023 21:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E19A811D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1681329571; bh=NHiD1FtFWjaeOzwxNy8tRLM3KhuiHz++ezxSowiCLx8=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=t9SD3D2vFTJ74g9fGadG9YzqcaS6KXgxZ/wSbcR/OeORGu/3Th5DHulY10cvGQPk+
	 DXSICEv1gTo4Dndgzt9URDtHjtm1Xh4kIazxM2rpD2BI9rdZBrLcIeOGefRxlrZnt8
	 9uJH0MJ9LxJMMuyuAqcyrjJNajDbmbNcvy5m1bdQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 12 Apr 2023 21:59:28 +0200 (CEST)
Message-ID: <54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
Date: Wed, 12 Apr 2023 21:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
 <3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz> <ZDEWyjdVE2IocpGY@ugly>
 <22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz> <ZDVnUj2B0EkMiOlA@ugly>
 <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz> <ZDWPy9YbXWWOqaC+@ugly>
 <7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz> <87ttxl7cxd.wl-tiwai@suse.de>
 <ZDZmDyOMYMD4Uu5g@ugly> <87wn2ho06z.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87wn2ho06z.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KRCLRID2X7C4FSG7UJ46NNAKP4JVJJZL
X-Message-ID-Hash: KRCLRID2X7C4FSG7UJ46NNAKP4JVJJZL
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRCLRID2X7C4FSG7UJ46NNAKP4JVJJZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12. 04. 23 12:37, Takashi Iwai wrote:
> On Wed, 12 Apr 2023 10:04:31 +0200,
> Oswald Buddenhagen wrote:
>>
>> On Wed, Apr 12, 2023 at 09:54:54AM +0200, Takashi Iwai wrote:
>>> I'm thinking whether we need to change anything in the kernel side for
>>> this at all.  Can't it be changed rather in alsa-lib side instead?
>>>
>> it could, but it would be a lot uglier. user space would have to do a
>> "man-in-the-middle attack" on the data, while in the kernel we can
>> just slightly modify the consumer. this would be particularly obvious
>> in the case of write() access.
> 
> But basically it'd be like fiddling sw_params temporarily for
> draining, I suppose?  And the "attack" here can be taken too
> seriously; the whole PCM operation can be somehow interfered if a
> process may have the access to the PCM device, and changing sw_params
> itself must not introduce too much trouble.

This looks like a sane proposal, but some drivers does not require the 
silencing at all, so we can probably skip this step for them (new 
SNDRV_PCM_INFO_PERFECT_DRAIN flag?).

The other not-yet-discussed option is to just print an warning in alsa-lib 
that the residue samples may be played (when no silencing / period size align 
is used). Then introduce a new helper function to setup silencing for the 
drivers without new SNDRV_PCM_INFO_PERFECT_DRAIN flag set.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

