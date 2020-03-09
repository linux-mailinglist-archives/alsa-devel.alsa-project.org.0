Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BE17E5AA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2B161697;
	Mon,  9 Mar 2020 18:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2B161697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583774712;
	bh=zhXrWZtmsalb6yNy3ZCldrSn9kelCx/Hvo9/Q4Ofooo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IIeqk3yDKEbL+fNf7ByBXsbZLOD1UZq1BnMvg5rzhuNNu5lZNW2KkqKpYstRZzza3
	 NkaC8IYzEcUBX+J/z78IMbJKZSacPpIEG6W3tvHxc7U425i49I9V8TzaZYTqDXNOUX
	 dsvUm+y2qGOedKfSWa9aqLjVpZYEoDTkyx6893e0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA70EF80290;
	Mon,  9 Mar 2020 18:21:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62587F8028C; Mon,  9 Mar 2020 18:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1296F800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1296F800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="231003497"
Received: from jdbostic-mobl1.amr.corp.intel.com (HELO [10.251.152.35])
 ([10.251.152.35])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2020 10:21:45 -0700
Subject: Re: [PATCH 0/9] ASoC: soc-pcm cleanup step6
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <874kuyi33c.wl-kuninori.morimoto.gx@renesas.com>
 <CAFQqKeViGDniocxCScM9KGfawCDiOzMfjK=aAFAnnWV=C3JzXg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d9ee960e-c47f-e186-9c67-6614aa05da61@linux.intel.com>
Date: Mon, 9 Mar 2020 12:15:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFQqKeViGDniocxCScM9KGfawCDiOzMfjK=aAFAnnWV=C3JzXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

Thanks Morimoto-san,

>> We are using plural form for for_each_xxx() macro.
>> But, for_each_rtd_codec/cpu_dai() are out of this rule.
>> 1) - 7) are for it.
>> 8) - 9) add new for_each_card_xxx() macros.
>>
>> Kuninori Morimoto (9):
>>     1) ASoC: soc.h: add for_each_rtd_codecs/cpus_dai() macro
>>     2) ASoC: Intel: use for_each_rtd_codecs/cpus_dai() macro
>>     3) ASoC: mediatek: use for_each_rtd_codecs/cpus_dai() macro
>>     4) ASoC: meson: use for_each_rtd_codecs/cpus_dai() macro
>>     5) ASoC: qcom: use for_each_rtd_codecs/cpus_dai() macro
>>     6) ASoC: soc: use for_each_rtd_codecs/cpus_dai() macro
>>     7) ASoC: soc.h: remove non plural form for_each_xxx macro
>>     8) ASoC: soc-dapm: add for_each_card_dapms() macro
>>     9) ASoC: soc-dapm: add for_each_card_widgets() macro
> 
> LGTM Morimoto-san. I feel like the last 2 patches might be a bit of an
> overkill but then they might make sense to keep the code consistent with
> the use of the for_each*() macros everywhere.
> 
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

LGTM as well.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

