Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE6253321
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 17:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2149D1773;
	Wed, 26 Aug 2020 17:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2149D1773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598454804;
	bh=8WeEi5025yM0p/SAtxYi2cx0TWpP0dbvAhk4Uc9GwdU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPNF0ywyq0T2aGjA4q3aHfPd3q2WAaATG1IAt1p1fmNjFsclIY5SWJS7n77hLW+DO
	 COz4eYkHyAUdCt2DkshwfBjeChnBjDftnCfDHoEsWpregqNowLuOiwg6lQgTlKVZkc
	 mmJMWpHCZX9kWJKMT0SmQPB1dBmo75GHpOKn/DT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70CCCF802C4;
	Wed, 26 Aug 2020 17:11:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 588B4F8016F; Wed, 26 Aug 2020 17:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90E8CF801EC
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 17:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E8CF801EC
IronPort-SDR: FKxaTMcKlVN2y6SRc9nEfY3rfQrHzlM+jZEkBF6iiI/EA2SnkxndRmmsYG6lxLjg9p5aNy9+gF
 kNAIb8m4id+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="143970570"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="143970570"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:21 -0700
IronPort-SDR: Kqzb7ZXAZ8xX5SlEi/WxQq5DXzfNtH2AFLCDJqB4ItflV1I+fWFym6ZPnOZw0sYNJuGfbTurLm
 4y58MMJou79A==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="299505099"
Received: from gillelas-mobl1.amr.corp.intel.com (HELO [10.255.231.51])
 ([10.255.231.51])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:19 -0700
Subject: Re: [PATCH 3/4] soundwire: SDCA: add helper macro to access controls
To: Vinod Koul <vkoul@kernel.org>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-4-pierre-louis.bossart@linux.intel.com>
 <20200826085540.GY2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9c078341-7e90-a4e8-da30-19e9720d93e4@linux.intel.com>
Date: Wed, 26 Aug 2020 10:00:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826085540.GY2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



>> +/* v1.2 device - SDCA address mapping */
> 
> Can you please add description of bits used by each field here,
> something like we have done for DevId

were you referring to something like this?

  * Spec definition
  *   Register		Bit	Contents
  *   DevId_0 [7:4]	47:44	sdw_version
  *   DevId_0 [3:0]	43:40	unique_id
  *   DevId_1		39:32	mfg_id [15:8]
  *   DevId_2		31:24	mfg_id [7:0]
  *   DevId_3		23:16	part_id [15:8]
  *   DevId_4		15:08	part_id [7:0]
  *   DevId_5		07:00	class_id

> 
>> +#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |			\
>> +						 (((fun) & 0x7) << 22) |	\
>> +						 (((ent) & 0x40) << 15) |	\
>> +						 (((ent) & 0x3f) << 7) |	\
>> +						 (((ctl) & 0x30) << 15) |	\
>> +						 (((ctl) & 0x0f) << 3) |	\
>> +						 (((ch) & 0x38) << 12) |	\
>> +						 ((ch) & 0x07))
> 
> GENMASK() for the bitmaps here please. Also it would look very neat by
> using FIELD_PREP() here, you can skip the bit shifts and they would be
> done by FIELD_PREP() for you.

ok.
