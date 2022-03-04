Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 105334CD8F8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:18:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19401B0B;
	Fri,  4 Mar 2022 17:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19401B0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646410735;
	bh=pplyzGOZjti6+eMC6tYcsKqtOHNvx8g5ht6HGNnoKqk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKTIWbbU42dFseGCohOTWOB6z4oUpBsK/RYKR6xvoF1rOcQ226aGGwfe/Vh8/W4jx
	 hnO9fdPGTNvzJdW3pdBce+O0JFRn+TQ5CJXavTohmA8DjXLKhOnRcw/01tqYUsHYJE
	 qLtYQJR8SmFtBcgb7FfHWIUC3RrTZI6pT4lA46AI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A75F800F2;
	Fri,  4 Mar 2022 17:17:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BDA0F801EC; Fri,  4 Mar 2022 17:17:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C79BF800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C79BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JJWb49rd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 224DOfXD012568;
 Fri, 4 Mar 2022 10:17:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=zjqR9q9GiOBUPRKXEJb75rxzZ1gRxVDQCkHM71cLsyk=;
 b=JJWb49rdZfvOAhrJcW+9e/tL8LBdjImXnsSU0P5u6QUJObwMU5kH8D4sTI9sNSDE6giB
 eTZ1AtONUD2u4pe1WqF3EEBjWUqYvDEPicuIOqiljkGfXldbETusqRUuDJ4WXwlpuhR/
 mbN8PfFVd7lZy3SY1w10s5aLCRNqS/ogsqdd1dTZWUIish1MCkiz31vRySgxi2/u2xHl
 BUqG3X/4f8Wuw/h1YSXSSds2XtNBwsGpiZln15nYvRLl1c/LBSiz4KmCAUo90SaIqBtc
 kOxM1gS6U9dLQ376BA9JhVosDhieaTyPxgkyOoHwjVUCo0YFHILSQrFK+qq67aiqsLBS Og== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h6we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 10:17:36 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 16:17:34 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 16:17:34 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 34C13B06;
 Fri,  4 Mar 2022 16:17:34 +0000 (UTC)
Date: Fri, 4 Mar 2022 16:17:34 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v2 13/20] sound: cs35l41: Enable Internal Boost in shared
 lib
Message-ID: <20220304161734.GF38351@ediswmail.ad.cirrus.com>
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
 <20220304150721.3802-14-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220304150721.3802-14-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: za1i0AhO99R2P4JBpiRAN2mzmymFBZOf
X-Proofpoint-ORIG-GUID: za1i0AhO99R2P4JBpiRAN2mzmymFBZOf
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Fri, Mar 04, 2022 at 03:07:14PM +0000, Lucas Tanure wrote:
> Boost enable is the default option from reset,
> but with external boost support, internal boost
> must be disabled.
> Add the enable of boost in cs35l41_boost_config
> to centralize the internal boost configuration.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
