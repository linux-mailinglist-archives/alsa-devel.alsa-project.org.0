Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF8336ED3
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 10:27:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1747F176A;
	Thu, 11 Mar 2021 10:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1747F176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615454861;
	bh=J2llBQjxfrGrQ6GSB6lJ18R949QJbqDlKldKC5Wtxlw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cETUcvq6Msd8KVgofZvy6ji5Z0cm7FDjHnftwkwiaFF6TOpsVNSlC3bW9t69e9fv+
	 suI+Du17BLAfxfZMElfZK6eRrN807Nv0Q2U+0nCiBJA/VPxLDTxjxRkaegL8TQPjwh
	 J+EhFpx9UJxq+iyXGPuTcCh3ZaOPmh+UFyFvKBJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A45AF8019B;
	Thu, 11 Mar 2021 10:26:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA4CF80227; Thu, 11 Mar 2021 10:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13682F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13682F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="outNCUuk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B9BRAn015584; Thu, 11 Mar 2021 03:25:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=g+p5KADsm0nlD2JkVntafglKAx7rDyNTyWDWKt5yxC8=;
 b=outNCUukLZVMF9vFaMn6/GHpijWlsxG+rSL2PMxw4AHGZgQJOt8jVO1pGnoBrwtwgFSK
 DHF6loVsYEWD+s3D8+e1+vSy0WYfKEyyfXEnBS5N02Q3Qt8ljwXfCwPbAOe3DPXISf1m
 B9A8d/DNYGC5CKdppivCrENACZ/+I+4NARDWRmSOr8umnTHVFDUfH12z7vuZPUjqkZT8
 TMijK0SemnCWl9XoUTc1aTMBysxy9qe0B/PpURZenaLlyOFfVwMmZTYtsrFj45TCN9jp
 GKd6GfEKi1CceYIkWOnPCeT0Af/gGe4AypbLJ5OxjPvJUpmeacGKNh7rdz1vrX1x85Rm mw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471vx158-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Mar 2021 03:25:55 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 11 Mar
 2021 09:25:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:25:54 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 036CB11D6;
 Thu, 11 Mar 2021 09:25:54 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:25:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 04/10] ASoC: wm8903: remove useless assignments
Message-ID: <20210311092554.GL106851@ediswmail.ad.cirrus.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
 <20210311004332.120901-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210311004332.120901-5-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110050
Cc: tiwai@suse.de, patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Wed, Mar 10, 2021 at 06:43:26PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warnings:
> 
> sound/soc/codecs/wm8903.c:1552:11: style: Variable 'best_val' is
> assigned a value that is never used. [unreadVariable]
>  best_val = ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
>           ^
> sound/soc/codecs/wm8903.c:1559:12: style: Variable 'best_val' is
> assigned a value that is never used. [unreadVariable]
>   best_val = cur_val;
>            ^
> 
> Indeed what matters in the code is the blck_div, the best_val is
> assigned but never tested or used.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
