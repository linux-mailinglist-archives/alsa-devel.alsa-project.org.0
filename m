Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 744A611057A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 20:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF7861668;
	Tue,  3 Dec 2019 20:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF7861668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575402566;
	bh=S98zDd+NpJWBZ4QihPVDsdcE4KtY+/1L7LqcxywTzcg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcKHnb89wDx81w+MJk3Hbi6Q+mwIfnm18ASFxcHDZMnj6Zg+01l2OkvpgJgbqouOm
	 PBWsDBh8P4/WvUlHIjqSVO9NCq0i9BxJ9qd442nm80jV2Ni5ZqsiyQIjiiN9eGM9UV
	 8H9Ps31DHGX5/mObnhtGfW31/QnSHStlqaR2ACKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97885F8015A;
	Tue,  3 Dec 2019 20:47:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E34E9F80227; Tue,  3 Dec 2019 20:47:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0DCBF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 20:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0DCBF800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 11:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,274,1571727600"; d="scan'208";a="201118703"
Received: from cjlabarg-mobl2.amr.corp.intel.com (HELO [10.252.207.140])
 ([10.252.207.140])
 by orsmga007.jf.intel.com with ESMTP; 03 Dec 2019 11:47:32 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20191203161908.7496-1-perex@perex.cz>
 <4bd562e7-64f6-1852-fe64-d280e91569c3@linux.intel.com>
 <s5hlfrtfcqk.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d2e3f6ff-0c9f-e456-fc1b-2b4312597fe6@linux.intel.com>
Date: Tue, 3 Dec 2019 13:47:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <s5hlfrtfcqk.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: snd-sof-pci - add model parameter
 and pass it to HDA codec driver
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


>>> It may be useful to pass the specific model to the generic HDA codec
>>> routines like the legacy HDA driver (snd-hda-intel) allows.
>>> The model name "sofbus" is tricky anyway.
>>
>> Humm, I must admit I have never looked at this for the legacy driver,
>> and I am a bit confused on what this would be used for?
>> The legacy driver uses codec->modelname but I can't figure out this
>> part in hda_codec.c
>>
>> if (codec->bus->modelname) {
>> 	codec->modelname = kstrdup(codec->bus->modelname, GFP_KERNEL);
>>
>> In theory there can be multiple codecs per bus (with different SDIs)
>> so using the bus->modelname for the codec->modelname looks odd.
> 
> That's true.  However, basically the model name is specific to the
> whole device, hence it's usually OK to pass to all codecs.  The
> mismatched model name is just ignored (that's why the current code
> with model="sofbus" works).  So you can think it a kind of quirk
> lookup with a system name given explicitly by user.
> 
>> Is there an example of this being used for my education?
> 
> You can find the list in Documentation/sound/hd-audio/models.rst
> and the usage in Documentation/sound/hd-audio/notes.rst.  The
> documents are a bit outdated, though.

ah, ok, thanks for the pointers.

So if you have a new machine that's not explicitly handled by quirks you 
can initially force existing tricks to be used, and in a second step the 
quirk is extended to handle that machine, yes?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
