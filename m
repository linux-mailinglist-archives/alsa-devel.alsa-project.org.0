Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65754AD11
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 11:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 574361845;
	Tue, 14 Jun 2022 11:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 574361845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655198220;
	bh=lkBfDkqVnNabY17OG35dQo4MnrOCx22YsjNm9ZniCac=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fb9kcwMx+zEiO5HAgWeVhWh945msvCDsOWODHwq/+oAPru8c9YY23U284NS2cjVJ1
	 JC4enxv8Tz5WadqwahghgNMu75CgtEwllFSGpXDgDgcTmqoNyA0+MLhYCJPYlD72rP
	 nXi2Pau+L+8VsmWDSAt60kC+1k5T57/qbLXBtV2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3514F800E1;
	Tue, 14 Jun 2022 11:16:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81038F80139; Tue, 14 Jun 2022 11:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B26CF800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 11:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B26CF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jc2xlFdB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E8EEoR024961;
 Tue, 14 Jun 2022 04:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=hGaw1xpIdCRzMGGJr+AjwkBfT2/8u311FkS5dHtbvyc=;
 b=jc2xlFdBKEffU1+ETM/D+dwgICc4/YvL113PC2Qx2JPrKi+3fJ62DNmX7titImY3CioW
 Ubp94ZqDHNYjZBXsgSdq8sUNtpBop1DXrNFqA+fY5UAz2G+M6BQkhaTailYQj8j2dp2K
 WVz2NB5SK/DNyX4mI3kxU8maV8rhVs5+oywWQSP6HowEMBs0/StfZCsQsNfVvNQ3HZRf
 5pXwUPRkwE88+lAYvMO3WZoNBBEZLEE/31xik4A/uuJCrVC7jsb15chv0OFa4RdpTJe/
 xYhjNg1c/7H1P48iMh3rsC2k71aGQ2tCDdUoBYDNk/b1Id01S0wl0MELvmEE4R0txMpD /A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf32w2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Jun 2022 04:15:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 14 Jun
 2022 10:15:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 14 Jun 2022 10:15:48 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 089CD458;
 Tue, 14 Jun 2022 09:15:48 +0000 (UTC)
Date: Tue, 14 Jun 2022 09:15:48 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock
 specifiers
Message-ID: <20220614091548.GC38351@ediswmail.ad.cirrus.com>
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
 <9e105410-94d5-1801-8919-af8c0cef4de1@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9e105410-94d5-1801-8919-af8c0cef4de1@sholland.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: uhUugW3zc5bftMo1ASxJcy0Ldlvdyx22
X-Proofpoint-ORIG-GUID: uhUugW3zc5bftMo1ASxJcy0Ldlvdyx22
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 wens@csie.org, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-sunxi@lists.linux.dev
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

On Tue, Jun 14, 2022 at 01:39:20AM -0500, Samuel Holland wrote:
> Hi Charles,
> 
> On 6/13/22 11:15 AM, Charles Keepax wrote:
> > Recent updates accidentally updated the clock producer/consumer
> > specifiers on this device as part of refactoring the CPU side of the DAI
> > links. However, this device sits on the CODEC side and shouldn't have
> > been updated. Partially revert the changes keeping the switch to the new
> > clock terminology but going back to the CODEC defines.
> > 
> > Fixes: 7cc3965fde74 ("ASoC: sunxi: Update to use set_fmt_new callback")
> > Reported-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Tested-by: Samuel Holland <samuel@sholland.org>
> 
> Thanks for the quick follow-up, and sorry for the confusion my earlier comment
> caused. I verified that sound is broken (loud static) on a Pine A64-LTS board
> with for-next, and is fixed by this patch.

Not at all man, thank you for spotting my foolish mistake. Glad
we got it fixed up for you, and thank you for testing it.

Thanks,
Charles
