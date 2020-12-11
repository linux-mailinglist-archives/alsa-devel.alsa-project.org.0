Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1C2D7308
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 10:48:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DDAA170E;
	Fri, 11 Dec 2020 10:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DDAA170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607680114;
	bh=2tLrUkEK6GAN5d1INMahwpL/t30C/3aFiDpszQ/ZR34=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5+TvGamZRBZvdKxuLu4xP/aPryZulNdzkg8kni/Ca/1ut9OqVJiBeipuLEu1R1jN
	 sVvV/7vv7JV4kLp+sWPR6u22nUct7KPo6mWEkzdZg/AYlc3UNa8hGpdhXFf6PFeaKB
	 5zKKTdsTLXmqBg4QD9xepX8A3tFbMrps8hl7HvLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F786F80217;
	Fri, 11 Dec 2020 10:46:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EB43F8020D; Fri, 11 Dec 2020 10:46:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BCD4F8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 10:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BCD4F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZFoxgmDU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BB9WZfc011144; Fri, 11 Dec 2020 03:46:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=KOa8GeMpJUQpTnzCyJi3VdjT2XgIvw2e6G+BBT2ox/A=;
 b=ZFoxgmDUBBzZuOpYxFK/lZv0a+ZG1WeDeMk8F2r6jRHwQ704wh/jDL4JpJ0X9ndUqj03
 WI2HLp58aLbwIxd/JkK5QU4XMxroHG1kphpX1HZGcX9YmsQVj0roDWW3zuMuODuC/nZU
 8RKiC7wxnXyFS/5wEkXrEzjmLHc/yhUbnVsrTeldgqbeY+2CCbwztnetpkwgXABh9RF/
 iZbLLDjslHSgpkCfHyx7IF2mIPe+/vPa6o+mI4S67+DFfeA0OQ8yYfQEe41GRDKyGLXp
 bDCmNPdKWVhYNB8jGk5Pu+RjnoDM8N49UPlyZ2/Joz4ttLrXQNwvWZisqLiioujVKvUa oQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3588g7g4yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Dec 2020 03:46:47 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 11 Dec
 2020 09:46:45 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 11 Dec 2020 09:46:45 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F31B2AB;
 Fri, 11 Dec 2020 09:46:45 +0000 (UTC)
Date: Fri, 11 Dec 2020 09:46:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ASoC: wm_adsp: remove "ctl" from list on error in
 wm_adsp_create_control()
Message-ID: <20201211094645.GB9673@ediswmail.ad.cirrus.com>
References: <X9B0keV/02wrx9Xs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <X9B0keV/02wrx9Xs@mwanda>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 bulkscore=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=2
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110059
Cc: alsa-devel@alsa-project.org, Adam Brickman <Adam.Brickman@cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Vlad Karpovich <Vlad.Karpovich@cirrus.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Luo Meng <luomeng12@huawei.com>, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

On Wed, Dec 09, 2020 at 09:54:09AM +0300, Dan Carpenter wrote:
> The error handling frees "ctl" but it's still on the "dsp->ctl_list"
> list so that could result in a use after free.  Remove it from the list
> before returning.
> 
> Fixes: 2323736dca72 ("ASoC: wm_adsp: Add basic support for rev 1 firmware file format")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Good spot there, thanks.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
