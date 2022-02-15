Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48D34B69EC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 11:56:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F6017F4;
	Tue, 15 Feb 2022 11:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F6017F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644922616;
	bh=8xwvlNFZP1IhwHTVMAuPxLMHwhQBHWnqZR1SNZZ0MV4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CdFrLmZlkWalV5WYEDRa18XQ/MnJ3jtfU7yyc6Y+rJKbHeOnfp5Pb2FqZiMw5JvCS
	 WFCaMOrUS2MRnvaQBFVr2yVG3hvzlkhi4jo2EEQRWYiCaQpWhcfSsthyeGN5e9B3Cr
	 9vsvO0Xy6Ztih4pJJ2s0FW1KkwIjFx0Xd7Ed1qhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3878F80159;
	Tue, 15 Feb 2022 11:55:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7F07F80132; Tue, 15 Feb 2022 11:55:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E21D2F800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 11:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21D2F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Jp3pzaNe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21F4STA4031155;
 Tue, 15 Feb 2022 04:55:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=9pRI9DHKMGrjxTpdktKuGS8mctU4c81Pqefuj9Uotc8=;
 b=Jp3pzaNepVGVVDVl+Igkfk8BlLbu+gQbUcdAqV4rmSlO7FBvUIArT6iofAI2ZVycyqDm
 I6ENQqlHwdhB0+AThKzsyqp5J/gYbBKgmnPAyfnOo7MEiW2wnQw35uQsKxHJk89NTL9q
 LYi+vBNq4bukYemDZJHLtHZjAkBHZ7Pgfinb3vAQ1TTqtH0nExM4b+2mlCRIl9ixx257
 YNH7fsSe6yz0pgFUIjWZGiAG5YbtDiHwbiwihAYQna8wcXRqhjEw7YzfhQBsB6k0ux7M
 hvXNPA0LNpqeacn+OSoXI7IefUr8DR1YjZlu737ncMPlvUBbvNPOUtF/RGiMZLER3fI0 uQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3e7kx7sbp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Feb 2022 04:55:36 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 10:55:35 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 15 Feb 2022 10:55:35 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 48B4811C7;
 Tue, 15 Feb 2022 10:55:35 +0000 (UTC)
Date: Tue, 15 Feb 2022 10:55:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH] ASoC: codec: wm8960: complete discharge on BIAS
 OFF->STANDBY
Message-ID: <20220215105535.GE38351@ediswmail.ad.cirrus.com>
References: <20220208121727.4461-1-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220208121727.4461-1-viorel.suman@oss.nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: HvhLj2FcgwmuXl1hKIbOImqGwRK0Hy7H
X-Proofpoint-GUID: HvhLj2FcgwmuXl1hKIbOImqGwRK0Hy7H
X-Proofpoint-Spam-Reason: safe
Cc: Shengjiu Wang <shengjiu.wang@freescale.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org
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

On Tue, Feb 08, 2022 at 02:17:27PM +0200, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> On BIAS STANDBY->OFF transition the current implementation sleeps
> 600ms on suspend in order to discharge the chip. The suspend is
> propagated from "snd_soc_suspend" call for all audio cards in a
> serial fashion, thus in case of boards like i.MX8DXL EVK which has
> 3 distinct WM8960 codecs the total cumulated sleep on suspend is 1.8
> seconds.
> 
> On the other hand the BIAS OFF->STANDBY transition happens
> asynchronously with regard to "snd_soc_resume" - the call is
> propagated from "soc_resume_deferred" which is just scheduled
> from "snd_soc_resume", each card having its own work scheduled to
> execute "soc_resume_deferred" call.
> 
> The patch performs discharge completion on BIAS OFF->STANDBY transition
> so that the cumulated effect on suspend described above is avoided
> and discharge is completed in paralel in case of multiple WM8960
> codecs on the board.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---

Apologies Mark not sure how I missed this one, a bit late now,
but the change looks good to me.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
