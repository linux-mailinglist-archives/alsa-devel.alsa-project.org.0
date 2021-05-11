Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37837AA09
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:58:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B266E17E8;
	Tue, 11 May 2021 16:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B266E17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620745108;
	bh=vrxFhJ64CkfjgbGx2wBTHOz7xK2WqSHaxbNG+9D/Ov8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHX25o4FqXg4mFyndHOYd5oiE6KgrjyQAQ287VdKs/TovLm0Ne0OjX/WjUBY/e8Vu
	 fyqvo3OYZoVHkN5vQoYf2oOpUxkdKmFLAniboSjWOLXG6ePkJgD1ecmADZSj4+gSPt
	 BqF6R0iIYYVqInhBeOXesp0CwGC6z7LKOP/GW5mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51DCFF80156;
	Tue, 11 May 2021 16:57:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F27FF80163; Tue, 11 May 2021 16:56:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0212BF80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0212BF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mVjrQoup"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BEupep010329; Tue, 11 May 2021 09:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=GUmiTsZa2D857EWY992Tdk6Pb79y3HyBhwjXfDZvVG0=;
 b=mVjrQoup1CR3wWN0VXqRXFsbE/WsqDDN+pqmWNKjSIalCwnPY1R65/yO53EHMzq819zX
 u2rMmKPfRbMnrZ8vrIMMCFh0CiqNA6kFmlAkoObnsext5Pa8T/eAmKECos0ou18kxa9F
 KadiC3PLlNNhwoA+BqpfKTlrTkSGdRQ5jA/DdMdTm3DjrNDhiBAqi0id+zI4ab/CIsYr
 LAoemqOeAyfdnUqjxps2U/MS2aPCNbmBf3R/XTV4JGAMmnJVpB+lrBtx1h6X//d0vmvy
 L6ZH2x56DkK01xQuNCZgWS6P6vN8mhoDcAyZL6DhT8ZQrV0WQGU0w+Zs3GPtD2T2FXWI Aw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4sq7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 09:56:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 15:56:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 15:56:43 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9CDEC11D1;
 Tue, 11 May 2021 14:56:43 +0000 (UTC)
Date: Tue, 11 May 2021 14:56:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Regmap must use_single_read/write
Message-ID: <20210511145643.GE64205@ediswmail.ad.cirrus.com>
References: <20210511132855.27159-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210511132855.27159-1-rf@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: fLHwtQWyn3_S9k3ZbLHWEMkDvaDOfPUH
X-Proofpoint-ORIG-GUID: fLHwtQWyn3_S9k3ZbLHWEMkDvaDOfPUH
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=757
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110111
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Tue, May 11, 2021 at 02:28:55PM +0100, Richard Fitzgerald wrote:
> cs42l42 does not support standard burst transfers so the use_single_read
> and use_single_write flags must be set in the regmap config.
> 
> Because of this bug, the patch:
> 
> commit 0a0eb567e1d4 ("ASoC: cs42l42: Minor error paths fixups")
> 
> broke cs42l42 probe() because without the use_single_* flags it causes
> regmap to issue a burst read.
> 
> However, the missing use_single_* could cause problems anyway because the
> regmap cache can attempt burst transfers if these flags are not set.
> 
> Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks Richard, I guess I better check the other devices I fixed
up for the same issue, as I am guessing that could probably
affect a few more. The few I have hardware to test already have
the single stuff set.

Thanks,
Charles
