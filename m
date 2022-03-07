Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADF04D0A5E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 22:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A34171D;
	Mon,  7 Mar 2022 22:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A34171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646690164;
	bh=KrlomCi+xi56zFEkkkk2ibceDMmqy1RzWIr/d2LiwPk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W3DmWz1I8r/HLsxvQ9oneyvFZ8YA/N2//04pEkeRIN8HYBc/c5ulF25Pr2eDhFSU9
	 YDWU4h6gNWQqcS4F4WrdLA+28ME7Q3jwjZoYrnsZhB7e6vSTmMZrWF83uRU4ut6X/G
	 2wKgaTfAX1xo3trLCMPXG8mIC2o9mwThmwp4oD00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED1CF80132;
	Mon,  7 Mar 2022 22:54:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9652F8013F; Mon,  7 Mar 2022 22:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4727FF800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 22:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4727FF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ictC7/GX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646690084; x=1678226084;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KrlomCi+xi56zFEkkkk2ibceDMmqy1RzWIr/d2LiwPk=;
 b=ictC7/GXicuWqDdVIXtPvUgDNtLMCEibxRvGodKPx2G3kRE3V1WpSJLt
 rDAry5xjndtPEXwhalgRXFXa8XqSDThXxAwnpAQBJ+BQNwokFL+ICjiQu
 bAwwpfkvUe+ENKdvGXHMA3ZdzWUVM5hXi8j5QTNwLd+yB9X+LlvmeVVNA
 D+tei8yQDkD1LigcszFxpKCEoX5expHvQsGyUe1TfcIIekzV12xZ+fVbs
 9GQa3W3f/qmpnSDJzxh/feHELtuf+ELhj0VIWaX+SkoMYhornXU+mb0mB
 ZB7dBwQRdUaYYZKvUQ3qLjb/1xW3MtYUB2mM+3l5552ni2HSaRDy1J73Z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="315229288"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="315229288"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 13:54:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="643410572"
Received: from rhack-mobl1.amr.corp.intel.com (HELO [10.209.14.71])
 ([10.209.14.71])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 13:54:38 -0800
Message-ID: <178c7536-7b54-5f73-b759-745db4fae2bc@linux.intel.com>
Date: Mon, 7 Mar 2022 15:54:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: mmotm 2022-03-06-20-33 uploaded (sound/soc/intel/boards/)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
 mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
References: <20220307043435.251DBC340E9@smtp.kernel.org>
 <39c76613-3fb4-651b-1838-f460c4f76a17@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <39c76613-3fb4-651b-1838-f460c4f76a17@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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



On 3/7/22 15:12, Randy Dunlap wrote:
> 
> 
> On 3/6/22 20:34, Andrew Morton wrote:
>> The mm-of-the-moment snapshot 2022-03-06-20-33 has been uploaded to
>>
>>     https://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> https://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
>> You will need quilt to apply these patches to the latest Linus release (5.x
>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>> https://ozlabs.org/~akpm/mmotm/series
> 
> on x86_64:
> 
> ERROR: modpost: "sof_dai_get_bclk" [sound/soc/intel/boards/snd-soc-intel-sof-cirrus-common.ko] undefined!
> ERROR: modpost: "sof_dai_get_mclk" [sound/soc/intel/boards/snd-soc-intel-sof-realtek-common.ko] undefined!
> 
> 
> Full randconfig file is attached.

Thanks Randy for the report. Indeed there's a problem with the 
SND_SOC_INTEL_SOF_SSP_AMP_MACH option. It should be conditional on at 
least one Intel/SOF platform being selected, as all the other platforms 
are already.

The following diff makes the problem go away:

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig

index 6884ddf9edad..81e012c164b0 100644

--- a/sound/soc/intel/boards/Kconfig

+++ b/sound/soc/intel/boards/Kconfig

@@ -615,6 +615,8 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH



  endif ## SND_SOC_SOF_JASPERLAKE



+if SND_SOC_SOF_HDA_LINK

+

  config SND_SOC_INTEL_SOF_SSP_AMP_MACH

         tristate "SOF with amplifiers in I2S Mode"

         depends on I2C && ACPI

@@ -631,6 +633,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH

            with RT1308/CS35L41 I2S audio codec.

            Say Y if you have such a device.

            If unsure select "N".

+endif ## SND_SOC_SOF_HDA_LINK



  if SND_SOC_SOF_ELKHARTLAKE



