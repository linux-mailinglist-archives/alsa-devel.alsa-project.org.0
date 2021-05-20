Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4D38A0A6
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 11:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42EF167D;
	Thu, 20 May 2021 11:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42EF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621502059;
	bh=qNZSQv6Rp16ydl7K5UBaKn1dCmrcaYHQGUNZpjLYlWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oaiqish70MFF8S7X+a/IXBISqTH7gwCYNpv3pUeOT7doeXq0PxVd02pVOM6sJUkrQ
	 yPOIonm9IOw0ZHUyodDwqLFzZiee/7+tFzuU19hPAvKR9M2ygYb1MZLmYrpmjljmH+
	 bhKibtZ1aQJu745SduBG7yuleK4imJsdS0pZHiZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45AC4F80229;
	Thu, 20 May 2021 11:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E7AF80127; Thu, 20 May 2021 11:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15F2DF80127
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 11:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F2DF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="p5F23JLn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14K9BskF015356; Thu, 20 May 2021 04:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=kgMXgU6Drc7cCBmMzgp6qY185dcSxO/26GftoC92ZcM=;
 b=p5F23JLnRHPaHdvKwWyfosmJ1Gy3Ij8uHg+97eV8g+A5q2nTVzJZ9+TPH/QsGq1VdnAU
 QzMnADrFiovauHLehrYkEi0dgbfhtmgzdYRPbeG55snDJWG59Pq9KI5asnc4p9u6dU6I
 yHLQvonMG+nAOzjBoOEHeRuSpy5PI07JS18nfyQSG6zbDtZ1RQwLiNaivyqfv1v6KCp5
 3fNQtRG1kWg4Ai+pwtbkYOnftxU+ntEIxmfar5MdD4d+2ec++knjCuM4ziDvdWxRbkEF
 IQYzkpOuQ8fzK289FlQ8GvQ2zB09wl3juIX64UWy6cgDe/AgZp0xS+A68ewdcmiEAgU0 9w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38n43v960x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 May 2021 04:12:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 20 May
 2021 10:12:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 20 May 2021 10:12:37 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1B4D911CD;
 Thu, 20 May 2021 09:12:37 +0000 (UTC)
Date: Thu, 20 May 2021 09:12:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ASoC: cs35l33: fix an error code in probe()
Message-ID: <20210520091237.GI64205@ediswmail.ad.cirrus.com>
References: <YKXuyGEzhPT35R3G@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YKXuyGEzhPT35R3G@mwanda>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: bYfN73qFYeEJsvw_yGXDZMa0sx_KDVL7
X-Proofpoint-ORIG-GUID: bYfN73qFYeEJsvw_yGXDZMa0sx_KDVL7
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105200070
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Mark Brown <broonie@kernel.org>, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

On Thu, May 20, 2021 at 08:08:24AM +0300, Dan Carpenter wrote:
> This error path returns zero (success) but it should return -EINVAL.
> 
> Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Good spot dude, sorry I missed that one in my recent fix ups.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
