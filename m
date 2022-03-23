Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEEB4E4F2E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 10:22:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C8401712;
	Wed, 23 Mar 2022 10:21:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C8401712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648027321;
	bh=LXXHbm4oY3iuGLO32t+KeZHEH9yEXIhNaYRuob7Ln5U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=teUw7ft2hlEH+37gSMqhgi4NzaP/dgQge5cSYcyNichfG4FAS7SE1ipfNDg9TWeTL
	 heDBceP4QXkQnbCJTDNR1Qe43lPuxK+0BNPf4jvyz8VXb7mSXY1gDfoRkyeasgnebk
	 +X4KUbcPuIW39EKYroieWyrNkD3ig1N+zt8AB37E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76103F800AA;
	Wed, 23 Mar 2022 10:20:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BC3F802DB; Wed, 23 Mar 2022 10:20:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E334F800AA
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 10:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E334F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dGJg4evu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22N6MgxC007319;
 Wed, 23 Mar 2022 04:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=dUdn/ajdZpukt6IfviTuwEcR8cl6Pbc9zj4WxhUmKt8=;
 b=dGJg4evumteFBY9L3HnQEPk/QrJyWWGJryeshHcMSyjn+QeWlvdBCEO8rhEcZ3WBFIx5
 TchnIW6s2xbWIdGse8YGxHPfEStWGYZvzvfhosNRUBOeWV5WUdDdQJx1rYHy1yU6I/S2
 Ofzyd8rYeRVBj1Yu146AM0eXgyhX2RBe6N3AQ0FBlJOT9kz1Kjeq1RbjEvO8qH2BRhQx
 3vB6vRBnNeaYUXHiXIBzGiMwdJOuanLBXW/uabAKwLuGari1mu+tuV7a9TMKKq2sNdG7
 mF4g7MSieKAsXS9zeEebPRaE2G4ecOw1bStoif5DX5sldi4U2c2lQ7l+Q0llwAbpi+ha cw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ewbknd5ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Mar 2022 04:20:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Mar
 2022 09:20:43 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 23 Mar 2022 09:20:43 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9023CB1A;
 Wed, 23 Mar 2022 09:20:43 +0000 (UTC)
Date: Wed, 23 Mar 2022 09:20:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v5 15/16] ASoC: cs35l41: Document CS35l41 External Boost
Message-ID: <20220323092043.GO38351@ediswmail.ad.cirrus.com>
References: <20220322151819.4299-1-tanureal@opensource.cirrus.com>
 <20220322151819.4299-16-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322151819.4299-16-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 1BSKhSHDLuiq-vmXuEjJMl83KV1ODsfL
X-Proofpoint-GUID: 1BSKhSHDLuiq-vmXuEjJMl83KV1ODsfL
X-Proofpoint-Spam-Reason: safe
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>,
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

On Tue, Mar 22, 2022 at 03:18:18PM +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Document internal and external boost feature for ASoC CS35L41.
> For internal boost the following properties are required:
> - cirrus,boost-peak-milliamp
> - cirrus,boost-ind-nanohenry
> - cirrus,boost-cap-microfarad
> 
> For external boost, the GPIO1 must be configured as output,
> so the following properties are required:
> - cirrus,gpio1-src-select = <1>
> - cirrus,gpio1-output-enable
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
