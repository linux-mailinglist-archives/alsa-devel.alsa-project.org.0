Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E266837B7DA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 10:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7632F188A;
	Wed, 12 May 2021 10:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7632F188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620807946;
	bh=KMZqIEr8YTWtWXmI7lwrcBlIqPYxtUpzgkZI3AbbugI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ze+gECMMKrnRhw83BDI3I4pXpA1i2DL7M1SdKD+/9mVT9L+quVHv7qkZo7mkKJzJ/
	 Hq2bd0Z4+Q9ruiQQGuLyOd3J6V7UdBVr1lpHzL5FmbDLc8SovX0KSODVaSJem1Lcfa
	 HXViLOpglDJ7dtn/SbHgepHG183888g08cbH5Upg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA98FF8026B;
	Wed, 12 May 2021 10:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E31AF80240; Wed, 12 May 2021 10:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49DF7F8013A
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 10:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49DF7F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="beETCuRY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14C8GxTo019727; Wed, 12 May 2021 03:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wG06jQsuxXmpyimFW25Di30SFAygGPupxoCDyLNhcwM=;
 b=beETCuRYrXrA3GVdgcPhpdwYtmDsB405/VaNYvJghaNT2P3Q95bJkx3mT10yjxhsvd3E
 70ERBtS+K8OyZb25wUrCa6int9YAnhBfgIuLGbP8Z+27JEaPJv3WRj1yETCiUpTF8GOm
 68iJ8itrDANQun4xMba9i2Djj7BF/xv0fN5yXnuLCmT+4N+gJiif7tcv841Spk0BYDWr
 fT2C9dR2q3PHR23aIGCoitjnShND1CwxNZ1PNG1v7Zw9upH3hmH2CvoCm5VTt4S3jlcS
 9ltcAZ4vQBisvIhE3+LAktOe03yG3jkAWhiJaQ4Sk6TttfvJiTyEcVYVuRodE3/+fALw kg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38f4x1ata5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 12 May 2021 03:24:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 12 May
 2021 09:24:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 12 May 2021 09:24:04 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6757611CD;
 Wed, 12 May 2021 08:24:04 +0000 (UTC)
Date: Wed, 12 May 2021 08:24:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: mark more data structures with the const
 qualifier
Message-ID: <20210512082404.GF64205@ediswmail.ad.cirrus.com>
References: <20210511171459.270169-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210511171459.270169-1-simont@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: wn-E5DoFsPPEs0soT1eJRsZdpd7wZ-aW
X-Proofpoint-ORIG-GUID: wn-E5DoFsPPEs0soT1eJRsZdpd7wZ-aW
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120060
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

On Tue, May 11, 2021 at 06:14:59PM +0100, Simon Trimmer wrote:
> The callback structures and memory region type table can be marked as
> const as they will not change during use.
> 
> Fix checkpatch warning against wm_adsp_find_region function by moving
> const keyword to form the 'static const struct' pattern.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
