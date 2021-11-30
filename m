Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA30463C45
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:51:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93F122365;
	Tue, 30 Nov 2021 17:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93F122365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638291063;
	bh=fHgBhCyMrAVNoyjzXbcpAJJdQPW9sZlLiSiL4iNGJlY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WbyLEcktoS1WK/bc1MJ8GPQz5rjXNJBdW+W98M0ablRWTONZOW1r7unbhY7SHox+q
	 NlnukFHGL1gDPJ0tUgNxB3B9rIce17zaZTePhbaJ6sOIXjydsjZ1Aadi9xCGeFk0T3
	 Yx5RB9/sEPX7JIl85rJCUjdWI8LzzvWXfHmT7imQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3852F802A0;
	Tue, 30 Nov 2021 17:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD103F80290; Tue, 30 Nov 2021 17:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 793C4F800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 793C4F800EE
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236079738"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="236079738"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 08:49:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="601572330"
Received: from vschult-mobl1.amr.corp.intel.com (HELO [10.212.122.173])
 ([10.212.122.173])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 08:49:33 -0800
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
Date: Tue, 30 Nov 2021 10:49:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, daniel.baluta@gmail.com,
 AjitKumar.Pandey@amd.com,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Bard Liao <bard.liao@intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, Julian.Schroeder@amd.com,
 daniel.baluta@nxp.com, vsreddy@amd.com
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




>> --- a/sound/soc/amd/Kconfig
>> +++ b/sound/soc/amd/Kconfig
>> @@ -96,4 +96,10 @@ config SND_SOC_AMD_YC_MACH
>>           Say m if you have such a device.
>>           If unsure select "N".
>>
>> +config SND_AMD_ACP_CONFIG
>> +       tristate "AMD ACP configuration selection"
> 
> This definitely needs proper dependencies, to prevent asking the user
> about this when configuring a kernel without AMD Audio ACP support.
> 
> I would have sent a patch, but...

There's indeed a missing dependency that was fixed in
https://github.com/thesofproject/linux/pull/3284

Daniel, you may want to squash it in an update?

To Geert's point, there may be an additional need to add a

depends on SND_SOC_AMD_ACP

There are also a set of

SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?


