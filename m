Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45193626AB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 19:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A76716CF;
	Fri, 16 Apr 2021 19:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A76716CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618593817;
	bh=Nl3WRkdOwsXa0W+pq+SbT6+39ibFdi6rDBdhFKIh+zE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VqbezeFHG6d7sZdUtMDRGhairWAeRIzVPiaZSvGsmmmGoGbKKQ2pP6EVwSMsjfV0t
	 i11O1bwly6rtFcuV441iPgSbvXmMnABvUbAZ3WzBe3S+BeUXl6xArJJk2/Ak4uK9I+
	 kNNA8qnZWU/yjotrccefDb1Av7wueMCZfWI6zi98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DB3F80269;
	Fri, 16 Apr 2021 19:22:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B0CBF8025B; Fri, 16 Apr 2021 19:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F2D2F800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 19:21:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C6B6EA003F;
 Fri, 16 Apr 2021 19:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C6B6EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618593711; bh=Uy6qo0ElD3bOqLDyWsDg+JjHGHh11SzaFJBCP/SR8gY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Zr/V8glek/BgfV3+z3hkbxuPFUMFREkcB0HR4oaQQ68QiAUoKS30QuXfxdPSA6MuO
 s++494DkEoFAzskB0AnIsNP+d9s1FA9LrWZiJyPlAcSqZJc9CivRKI484UVGAPNOKZ
 hTalwsSb5piOL3qKEz2jsU6SrPoR16xFM2nJKaYQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 16 Apr 2021 19:21:46 +0200 (CEST)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Ideapad S740
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210416081211.20059-1-tiwai@suse.de>
 <be178038-8e42-34db-3804-f27240b2d488@perex.cz>
 <a5fee517-c12e-1cb0-755f-453d6bb47795@linux.intel.com>
 <s5h5z0mgpsu.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b04b5f9b-1b19-e216-793a-dde9c3d66371@perex.cz>
Date: Fri, 16 Apr 2021 19:21:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <s5h5z0mgpsu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Ryan Prescott <ryan@cousinscomputers.net>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 16. 04. 21 v 18:25 Takashi Iwai napsal(a):
> On Fri, 16 Apr 2021 18:05:17 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>> On 4/16/21 3:47 AM, Jaroslav Kysela wrote:
>>> Dne 16. 04. 21 v 10:12 Takashi Iwai napsal(a):
>>>> Lenovo Ideapad S740 requires quite a few COEF setups to make its
>>>> speakers working.  The verb table was provided from Ryan Prescott as
>>>> the result of investigation via qemu:
>>>>    https://github.com/ryanprescott/realtek-verb-tools/wiki/How-to-sniff-verbs-from-a-Windows-sound-driver
>>>
>>> [Cc: to Kailang / Realtek]
>>>
>>> I believe that this sequence contains I2C writes to amplifier chips. It would
>>> be really helpful, if Realtek can provide more information for the I2C master
>>> interface for their codecs (describe basic I2C I/O).
>>
>> The biggest problem is to figure what address/value pairs to write
>> with I2C into the amplifiers, and here the catch is that those I2C/I2S
>> amplifiers may or may not be sourced from Realtek, and it'd be
>> difficult for Realtek to provide documentation on their competition,
>> wouldn't it?
> 
> Sure, that's another problem.  But currently it's not clear even how
> to communicate via I2C/whatever to the underlying chip, as it's done
> via the vendor-specific COEF verb.  At least this could be opened, I
> hope.

The nice thing if we know the I2C master communication is that we can create
I2C bus in the HDA driver and do run i2cdetect to detect the connected chips.
Yes, it's partial information, but it's far more better than this unreadable
coef implementation.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
