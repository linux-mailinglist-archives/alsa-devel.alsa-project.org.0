Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A3212CC4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1FF116E3;
	Thu,  2 Jul 2020 21:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1FF116E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593716768;
	bh=wrfZzaiTDhTqquH0bHyQ0jtn2kUqXpVF3MgcJ28mC0M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ta7a1P9Gh5ivzGfCpbsDAy+CYQL7pfCqhIxF+CfsyPdjSVvc+ueFmeOmxaICr24A8
	 fP6OFcDH0SBaGy/6q0bAsS7vI5r4e/YYVvLSpcjWaZFLMLdnEQFw5IzLxjFcuyGK1B
	 r4z0WEsj2WmBRT+tEE1xzdt8MNHIWaqHpIj2qvS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9531DF80134;
	Thu,  2 Jul 2020 21:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C37AEF80247; Thu,  2 Jul 2020 21:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F488F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:04:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F488F800ED
IronPort-SDR: BfubklYI9dblJAivlCb35k9SVaJuoWZGJaxDxoruk8Gt6pLKb2Mh5Cqp2sCunnTHW38iWXv+fi
 UyfqF714dTNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="135285871"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="135285871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:03:59 -0700
IronPort-SDR: gnOBcBliBICPHYLlTAPB2fAVH+V8bYokR4W/N0dEdoSDStXp83ufUbFjAeqPKRu7wvhjleJ1g5
 aUDy828pShMw==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="295989116"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO [10.254.75.219])
 ([10.254.75.219])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:03:59 -0700
Subject: Re: [PATCH 6/6] ASoC: fsl: fsl_esai: fix kernel-doc
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-7-pierre-louis.bossart@linux.intel.com>
 <20200702185556.GG23935@Asurada-Nvidia>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2191ccbf-5c94-62e5-33b0-635284e5a8c6@linux.intel.com>
Date: Thu, 2 Jul 2020 14:03:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702185556.GG23935@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 7/2/20 1:55 PM, Nicolin Chen wrote:
> On Thu, Jul 02, 2020 at 12:22:27PM -0500, Pierre-Louis Bossart wrote:
>> Fix W=1 warnings. Fix kernel-doc syntax and add missing parameters.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
>> + * fsl_esai_set_dai_sysclk - This function mainly configures the clock frequency of MCLK (HCKT/HCKR)
> 
> Can drop "This function mainly"
> 
>>   /**
>> - * This function configures the related dividers according to the bclk rate
>> + * fsl_esai_set_bclk - This function configures the related dividers according to the bclk rate
> 
> Here too -- dropping "This function"

will fix both, thanks for reviewing the edits.

> 
> Otherwise,
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
> 
> Thanks!
> 
