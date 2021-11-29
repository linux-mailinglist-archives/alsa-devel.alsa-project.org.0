Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26722461BD0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:34:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE651ADF;
	Mon, 29 Nov 2021 17:34:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE651ADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638203693;
	bh=7I0iQPg5XiQWICh9miw51x7T2wdjlHhoYE9Gpuovw28=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNhqk6X2DtaFaknWWEbiGoEe74g8f8ILV2gWYgoKjkFDCTq8QmPcmpxB4nZPRFjF8
	 smqf9UlMVM1m+mgT1rA/HWtBd1G1P49X4aTwGakTgsoxr6roaoeKxFjs/rVJR2tFfL
	 FD57a0jleY4go3Vp5oXHvLcPMhyQSlL6kdPj455Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62FF6F804EC;
	Mon, 29 Nov 2021 17:32:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64E15F804E6; Mon, 29 Nov 2021 17:32:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36551F80240
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36551F80240
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322241112"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="322241112"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="676418485"
Received: from ticela-nm-11.amr.corp.intel.com (HELO [10.212.98.225])
 ([10.212.98.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:07 -0800
Subject: Re: [PATCH v4] ASoC: Intel: boards: add max98390 2/4 speakers support
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20211125030453.4382-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c1eaccab-c02c-c012-8f21-1aae21ed8944@linux.intel.com>
Date: Mon, 29 Nov 2021 09:47:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125030453.4382-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 yang.jie@linux.intel.com, bard.liao@intel.com, kai.vehmanen@linux.intel.com
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



On 11/24/21 9:04 PM, Mac Chiang wrote:
> support 2 hw boards.
> 1. SSP2 connects max98390, 2 speakers.
> 2. SSP1 connects max98390, 2/4 speakers.
> 
> 2 or 4 speakers playback
> add echo reference capture
> add bt offload support
> add DMI_OEM_STRING for board variants
> add ALC5682I-VS support
> 
> Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Kieth Tzeng <keith.tzeng@quantatw.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>

LGTM

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
