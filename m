Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37F14B6D53
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 14:25:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64EEF17F6;
	Tue, 15 Feb 2022 14:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64EEF17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644931516;
	bh=tg5KVXiLNtnlBHB2E+Xu2CmiA0YkZT0KL2za/dqZN0o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XmxtcUr4bnQgtjaXQ5/cRVl7mPX6oqjKpSF2nW069XzZIbhWBQeBPdc2VHajWwydp
	 37vpbCUk52cTmChtOdkRokJrzI1nLvEC+zInYf6AJzdgpolHOScBAx1iw521EQMFhX
	 T2aPAAS6iY1HxRnNJi++tiQc0SvZ25tRqB6Zk73k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2221F80159;
	Tue, 15 Feb 2022 14:24:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD64F80132; Tue, 15 Feb 2022 14:24:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF99DF800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 14:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF99DF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RMwV/bnL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FCQn0R027968;
 Tue, 15 Feb 2022 07:24:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=GwXfAsvDJx5IcqRJVN2beKTyGRoEjyULajUSVSVdQvQ=;
 b=RMwV/bnLNRKWTK+mfEh0+u0wZPYezvx5t8PYpM3y330G1HVAeaD/Bu6FasD44d4DKbbl
 WS+ZMEVbme38gTNjzbUJAXG3bMh9WniyBNsP+7ypuZ/kb5wHo5G3FMvcEcgxmhpw7Ard
 vREj9w34ityzrUgzV7c0SDp0Jgzru0/zYmr2qxQQAu6wpLoSqNtb1IMxMfrCQeRGADf9
 6ewUp55B2Hkhs3mzg9UqUi9JjIDd/4+x+vybtE2rnBFN6WOiPVxd1RObiYqo4+u/eDsE
 OCz0Ygb+Cq+82XfHBXZ5H2z1dQQXMWINIe43hKpscslO0xrV0fcvj/PeksxMCgWAvIB7 yg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e7qq19bss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Feb 2022 07:24:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 13:23:58 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 15 Feb 2022 13:23:58 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 530252A9;
 Tue, 15 Feb 2022 13:23:58 +0000 (UTC)
Date: Tue, 15 Feb 2022 13:23:58 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] ASoC: cs4265: Fix the duplicated control name
Message-ID: <20220215132358.GG38351@ediswmail.ad.cirrus.com>
References: <20220215120514.1760628-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220215120514.1760628-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 46gsrPcG_amcGj1zrUqOSsa_8ugLBxPa
X-Proofpoint-GUID: 46gsrPcG_amcGj1zrUqOSsa_8ugLBxPa
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, alsa-devel@alsa-project.org,
 broonie@kernel.org, flatmax@flatmax.org
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

On Tue, Feb 15, 2022 at 09:05:14AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Currently, the following error messages are seen during boot:
> 
> asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
> cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Switch: -16
> 
> Quoting Mark Brown:
> 
> "The driver is just plain buggy, it defines both a regular SPIDF Switch
> control and a SND_SOC_DAPM_SWITCH() called SPDIF both of which will
> create an identically named control, it can never have loaded without
> error.  One or both of those has to be renamed or they need to be
> merged into one thing."
> 
> Fix the duplicated control name by combining the two SPDIF controls here
> and move the register bits onto the DAPM widget and have DAPM control them.
> 
> Fixes: f853d6b3ba34 ("ASoC: cs4265: Add a S/PDIF enable switch")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
