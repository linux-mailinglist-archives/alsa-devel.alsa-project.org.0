Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E431BAD3B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 20:52:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA324168E;
	Mon, 27 Apr 2020 20:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA324168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588013528;
	bh=ZVQCp/SFnBPmSLWaR0/P4hpecsJkiyChWCtrVvt8wSQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mBxRVjYOIyDJ5490PJyX/Af8RCHziiJBR8DD8bBNJBOKMXAqEZumHBGkyoRAjk8pP
	 Z88zl+mWPbqegn25usunkSBupn9WvPgTLYWx1+PoUji+lPI/zTG8FJ/eCgJjjAVLnt
	 sq/yIfe82n4bdzAUPETzkbng3qFw6Xi8ZBFmtKkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB3B1F80217;
	Mon, 27 Apr 2020 20:50:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4DFAF8022B; Mon, 27 Apr 2020 20:50:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DF7BF80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 20:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF7BF80113
IronPort-SDR: GErLBPhUHKYZotpEOioHWlazfLWU44P/pI9O2jyGu+rgm1CCwngnSDYvOUW69rzDH+7Ja6tVLQ
 oNBNnoJ4Aqcw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 11:50:14 -0700
IronPort-SDR: k6fGQjY5zDoVnhEwniGYbb5hHv7BMpYDJiTB4hMuK7siOIKOgQvYOh0kpULwb/lg/JW5wfE90S
 R6n1X0moitBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="281866779"
Received: from unknown (HELO [10.254.177.143]) ([10.254.177.143])
 by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2020 11:50:14 -0700
Subject: Re: [PATCH v2 0/3] add channel constraint for BDW machine drivers
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1588007614-25061-1-git-send-email-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <866ef71f-8794-558b-bd4d-c491ab4effc4@linux.intel.com>
Date: Mon, 27 Apr 2020 12:59:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588007614-25061-1-git-send-email-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>
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



On 4/27/20 12:13 PM, Brent Lu wrote:
> The machine driver bdw-rt5650 (for Google buddy) supports 2 or 4-channel
> recording while other two drivers support only 2-channel recording. HW
> constraints are implemented to reflect the hardware limitation on BDW
> platform.
> 
> Changes since v1:
> - Change the patch title.
> - Remove the DUAL_CHANNEL and QUAD_CHANNEL macros which are too obvious.
> - Follow the naming convertion, using 'bdw_rt5650_' and 'bdw_rt5677_' to
>    name startup functions.
> - Refine the comments in startup functions.
> - Redesign the bdw_rt5650_fe_startup() function for readability.
> - Add an assignment to initialize runtime->hw.channels_max variable.

For the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Brent Lu (3):
>    ASoC: bdw-rt5677: add channel constraint
>    ASoC: bdw-rt5650: add channel constraint
>    ASoC: broadwell: add channel constraint
> 
>   sound/soc/intel/boards/bdw-rt5650.c | 29 +++++++++++++++++++++++++++++
>   sound/soc/intel/boards/bdw-rt5677.c | 26 ++++++++++++++++++++++++++
>   sound/soc/intel/boards/broadwell.c  | 26 ++++++++++++++++++++++++++
>   3 files changed, 81 insertions(+)
> 
