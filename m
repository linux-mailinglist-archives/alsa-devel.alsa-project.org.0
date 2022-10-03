Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A88575F2E99
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 12:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91891FCF;
	Mon,  3 Oct 2022 12:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91891FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664791573;
	bh=UytEE/av9bme7gBWVIUfglWDvGD52tP3CX9V/wO4Tg0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qI1TX2ZjM37kqXwJQp1xO4zEQggxqxRFISfsgjpdOhkLGSLFgQCr6wERg9WtbsuVz
	 k6P/mb2zQx/r9tdo7LaTZBlcqebqY9jNR6tjgVvFrcF5Y0bzSkZSj/CjSR1jNGZv9P
	 G2kAlJxVurNYtjux5khxrti8PBTbX/EetokYPko4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CCB5F80431;
	Mon,  3 Oct 2022 12:05:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E5CF80269; Mon,  3 Oct 2022 12:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E81F800B5
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 12:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E81F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="anYf/CBF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2933mftP015208;
 Mon, 3 Oct 2022 05:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ueQslRrv0xtGaVId8xAEBFWPVgtnW3Q1mwzpWlzeiJQ=;
 b=anYf/CBFOnG+DF10cSyYxmw7v6/qn4Umn43ORi8y9d1qfph96wcXaFzzzHsCw2lLQpdu
 zTH9DFZQymHQEwd7QGJT/JdQkaa1anVb+44MobnF81T/0Fl03ZLgYuoqijRJztAQqYU0
 e2BDkxH5A8zhfgkzD6QoriECHTDhWeNt9CSVW5dHfB+TYgdrIr1BB5kTe8GW1M5JGett
 SFMeTEdmm2Kbh/hjlCw+eUjtS0xJX0tET58jXXCcaMX0C+bz4TrNKRtyzRgmz30gWBhx
 V9fpmKQkbUwsLupPppxSzz1TAlCZ4O6vcMiXCdtEX1t8Q0l33lh5QjWyrer3uSxvewaM JQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jxjy321h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 05:05:08 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:05:06 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Mon, 3 Oct 2022 05:05:06 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 61FC8475;
 Mon,  3 Oct 2022 10:05:00 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:05:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 -next 1/4] ASoC: wm8997: Fix PM disable depth
 imbalance in wm8997_probe
Message-ID: <20221003100500.GV92394@ediswmail.ad.cirrus.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-2-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220929150653.63845-2-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: uJtWLhYPS0UUPJWIOZW8OPgmgRRWhBZN
X-Proofpoint-ORIG-GUID: uJtWLhYPS0UUPJWIOZW8OPgmgRRWhBZN
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

On Thu, Sep 29, 2022 at 11:06:50PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> Fixes:40843aea5a9bd ("ASoC: wm8997: Initial CODEC driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - call pm_runtime_disable when error returns
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
