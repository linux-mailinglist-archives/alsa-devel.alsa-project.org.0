Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56571150A7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98991918;
	Mon,  6 May 2019 17:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98991918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557157760;
	bh=CTei82Q3nJ1/AwjVcmr7kglYCzptlpXPc8XJ+huvNQY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhPQGhLouRAbf07eiNOcOfz/KG7Bo0uXpP7lbDxbbkF7tqT0ypbk9ZgXJixeeylG3
	 YqHgM2GqcD3F0uLqS1EP1yQjRkdkLx6tC4/pgpXhgYllKoun0DLIQkEjg/7POowQi0
	 iAf7UQz7BaQ26XSkbd71u/eqFTXuRRCpvbddc5Us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E12F896F0;
	Mon,  6 May 2019 17:47:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DB87F896F0; Mon,  6 May 2019 17:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E70C3F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70C3F80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="297594840"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 06 May 2019 08:47:26 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 96D1458010A;
 Mon,  6 May 2019 08:47:25 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
 <bebcb1f6-1d8b-63aa-a22d-b48047b64809@linux.intel.com>
 <s5hzhnz3817.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5286a2bd-cb71-8094-84d5-6ac2ad2b1c02@linux.intel.com>
Date: Mon, 6 May 2019 10:47:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hzhnz3817.wl-tiwai@suse.de>
Content-Language: en-US
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 subhransu.s.prusty@intel.com, samreen.nilofer@intel.com
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
 monitor in hw_params
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 5/6/19 10:41 AM, Takashi Iwai wrote:
> On Mon, 06 May 2019 17:37:32 +0200,
> Pierre-Louis Bossart wrote:
>>
>> On 5/6/19 1:59 AM, libin.yang@intel.com wrote:
>>> From: Libin Yang <libin.yang@intel.com>
>>>
>>> This patch move the check of monitor from hw_params to trigger callback.
>>>
>>> The original code will check the monitor presence in hw_params. If the
>>> monitor doesn't exist, hw_params will return -ENODEV. Mostly this is OK.
>>>
>>> However, pulseaudio will check the pcm devices when kernel is booting up.
>>> It will try to open, set hw_params, prepare such pcm devices. We can't
>>> guarantee that the monitor will be connected when kernel is booting up.
>>> Especially, hdac_hdmi will export 3 pcms at most. It's hard to say users
>>> will connect 3 monitors to the HDMI/DP ports. This will cause pulseaudio
>>> fail in parsing the pcm devices because the driver will return -ENODEV in
>>> hw_params.
>>>
>>> This patch tries to move the check of monitor presence into trigger
>>> callback. This can "trick" the pulseaudio the pcm is ready.
>>>
>>> This bug is found when we try to enable HDMI detection in
>>> gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi in UCM,
>>> pulseaudio will try to parse the hdmi pcm devices. It will cause failure if
>>> there are no monitors connected.
>>
>> Out of curiosity, how is this handled in the legacy driver? I haven't
>> done this for a long time but I remember very clearly being able to
>> play on the HDMI:3,7, etc devices without any monitors
>> connected. You'd get of course no sound but there was no error
>> reported to userspace. The hardware is perfectly capable of pushing
>> samples into the display controller using the HDAudio/iDisp link.
> 
> As mentioned in the thread, PA just picks up the stream that is
> connected via a monitor by checking / notified by the corresponding
> Jack control.  On hdac_hdmi driver, the jack control has different
> base name that is irrelevant with the output pins, so PA doesn't know
> how to interpret it, hence it's ignored.

Yes, but do we have any error checks in the hw_params or trigger cases 
with the legacy driver?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
