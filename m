Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52D2E70C0
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 13:59:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF9AB17A0;
	Tue, 29 Dec 2020 13:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF9AB17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609246768;
	bh=BsXKG7NZ8OZ3htkNZh0ALEI68Mt8jybyj2cLIJmLqhc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMZeuKij2XUq1G2G7JYVeccXvDhE1JNuv6zA8+HvUKgDD+9SjFH3jGEE8z4t/nSEb
	 F7iz/00jQ9SHNQfyzJFA8Sy1HVQyAh9J3BxtACPi2GjIkeuaAT1ub2ly0NvWN76z1S
	 IlYLw3RWer2c7NJmpoY7Cfigj79VavGVSXRsKs3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 390ACF8022D;
	Tue, 29 Dec 2020 13:57:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0650DF8022B; Tue, 29 Dec 2020 13:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86985F80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 13:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86985F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Xu1LMv/8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BTCvjWU025022; Tue, 29 Dec 2020 06:57:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=E+LLn2lciRVI6aTOT3XvuKQAoEO/c5/A1kLV+3X0f5A=;
 b=Xu1LMv/8j9TsOFqyDDIXTQTXVVqeddtAxplQnhRqbXZsu8GTLbnDM2J0781ZI1r41Azx
 j+V9qBi4DC7aw6Ax8eA7rWueN0yNEg93vsgcThEw/BBA0zPFvFsaaXYg67TMvAGs3L+y
 qSmXs+2PJLRhm4AQGW0UfhAfKs9x1PCnx6aQgOCukkfhJSfsVWw5+H+Dme82WYNdEVKv
 rvD6yxkV8diW75f0iB+/5COKyPanAfxHiVoFp6d7gIW05OplQIgoAlVi8z2t+084Cvff
 gsyifXt24HKYjFnrYpqK1mSwVo/fOqa2NVUQge7Q4vk42MvMzWfGIY2vDiQLRzD9oQZE zA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35p2fs2b86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Dec 2020 06:57:45 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 29 Dec
 2020 12:57:43 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 29 Dec 2020 12:57:43 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7F7952AB;
 Tue, 29 Dec 2020 12:57:43 +0000 (UTC)
Date: Tue, 29 Dec 2020 12:57:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 09/14] extcon: arizona: Add arizona_set_extcon_state()
 helper
Message-ID: <20201229125743.GM9673@ediswmail.ad.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-10-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201227211232.117801-10-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290080
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

On Sun, Dec 27, 2020 at 10:12:27PM +0100, Hans de Goede wrote:
> All the callers of extcon_set_state_sync() log an error on failure,
> without doing any further error-handling (as there is nothing they
> can do about the error).
> 
> Factor this out into a helper to remove some duplicate code.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/extcon/extcon-arizona.c | 47 ++++++++++++---------------------
>  1 file changed, 17 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 145ca5cd40d5..d5b3231744f9 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -595,6 +595,16 @@ static int arizona_hpdet_do_id(struct arizona_extcon_info *info, int *reading,
>  	return 0;
>  }
>  
> +static void arizona_set_extcon_state(struct arizona_extcon_info *info,
> +				     unsigned int id, bool state)
> +{
> +	int ret;
> +
> +	ret = extcon_set_state_sync(info->edev, id, state);
> +	if (ret)
> +		dev_err(info->arizona->dev, "Failed to set extcon state: %d\n", ret);
> +}

Would be nice to also print which ID it is that is failing,
would help to narrow things down since we lose the customer error
messages for each case.

Thanks,
Charles
