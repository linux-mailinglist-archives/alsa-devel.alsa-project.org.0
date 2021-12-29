Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A0481174
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 10:57:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A7EF1744;
	Wed, 29 Dec 2021 10:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A7EF1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640771846;
	bh=zDujzLKo2UafknoNFJ5fEoqa+N/BRwpV6Lqx+aBg/7k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gL3vdG7PhAuaKkrbl6ceavbPd3dbpU8r/v2OUgNGrrYHWexDTPZ40yhsVv/TLaxG5
	 JY2Ej+PrOLOitpEPHkU9ZUXi5+RpWn/0Zt6vXsqN8trfFmVNDCGpK9QVdL76Gi71zD
	 3ZzmMnZ+VHvW7K/FzY09D3tcLRO0KX+W8nv8kRiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D794CF80224;
	Wed, 29 Dec 2021 10:56:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2B64F801EC; Wed, 29 Dec 2021 10:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14BCFF800D1
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 10:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BCFF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="E1kN5X34"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BT9j9Gw021111;
 Wed, 29 Dec 2021 03:56:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=I6yDp7lk8TpMJKUqpuB2GTBSL4BlyZqhTZqtkDkCXj8=;
 b=E1kN5X34bm2GKPRdQxD1tMVE2Q1SaOCp/PldYVvEC8S92y+W0zlCwTxA7VPxTpjVkCZZ
 nUv8RAjfE7j5gkkA2CkTv8WSsOBpRNwYSzBlEqZKXcwu9lu9LgmbDEGklrAFnMeIQ7hR
 0eqiwpx1S815FkjRCgTwgCpxh4M9JsIsLaY4LbsF/zhs4cLtsYSFRpfscNEB3mbI/DU9
 U6DnsRCbZl6F7CSmL4VR/0ucwHuGoqnwr8CPwaH6qa1mpMviNebQFZoKd5/dUhdSonqf
 GTB3UE1tgLUeGMs/ToaHMbIGWmjxi5WK7LC6Q1W4QiM2KOFkCx07ywMwNNRjdCOqiwbQ hQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3d7c571wmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Dec 2021 03:56:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 29 Dec
 2021 09:56:04 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 29 Dec 2021 09:56:04 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C39446C;
 Wed, 29 Dec 2021 09:56:04 +0000 (UTC)
Date: Wed, 29 Dec 2021 09:56:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RESEND 1/2] ASoC: cs4265: Fix part number ID error message
Message-ID: <20211229095604.GY18506@ediswmail.ad.cirrus.com>
References: <20211222141920.1482451-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211222141920.1482451-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: Khmnv2aslwyKOtI7wxYxiCuQDA0gU4aw
X-Proofpoint-GUID: Khmnv2aslwyKOtI7wxYxiCuQDA0gU4aw
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Paul.Handrigan@cirrus.com, james.schulman@cirrus.com
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

On Wed, Dec 22, 2021 at 11:19:19AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The Chip ID - Register 01h contains the following description
> as per the CS4265 datasheet:
> 
> "Bits 7 through 4 are the part number ID, which is 1101b (0Dh)"
> 
> The current error message is incorrect as it prints CS4265_CHIP_ID,
> which is the register number, instead of printing the expected
> part number ID value.
> 
> To make it clearer, also do a shift by 4, so that the error message
> would become:
> 
> [    4.218083] cs4265 1-004f: CS4265 Part Number ID: 0x0 Expected: 0xd
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
