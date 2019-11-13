Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D8FAC0D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 09:27:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BCAB1667;
	Wed, 13 Nov 2019 09:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BCAB1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573633634;
	bh=BYlZICjyT7k38HVMXxIv4yNxy5Z03f254kl/v1mFrfc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQ5FjjYv7qQ84zYuiFjkOIpPtLwA2QJr6R/LMtscux81AUq7lw1yrzjw95PqZBLcQ
	 krVh2UcxhqFU6Y06HVUnpTf0piNsYlwOTjM3TH4nDCnFplSVIAndcfMQ0EEdUsYN/V
	 oTpTKHn0oETexyM4nA8r3VnpkWZZTpJgB+a7Mqmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B5E5F8045D;
	Wed, 13 Nov 2019 09:25:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F99BF804FF; Wed, 13 Nov 2019 09:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34932F802E0
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 09:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34932F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RRnBMVhW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAD8O2WY011619; Wed, 13 Nov 2019 02:25:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=HUlJKxSb206fnxwJaIVeyt16K+PMELRcWcNa+iKeQpI=;
 b=RRnBMVhWz+xv57PxGF/yWVwxG7Ph6hVsaFMNRZrnsmXLW+TO+0DG28iAQuhmnacdcNZl
 mvJuyl7RwNaO6l3hqLQQOCPPZ64UDIv1K2L8QmMOUoV07orx5QslPzR9uJTmGToSFVMC
 LGCTjQOnUPTnCnByXUl+lbYfJRsx8MWJQ2XpZVPDjBKoLrQNu2uF+uEFTLPNBdq+nxnu
 qidM7yFLJ6QKgsQgB7zmHkp6C546/fZ37fIebQObiS2MIhE9LG3LUiL0plcGd+9dUequ
 KNjPpwrCCmRI85vK0Ggh92FcKiFuJGrBHMC+0F4pr/hALLRKoRRJGdjjzmt+/CODju2o 0g== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2w5trnx073-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Nov 2019 02:25:17 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 13 Nov
 2019 08:25:15 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 13 Nov 2019 08:25:15 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3D0302A1;
 Wed, 13 Nov 2019 08:25:15 +0000 (UTC)
Date: Wed, 13 Nov 2019 08:25:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Michael Walle <michael@walle.cc>
Message-ID: <20191113082515.GE10439@ediswmail.ad.cirrus.com>
References: <20191112223629.21867-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112223629.21867-1-michael@walle.cc>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 mlxlogscore=614 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911130077
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8904: fix regcache handling
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

On Tue, Nov 12, 2019 at 11:36:29PM +0100, Michael Walle wrote:
> The current code assumes that the power is turned off in
> SND_SOC_BIAS_OFF. If there are no actual regulator the codec isn't
> turned off and the registers are not reset to their default values but
> the regcache is still marked as dirty. Thus a value might not be written
> to the hardware if it is set to the default value. Do a software reset
> before turning off the power to make sure the registers are always reset
> to their default states.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
