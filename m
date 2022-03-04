Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 906764CD247
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 11:20:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A7921A40;
	Fri,  4 Mar 2022 11:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A7921A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646389243;
	bh=N5BC+YrDmF80i8BKU8+hoglcSTfA3pVad1Bec4/kcfM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GJS/0cwoNMjMFhz/ntoOYRahNFICYbadJI0087nNxijPnbdGE/J1X1nwOz17R5NXE
	 bMI1Icb+79a2yPiy2Azf9RRWytPraTAjT56R1pNIY/0HY/m/MNWATVXqIhTCr5cDX7
	 xLxxBtce70yzXMcRcbjsPFSSvqCKBzveLtNGniXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A2FFF801F5;
	Fri,  4 Mar 2022 11:19:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87ED9F80507; Fri,  4 Mar 2022 11:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71B03F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 11:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B03F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="R/PLloQ0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2244C9fe003921;
 Fri, 4 Mar 2022 04:19:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=DImCBkyjORf8pQMKZ3k5cogPNsWDGe32FfR6YNNWTyA=;
 b=R/PLloQ0rUTWlIO11J5QfdITDLIynSfpPNHVvYs4/lXQwq/QYrGJqaF3Ha89hFbxXrjH
 dFifHL6NmQCQLv/LELqWlbxSZ2P92/Jbz+R9bNcSjk1k/KbfAkoqiiIJHJKIUwmAH9qS
 z2gp/+j8m2kYTJf6VQuk+M4FJtu8oh923a2L2qe5AfOcjkK4z/gEMPV8heVtw/gvDuyv
 zbBtlOVeA5gt++ECBazwu0Zbkd4njJBU2JXr9E2pClPpQTEatpcYbtlf51LEIDjr21EW
 EvlBoYQupP0dl1YLuYDE8zBL+r/4yCciZVwpwh/a2QkWgk3h/wK98u4/NWlH1pwKLA/t ew== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3gsxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 04:19:44 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 10:19:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 10:19:42 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 676F47C;
 Fri,  4 Mar 2022 10:19:42 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:19:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 13/20] sound: cs35l41: Enable Internal Boost in shared lib
Message-ID: <20220304101942.GD38351@ediswmail.ad.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
 <20220303173059.269657-14-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220303173059.269657-14-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: QYLkXjjrVqh3elDkhp0JuUGy2H5JnFv3
X-Proofpoint-ORIG-GUID: QYLkXjjrVqh3elDkhp0JuUGy2H5JnFv3
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

On Thu, Mar 03, 2022 at 05:30:52PM +0000, Lucas Tanure wrote:
> Boost enable is the default option from reset,
> but with external boost support, internal boost
> must be disabled.
> Add the enable of boost in cs35l41_boost_config
> to centralize the internal boost configuration.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
