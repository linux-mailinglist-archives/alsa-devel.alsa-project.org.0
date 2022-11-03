Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DD161809A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 16:08:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353211663;
	Thu,  3 Nov 2022 16:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353211663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667488105;
	bh=wZufn07VUU8yh2ssVtF4A7EwVO7U9Y4tT++3pYG0rnc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G0Be6NOUNNgX86LFOW1H9YrluuY8FL5q+LUOze55chUOZF32zA0xxNIJxa+WeccML
	 800WTKVv5qYiaVk6fzJTxGdgmQkIWlJtnk7EZpGQmDhMvhSG2PLdtWPxX2CuI84zwr
	 gUcUp+ZytVnM6YXcM4fXbMR1xuTPqz+8Vz7yh+bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A8F3F8052F;
	Thu,  3 Nov 2022 16:07:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BE3DF80155; Thu,  3 Nov 2022 16:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0413F80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 16:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0413F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d1y74jJU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A36QhvN003553; Thu, 3 Nov 2022 10:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=TcxZDwlXKPQCCqdzTr2pfzo7RdcE3/NIsDb8Wx6Kb+8=;
 b=d1y74jJUjQQw/YuT32crpeodLqJpRMGjOXz1xMsBW0IoU4hUXEPeT3LDs2GlUa+q8yDU
 BVGdqz94acG4Ls3fqdh185v1w1k4iOIhb6tvEMXaINpex4A+IBob9LUsBR5XG+qKmGVc
 3wThKKUIrRnCT4pGwDDMvGJVDm4n9noyFkpu2FA89MH+3lv2ryM2Z4JEoGRF9/NnK6Oj
 JPd5zEDovAoKygbWPbNzfHvav81v0BTrvSj+IFwkDgd95Ib/W9YYZFd1V/glesVgSJqO
 h5IBmwSSJJxc5rA29nXxbpTNfgOZB3pZ1lPPVugosVx6vLmcwZzKwlCBmLb4LNe3imO1 wg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kh1k1efuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 10:07:02 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 3 Nov
 2022 10:07:00 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Thu, 3 Nov 2022 10:07:00 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 20F332AA;
 Thu,  3 Nov 2022 15:07:00 +0000 (UTC)
Date: Thu, 3 Nov 2022 15:07:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jason Montleon <jmontleo@redhat.com>
Subject: Re: [PATCH v4 2/2] ASoC: rt5677: fix legacy dai naming
Message-ID: <20221103150700.GC10437@ediswmail.ad.cirrus.com>
References: <20221103144612.4431-1-jmontleo@redhat.com>
 <20221103144612.4431-2-jmontleo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221103144612.4431-2-jmontleo@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 3JXg8iWZ1IgOwI4Dv6wWBf9mpFDxm1A9
X-Proofpoint-GUID: 3JXg8iWZ1IgOwI4Dv6wWBf9mpFDxm1A9
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, cezary.rojewski@intel.com,
 regressions@lists.linux.dev, tiwai@suse.com, alsa-devel@alsa-project.org,
 stable@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org
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

On Thu, Nov 03, 2022 at 10:46:12AM -0400, Jason Montleon wrote:
> Starting with 6.0-rc1 the CPU DAI is not registered and the sound
> card is unavailable. Adding legacy_dai_naming causes it to function
> properly again.
> 
> Fixes: fc34ece41f71 ("ASoC: Refactor non_legacy_dai_naming flag")
> Signed-off-by: Jason Montleon <jmontleo@redhat.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
