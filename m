Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E930962A
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 16:17:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 744B516F9;
	Sat, 30 Jan 2021 16:16:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 744B516F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612019862;
	bh=vjnQEWbB3k9bHySZYJqzEbqK5JR6oWmJO/H8OHsrEZY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JYD3dDAqcukH7yZnmV4Jmqcqxmh8kAN0x0t8QH3MXGhR8+j0urvuQKQTfe14EZ4um
	 VqB27ToLzocfwSnG6aXjK03C95duICP/hziTdP5LH6ZEW1ZQ1Ew0pQYlHT+2yi1TzX
	 e02r+Sz/XCOIDvSWcWVDKnyIZmn/cWNRM5aQdSqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7BDF8020D;
	Sat, 30 Jan 2021 16:16:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59226F80217; Sat, 30 Jan 2021 16:16:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36CB5F800BE
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 16:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36CB5F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NaRdw6A9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10UFDV3R032176; Sat, 30 Jan 2021 09:16:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=p/pzeyYsnFxNAOpE2c1K2xRSiQFiBIMVCrEnGUzyVOM=;
 b=NaRdw6A9aKP6MJ3czwou6BvRpENHDuwABc6v/r9oacZKpYM7r//cZPxWJ4DWVNsiUzf6
 8oA1twK1JPMys/aMzPtNyOJgJC2AsTVNsvooS0U2cuzzOnycs+2VTIZ1yHf5ueuwJuF8
 xCRdBGYkT+J5G8u9BeYH603eFCcxyfVpRYuClnnsWKzJMoL9A49zf+P0quV99+3OXNdk
 bI9omySDwvkQ99OI66jn2dDseJkHggYhZd0Eed1gl1oKDjJgKfGZL0AJmZ0y7xPyNsii
 Ryw86pIPUpQS1WFixBRC/jzI2hZLUDCgDRSat7Osq+Hs/rR6qM9VSOXo4A5qmUxbhfGn Ng== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36d5r684w7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 30 Jan 2021 09:16:38 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Sat, 30 Jan
 2021 15:16:36 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Sat, 30 Jan 2021 15:16:36 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3709F11CA;
 Sat, 30 Jan 2021 15:16:36 +0000 (UTC)
Date: Sat, 30 Jan 2021 15:16:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 08/13] ASoC: arizona-jack: Use arizona->dev for
 runtime-pm
Message-ID: <20210130151636.GS106851@ediswmail.ad.cirrus.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121313.79530-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210123121313.79530-9-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=648 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101300084
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
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

On Sat, Jan 23, 2021 at 01:13:08PM +0100, Hans de Goede wrote:
> Drivers for MFD child-devices such as the arizona codec drivers
> and the arizona-extcon driver can choose to either make
> runtime_pm_get/_put calls on their own child-device, which will
> then be propagated to their parent; or they can make them directly
> on their MFD parent-device.
> 
> The arizona-extcon code was using runtime_pm_get/_put calls on
> its own child-device where as the codec drivers are using
> runtime_pm_get/_put calls on their parent.
> 
> The arizona-extcon MFD cell/child-device has been removed and this
> commit is part of refactoring the arizona-extcon code into a library
> to be used directly from the codec drivers.
> 
> Specifically this commit moves the code over to make
> runtime_pm_get/_put calls on the parent device (on arizona->dev)
> bringing the code inline with how the codec drivers do this.
> 
> Note this also removes the pm_runtime_enable/_disable calls
> as pm_runtime support has already been enabled on the parent-device
> by the arizona MFD driver.
> 
> This is part of a patch series converting the arizona extcon driver into
> a helper library for letting the arizona codec-drivers directly report
> jack state through the standard sound/soc/soc-jack.c functions.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
