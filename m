Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CE8E8CF
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 12:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 461B211C;
	Thu, 15 Aug 2019 12:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 461B211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565863804;
	bh=JroFo5b5PLkxdx/gc9ivM5NFjrvtQhUHJh86c/JVk+Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pPSJfl1sS59DjcyxhSASchAEc5X6Lsz3zCJvX+NEMT0Djy32sHjqdsvXW6PYINUYV
	 GlR9M0BI2bIMdWL9H3V98RKw5u+A/gNEmqZOek4F3teKjJ4i/nmgTKMDE8c73vu2s0
	 ZaJaLS1H2raXhuxOq6vs7RpGE130Bbw853iuORCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FF33F80290;
	Thu, 15 Aug 2019 12:08:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F193F80274; Thu, 15 Aug 2019 12:08:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7F4AF801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 12:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F4AF801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qGQGHOi1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7FA42U3029326; Thu, 15 Aug 2019 05:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=b1bBykvPnnxG06cNHLJogBSzoi3BdoXhENT7TdiZJxs=;
 b=qGQGHOi1tp/NK4hX/zxcVeLmRWelx31p6Zu53m01BChsAGZEMOSzDZut0+kGZcFWtwls
 LKLW9cba0VDZkRh82/YBMUly6wiqrV8nwwgXf36XgaAgBgjomoenS9mj2rty2GF5nJJB
 4kOXkZeOobqMWEa/9fRLUDbpMSaV6Ozm9vpvlDekYqkKiyYceWPRuup27zxpDAtFshjN
 FTHQHp5xO3hj62jeSoczXzvR9iFow2C5x4ddOB0yyA8w2WPRtxowlmgPkBmZh91I9KLj
 QduBknYO2Gd40/xiiJ1fMkKMrBAaY27Kg/PjrjrjifP7DltWiwqNZO+EbhoqLXntkGHa 8A== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2ubf9bv4ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 15 Aug 2019 05:08:12 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 15 Aug
 2019 11:08:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 15 Aug 2019 11:08:11 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2079D7C;
 Thu, 15 Aug 2019 11:08:11 +0100 (BST)
Date: Thu, 15 Aug 2019 11:08:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190815100811.GO54126@ediswmail.ad.cirrus.com>
References: <20190815091920.64480-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815091920.64480-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0
 clxscore=1011 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=838
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908150107
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, patches@opensource.cirrus.com,
 tglx@linutronix.de, info@metux.net
Subject: Re: [alsa-devel] [PATCH -next] ASoC: wm8737: Fix copy-paste error
 in wm8737_snd_controls
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

On Thu, Aug 15, 2019 at 05:19:20PM +0800, YueHaibing wrote:
> sound/soc/codecs/wm8737.c:112:29: warning:
>  high_3d defined but not used [-Wunused-const-variable=]
> 
> 'high_3d' should be used for 3D High Cut-off.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 2a9ae13a2641 ("ASoC: Add initial WM8737 driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
