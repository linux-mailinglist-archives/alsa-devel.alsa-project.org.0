Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9D358B3E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 19:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C458882E;
	Thu,  8 Apr 2021 19:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C458882E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617902540;
	bh=qT+6EuClEg+lCz4tjc8SSH8FDm+zGeKVAxDjgt8p13U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VaA3dXZXUgImidaZEhpLjnBQ5dEuFAgJO0dFsbSRBGAtjzwVLT2dr812GVfPVCuf9
	 AYwfCum9Bqqu+beBp2MvnnqFmDnz881flB5RYllOgUXvvqpjfs0Q04tDdwLiJR5m97
	 CSHX8kLyV4SAQPZWDs361D2/wS3eLPifnnNuwdnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C5FF80162;
	Thu,  8 Apr 2021 19:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9149F80169; Thu,  8 Apr 2021 19:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61493F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 19:20:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 24973A003F;
 Thu,  8 Apr 2021 19:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 24973A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617902445; bh=MQ+MGJoS1FJxyn+XBTaT4ubKo2gaZe/hohWuL7EowNg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pUmf7Z60kz7tGdBFOKh6bPTyNaBInL85Cib3pkPu70DD0sqQFf42bIVOYTfEhcINe
 QQAR7QMPCLzs8+HE9dtFe00MqcYZFYmegx1sZLKyDhIDw8mn/FkcQrgr8QY8r36uP+
 Nc32H1ELEhfF4t4lKzt2p3B+6WHRYfaX/w2jWNQ8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 19:20:39 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <20210408162250.GN4516@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <9ab048b1-09a9-f6c9-da84-bc6371e1720d@perex.cz>
Date: Thu, 8 Apr 2021 19:20:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210408162250.GN4516@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 08. 04. 21 v 18:22 Mark Brown napsal(a):
> On Thu, Apr 08, 2021 at 05:01:14PM +0200, Jaroslav Kysela wrote:
> 
>> There are two things to consider (please, don't concentrate to UCM here):
> 
>> 1) the card identification
>> 2) the user experience
> 
>> Actually, the generic ASoC drivers are too much generic and they didn't
>> provide a solid information about the hardware.
> 
> So if the information provided through the driver is too generic then we
> should ideally be fixing those drivers/systems to do something sensible.
> For the DT systems the generic cards have properties that let the system
> just specify names directly so it will just be a case of setting them
> properly and it should just be the x86 systems that are a problem.  ACPI
> is a bit of a lost cause here, most of the systems aren't interested in
> supporting Linux in the first place and the idioms there aren't great,
> but for DT it's reasonably tractable to push back on people if there's
> issues and it's much more scalable to do that than telling individual
> users to do that.

DT works only partially. Also, you need the DT compiler to change something,
it's easier to overwrite things in the booted system. The user experience is
lower with DT.

And as Pierre-louis noted, it may be possible to modify the firmware setup in
udev.

>> As you can see, the information for both drivers is quite inaccurate and users
>> (including me) may want some flexibility to change those strings to something
>> else. It may resolve some UCM problems, but it's just one small piece of the
>> issue.
> 
> It feels like if we're conflating end user configuration and what we're
> reporting to userspace for userspace to key off we're going to end up
> causing confusion and/or tying ourselves in knots when people update
> both places, for example if you're trying to figure out which
> configuration was used but the values used to select the configuration
> that was used have changed.
> 
>> Another issue is when the udev driver loader can change some parameters which
>> modifies the driver behaviour and sound device structure for the given card
>> (as discussed in another thread).
> 
> Not sure I've seen that thread, I've certainly not seen anything on
> github.

I meant the e-mail replies to this thread started by Pierre-louis about OEM
firmwares for the SOF driver. Sorry for the confusion.

>> When we have a common standard layer for the plug-and-play handling (udev), we
>> should concentrate to allow changing / refining of this information there.
>> Those strings are not used for anything else than the user space. So from my
>> view, there's no reason to create another mechanism to handle the overrides.
>> It should be a safe, fast, flexible and _optional_ solution. The udev can
>> alter the sysfs attributes directly without any hassle with the file
>> modifications or looking for another way to pass / store this information
>> somewhere.
> 
> We could add a new sysfs file for user overrides, or alternatively have
> a new non-overridable file which contains whatever the kernel would set
> by default so it's always available in case things start to get
> confused (ie, you can always look at the original value even if it's
> been overwritten later)?

It's an interesting idea. Preserving the original strings may be wanted.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
