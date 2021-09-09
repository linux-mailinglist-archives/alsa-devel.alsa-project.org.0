Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC78C40486A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 12:29:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367051686;
	Thu,  9 Sep 2021 12:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367051686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631183344;
	bh=ynVDuYh057PEPsdCa8vlXYlFyC7tjzxyt6uIQIEjuTA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJvbALDHqRGu3YVyZsoTNzAb8L0HScta055PldYi2SRyuu555Mm32lgtuDHpQaT6H
	 IL+CnKB81Zx2d8E1swWhN7VaX5uCKD3+4DdNmmcFFKAOVp0AdIM90U/E8JbhsOu9bt
	 Yndfb21f45V9PdNsmQhnGBvgrEAZWLpfnQcdV6Pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A64DDF800FC;
	Thu,  9 Sep 2021 12:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81143F80217; Thu,  9 Sep 2021 12:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60521F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 12:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60521F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YQJFIM0a"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1896onVT002355; 
 Thu, 9 Sep 2021 05:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=2dij4fdqqNTWnpDU64jZ8EECsb2mTCgKMlL9Buf+1kA=;
 b=YQJFIM0aMnQRSR1kKUBs1oOih1ZGUqkncBWrnWpkNm+phyo44MvLlrtcHVIyg68IOPOc
 bA6WuQpcRW+1TUXceFHFuJc5xRkhKTozPzMIb8/gKo/6Bi/C39RXttivZk3jW82t7mem
 IizvCLYVBW4K0LImEJf7EUk3YJQRaNdiIq10JW2pXhbbfjmtN8mEFFAVWQSDepeAU7ug
 jO7Bb0Vv5nchnP19oO90BzLx5Gu0IbywQo7XfDo6cNTTI6FaamD/8XoibM9fKyecRlas
 aCmN/OX9X8PNVQbTBzUePnENPt5Ek8chTaZYZdp6UWhFw8p7EeKGsC+6oECF0gFdC+CM Rw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3ay8n60d3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Sep 2021 05:27:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 9 Sep
 2021 11:27:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 9 Sep 2021 11:27:31 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 91143B16;
 Thu,  9 Sep 2021 10:27:31 +0000 (UTC)
Date: Thu, 9 Sep 2021 10:27:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v7 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210909102731.GS9223@ediswmail.ad.cirrus.com>
References: <20210907225719.2018115-1-drhodes@opensource.cirrus.com>
 <20210907225719.2018115-2-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210907225719.2018115-2-drhodes@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: y8DZERnkIsTnfrF0VYltgg4e1kDeLXCh
X-Proofpoint-GUID: y8DZERnkIsTnfrF0VYltgg4e1kDeLXCh
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

On Tue, Sep 07, 2021 at 05:57:18PM -0500, David Rhodes wrote:
> SoC Audio driver for the Cirrus Logic CS35L41 amplifier
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> ---

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
