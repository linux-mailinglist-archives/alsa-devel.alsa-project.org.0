Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A4358A39
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F0784D;
	Thu,  8 Apr 2021 18:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F0784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617900928;
	bh=AA5N8FVJATHffzYsRs6j95hwntt4woDXEFyXZobW3I4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ng+YTWygn6XJmglyB9ct3zyQJe6F2i8hWZrK8B04diOqGLP6rVxSVLyAzO14WLyey
	 A0d6ZwBF7KHNxUNVEvxDjE7bgUzT5WZ+QmL1vo1xIpyGbWKc3E9M8yehChMiTNvi1u
	 6JMFM6R+HcGbI8FGfiQ86LE1yyNagQH9m61zHSV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CBAAF80246;
	Thu,  8 Apr 2021 18:54:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46E7FF80169; Thu,  8 Apr 2021 18:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD83F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:53:48 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6CB0BA0040;
 Thu,  8 Apr 2021 18:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6CB0BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617900828; bh=Dij16s5tjTje+BNkXJ8X2uxD526+5cPGL5E7fxAYASs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Orx8DjlFtVwvKH58a8rabAhnpiUOYNo7MHcKxTz6AHGCAm2iAIE5m1eTXa5GbHAeP
 B3iNg7fWPdiV6b0Ge8Dk41DnqVanl8aCu6FB0nDhWHa29+Y+r4oiw8fy75pVxuIHlj
 CBnT2rP8LMgEun+o5UKLn8iYaPAnyDPuzPQWHoJA=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 18:53:43 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
Date: Thu, 8 Apr 2021 18:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 08. 04. 21 v 17:32 Pierre-Louis Bossart napsal(a):
> 
> 
> On 4/8/21 10:01 AM, Jaroslav Kysela wrote:
>> When we have a common standard layer for the plug-and-play handling (udev), we
>> should concentrate to allow changing / refining of this information there.
>> Those strings are not used for anything else than the user space. So from my
>> view, there's no reason to create another mechanism to handle the overrides.
>> It should be a safe, fast, flexible and_optional_  solution. The udev can
>> alter the sysfs attributes directly without any hassle with the file
>> modifications or looking for another way to pass / store this information
>> somewhere.
> 
> There's one part where I am lost.
> 
> The initial idea of udev what to modify kernel parameters to pick a 
> different path for firmware/topology before probing the PCI driver. At 

This may be a problematic point. The kernel cmdline cannot be modified from
udev (as far as I know). The module parameters can be set using modprobe's
config files or when loaded with sysfs attributes (/sys/module/*/parameters).
Eventually, you can call the modprobe command with custom module parameters
when the appropriate MODALIAS is probed.

Perhaps, I'm missing something here, too. Some example udev rules may help.

> that point there is no card and no sysfs attributes just yet, they will 
> be added at a later point during the probe itself.
> 
> So are we talking about a second set of rules that would be applied when 
> the card is created?

Yes, I'm talking about rules which depends on the sound driver specific sysfs
attributes (you can match the modified /sys/module/*/parameters here).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
