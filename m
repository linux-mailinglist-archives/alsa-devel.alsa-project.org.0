Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35474E02
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 14:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE0616EF;
	Thu, 25 Jul 2019 14:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE0616EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564057084;
	bh=rEcAj6Zk8NHMDL78XGnhesiTpo9OoNSIS9SAOs3zFps=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UoubVD/gvnvP7HoeHLxiNu3HcygIcE4tGWjwWkL3T1vnxgkVYLkV7p65NxaVt/v5O
	 iUg7++vqRhc/yBsFRJ1osStWeurM9d8qILhUlzHYDKRwLOJ4gkRY1Ktjx8ECTPayV2
	 pzNDYOQhWC0fvP18oP5YZatWyDt3pXpaLe7t39rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75151F803D0;
	Thu, 25 Jul 2019 14:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9D3EF803D0; Thu, 25 Jul 2019 14:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E61D5F800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 14:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E61D5F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OU9k11vG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6PCDoA3024468; Thu, 25 Jul 2019 07:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Be+Mr1BAxoa4k+8AKUASutE0Q12hugIGsGAcQRE3b0U=;
 b=OU9k11vGUZVQHDBrxgQbYp/fY27Drk6RKzmGEPXIhChbxf3hVRD2EZ+cHcT1pqE+gGti
 ecQ36k82FbHlLvjYfQZT7oT5WU5DWfTn17VdWemy4gltehvlBzJh3StFR3S5EGsPKS7H
 IRNZYA9aXysu0pf+CTCxrPT/sY5iE5CHcFRK6MB2yQeTuXE3mgl3jMjZcBuJxL/8reKO
 xM+8ZoWtmPnhrk1dqqZi+J4tdWU+IjM+bAIb4NdW/iuDb4/uHk3p0LeVgn73NENrhuh+
 jpkX6B3ZmuAkLq+oYVYDq/wEfNj2O9lm0rPStzqvp18kQE+hLbE29IGlw6vbWvOajqtM Kw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tx61s3aw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 25 Jul 2019 07:16:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 25 Jul
 2019 13:16:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 25 Jul 2019 13:16:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 471B545;
 Thu, 25 Jul 2019 13:16:07 +0100 (BST)
Date: Thu, 25 Jul 2019 13:16:07 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Message-ID: <20190725121607.GY54126@ediswmail.ad.cirrus.com>
References: <20190725110228.16205-1-ckeepax@opensource.cirrus.com>
 <20190725110228.16205-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725110228.16205-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=955
 suspectscore=1
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1907250142
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: cs47l92: Add codec driver for
 Cirrus Logic CS47L92
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 25, 2019 at 12:02:28PM +0100, Charles Keepax wrote:
> From: Stuart Henderson <stuarth@opensource.wolfsonmicro.com>
> 
> Adds the codec driver for the CS47L92 SmartCodec. This is a
> multi-functional codec based on the Cirrus Logic Madera platform.
> 
> Signed-off-by: Stuart Henderson <stuarth@opensource.wolfsonmicro.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Sorry couple of things in here that shouldn't be will do a
version two.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
