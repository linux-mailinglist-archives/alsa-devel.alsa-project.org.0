Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850614B3DF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 13:00:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC0C15E5;
	Tue, 28 Jan 2020 12:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC0C15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580212813;
	bh=9aDS53r78RDHro5JFfdlcnpHwPOvNZyKsveyNz6GuNs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xsv01J/h7Z1eglZ/Bpqd6zRSoU6xEeaqeiMSrb1d7GBJZP8LaKzeI4PyrIV26T/qV
	 xqoOnSA4z0hdETt7jWGn9sdWO+9ji4KdJpSI06epmXx+q30hjp43RwRX5L3N2DGTSx
	 TW/lvxptxuTENT4mnL2cRUJKU0sxzQAoeI78+6xU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A393F80150;
	Tue, 28 Jan 2020 12:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6F08F8014B; Tue, 28 Jan 2020 12:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D1BF800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 12:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D1BF800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 03:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="231902149"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 03:58:19 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-5-cezary.rojewski@intel.com>
 <20200128105946.GP2841@vkoul-mobl>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <57fa4c0d-3b64-d0c2-3d19-3b3569557069@intel.com>
Date: Tue, 28 Jan 2020 12:58:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200128105946.GP2841@vkoul-mobl>
Content-Language: en-US
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v3 04/11] ALSA: core: Expand DMA buffer
 information
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

On 2020-01-28 11:59, Vinod Koul wrote:
> On 28-01-20, 11:43, Cezary Rojewski wrote:
>> Update DMA buffer definition for snd_compr_runtime so it is represented
>> similarly as in snd_pcm_runtime. While at it, modify
>> snd_compr_set_runtime_buffer to account for newly added members.
> 
> Please run ./scripts/get_maintainer.pl, it will tell you the people you
> should CC on a patch.
> 
> Also Takashi already acked, so you should add the acks/reviews received
> in subsequent versions (unless they changed)
> 
> And for this:
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>
> 

No ALSA core & hda patches changed since v1. Sorry for missing the 
Acked-by signature from Takashi. Should I resend and add the missing ack 
in v4?

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
