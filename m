Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15A188826
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 15:53:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B8316D7;
	Tue, 17 Mar 2020 15:53:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B8316D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584456835;
	bh=YW/A62QaePcMM9OkmxZNgrq4EKhyOM9bK9cnR8bNA9U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUJc1ZhkXoriq0EEccukBsB5EX/fxdLpPTHZaGj5Tz97Sh6be2p+dRsDgKwgOuyOf
	 pwvKQsZIbHDFDxypblBs/oF3hJpYnbkSM376++NmIIpRBK99Aflcd5JzfemmZL97F7
	 1d+7HWJ/yJAOgDtixElV9isQbcj/ddQRTakoQEHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFBD9F800C0;
	Tue, 17 Mar 2020 15:51:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 939A5F8022B; Tue, 17 Mar 2020 15:51:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F247F80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 15:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F247F80058
IronPort-SDR: AvSesiZHDLK6DEheCnLvkIApz0SqkimF3bDBP29hwidPrz2fvnBUmgADr95vISnJko3B+EZIoV
 +QYeXc+aH8SQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 07:51:21 -0700
IronPort-SDR: Mv7Ot4hzOO4MZi/DvjK+eO2HMILdMvsUL8+mmd2NMd0BXHw37eHYRszHZRujbMCqVhAR9QgNE2
 TYz+rRz4/g5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="247842493"
Received: from dasabhi1-mobl.amr.corp.intel.com (HELO [10.255.35.148])
 ([10.255.35.148])
 by orsmga006.jf.intel.com with ESMTP; 17 Mar 2020 07:51:21 -0700
Subject: Re: [PATCH v3 0/6] ASoC: Merge CPU/Codec DAIs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ce0a13e6-175b-7256-a4cd-e7b14529d6dc@linux.intel.com>
Date: Tue, 17 Mar 2020 09:50:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87y2s0olg6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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




> Kuninori Morimoto (6):
>    ASoC: soc-core: Merge CPU/Codec DAIs
>    ASoC: soc-core: Merge for_each_rtd_cpu/codec_dais()
>    ASoC: soc-dapm: Merge for_each_rtd_cpu/codec_dais()
>    ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()
>    ASoC: soc-core: Merge CPU/Codec for soc_dai_pcm_new()
>    ASoC: soc-pcm: Merge CPU/Codec MSB at soc_pcm_apply_msb()

I only had an alignment nit-pick, otherwise looks good. The results from 
the SOF CI seem ok so for the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Morimoto-san!

