Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7DE3587CE
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 17:06:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59571669;
	Thu,  8 Apr 2021 17:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59571669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617894399;
	bh=T+9gpk/uIg8B1M9aDfe1zj65owCE2SF6/6tBtQwcL2g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQsbOfEmHMNQC4gMTzxgsrXsaRrwL7n2vVzCOC5KUdr54xuSun0VZw++TnDr8nsAc
	 /8/qhyfpEQElfcKu4j9WSG1Mf4W6zJPciqvhp87s4YXnkw5GeFuPWCy36gkzBtmY8U
	 qfaJEkFW4LR1Bw22KiVz2eL5r06tuLQaT2uWQudE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 135D9F80246;
	Thu,  8 Apr 2021 17:05:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDB83F8020B; Thu,  8 Apr 2021 17:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D08FF8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 17:05:05 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7C049A003F;
 Thu,  8 Apr 2021 17:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7C049A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617894304; bh=2BWV/ZxV7WrUlxdpzs0zG3vUU8glL3XRznNhbrnKICs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=M9Tk890BPzs29bCuo3yuX4jo3TyTvjNsw6eI9Llblm40ga2Ih5ndtg7+xVriTES68
 Rv643zhJguA/o5y7OcRqamCJRD6Uj12AEJQr6Oa1YwArV/czOSj9XR+uHqW41V4Oym
 B1/XB71qtBpdARgMfdi3yjqwGwKlBYN8MjWAWhc4=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 17:04:59 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <a15ad17a-e86d-50b3-64e2-9c9dd019ff2e@linux.intel.com>
 <20210408144706.GK4516@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <9c758fde-cad7-8c9f-ac9d-61357ce2581e@perex.cz>
Date: Thu, 8 Apr 2021 17:04:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210408144706.GK4516@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@google.com>,
 ALSA development <alsa-devel@alsa-project.org>
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

Dne 08. 04. 21 v 16:47 Mark Brown napsal(a):
> On Thu, Apr 08, 2021 at 09:12:57AM -0500, Pierre-Louis Bossart wrote:
>> On 4/8/21 8:18 AM, Takashi Iwai wrote:
> 
>>> I guess the question here is how to identify the proper profile for a
>>> certain platform and how to get it passed over the whole system.
>>> Theoretically, the rename of the card name or mixer name strings could
>>> be done in user-space side, too (e.g. mapping in alsa-lib or
>>> whatever), so I don't think it mandatory to make them variable via
>>> sysfs, if it's meant only for the consistency reason.
> 
>>> Didn't we discuss in the past about the possibility to store the
>>> profile name in the card component string?
> 
>> Because of OEM or user customization, we will have multiple versions of
>> firmware and topology that will have to be enabled in specific setting. The
>> last thing we want is hard-coded rules in the kernel on which firmware
>> customization to use for which platform.
> 
> ...
> 
>> If the users wipes the OEM image and installs a standard distribution on the
>> same device, they would by default use the firmware generated from the SOF
>> main branch, without any differentiation and 3rd party IP.
> 
>> So the point is: how do we expose this information to UCM? In the machine
>> driver where the card is created? There is zero information on what the
>> firmware/topology does. The information can only be extracted when the
>> topology is loaded when probing the SOF component driver.
> 
> So what we're looking for here is a mechanism to tell userspace what
> firmware has been loaded?

It's just a part of the issue with the proper runtime sound card
identification. But yes, the firmware can really change the created sound card
(controls, PCM devices, paramters for those devices). In this case, UCM should
pick another configuration.

I'm looking for a straight solution here.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
