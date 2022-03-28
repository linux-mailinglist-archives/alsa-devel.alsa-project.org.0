Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B54E917E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 11:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83151745;
	Mon, 28 Mar 2022 11:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83151745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648460159;
	bh=mMG+T3Nc6U+XdGfvqIM+kMc+2/EYEtrs2Ga1znnRxWc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FDCla814FX11HsdBdco60lDTtFpr0PvbXX1+8mR0r9hSTC7715ebmnYadwqlb+MFJ
	 QJRND3DekqCQ1jxrjP2MMzNPyzDRNRQFuk7++2zKcd0Js+k8bGJy1F4N1zF9lf40W5
	 sJVjxdn5yTVyDElvxbrKynnGsTrFcoMjnVYr8sZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 523BBF80128;
	Mon, 28 Mar 2022 11:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6032DF8024C; Mon, 28 Mar 2022 11:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30559F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 11:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30559F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CiGfEpyu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S89QXB026189;
 Mon, 28 Mar 2022 04:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=v1x0UEwXhtzfVaQ5mA/sQw5D2UnNmvHct9R+GRkUUWM=;
 b=CiGfEpyuFN9QnpOGyY79ThmryCepaEYPovj0H6e5PC1f3diyTzbX9URu0agMyYKRhZOw
 ftMq+HBew7c4aZdfY99YAojFbLdAF6pxQFKC5dgDN+zcx6UfZNRe7XVBXnFW6IbWnaQR
 gCgeVTLzwYXacxmmz1s2EbCLYFvcTbxUih4l8RwyvkqCGx/xDRTUMXqq4B94BIB5ocEd
 cIdc/sY1TaKhPN6bC3hl0gs9ey+OvAcsWoX85CXVLZUPjvydFCLeFJNotqGfuvW2wIH9
 pQZrN2jGULQ4pyciZ35G2RI+ULhnN4Ct5sPnh0+gai6HvBXM/s31EhR/lFIRmdfGcF6i xw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3f1y8pa7xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 04:34:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 10:34:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 10:34:42 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CFB1846A;
 Mon, 28 Mar 2022 09:34:42 +0000 (UTC)
Date: Mon, 28 Mar 2022 09:34:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/7] ASoC: wm8731: Factor component init out of bus code
Message-ID: <20220328093442.GV38351@ediswmail.ad.cirrus.com>
References: <20220325153121.1598494-1-broonie@kernel.org>
 <20220325153121.1598494-3-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220325153121.1598494-3-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: WQDcqZIk2XDVQLArX8wZoL6F34r-vv5d
X-Proofpoint-ORIG-GUID: WQDcqZIk2XDVQLArX8wZoL6F34r-vv5d
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

On Fri, Mar 25, 2022 at 03:31:16PM +0000, Mark Brown wrote:
> Both the I2C and SPI bus code register the component immediately after they
> call wm8731_hw_init(), factor the code out into the the common function and
> rename it to just be plain wm8731_init() while we're at it since it's not
> just for hardware init any more. This refactoring means we need to move the
> function after the declaration of the component driver.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
