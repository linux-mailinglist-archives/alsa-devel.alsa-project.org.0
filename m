Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DBF4DF5B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 05:43:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31775166B;
	Fri, 21 Jun 2019 05:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31775166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561088625;
	bh=/MXtmIV2dzH5giQviXRDn5CJnJR99j9I0gGP+59vSig=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkiwz2BPRPL8VLeDU/U/3y3WGhFSa9LHFs5ppS279v++QIw56z8NHmoecZMd5qA1q
	 88ydHIh4BrevAenwaDvU9t1cQwmldNFsMkkUhse0UtcnP0hZBFjz9uynj4HgPFYzsq
	 e8B6M6fC/gR+VPacxOrDMoeDQ0lVrqYpDB2Xnbi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BA78F89682;
	Fri, 21 Jun 2019 05:42:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0AC8F896B8; Fri, 21 Jun 2019 05:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2556F808AF
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 05:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2556F808AF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 20:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,399,1557212400"; d="scan'208";a="187035252"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2019 20:41:52 -0700
Received: from xyang32-mobl.amr.corp.intel.com (unknown [10.252.27.214])
 by linux.intel.com (Postfix) with ESMTP id B17F55807EA;
 Thu, 20 Jun 2019 20:41:49 -0700 (PDT)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20190619150213.87691-1-andriy.shevchenko@linux.intel.com>
 <a987bd54-5364-f046-a928-44a97ed0307f@linux.intel.com>
 <20190620150907.GG9224@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <76ae3d0e-a948-f8f9-d6af-13c523414352@linux.intel.com>
Date: Fri, 21 Jun 2019 05:41:48 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620150907.GG9224@smile.fi.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: Intel: Skylake: Switch to modern
 UUID API
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


>>>    	char mod_name[64]; /* guid str = 32 chars + 4 hyphens */
>>> -	uuid_le *uuid_mod;
>>> -	uuid_mod = (uuid_le *)guid;
>>>    	snprintf(mod_name, sizeof(mod_name), "%s%pUL%s",
>>> -				"intel/dsp_fw_", uuid_mod, ".bin");
>>> +					     "intel/dsp_fw_", guid, ".bin");
>>
>> indentation looks off, not sure if this is a diff effect.
> 
> Ah, this can be modified to the below (by a separate patch, since Mark applied
> this one already):
> 
> 	snprintf(mod_name, sizeof(mod_name), "intel/dsp_fw_%pUL.bin", guid);
> 
> What do you think?
> 
> P.S. And it will take only one line.

Sounds good to me. Not sure why it was written this way.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
