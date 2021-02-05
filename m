Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB4310D66
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 16:49:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1FF1607;
	Fri,  5 Feb 2021 16:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1FF1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612540165;
	bh=mffGps49avdBiy8KqZrNM5vye3EXYg6yptP/wMUEAOM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nkKbwG62T4CSF8d0Ek2TZIdftnrL1oV7QvVmdm0R63rZ+S6MKstz4RGqIePdSKFr0
	 QavMgxR45UWcOKAcUV2PYrNuuiszqr/vVcDwPU5wVGleT7tQhUCs4vRsF8ZrKLMksQ
	 H2VZHu7E4o1DLvAmkDBIEF46BuYQ5D/iEUi1sXNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53E60F8016E;
	Fri,  5 Feb 2021 16:47:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3712F8015A; Fri,  5 Feb 2021 16:47:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1DB6F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 16:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1DB6F800C0
IronPort-SDR: Dxn+ZJ1vm4rzojOv/t5tbWVno6+ipHWLFpbkQedU3/is2NpqHwkGNA+okt5cj/w9qsldEavOcG
 YhtfeQ+3seJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181596194"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="181596194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 07:47:41 -0800
IronPort-SDR: uVGFPbqOJcsv2httPANMUiprMD336Zxdd4KGySfPoZoEKgl++3c63PLx1R4jZsEfpjW3mHuQKJ
 wDhvGEMFopJw==
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="393913262"
Received: from gjcomber-mobl.amr.corp.intel.com (HELO [10.255.228.165])
 ([10.255.228.165])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 07:47:40 -0800
Subject: Re: [PATCH 14/14] ASoC: SOF: Intel: hda: add dev_dbg() when DMIC
 number is overridden
To: Mark Brown <broonie@kernel.org>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
 <20210204203312.27112-15-pierre-louis.bossart@linux.intel.com>
 <20210205153336.GE4720@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d6f10083-f046-a708-60b1-86e3fd731e60@linux.intel.com>
Date: Fri, 5 Feb 2021 09:47:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205153336.GE4720@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 vkoul@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 2/5/21 9:33 AM, Mark Brown wrote:
> On Thu, Feb 04, 2021 at 02:33:12PM -0600, Pierre-Louis Bossart wrote:
> 
>>   	/* allow for module parameter override */
>> -	if (hda_dmic_num != -1)
>> +	if (hda_dmic_num != -1) {
> 
> This is breaking in an x86 allmodconfig build due to:
> 
> /mnt/kernel/sound/soc/sof/intel/hda.c: In function 'dmic_topology_fixup':
> /mnt/kernel/sound/soc/sof/intel/hda.c:615:6: error: 'hda_dmic_num' undeclared (first use in this function); did you mean 'dmic_num'?
>    if (hda_dmic_num != -1) {
>        ^~~~~~~~~~~~
>        dmic_num
> /mnt/kernel/sound/soc/sof/intel/hda.c:615:6: note: each undeclared identifier is reported only once for each function it appears in
> 
> which will actually be triggered by one of the earlier patches in the
> series (my script is going through things in reverse order), that
> variable is only defined for CONFIG_SOC_SOF_HDA.

That's not good. Please drop this patch for now, it's nice-to-have and 
not critical.

I'll have to figure out why this wasn't reported earlier.
