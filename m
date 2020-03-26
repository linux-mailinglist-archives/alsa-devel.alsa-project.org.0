Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E1C194741
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:14:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B3BB1686;
	Thu, 26 Mar 2020 20:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B3BB1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585250042;
	bh=0QrJ8Y+ZLyvvWR+718ikgWcB5E1KDOlTntcAK91KKSY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jqnx1GHkgjxvkPqhYFET0/vWbyPmTipl9r7OfPrRi7CdkoGp3gTa0CmbAw9a1FquA
	 R0V5b9VhNzRSZ8I6gEhWcp5FX/ib3APZqqbw0Goe3VmhybgqsNHgf9gGLKYP4vwLWc
	 xDbItkTNMqe/XO+zIL93keU/XNwQ+r/sdeilpwmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C95CF80234;
	Thu, 26 Mar 2020 20:11:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8744BF80234; Thu, 26 Mar 2020 20:11:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F02FF8011E
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F02FF8011E
IronPort-SDR: 2sEN2oyNHMCx4gs6bqhiAOKg/kE0JUbquuHaZr9uVCG4HFbZKyyHb6CiaFoH+zBsZWWlYtu+ZK
 mil8qhdmNQ+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 12:11:13 -0700
IronPort-SDR: SBZW9XCDycdrs1tMScAJO/vCryMr6Z1YHEQ3PB/Y/KuVgWOhWO7L4VIZI9QEOLZ15z8wti3bpD
 iIPl9IaHEynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,309,1580803200"; d="scan'208";a="282608048"
Received: from tsnider-mobl1.amr.corp.intel.com (HELO [10.251.138.161])
 ([10.251.138.161])
 by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2020 12:11:12 -0700
Subject: Re: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200325122230.12172-1-mateusz.gorski@linux.intel.com>
 <70860cdd-0017-7e6c-3a87-85e125e236fe@linux.intel.com>
 <49890f9b-f6db-c989-6072-312014a1a1f2@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6ae14d4b-41e2-c48c-d0de-24a692468009@linux.intel.com>
Date: Thu, 26 Mar 2020 10:26:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <49890f9b-f6db-c989-6072-312014a1a1f2@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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



On 3/26/20 10:00 AM, Gorski, Mateusz wrote:
> 
>> That's progress but is this complete?
>>
>> skl->i2s_dev->name is the name of the machine driver, I don't see the 
>> part where this is modified to deal with the number of dmics?
>>
>> In your topology patches, the names are: hda_dsp_noDMIC 
>> hda_dsp_DMIC_2ch hda_dsp_DMIC_4ch
>>
>> How would the relevant file be found based on the number of DMICs on 
>> the platform? I must be missing something here?
>>
> 
> The intention of this patch was not to deal with the different DMIC 
> configurations problem. It only simplifies the topology binary 
> selection. As you mentioned in one of previous mails, currently there 
> are two options:
> 
> - name based on NHLT, which is pretty complicated, especially for end 
> user, and is also depending on things like OEM name so the same topology 
> will need to be renamed multiple times different devices (additionally, 
> there are laptops on the market that do not have NHLT table at all)
> 
> - dfw_sst.bin, which is only a fallback binary name and should not be 
> actually used because it could be misleading for users/distro intergrators
> 
> This change adds the third option, which is, in my opinion, the right 
> way to deal with this problem. This name is simpler, does not depend on 
> existence of NHLT, and makes life easier for users/distros.

Right, and that's fine to avoid the NHLT-name and dfw_sst.bin, no issue 
here. The point is to go one step further and require ZERO configuration 
from users.

> And as for the mentioned DMIC confguration problem - I am doing a 
> research to find the simplest way to deal with this.

Just append the number of mics detected to the topology file name? 
Asking users to copy/symlink hda_dsp_DMIC_2ch.tplg as hda-dsp.tplg 
doesn't really help, you can make things simpler.
