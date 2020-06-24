Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666C206EDB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 10:20:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6EBD1883;
	Wed, 24 Jun 2020 10:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6EBD1883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592986817;
	bh=3XgaGLchMap4uX4vj5HLeybgsNN5B0txlMgbaLX3QFs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoenL71kDpNBC48+cenUtN1avDq7bwR5tF5vB6attOavbthFAwtcqAPqGItH0800b
	 skDSaEEskV2jrXqmPBuEQ4CwzRYCI+PmH04uXWDyZLxMMggoLt5Nz8kW31nkVSrs1g
	 lxRaKonNst/BoU40b41MCkWErpP9dkpSlV5aW4rA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E25F80084;
	Wed, 24 Jun 2020 10:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E40F8015B; Wed, 24 Jun 2020 10:18:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87CEFF8012F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 10:18:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 242A5A003F;
 Wed, 24 Jun 2020 10:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 242A5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592986706; bh=psf8eoqEAtA4CN3CdzBkLanvQNFPI/+raI6Z4DzC3tI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=svkGokCEB/7oZnRoWmx7FB428/t47fSlQvxPZoEr0DgyY17ahBInSX503IsQiYSmV
 WkdgAOG397UiwS0Ne8GaX+f73kuTAGrOz+YCEQpwdDLoguK7HdANXZxHY5tVqxnVzm
 8d4WhT73ijXSlV/XubDWaS2SmQbHxJRDyPut1NAk=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Jun 2020 10:18:20 +0200 (CEST)
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
To: Takashi Iwai <tiwai@suse.de>, Harsha Priya <harshapriya.n@intel.com>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
 <s5hr1u4lxee.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f2da25c0-c740-4d44-ab66-6017622f7dde@perex.cz>
Date: Wed, 24 Jun 2020 10:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hr1u4lxee.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kai.vehmanen@intel.com, Emmanuel Jillela <emmanuel.jillela@intel.com>,
 alsa-devel@alsa-project.org
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

Dne 24. 06. 20 v 9:45 Takashi Iwai napsal(a):
> On Wed, 24 Jun 2020 01:26:36 +0200,
> Harsha Priya wrote:
>>
>> External HDMI receivers have analog circuitry that needs to be powered-on
>> when exiting standby, and a mechanism to detect PCM v. IEC61937 data.
>> These two steps take time and up to 2-3 seconds of audio may be muted
>> when starting playback.
>>
>> Intel hardware can keep the link active with a 'silent stream', so that
>> the receiver does not go through those two steps when valid audio is
>> transmitted. This mechanism relies on an info packet and preventing the
>> codec from going to D3, which will increase the platform static power
>> consumption. The info packet assumes a basic 2ch stereo, and the silent
>> stream is enabled when connecting a monitor. In case of format changes the
>> detection of PCM v. IEC61937 needs to be re-run. In this case there is no
>> way to avoid the 2-3s mute.
>>
>> The silent stream is enabled with a Kconfig option, as well as a kernel
>> parameter should there be a need to override the build time default.
> 
> I'm not sure whether the module option is the best interface.
> An alternative is a mixer element that controls dynamically.  Then
> it'll be per card unlike the module option.

+1, kcontrol seems the appropriate way to control this.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
