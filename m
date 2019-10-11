Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCFCD4221
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 16:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23D901612;
	Fri, 11 Oct 2019 16:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23D901612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570802741;
	bh=tmXxl6u99jw1zjqMg/WxFLh7asPUTbhMaJUGJK2wuLw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rq4080Mvuuq5Frl6yhJjagkw350VvSOEVFVJJLnHoAp4kR1sPuUJO+dIGvxMvWx8z
	 9fSgqej3j5tuc59doVixW+uTurDGl/clMu0ss1tkWeiXIJ4iR+bC/FB40783DnmEXb
	 pN2ZUyWVpUtozsMBSopgv3PSG36sBjxOZuFNdM5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1082F805FB;
	Fri, 11 Oct 2019 16:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2888F80323; Fri, 11 Oct 2019 16:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 808F9F802BE
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 16:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 808F9F802BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 07:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="188326732"
Received: from hmmanuel-mobl.amr.corp.intel.com (HELO [10.254.42.220])
 ([10.254.42.220])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2019 07:02:14 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
 <878spuilqd.wl-kuninori.morimoto.gx@renesas.com>
 <df9de456-a4c2-53c4-2143-edb4d4b2292f@linux.intel.com>
 <87sgo0w0n1.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cb3438d9-1d85-f739-7faf-aa7f82d3d334@linux.intel.com>
Date: Fri, 11 Oct 2019 08:43:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87sgo0w0n1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 14/21] ASoC: soc-core: have
 legacy_dai_naming at snd_soc_register_dai()
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



On 10/10/19 8:07 PM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your feedback
> 
>>> snd_soc_register_dai() is now used from topology.
>>> But, to reduce duplicated code, it will be used from soc-core, too.
>>> To prepare for it, this patch adds missing parameter legacy_dai_naming
>>> to snd_soc_register_dai().
>>
>> It doesn't look like this series reduces the confusion between
>> snd_soc_register_dai() and snd_soc_register_dais() ?
>>
>> maybe for the latter case since it's a static function we don't want
>> the entire prefix then?
> 
> Maybe my explain is not so good...
> The point is that, in general people think like below from naming.
> Other functions are this style.
> 
> =>	int snd_soc_register_dai()
> 	{
> 		...
> 	}
> 
> 	int snd_soc_register_dais()
> 	{
> 		for(..) {
> =>			snd_soc_register_dai()
> 		}		
> 	}
> 
> But in reality is like this
> 
> 	int snd_soc_register_dai()
> 	{
> 		/* almost same but different code */
> 	}
> 
> 	snd_soc_register_dais()
> 	{
> 		/* almost same but different code */
> 	}
> 
> To avoid duplicate code and confusion,
> this patchset try to implement "general" style.
> But needs some preparation.
> 
> I will fix log and English.

I get your point, what I was trying to suggest is that we only use the 
full snd_soc prefix for non-static functions that can be called by other 
files, for static functions we can use just the soc prefix. It's a 
convention that helps the reader understand what is local and what is 
common/shared.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
