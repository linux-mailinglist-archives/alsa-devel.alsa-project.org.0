Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA0445CC57
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 19:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B5617CD;
	Wed, 24 Nov 2021 19:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B5617CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637779363;
	bh=FrQ0MxwQUtQsNsDVjhTf2iiIHbf7+M1Kouy5X7uEdTo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrkDNozzG2mWmxCeefpwWqCrRlWFy1Bl3IhhFKd9SbKmVUBljCwt0wOUv+OoLAQHO
	 Qmyg4wbAaz4flMOzeIH5p3XdIYaIe7tGMA0zydWfZNpFOCEIkCUg+LuJ8WKxYw9Nux
	 Kq8vf3y6ICz1pcpfsL0zyMrQKi+HUPVbBubup5A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D34BF80212;
	Wed, 24 Nov 2021 19:41:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CB41F801F7; Wed, 24 Nov 2021 19:41:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23080F8013A
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 19:41:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23080F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aZbe45j2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AOCdIQr027676;
 Wed, 24 Nov 2021 12:41:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=pU5oPDwNb51xbR+dqzWio0+9rLLGRpYPqGSN7CQkcY8=;
 b=aZbe45j202Nc0xlZuaTj/Qf7pHvwphYzyay91bSdBc/NH0lBIjEunMnFbNuXlo0ySJJx
 URM7YVi6Gec4V3wKh8GYBQjVRNNtnpM1J0vFfa1w5J/byxf0wvluUiQvYyJX6vW4GjwI
 sqS4D4Q/XAIZs30YkBSIXutQ51MLd6RMfe3zEs7eFuhrnwGpTwAd1lk/9g6JEQvnVVBM
 p8U+u/28mSM0S0CbXzBY7bd9OqgrsU2wxnIBsvNJwZ0/jy6aRSapg/u9Vv3rz4b7bXUA
 +hgZFv1Lvtv3+e8UxJqVN9kw7gvlUTSJzDijjZP++l0f2+JZjxj/I0iPujJ//4BcQ9bs ag== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3chb8wgx9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Nov 2021 12:41:11 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 24 Nov
 2021 18:41:10 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 24 Nov 2021 18:41:10 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3FADB2A1;
 Wed, 24 Nov 2021 18:41:10 +0000 (UTC)
Date: Wed, 24 Nov 2021 18:41:10 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8962: add missing interrupt
 property
Message-ID: <20211124184110.GH18506@ediswmail.ad.cirrus.com>
References: <20211124155101.59694-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211124155101.59694-1-david@ixit.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8YLOc8iRxNGIJk4yPsfVx68GzCwvaUCs
X-Proofpoint-ORIG-GUID: 8YLOc8iRxNGIJk4yPsfVx68GzCwvaUCs
X-Proofpoint-Spam-Reason: safe
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 - <patches@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, ~okias/devicetree@lists.sr.ht
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

On Wed, Nov 24, 2021 at 04:51:01PM +0100, David Heidelberg wrote:
> Both, hardware and drivers does support interrupts.
> 
> Fix warnings as:
> arch/arm/boot/dts/tegra30-microsoft-surface-rt-efi.dt.yaml: audio-codec@1a: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/runner/work/linux/linux/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
> 
> Fixes: cd51b942f344 ("ASoC: dt-bindings: wlf,wm8962: Convert to json-schema")
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
