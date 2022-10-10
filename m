Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7BD5F9BA9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 11:10:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C7B1ACB;
	Mon, 10 Oct 2022 11:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C7B1ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665393051;
	bh=ZcdeHNlBtBQDoSa+mIoyTI79xslNmsfS5VMRA43NIJ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwuRyWNi+7YDQKiAaVrniNsWKBCZXpStSuJb/VEYqxImXjR1canNQE7zDneeBv25D
	 2UQWphBplEWW8r+lHz7bvZwD+y+my/H4Oppn/BmaSKh3OOSBbShkz+ieisl0J5p04q
	 MR1Qq+0yaCkn7hlpLvKwcMBy96gO/pGbn4wKhs+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05B52F80155;
	Mon, 10 Oct 2022 11:09:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A97F80107; Mon, 10 Oct 2022 11:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D591CF80107
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 11:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D591CF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hV9iwlYY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29A7wfNH020152;
 Mon, 10 Oct 2022 04:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ihtmFH6a9zq45CCx/RyFyA+uQJY1mTuU4uxwk5kPMUw=;
 b=hV9iwlYYICt3bgLCt0RMRIBZ+QhCQs4oOtMP2e5RkmcMKLTjJ3s2mWirLbZ2KifmThLi
 40a7JDNpmO5uDfaj6jfdJJWyIn54WTThwVLXCluV6EzStZwgBcFl+3hkpsRfqpj6r6Wi
 xkQ/35LJ70goEp6E2OpRWEUO1dT9lT2b4NXkhl1P61gorqdr3s10YVJSItOnQqokoB0h
 LCRs3ZlBoQTTXhoA15Om1Kbx5k879mvFa1zePqXiovxFqe3Qje9eyBlLTzbhvYNzOXOE
 SwV5Vtyvd9c+VGrjBmfJbHPGmS2QacApwv3zaQxgp5zF49LHT0PfbGDcCqqGVozmATkX SQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3k35mpstx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Oct 2022 04:09:46 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 10 Oct
 2022 04:09:44 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Mon, 10 Oct 2022 04:09:44 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A3CD8356D;
 Mon, 10 Oct 2022 09:09:44 +0000 (UTC)
Date: Mon, 10 Oct 2022 09:09:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH -next 0/3] Revert old "Fix PM disable depth imbalance in
 wmxxxx_probe"
Message-ID: <20221010090944.GC92394@ediswmail.ad.cirrus.com>
References: <20221008134358.131712-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221008134358.131712-1-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 7wmqM7AOmVYSQqZtp7Rf2lWyI4I4rzZ2
X-Proofpoint-GUID: 7wmqM7AOmVYSQqZtp7Rf2lWyI4I4rzZ2
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 ckeepax@opensource.wolfsonmicro.com
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

On Sat, Oct 08, 2022 at 09:43:55PM +0800, Zhang Qilong wrote:
> Both the old and new patch have been applied, it will resulted in
> redundant calling of pm_runtime_disable when error returns. We Just
> revert the old three patches to fix it.
> 
> Zhang Qilong (3):
>   Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
>   Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
>   Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
> 
>  sound/soc/codecs/wm5102.c | 6 +++---
>  sound/soc/codecs/wm5110.c | 6 +++---
>  sound/soc/codecs/wm8997.c | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Yeah we definitely don't want both applied:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
