Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157E461BCB
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:34:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141011AB0;
	Mon, 29 Nov 2021 17:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141011AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638203646;
	bh=q5aBe0Jvp1sWsQ8PvUlZgsZZjnzwEdxUlLIAp54EnPE=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYu3uO1rLyYp95QM5lFSeWRo3pK17WkV5kTmu7puZv8rb5kKm55S/LkTsEqi4/Q8S
	 Kq9lvbjJ7y2dKTxAxinLkvG6O50pYkHvd4OPKnsB72G6Dn2kzjVl1BruoE7vMEclLf
	 A3rekONrf93i9ENwOYNr8tzs1rqQU4qArHtkPCjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B187F8025C;
	Mon, 29 Nov 2021 17:32:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E40E0F800EE; Mon, 29 Nov 2021 17:32:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92AAAF800EE
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92AAAF800EE
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322241095"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="322241095"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="676418419"
Received: from ticela-nm-11.amr.corp.intel.com (HELO [10.212.98.225])
 ([10.212.98.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/5] ASoC: soc-dai: update snd_soc_dai_delay() to
 snd_soc_pcm_dai_delay()
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
 <875yssy25z.wl-kuninori.morimoto.gx@renesas.com>
 <2cc78158-e288-e949-594f-0ab939a35942@linux.intel.com>
 <YZ+8WbwDA9oQoRSk@sirena.org.uk>
 <TYCPR01MB5581F87D324E2499303E36EAD4629@TYCPR01MB5581.jpnprd01.prod.outlook.com>
 <YaDqo6MC8/zjhpoh@sirena.org.uk>
Message-ID: <2cd48411-4be6-196f-025d-74fd3a5266dc@linux.intel.com>
Date: Mon, 29 Nov 2021 09:42:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaDqo6MC8/zjhpoh@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Gu Shengxian <gushengxian@yulong.com>
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



On 11/26/21 8:09 AM, Mark Brown wrote:
> On Thu, Nov 25, 2021 at 11:41:38PM +0000, Kuninori Morimoto wrote:
> 
>> Sorry for my late response.
>> (It was PC replace week)
> 
> No worries, hope the new PC is working well!
> 
>>>> I would think it's more accurate to update the delay information while 
>>>> dealing with the hw_ptr update, no?
> 
>>> Morimoto-san?
> 
>> I think your opinion is very correct.
>> But this patch-set is for "cleanup/refactoring",
>> and your opinion is for "add new feature", I think.
> 
> Hrm, right - this isn't making anything better or worse in terms of the
> accuracy, it's just moving things around so Pierre's suggestion is a
> separate thing.

Indeed, I misunderstood the series are removing the update of the
runtime->delay field while updating the hw_ptr, but this is only
shuffling code around. This is still updating both avail/delay in the
same manner so no objections. Sorry for the noise.
