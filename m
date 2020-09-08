Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DDE2612EE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B6417A8;
	Tue,  8 Sep 2020 16:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B6417A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599576469;
	bh=GXdr2HpLDvzbqS3RyjsWhUITfCW3xMPkRE+o4aHX+h8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=roEN+7ceA/sfuN1oPax3zDgCfC8CTOgFxL9cQj2QcohFSzgjDFO0gMZMKD5jbpaoq
	 mhHpBABSwQE/5zl2LoeCptA9Bj/QzHtc3C76hE6VDFUEJ49DJaD2BYq/hTknF1kArW
	 nPMD14mpvmPRuw/u7H0QPRxh7rOfQualyH3S9q90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B7BF8015F;
	Tue,  8 Sep 2020 16:46:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D34F80264; Tue,  8 Sep 2020 16:46:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1750F8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:46:00 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6708BA0065;
 Tue,  8 Sep 2020 16:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6708BA0065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599576360; bh=G9Kud4RU0jWLVCXshPcwiYfY/xaaRE9L6yDGKi1cDU0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=y/kX/KGZ6IbhANo25hBuEgPidIm1EEn9aGUJ4sosl7RzntjxQj68cSBZurS0Tf1iD
 N3PYvgIA/V0Jf/A2IDsnVVrQ+AheacjckTp6kt/AE+kvnnbMax6nnICcrmH2BlNbPZ
 vlNWNr29tdBXs+i1QBjOy8fX/qZxTXhzxRDN5oBI=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Sep 2020 16:45:56 +0200 (CEST)
Subject: Re: [RFC PATCH 1/3] topology: use inclusive language for bclk
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <20200903201024.1109914-2-pierre-louis.bossart@linux.intel.com>
 <s5hd03152mr.wl-tiwai@suse.de>
 <deaae562-80f2-a934-d551-ac5d9a047bbf@linux.intel.com>
 <20200908143504.GD5551@sirena.org.uk>
 <70a2012f-aa8b-52db-7694-592677d7171c@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b1d6f026-e6d0-8ae8-2f5b-a8df45299fdf@perex.cz>
Date: Tue, 8 Sep 2020 16:45:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <70a2012f-aa8b-52db-7694-592677d7171c@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Dne 08. 09. 20 v 16:41 Pierre-Louis Bossart napsal(a):
> 
> 
> On 9/8/20 9:35 AM, Mark Brown wrote:
>> On Tue, Sep 08, 2020 at 08:39:13AM -0500, Pierre-Louis Bossart wrote:
>>
>>>>> -	__u8 bclk_master;	/* SND_SOC_TPLG_BCLK_ value */
>>>>> +	__u8 bclk_provider;	/* SND_SOC_TPLG_BCLK_ value */
>>
>>>> Is it 100% compatible?  Note that the uapi/* header is a copy from the
>>>> kernel header, and it means that we'll change the same for the kernel,
>>>> too.
>>
>>> It's absolutely 100% compatible by design.
>>> I was planning to update the kernel uapi header to align changes, but the
>>> volume of code is much lower on the alsa-lib side. Will resubmit with the
>>> preferred provider/consumer wording.
>>
>> It's binary compatible but it'd break the build for any existing code
>> using the UAPI headers.
> 
> Sorry, I don't fully get the comment. Aren't the uapi headers copied 
> into each software tree that relies on them?

I think that only alsa-lib's topology library uses this header (and has own
header copy), thus the breakage is minimal in this case.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
