Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B42404871
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 12:29:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B070D1699;
	Thu,  9 Sep 2021 12:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B070D1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631183389;
	bh=2EJXVR32cgbnQqtrIxV0dF46IQm473pJgOk3Qi4wNiA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oIOgDqc1UiEVfMVKOFyM0tR9x0EMeJqiWsfRNHB9iKHDb6zCWMxkAMEGUO0JTXyKP
	 jkXp6G7YiKauYKVECSFDZ24KsFV4W7hFnU78L3S/AsHNg3FUDMezV0WY3yvaPWh8yV
	 oB5oxursbi2cfeXHx4lTecxQBngXDLY35yjN3B2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3801FF802A9;
	Thu,  9 Sep 2021 12:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F28F802A9; Thu,  9 Sep 2021 12:28:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E153F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 12:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E153F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="js3uxnTW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1895pVHm003659; 
 Thu, 9 Sep 2021 05:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=5FAJqHODCUpFso5EKmOA9l3S/N2pPxXYDInrdn+GcLU=;
 b=js3uxnTWdixBdSbsL5+kVM4KiNNv6ulj250naUh55DNTSsDPo6S/79gO1/F17HstOe/p
 Lm24GiP1noaL2tOgxnxN6wQZHFIIOo3m/7hU7SNgnYEbXqzHN7MSyEAr3opxfC74IfnF
 8FvrYqAnxK4vXMA2V5wov/0F6yyBp63gZ5y4AMUWKuPrO24vani54EeYPF96LEJ8WyVw
 bZlvuPR5OaVA9RCM8ZF7/3T2+w9dz8Qv24dTNQ6QVdmyMJmypehpOg38Gw5InLy8oZob
 zTQ2/ekT2uLk0l1Uco9HC26lz4YL5EPig43np6JbBPfz+SIwvD1sAT0/UEevFbKakgT6 eg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3ay63v8g76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Sep 2021 05:28:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 9 Sep
 2021 11:28:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 9 Sep 2021 11:28:34 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 143E7478;
 Thu,  9 Sep 2021 10:28:33 +0000 (UTC)
Date: Thu, 9 Sep 2021 10:28:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v7 2/2] ASoC: cs35l41: Add bindings for CS35L41
Message-ID: <20210909102833.GT9223@ediswmail.ad.cirrus.com>
References: <20210907225719.2018115-1-drhodes@opensource.cirrus.com>
 <20210907225719.2018115-3-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210907225719.2018115-3-drhodes@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: a_6VGYfBsdjFMeuAbwKHbaRZkdMPX7-7
X-Proofpoint-ORIG-GUID: a_6VGYfBsdjFMeuAbwKHbaRZkdMPX7-7
X-Proofpoint-Spam-Reason: safe
Cc: robh@kernel.org, brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
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

On Tue, Sep 07, 2021 at 05:57:19PM -0500, David Rhodes wrote:
> Devicetree binding documentation for CS35L41 driver
> 
> CS35L41 is a 11-V Boosted Mono Class D Amplifier with
> DSP Speaker Protection and Equalization
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
