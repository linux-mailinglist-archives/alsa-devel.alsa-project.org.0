Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8018E211FAC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 11:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7CF0169A;
	Thu,  2 Jul 2020 11:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7CF0169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593681642;
	bh=nR/rYd3GQuF99kfI1lWK3Orr2bVN9fuw+l6WJkRS9D0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m0muL2I9W/w2gg0TpjvVxsP95/GB0GwRpFBMlP+UMc54OLotppKkXzYrSWydgO9te
	 xFd/lOj0hojE7B2GqLbe9ZdlPz+sUk2Dkxx3AcZBIppE4VPR5FlJsp7zRoxAY997wj
	 YBRn1cUXnTi0eygTTUf9HLIS688qUfUQ7HDxVqOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 715EFF800C1;
	Thu,  2 Jul 2020 11:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF439F80252; Thu,  2 Jul 2020 11:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84A4BF8022D
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 11:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A4BF8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KidZHu/V"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0629GRVg025172; Thu, 2 Jul 2020 04:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=PBy9MwgCulaf34AMwDeliOtsLycq7aauGSuObWDCYmo=;
 b=KidZHu/VY+DmkDbwGQirU/HlGe88bz+B80CSdePHBv4KNq7AZ5qz1yhZqGDk+YX/JFRo
 SGtPk6c1OvAi2Wcw8Q4utaQRoxf6AgFachkRiMS1jXLkHAtEnBYYjDsE4WDyKyxB6VA9
 vpFa8U4Tx8MqOUpiMLr5aLVNPxvLPaUT23kS5jA7YKctIp8G4bZfQs6EIZV9wbLH+Gmh
 FS2cre4C0tTjUprgJ1x6/76ZvCWSimctjYApf8XBqaAfnqV8MM1L5ukjPpINQA5o/E72
 akVN4YFUwkhRptdNZHtWcQqj2CClr5IYrt2HxeGpXBju/JHyWMT8xxtDJKiDmNKvsbhS IA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 31x2hpy9hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Jul 2020 04:18:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 2 Jul 2020
 10:18:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 2 Jul 2020 10:18:22 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4A5682AB;
 Thu,  2 Jul 2020 09:18:22 +0000 (UTC)
Date: Thu, 2 Jul 2020 09:18:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/7] ASoC: codecs: wm8960: fix kernel-doc
Message-ID: <20200702091822.GI71940@ediswmail.ad.cirrus.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
 <20200701181320.80848-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200701181320.80848-5-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=898 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 cotscore=-2147483648 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007020069
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Wed, Jul 01, 2020 at 01:13:17PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warning
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
