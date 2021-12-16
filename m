Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CBA477578
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:14:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6182029;
	Thu, 16 Dec 2021 16:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6182029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639667671;
	bh=GKNI9+uG02nILpBlByaWYcPE3qK/ra1Trg4IPKwdjZQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=No+B1zWiNOpIVsEfcyCaW1fFRuxV/8TxWU21sddIX+aTcIebJni0t528XbsaE3yo0
	 tJ6nscg2Z4txBLb9dTY0Kg2/Wwo/Fo0QABysZQNtHj0WiOcxXuxcImrLJd6Wqe8J81
	 LfdXtyiZygk10AjHbK1AEgC4JfCZ2M2RKp1kHk5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79758F800DE;
	Thu, 16 Dec 2021 16:13:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1287CF8016E; Thu, 16 Dec 2021 16:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2704EF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2704EF800DE
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="219530379"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="219530379"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:13:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="755969981"
Received: from kloriaal-mobl2.amr.corp.intel.com (HELO [10.213.169.180])
 ([10.213.169.180])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:13:18 -0800
Subject: Re: [PATCH 4/5] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
 <20211216115743.2130622-5-cezary.rojewski@intel.com>
 <4a8afa77-217a-9d1a-7704-909ee895c4c7@linux.intel.com>
 <2377ff39-2ee2-c1fe-844b-aa9749f4e026@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <261b8815-6c8e-7e0a-4b34-e7948efb6884@linux.intel.com>
Date: Thu, 16 Dec 2021 09:13:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2377ff39-2ee2-c1fe-844b-aa9749f4e026@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com
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



On 12/16/21 8:37 AM, Cezary Rojewski wrote:
> On 2021-12-16 3:11 PM, Pierre-Louis Bossart wrote:
>> The intent of soc-acpi files is to establish a match between ACPI _HID
>> and machine driver, this is now duplicated, and it makes limited sense
>> to add machine driver dependencies in a platform driver.
>>
>> Nothing was broken with the existing code.
> 
> Hello,
> 
> Yes, nothing is broken in the existing code. The intention is different
> - be cohesive about what is actually used by the driver.
> 
> PCI-ids table is duplicated already for the Intel audio drivers. And
> it's OK to do so - one knows which ids are covered by given driver and
> how. Here, it's clear that haswell_machines are only used by
> catpt-driver and so are some fields for broadwell_machines. In time I
> believe that we will be able to reduce the number of fields for struct
> snd_soc_acpi_mach i.e. have a single fw_filename and single
> tplg_filename field without some driver-specific duplicates.
I don't really see the point about the number of fields, this is a
generic descriptor used for I2S/SoundWire devices so mechanically there
are things are are not used in all platforms.

Another example is the quirks field, it's only meant to be used when
there's actually a quirk.

Note that I am planning to remove the sof_fw_filename field since it's
redundant with what is part of the PCI descriptor, but the topology will
remain there: it has to match with the machine driver.

> About the last, there could be a case where no topology file is
> available for certain configuration and given entry should not be taken
> into account. While catpt-driver does not make use of soc-topology
> feature, that isn't true for other drivers.

Again if a feature is not needed/not supported, the field can remain empty.
