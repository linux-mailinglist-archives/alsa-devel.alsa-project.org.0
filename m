Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FDD140897
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 12:04:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE00517CB;
	Fri, 17 Jan 2020 12:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE00517CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579259059;
	bh=3xExwnW7o5kcVZD6/7a9wSyHa2gw3tzh20Vq+dW6SZY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwfTGC7M6f+ErpqWfufvTMeOE6rYceswOZhWtpX4yb8aA2e7Wm/GktvHr+IhBLiVO
	 LmTdd879jHxdHZoDTYs/vZMlnhok4/ci9EgqvpxmuqhxnLQnk8sVxZeou218kDt0gE
	 9akeau0q/PTrbwjW1rqqo43Y2xwj25polhpxA028=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52436F801F8;
	Fri, 17 Jan 2020 12:02:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CBA0F801EB; Fri, 17 Jan 2020 12:02:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 852B0F800AA
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 12:02:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852B0F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YaIyNzlx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HB0sUc028902; Fri, 17 Jan 2020 05:02:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=/K8G6DW8ZdlZhrNN38eKgsQCavJ8adK6li1BkOpBUZM=;
 b=YaIyNzlxIsJt75JfMPNFxTI9xsCZ851o0ItCyYGBm2SSwJKF2+zs2aEOaJ0Psd73U/6z
 drMTBy17U2rysxUKEUzJ/IC/9Wn4Dj04fRvFw0U/aP6ThatRpHi/dUafeYzilMl10eEs
 hzNdwUcnjvDhBT4TK1VfoqXJq6WpfjUPCleEYEBKFueQUPaP33uGEnjDu5oFOr7B+yTe
 xowfzirbCPV5vRs9Lrc1bNc0JeApEAMhALLnL3JUzc+2PI7lOOsNuhbUbn6+ZRdvRwUo
 f1FqjAu9rEtquqVRpnVdEUMK/Oj0kmfic9dq6QVUb7PY7o9WzuSt+YW2YZRLF++VqWUY tw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2xk0t1rtg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Jan 2020 05:02:28 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 17 Jan
 2020 11:02:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 17 Jan 2020 11:02:27 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EDBC12AB;
 Fri, 17 Jan 2020 11:02:26 +0000 (UTC)
Date: Fri, 17 Jan 2020 11:02:26 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Message-ID: <20200117110226.GB4098@ediswmail.ad.cirrus.com>
References: <20200114161841.451-1-ckeepax@opensource.cirrus.com>
 <20200114161841.451-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114161841.451-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=955 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001170086
Cc: li.xu@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, david.rhodes@cirrus.com
Subject: Re: [alsa-devel] [PATCH 2/4] ASoC: madera: Correct DMIC only input
	hook ups
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

On Tue, Jan 14, 2020 at 04:18:39PM +0000, Charles Keepax wrote:
> diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
> index c3b6f4d41005b..35ff5a923e282 100644
> --- a/sound/soc/codecs/cs47l90.c
> +++ b/sound/soc/codecs/cs47l90.c
> @@ -1941,9 +1941,13 @@ static const struct snd_soc_dapm_route cs47l90_dapm_routes[] = {
>  	{ "IN3R", NULL, "DMICDAT3" },

IN3 should be updated here as well, sorry will respin.

Thanks,
Charles

>  
>  	{ "IN4L", NULL, "DMICCLK4" },
> +	{ "IN4L", NULL, "DMICDAT4" },
> +	{ "IN4R", NULL, "DMICCLK4" },
>  	{ "IN4R", NULL, "DMICDAT4" },
>  
>  	{ "IN5L", NULL, "DMICCLK5" },
> +	{ "IN5L", NULL, "DMICDAT5" },
> +	{ "IN5R", NULL, "DMICCLK5" },
>  	{ "IN5R", NULL, "DMICDAT5" },
>  
>  	MADERA_MIXER_ROUTES("OUT1L", "HPOUT1L"),
> -- 
> 2.11.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
