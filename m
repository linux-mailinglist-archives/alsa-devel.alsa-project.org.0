Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C94B2B9E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 18:21:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A80C18E1;
	Fri, 11 Feb 2022 18:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A80C18E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644600063;
	bh=gaQhMOYUQLQdGqxXTEjbL7f36XXptHIIgVrGbBgzwCg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOnfDYHVKCHBda3cQdtvoDhVYYhPcWJn1Ja0d3zDevu8yR3g9Z+hxeYo6z1wZtX3d
	 gTiwnBFnxa/db0+fpLs+TdRjoWA7C7eTxjJvRoDFZ1YxYY24Cq1Trj4zjFSNwNdlBY
	 j2n3V1/u6CRGGypMHhzYjan+JPPx6KSOiJE23abQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB52EF8013D;
	Fri, 11 Feb 2022 18:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD834F80125; Fri, 11 Feb 2022 18:19:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77DE6F80125
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 18:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77DE6F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d6npwrZA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21B5Tw9C021781;
 Fri, 11 Feb 2022 11:19:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=r251vmoQ2L83FQn2q//QAdd00DY8XmonuwupWWqZbUQ=;
 b=d6npwrZAxXY3brRJzxErPJJNeWqhPCX6f7yk4LAMTj/puBoUCcNhwJbVzcHqkwdKxffc
 4fC1hpWkgWaCihS9M0TsikldlvBwSLlcYWvW6oRhL1YRHqqZANGP0mTl6Ad2mG7HQenq
 0HNZEJ/IVQek5NYehOAH73vFkEPiOBhxEMOdTO9L7CDcGIXWP0ogXeKphdKPWnrdp5Z1
 6weSQA1Uhl3ztnyAzWBeJ3aAHoH6QT7ZmxCgQlMQ/rL+25oI1XjgRLurTJUlw+bgNv5X
 wXp3TCuFEYtIJ0IwgdKpfdEtNNNjM5OYU0WES/1GBPMEn9d0R2CEwq4185RfQ42AJPnO gQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e4brbb92e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Feb 2022 11:19:43 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 17:19:41 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 11 Feb 2022 17:19:41 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F919459;
 Fri, 11 Feb 2022 17:19:41 +0000 (UTC)
Date: Fri, 11 Feb 2022 17:19:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wm8731: Delete empty remove() function
Message-ID: <20220211171941.GA38351@ediswmail.ad.cirrus.com>
References: <20220211165811.1176005-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220211165811.1176005-1-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: EkZFbUVSWz3vL8c8E6dOJJdQtcfZj4YG
X-Proofpoint-GUID: EkZFbUVSWz3vL8c8E6dOJJdQtcfZj4YG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, Feb 11, 2022 at 04:58:11PM +0000, Mark Brown wrote:
> The I2C remove function is empty for the wm8731 driver, it can just be
> deleted.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
