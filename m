Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D92E740C5FB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B3A71832;
	Wed, 15 Sep 2021 15:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B3A71832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631711527;
	bh=kS/HrUbOjHd9CfrxSXLoSc0aZV7JpjG/KBQ/3HZVqZU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NedssotdKdrk73rzJ+p1tIHk50TyELjbLMae25xEvRp+GDkO49dby2hh1U+2PVNyW
	 aCcH8PJNvBD1j2yJgmT5J+jV+oIaVQRzhV7e7GcX20JxI/Ekg5Fni7JCAKQvnUgiXU
	 rq6HNUWTw6IogbviPD49EHA/QhZf7rFXZg/pCGCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF13F80117;
	Wed, 15 Sep 2021 15:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D899F8027C; Wed, 15 Sep 2021 15:10:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1572EF800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1572EF800EF
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="220436810"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="220436810"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:10:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="472394664"
Received: from msavu-mobl1.ti.intel.com (HELO [10.251.216.36])
 ([10.251.216.36])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:10:35 -0700
Message-ID: <ec54c494-4d3b-675d-f519-3a3d296778d6@linux.intel.com>
Date: Wed, 15 Sep 2021 16:10:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 04/12] ASoC: SOF: imx: imx8: Bar index is only valid for
 IRAM and SRAM types
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
 <20210915122116.18317-5-peter.ujfalusi@linux.intel.com>
 <20210915130041.GG5389@sirena.org.uk>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20210915130041.GG5389@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@gmail.com,
 pierre-louis.bossart@linux.intel.com
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



On 15/09/2021 16:00, Mark Brown wrote:
> On Wed, Sep 15, 2021 at 03:21:08PM +0300, Peter Ujfalusi wrote:
>> i.MX8 only uses SOF_FW_BLK_TYPE_IRAM (1) and SOF_FW_BLK_TYPE_SRAM (3)
>> bars, everything else is left as 0 in sdev->bar[] array.
>>
>> If a broken or purposefully crafted firmware image is loaded with other
>> types of FW_BLK_TYPE then a kernel crash can be triggered.
> 
> This is a fix which should have been at the start of the series.

The same is true for the next patch for imx8m, I'll move it ahead in the v2.

-- 
Péter
