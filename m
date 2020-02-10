Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5591570DA
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 09:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88291167D;
	Mon, 10 Feb 2020 09:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88291167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581323696;
	bh=NTJuuO75+yOh+iBH4Hc3KTa0D6oq6J97FaMqJXp5/Z4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcYuw25PXR+mQbBqJk66qmh5VBPW0smZlBFxPlpi4I9qXt0/nH+4I6WbNiKRlMkXX
	 1ElG7JOSQx7rlFhXMb+svxjLsro23/JxL9Yl6eupu8mv+bl/gvrXslAnZL+f1gNnfF
	 WplbyRIeRnH5qiAREGDDers8jQNEz8N+1E5FDyoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B6C5F80228;
	Mon, 10 Feb 2020 09:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEE49F80157; Mon, 10 Feb 2020 09:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17AEFF80118;
 Mon, 10 Feb 2020 09:33:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17AEFF80118
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 00:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,424,1574150400"; d="scan'208";a="237026122"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.51.144])
 by orsmga006.jf.intel.com with ESMTP; 10 Feb 2020 00:33:01 -0800
Date: Mon, 10 Feb 2020 09:33:00 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Message-ID: <20200210083300.GA20345@ubuntu>
References: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
Subject: Re: [alsa-devel] [Sound-open-firmware] [PATCH 0/3] ASoC: SOF:
 VirtIO: preparatory patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

Any comment on this?

Thanks
Guennadi

On Fri, Jan 31, 2020 at 12:43:52PM +0100, Guennadi Liakhovetski wrote:
> This is the first set of patches for the SOF virtualisation work. We
> send these patches first because they touch the ASoC core. 2 of them
> are mostly cosmetic with no functional changes, but patch 2/3 might
> cause some discussions. Please review and comment.
> 
> Thanks
> Guennadi
> 
> Guennadi Liakhovetski (3):
>   ASoC: (cosmetic) simplify dpcm_prune_paths()
>   ASoC: add function parameters to enable forced path pruning
>   ASoC: export DPCM runtime update functions
> 
>  include/sound/soc-dpcm.h |  30 +++++++++--
>  sound/soc/soc-compress.c |   2 +-
>  sound/soc/soc-dapm.c     |   8 +--
>  sound/soc/soc-pcm.c      | 126 ++++++++++++++++++++++++++++++-----------------
>  4 files changed, 112 insertions(+), 54 deletions(-)
> 
> -- 
> 1.9.3
> 
> _______________________________________________
> Sound-open-firmware mailing list
> Sound-open-firmware@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/sound-open-firmware
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
