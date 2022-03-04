Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C94CD7AD
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:23:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4E71F3B;
	Fri,  4 Mar 2022 16:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4E71F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646407432;
	bh=vDbWA01scFSr/zhxDvUqBQPBkoAbmoscgeL1MD/0qp4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGt+duVp+iqzlvx+Y4ziqP9bcTLtDUqasseTV+s+btwgCJNBJCoqooFsxZO+eW9Cm
	 PJWIzA1mA9BwKGFIebZiXUe+xZL7a30ykWT3xsYAXi7Re3WVNLwfjNzNGXutjn4Xjm
	 k7IinyEZc9OC9U53BYxPPXR/WpxGzPqt6boKCvmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C08F80311;
	Fri,  4 Mar 2022 16:22:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19194F80224; Fri,  4 Mar 2022 16:22:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0125AF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0125AF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Kq7vR+Kh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2244w2iN013723;
 Fri, 4 Mar 2022 09:22:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=zdyEa7Y4Dsr2FafTy8WZl0nDrvZfH+dMGq9ZuvpLGnQ=;
 b=Kq7vR+KhtGA8dQRLQZ9Ne23lw2Po/DfkMXM9tOJ8Z4dwp7gCwgaMoZciXJLJyq9Uu+Ll
 f0WpxYdJ+cgZQ1LukhKGZJLs1VI+Forr6P883c+ws+0Fj72ByolDi8iX2q/8jK7EIiPb
 Tj5yZTCRzno+y9sSIvqCR1TkVGpW36sqXrID9AKyRSbHVnyXl2AqR75LimN9Db7BRvf4
 pVE8Y/u/JqxTXKgn0rY4uerxlB8ifh7mW75HsNtVKBljx+4KuJ+TMMu9hhVshc1nIP93
 PAx8EmAibGAto7N5HzLYpaNgH9rt4KyAAueuw3tDLqNx/WdhUgj11dSS4g5Ck/EPBg5Y nw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h4nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 09:22:28 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:22:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 15:22:27 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3B95BB1A;
 Fri,  4 Mar 2022 15:22:26 +0000 (UTC)
Date: Fri, 4 Mar 2022 15:22:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v2 01/20] ASoC: cs35l41: Fix GPIO2 configuration
Message-ID: <20220304152226.GE38351@ediswmail.ad.cirrus.com>
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
 <20220304150721.3802-2-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220304150721.3802-2-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 6j_lMiZTNMeNu_XmAeDm7JNCjuNaQLYm
X-Proofpoint-ORIG-GUID: 6j_lMiZTNMeNu_XmAeDm7JNCjuNaQLYm
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Fri, Mar 04, 2022 at 03:07:02PM +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Fix GPIO2 polarity and direction configuration
> 
> Fixes: fe1024d50477b ("ASoC: cs35l41: Combine adjacent register writes")
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Really sorry I only just spotted this but you are missing your
own sign off here. You always need to personally sign each patch
you are sending up.

Thanks,
Charles
