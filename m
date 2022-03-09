Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F064D34D2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 17:32:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EBA21723;
	Wed,  9 Mar 2022 17:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EBA21723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646843526;
	bh=FegaM7fyquQcvIUfdFGLo9QJeHrC8j0dQiqA9J/gNVk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dtBHgSBXPCEbWezysQGPM7qBjbzDUG0kdMyoj/bMFHD5ojmFzrLR/VBvcbZ89j1SE
	 tb0R0gxSx8G1NSWLDO3sQmAk24KjcmbSUnYMfGWSQMcYXcNvZ6d4QMftmD0XgNL6Pr
	 I+psTdmqsSH/xXq/Rhf4kI44w4fhVcjI/55WLVEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D1EF80236;
	Wed,  9 Mar 2022 17:30:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC164F800D2; Wed,  9 Mar 2022 17:30:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D389F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 17:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D389F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fDW5v5bE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 229ChahE025200;
 Wed, 9 Mar 2022 10:30:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=5p9dlokEkB0sYsrc9fOvTc1J5T04pBFuBWWS+FlOuYM=;
 b=fDW5v5bEuOn5ZRJKZ54qCUsh0X01/+9fAFAGK91fs+EaS/ymSL3/qeyG05XSqn5rE8bX
 g6Sge4ijTiLE1ajjz/SDYSCOUuPr4Js6GGj/UBDeNgd5q1DMGC7h3WmtxNvEL3FhRywc
 ghn+DX7RK4U7MkvxTZfdGqwZOL1i9GHZc0XSJGuvr8tSDmvB9bDP4maMKcZ99FAHsypA
 drSlgFRL7rsmXuHy+8VzXMvauC5Dev/R4wWI6DhlPi7/AHzpzi52U0fRv+pMgvX5hw2n
 skNTf1VRv4ksuYvCjW8uf8J0CkNxRvYqxuHlQ8IRncjRk4vwWxfeE8HvDRffBKBx758L 3w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656nwq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 09 Mar 2022 10:30:50 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Mar
 2022 16:30:48 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 9 Mar 2022 16:30:48 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 026CF46C;
 Wed,  9 Mar 2022 16:30:47 +0000 (UTC)
Date: Wed, 9 Mar 2022 16:30:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Compressed stream DSP memory structs
 should be __packed
Message-ID: <20220309163047.GJ38351@ediswmail.ad.cirrus.com>
References: <20220309130017.2816-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220309130017.2816-1-simont@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: c9fV52yxDRZ7L-UVldX0dtYbvo2KBf-A
X-Proofpoint-GUID: c9fV52yxDRZ7L-UVldX0dtYbvo2KBf-A
X-Proofpoint-Spam-Reason: safe
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

On Wed, Mar 09, 2022 at 01:00:17PM +0000, Simon Trimmer wrote:
> The compressed stream code has a bunch of structs that are used to
> represent DSP memory but have not been marked __packed. This isn't
> safe, they could get padded on a 64-bit build.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
