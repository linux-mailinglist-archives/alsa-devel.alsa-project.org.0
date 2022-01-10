Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E852B4895A9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 10:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8960617DB;
	Mon, 10 Jan 2022 10:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8960617DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641808237;
	bh=5DJIP5zfYHWSHFXGWCwOpK7LN3a2WZFuEcN7NUl5o/M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PEtZUnWTJJeYNYSWTCIwmPNvESs77W6+zC2UM00FnJmN5nVbwYjtCCMBqhXtUzRSW
	 448V2CWPO5P4hhEGCTbm8kS7Zz4SQryx0HBAaj0E5EyTfozUvP8b3lgqClbFebXv+N
	 svEut+g/V9G213GVQMMZ1BIXDE2p/t/tED7y8lPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A11F2F80518;
	Mon, 10 Jan 2022 10:48:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E4AFF80248; Mon, 10 Jan 2022 10:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B77BF8012E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 10:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B77BF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O1BkUNvM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20A6juY7030824;
 Mon, 10 Jan 2022 03:47:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=eRYDLyz+LPBq9MDS7nPUbIBLRnqZnHufAJrzcP4C2OU=;
 b=O1BkUNvMs9zYY86WUIZ4Dq8MKORm0FP2eZBDm+1K1T2YrTwINHgUUIkRk4ReNX4z+YfW
 ro6wgB6hgEiHbr9g11h3mwSBec+Jg/AJ9PD1UjHJswuX/MHUjtKrkvtjYT70Jm2mCu8n
 qOPlXfBjSd4sXm4PwRZW4pnMvz1yuoJP7QvG/2iyfa6grpmX4MY+VarpHI6Lextu4srF
 MI3j3yDMaxW3pjnJsGufo2xMYOQyhBUUYT8AMWEnKSI2V5Hp0b5Ks99fb7UvjHha+Izr
 ykwKkfydaTsb12fxGqQxcaPvayUzS65o1IB46yF/xj5E9UjO08cZ/ykxdvplkUc5lXkf xQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dgfear4w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 Jan 2022 03:47:56 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 09:47:55 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 10 Jan 2022 09:47:54 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DC54646D;
 Mon, 10 Jan 2022 09:47:54 +0000 (UTC)
Date: Mon, 10 Jan 2022 09:47:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <cgel.zte@gmail.com>
Subject: Re: [PATCH] sound/soc/codecs: remove redundant ret variable
Message-ID: <20220110094754.GI18506@ediswmail.ad.cirrus.com>
References: <20220110012833.643994-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220110012833.643994-1-chi.minghao@zte.com.cn>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: sVZkMFJizHY_rDKXA1PCi7Yin1kOoQdp
X-Proofpoint-GUID: sVZkMFJizHY_rDKXA1PCi7Yin1kOoQdp
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com, chi.minghao@zte.com.cn,
 lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Jan 10, 2022 at 01:28:33AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Return value from devm_snd_soc_register_component() directly instead
> of taking this in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
