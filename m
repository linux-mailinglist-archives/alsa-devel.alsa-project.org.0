Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C995F4CD1EF
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 11:03:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F6C190B;
	Fri,  4 Mar 2022 11:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F6C190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646388221;
	bh=hrpCtoqiQ0s8vFAEMoQ3gk4nbkKnMFRcFHxTjKb7xlI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JLk+MS3GViND1grzu8DsywZOuqcB+0rUvF6TtxOMeLJCCDU62Fl3d1LmciN8u324a
	 R0i+O4EsSW0+tJ6azrWSbVGBKHFCDNxtNsPa5612bOQLIEArnHn50S6l0srmapBeyX
	 V8fx3CzlhHuRYdKCYmi+63/JkBu8cwE8m36mCax8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 725BEF80311;
	Fri,  4 Mar 2022 11:02:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DF7FF801EC; Fri,  4 Mar 2022 11:02:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AAFFF801EC
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 11:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAFFF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZIOhoEFL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2247SM8v025160;
 Fri, 4 Mar 2022 04:02:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=m480WoGIj49SZf0SqpjkJC1Q1fWJXgkdkw/YFV7gZvU=;
 b=ZIOhoEFL+j7MiKdJNswIPiJo2XRbj8ZXbLhmpxwEjkj273nmKamQM0sHXViVArG4jLfC
 HAr9QDidoAuC7jM+VTvXR0iHK3eCZs3rvpVx7s5VGnE8gJg6mPCjuBxDKNOVZgiO5bDY
 2fzUxwydS+2LGORetBenjdFOWbqIoByA2d6iiL9f8R5dmpxAoZDSHbK4JmPquypSchTl
 TwH0n+NCl98SVj74mxnu3GLFqa6eFLB/crbYfeu1bXvm+4USpAG6Ra0QprxUjcPwpQd9
 WGXt3wlAeaRTky8B1EHrNejuMb/RoFCobWJW0Ab1avEw8wplNwouMRimPIwUEPNQ+iaj Zw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j1rs4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 04:02:04 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 10:02:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 10:02:02 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 047597C;
 Fri,  4 Mar 2022 10:02:01 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:02:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 02/20] ASoC: cs35l41: Fix max number of TX channels
Message-ID: <20220304100201.GX38351@ediswmail.ad.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
 <20220303173059.269657-3-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220303173059.269657-3-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 6I9BDi-CgjIff8cp0m2Vg-QPVTmpnu2h
X-Proofpoint-ORIG-GUID: 6I9BDi-CgjIff8cp0m2Vg-QPVTmpnu2h
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, Mar 03, 2022 at 05:30:41PM +0000, Lucas Tanure wrote:
> This device only has 4 TX channels.
> 
> Fixes: fe1024d50477b ("ASoC: cs35l41: Combine adjacent register writes")
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
