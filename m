Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D341E54BF
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 05:42:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA4D165F;
	Thu, 28 May 2020 05:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA4D165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590637324;
	bh=l7zaILrHBN9AnHQnHM6nP/f29wfr+VONr7egeq/v32E=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLKummLou6xuEKnRF/zrsXQnpqjv+iVJENCMzqSmfSt4+qY17REg7RTpDp5V+JZ+O
	 FruL/rC0Tk+SjbYRCE/aSF7csiUbbOQfBlALrfAVTs5dzW40TYovc2dF+G9r6y1QrG
	 drvNQrpYTkQkrhTOl3ehHl+Pd3ZGk++xcLzRY8yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B32C4F800FF;
	Thu, 28 May 2020 05:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFFA6F80150; Thu, 28 May 2020 05:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC75AF800FF
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 05:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC75AF800FF
IronPort-SDR: 3iZvutJi3X9RPv+bomKXaMYTjalI0M1WtUw/82eeUYmqz/EyR06XYvIlwkoZKFDWrctfeyajaj
 /H5d32Ujev5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 20:40:03 -0700
IronPort-SDR: GLNbw/0rrex193AwRelDcxn26oBnVo4/vbEbpKubWbx7ObL6Og3ynSHZ0DDfu4qcrckyqOgLSs
 ga0xgFA9X89A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; d="scan'208";a="267071995"
Received: from tgarris-mobl.amr.corp.intel.com ([10.255.72.202])
 by orsmga003.jf.intel.com with ESMTP; 27 May 2020 20:40:02 -0700
Message-ID: <8519ab3772b6abcb3d3458644addfaa5d5dd1fc9.camel@linux.intel.com>
Subject: Re: [PATCH v3 0/2] ASoC topology header parsing refinement
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
Date: Wed, 27 May 2020 20:40:02 -0700
In-Reply-To: <20200527022801.336264-1-yang.jie@linux.intel.com>
References: <20200527022801.336264-1-yang.jie@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 sathya.prakash.m.r@intel.com, vamshi.krishna.gopal@intel.com
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

On Wed, 2020-05-27 at 10:27 +0800, Keyon Jie wrote:
> This small series is to optimize the header logging during the
> topology
> parsing. This is verified work fine on both SOF and SST drivers.
> 
> Change History:
> v3:
> - Remove using the separated soc_pass_load() function and merge it to
> the
>   soc_tplg_load_header() body.
> - Add more Tested-by tags.
> 
> v2:
> - Change the internal used array to be 'static' to fix the issue
>   reported by: kbuild test robot <lkp@intel.com>
> - Add testing coverage including Intel SST driver also.
> 
> v1:
> - Initial version.
> 
> Keyon Jie (2):
>   ASoC: topology: refine and log the header in the correct pass
>   ASoC: topology: remove the redundant pass checks
LGTM, thanks Keyon!

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

