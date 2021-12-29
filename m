Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB5481171
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 10:55:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 942591710;
	Wed, 29 Dec 2021 10:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 942591710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640771715;
	bh=WZWMiL/lZRQkIvNvPvRE4mCwcpM6+IL2QwNTKn5tqyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4Rr5HILnl9k7o8ltb5TmzFQrn/4DT/TSkcsI2FRPTqXvN+C+0iWA14+fYYxywVNR
	 c9xYXCtRAu86NVzaTAVUps7JwagByXdPNzMnvpoCC7ew25A7C9/lYepfGZhVTzSg/w
	 ZpxHStlfItRu3GIgL6avnGb0TNGsrBBkvd1MyJjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E1EF80224;
	Wed, 29 Dec 2021 10:54:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3778EF800D1; Wed, 29 Dec 2021 10:54:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1612CF800D1
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 10:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1612CF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DCdrYRye"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BT6Ueaw008025;
 Wed, 29 Dec 2021 03:53:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=s5779NgSmZdidPeKYZafjjJtfgHumjhVoJekxPIdq7E=;
 b=DCdrYRyeVjgKSWN/snbvXK2mzwd3bEqoT1HJgQEiWOA0s5yoLOIe9NDwx+a1lW0iOOI3
 MyjHygKXlkdKg7/yXH4Uzmn3xiESfil5ogTyiTh3+pjvKKg8UE36bmrJjP4WK1zx9dN8
 +xqvibk6GD5uXhmFn9wgpVWqrSUJrdf/tdDOqkUp7DIYhbHAcdzWAZ5qrTPE6nxHd3+I
 9zggUTapT/Q+Xto8ocS5MA/VrQF6W9lzLDgtehqjfWLvmmKa3wjwoBPuxxIpZzVKzbtb
 7Q+s/6SQIDDPJrsDj6SRKijhk3dE8zx34MTKALo1HcLA0Gjn/pJkSMTxDpAhblEAzUqU Sw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3d7ksg9hm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Dec 2021 03:53:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 29 Dec
 2021 09:53:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 29 Dec 2021 09:53:46 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D68FB46C;
 Wed, 29 Dec 2021 09:53:45 +0000 (UTC)
Date: Wed, 29 Dec 2021 09:53:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Message-ID: <20211229095345.GX18506@ediswmail.ad.cirrus.com>
References: <20211222164534.67636-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211222164534.67636-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Ay8phJ6Y0cBy97KnS6b_yyWSsb3gnbEK
X-Proofpoint-ORIG-GUID: Ay8phJ6Y0cBy97KnS6b_yyWSsb3gnbEK
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>
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

On Wed, Dec 22, 2021 at 06:45:34PM +0200, Andy Shevchenko wrote:
> When kernel.h is used in the headers it adds a lot into dependency hell,
> especially when there are circular dependencies are involved.
> 
> Replace kernel.h inclusion with the list of what is really being used.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
