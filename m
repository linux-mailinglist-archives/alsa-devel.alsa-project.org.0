Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F2212CC2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 610FE16D9;
	Thu,  2 Jul 2020 21:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 610FE16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593716721;
	bh=8hdEW7EwqIN/1VG2iLcQDuqIN5qDb+WvsjNtxbPCL7Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hrTrTjy/kT0tQrtN6eiFfyW8eS3dsnvdEL0hg7XlJesHcOxs602QCLh08dXgLeoLn
	 WRGLkrfd8Lus/xH4S7+GZeIkNV6V+gqt/OPUga/Wds79mSGpErChnPZy6/OJeNqM/z
	 AL1tmES4Nx2SumfZi5BhQZrWhNcegDNZ8d2UBUkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71521F8022B;
	Thu,  2 Jul 2020 21:03:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C590F8022D; Thu,  2 Jul 2020 21:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A1C5F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1C5F80134
IronPort-SDR: CIsuDbZe40thPOVbcOldV+4yqv5ogy2bPd/T5w20YVbCXepD6fc6v7SelqmR9cCRagoHgEgNG/
 ElYQrDZNP87A==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="146088766"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="146088766"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:03:23 -0700
IronPort-SDR: ITwhDjjC2EW5TkDGnDY5YhDJPnao/dKwEHsS0zhlA07dwxJxe7RUuCj3idyidbNsnHlTLiFRvr
 Qic3MYf842Mg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="295989015"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO [10.254.75.219])
 ([10.254.75.219])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:03:22 -0700
Subject: Re: [PATCH 3/6] ASoC: fsl: fsl-asoc-card: fix kernel-doc
To: Nicolin Chen <nicoleotsuka@gmail.com>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-4-pierre-louis.bossart@linux.intel.com>
 <20200702184727.GD23935@Asurada-Nvidia>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7c6fac59-562c-d3b5-8eea-3e0f450cee6b@linux.intel.com>
Date: Thu, 2 Jul 2020 14:03:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702184727.GD23935@Asurada-Nvidia>
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



On 7/2/20 1:47 PM, Nicolin Chen wrote:
> On Thu, Jul 02, 2020 at 12:22:24PM -0500, Pierre-Louis Bossart wrote:
>> Fix W=1 warnings. Kernel-doc syntax was not properly used.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   sound/soc/fsl/fsl-asoc-card.c | 21 +++++++++------------
>>   1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> 
>>   /**
>> - * Freescale Generic ASOC card private data
>> + * struct fsl_asoc_card_priv - struct Freescale Generic ASOC card private data
> 
> Just a nit, can you drop the "struct" before "Freescale"?
> Other parts of your changes don't really add this word.

will do, thanks for spotting this.

> Otherwise,
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
> 
