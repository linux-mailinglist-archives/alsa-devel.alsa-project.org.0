Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 356394D669B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 17:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9DAE1A75;
	Fri, 11 Mar 2022 17:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9DAE1A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647017005;
	bh=catAy0li8e6OfVX6wInp4+nweaxcRIaaN+sbl557cdM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPbvTU451ppZbT9tUHHf3BZQ6ZcbHXmWH4ZJhICUL997LoedyppWhZbXaNAHpM2Hw
	 4mK8rnpGDGpA+EXBCf3DNpPu7EM0Uy/+9TajdHfIqSzjhN4QhWFbGwlogSyJrFx83Q
	 AdA712RkuCyRRhQhOvQnSE0REmh/+HSj4TcJwZTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D18AF800D2;
	Fri, 11 Mar 2022 17:42:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89259F80227; Fri, 11 Mar 2022 17:42:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE345F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 17:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE345F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cu2FJn9U"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22BEVRGw004035;
 Fri, 11 Mar 2022 10:42:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=MBtfvtDRtz/VJzfEn3YgCvx7Yce6dxy2We1MtxjrVHw=;
 b=cu2FJn9U5krj0MYojbhSo4jaUhH70bh735OU8NhTdQlMQtWsUtpq+uNfGPQdkcS2rv4k
 Uu40wL2uP4uBDU9b5X2mJPjOlqjGhXrTA13p0uqYp23djYP4rgs2q+hveL38VKRSaX/w
 Kr0gJZ/8wyWHIdV3hqiMUP6I1lrptqTeHL+Uh37QCNhtS19pN5QghIhxPC+6K0oDACin
 h6o69gjFeqTm92/OyARsc478M7JMAy+FGeA8YBfsqtOkEwpAgEVD9QCz55NENgVYmAiJ
 0iqKyqPGRQ4KuIjlW3DUo9cvceZKCaWGAx5W/4aI1CsM5pvQ2RhlkhG1WW33IaGS6A4u Aw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656rs73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Mar 2022 10:42:12 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Mar
 2022 16:42:10 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 11 Mar 2022 16:42:10 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9EAE3B16;
 Fri, 11 Mar 2022 16:42:10 +0000 (UTC)
Date: Fri, 11 Mar 2022 16:42:10 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Add new SOC_DOUBLE_SX_TLV macro
Message-ID: <20220311164210.GL38351@ediswmail.ad.cirrus.com>
References: <20220311163258.175627-1-ckeepax@opensource.cirrus.com>
 <Yit7XQaVm+QY/iJ5@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yit7XQaVm+QY/iJ5@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: XO08_IqNel0sNJicM4cVJsxi8CE7Uush
X-Proofpoint-GUID: XO08_IqNel0sNJicM4cVJsxi8CE7Uush
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

On Fri, Mar 11, 2022 at 04:39:57PM +0000, Mark Brown wrote:
> On Fri, Mar 11, 2022 at 04:32:58PM +0000, Charles Keepax wrote:
> > Currently macros only exist for SX style (implicit sign bit 2's
> > compliment) volume controls where the volumes for left and right
> > are in separate registers. Some future Cirrus devices will have
> > both volumes in the same register, as such add a new macro to
> > support this.
> 
> Have you tested the bounds checking on _SX controls with mixer-test?

I have tested against some experimental code for a future CODEC,
but this is a good point. Let me run some tests through mixer-test
before we apply.

Thanks,
Charles
