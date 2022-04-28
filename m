Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E02F512F53
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 11:10:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C63051633;
	Thu, 28 Apr 2022 11:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C63051633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651137046;
	bh=V3oBPaAyD+OmVGlmvD3Xj8u7utnD/BqIrjfYWxh/vQ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ainCk2tjS7iBJdsvg/0Sqx623H2BhMaCFKp3NYwleUr3bCfBrEBbgkUhBhaVoZujd
	 ClUzlvzbfcQFMG+cYxS/o/2VfF3gNwqhQYdCydPr+gsoZg9J5uaKVGayBFz2OZgAuH
	 yjHJ1gYwjwtCQFhto08hkweW3geslRBkYCBFL0bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 584B0F80311;
	Thu, 28 Apr 2022 11:09:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3472BF8016E; Thu, 28 Apr 2022 11:09:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E71B7F8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 11:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E71B7F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JUAP3eEn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S85htd016443;
 Thu, 28 Apr 2022 04:09:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wGe9ChCGhIXP4QIDrj+TzUIOiBoc2Pw4Nm/hP4S6BWE=;
 b=JUAP3eEneERkeobmLGfACUvf9Pgp0gPl74+shOdTdtoi0r2wXfnRc+370JysnFNHzstu
 z6PBP+NYtYwYV/XsQlxI47thqN4Ae2yGzI6cv65t8o+En6VeCPF47RVf1Bwpg6rkRMgD
 4SIJlt0suBNyaOkNn4uDnhquj1+U03tQcPZQay6DtL/uyX7fXxEtsDOZWzEo/+n4ciBy
 5kwasjyH1SmUttxFwVbWJyoRyozVITaU3v5TL/OG8fiO4iRuPGyJDE0zOJWrmT9X50DX
 YRVKjGV7fbpZY41SPwvz5f9oS2LSIFqVpHZ1+A2FLk6WY+EOTvhgW3CdVGrpQYthGJEq iw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fprtb1vap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 04:09:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 10:09:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 28 Apr 2022 10:09:35 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9A205B10;
 Thu, 28 Apr 2022 09:09:35 +0000 (UTC)
Date: Thu, 28 Apr 2022 09:09:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH 18/26] ASoC: cs35l41: Move cs35l41 exit hibernate
 function into shared code
Message-ID: <20220428090935.GN38351@ediswmail.ad.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
 <20220427150720.9194-19-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427150720.9194-19-vitalyr@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 6VuXKe2AvUxKgVp4eNP_u893MW8_MEiM
X-Proofpoint-GUID: 6VuXKe2AvUxKgVp4eNP_u893MW8_MEiM
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Apr 27, 2022 at 04:07:12PM +0100, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> CS35L41 HDA Driver will support hibernation using DSP firmware,
> move the exit hibernate function into shared code so this can
> be reused.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
