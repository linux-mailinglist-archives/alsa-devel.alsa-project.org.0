Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F01B7C52
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 19:02:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC5616A8;
	Fri, 24 Apr 2020 19:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC5616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587747775;
	bh=GkUgODYgyE3bP64RqKBYCBXHK62xoVCXM+MJlh3TwVc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IYPtxw+ugrLoEuWgmAg5Axarpz+wMZgqext+4iAsE6cnCXqU9Pl8caEGNCQQkVWBy
	 HYeliF61nkV4/R+d8PbFS9eXUD+kbEhBkFCdWTTbcsnUjrwVb9UqqfXrWsYircqf3h
	 4h5a3pV21xkQwU76lv+N9/uKjXPxJjOcbrFbRwa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 349BFF80142;
	Fri, 24 Apr 2020 19:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F6B2F800BE; Fri, 24 Apr 2020 19:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF3EF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 19:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF3EF800BE
IronPort-SDR: fUy9FHOXm46BcLhutVMa7/IKtO2bKN0QjAbgqwmMreWvtl/1pu9oH+hPBSZFtJpY9JmhdnbloB
 qlGuFN6JkZOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 10:01:26 -0700
IronPort-SDR: q6wAWx1DtkygXgcOFSqseIh3SwhyDaJPYnJohbsaGvhb4twiog5+Zz/KXtypgSJWcmqvuXZeoj
 tAvLhwsxnSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="274663544"
Received: from jinglu1-mobl1.amr.corp.intel.com (HELO [10.254.176.234])
 ([10.254.176.234])
 by orsmga002.jf.intel.com with ESMTP; 24 Apr 2020 10:01:25 -0700
Subject: Re: [PATCH] ASoC: snd-sof-intel-hda-common - add hda_model parameter
 and pass it to HDA codec driver
To: Takashi Iwai <tiwai@suse.de>
References: <20200424092520.23989-1-perex@perex.cz>
 <alpine.DEB.2.21.2004241517530.2957@eliteleevi.tm.intel.com>
 <s5hk125rr82.wl-tiwai@suse.de>
 <28900433-f2a7-bf4e-7861-5522f0aedee1@linux.intel.com>
 <s5h368sswa9.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ce15396a-8d6c-c414-068c-ab8197ae9599@linux.intel.com>
Date: Fri, 24 Apr 2020 12:01:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5h368sswa9.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


>>>> Hmm, I wonder is this now doing more harm than good. Based on browsing
>>>> through the related code in hda-codec.c and friends, it would seem
>>>> "sofbus" as the default is mostly harmless, but I could have missed
>>>> something.
>>>
>>> That's currently harmless since no codec driver defines "sofbus"
>>> model, hence the HDA parser continues to match with the default
>>> quirks. OTOH, the fixed "sofbus" model is fairly useless.  So, feel
>>> free to take my ack, too:
>>
>> For my education, are you saying that the default should be that the
>> modelname is NULL, and the hda auto parser will use known quirks based
>> on PCI/SSID information, and when the user sets the model name to a
>> non-NULL string it will force a specific quirk to be used?
> 
> Yes.  If the given string matches with the pre-defined table, the
> quirk entry is used and applied.  If no string is given or it doesn't
> match, it continues to the fallback quirk, that is, matching with PCI
> SSID, then codec SSID.

Sounds good, thanks for the precisions Takashi
