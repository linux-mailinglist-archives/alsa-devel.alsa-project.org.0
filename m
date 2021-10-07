Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A82425973
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 19:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EB9B1612;
	Thu,  7 Oct 2021 19:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EB9B1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633627729;
	bh=WAdqDxe0lu8sxnpk0yModBXUWba3GS3x/WDLyHniMhc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RHbIW+zcEQOe0iBpV2Utzn/I7fhtd0LSWGmxeJugX/ndpS6wQreIO28lDCX+wl3D3
	 ajrxvyqFYRFhWezvzUNlRWFo8vTSv+38HVNHfjde9TP2eBRcMhsWup84HohkvjftvH
	 kMaO4G+/ByXHDZ5LYi02acG3MXLfVsv3LFYs8BnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B32AF80259;
	Thu,  7 Oct 2021 19:27:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 200F8F8027D; Thu,  7 Oct 2021 19:27:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE37F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 19:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE37F800F0
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="312509782"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="312509782"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 10:27:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="440347800"
Received: from klmutolo-mobl.amr.corp.intel.com (HELO [10.212.1.203])
 ([10.212.1.203])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 10:27:16 -0700
Subject: Re: [PATCH v2 1/3] ASoC: soc-acpi: add comp_ids field for machine
 driver matching
To: Cezary Rojewski <cezary.rojewski@intel.com>, Brent Lu
 <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20211007133516.1464655-1-brent.lu@intel.com>
 <20211007133516.1464655-2-brent.lu@intel.com>
 <7e6cf92f-b889-aed9-b13a-615d4d5f9b93@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ae5e8ef-76cb-8335-e250-64b0246175f3@linux.intel.com>
Date: Thu, 7 Oct 2021 12:27:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7e6cf92f-b889-aed9-b13a-615d4d5f9b93@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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


>>   struct snd_soc_acpi_mach *
>>   snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
>>   {
>>       struct snd_soc_acpi_mach *mach;
>>       struct snd_soc_acpi_mach *mach_alt;
>>   -    for (mach = machines; mach->id[0]; mach++) {
>> -        if (acpi_dev_present(mach->id, NULL, -1)) {
>> +    for (mach = machines; mach->id[0] || mach->comp_ids; mach++) {
> 
> Such loops are hard to maintain i.e. 'comp_ids' acts here like a flex
> array that follows 'id'. Removal of 'id' field and streamlining code to
> only use 'comp_ids' should make this loop more intuitive.

Changing all the tables adds more noise IMHO. There are 15 files and
about 100 ids.

This patch provides an opportunity to reduce duplication, that's good,
but let's leave all the existing unique table entries alone, shall we?
