Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E9336EF3
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 10:33:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1D917EB;
	Thu, 11 Mar 2021 10:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1D917EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615455207;
	bh=Anl/5k4YhMdvgQGW5WS9iIV8y2bLeo/g3oNbIYxMhzE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6/+0FsJxVHviDsEMioDbQ8hJ6fOWr/X4AVkyODaJ8VqVGls0KySh/PAR4+dlOuKg
	 oCBeMzsZvKgk1b6csjXCPjkwx/xUF1aX57Au21l4V/xvTsfv4ghC47SgtGvBZpDxWP
	 p5+nm5FGQpRjipG3mYlZGQEV4cDw/une9gGBmi9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC249F8028B;
	Thu, 11 Mar 2021 10:32:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2640BF80276; Thu, 11 Mar 2021 10:32:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E717F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E717F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YTa0w7xx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B9Vefw030511; Thu, 11 Mar 2021 03:32:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=cB9WuEA1gMsV4jqUq9kHx6MNZxTUH8naycCxx5wKzXQ=;
 b=YTa0w7xxj6G2Oa27g6vd5pLzP46c5R+FXWQmpxXUN1JJF+VWLw2rCxbiOpvna/cz3s1Y
 LKQtqqgBG61KYtVWSe6MA23yXW+QQEhwslx+0Kc2mc7Jno9Ok8pnDiylzpPUC79ipdPb
 Cn5OzAyrJfR3YrVIu7S4nvPYE+V2erD54DczTaRfq0ni7gliYY5YbUcAJ03vSp2JcGka
 CMBboouXMUyGTCPNgTii8KHKqGGA3vkTCR4BiC6UqV3/VUuoQTyI65lcuHxwA+kxAswX
 xcrwUdC2Rkp2rLjCmsySTwANhR6f/YEcbK9EYPf18WYE6VIuzxjkfKAn4DR8M0WsyMht 6A== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 374819e2jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Mar 2021 03:32:23 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 11 Mar
 2021 09:32:21 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:32:21 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8E19011D6;
 Thu, 11 Mar 2021 09:32:21 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:32:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 10/10] ASoC: wm_hubs: align function prototype
Message-ID: <20210311093221.GR106851@ediswmail.ad.cirrus.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
 <20210311004332.120901-11-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210311004332.120901-11-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=906 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110051
Cc: tiwai@suse.de, patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org
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

On Wed, Mar 10, 2021 at 06:43:32PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warnings:
> 
> sound/soc/codecs/wm_hubs.c:1194:11: style:inconclusive: Function
> 'wm_hubs_handle_analogue_pdata' argument 8 names different:
> declaration 'micbias1_dly' definition
> 'micbias1_delay'. [funcArgNamesDifferent]
>       int micbias1_delay, int micbias2_delay,
>           ^
> sound/soc/codecs/wm_hubs.h:59:11: note: Function
> 'wm_hubs_handle_analogue_pdata' argument 8 names different:
> declaration 'micbias1_dly' definition 'micbias1_delay'.
>       int micbias1_dly, int micbias2_dly,
>           ^
> sound/soc/codecs/wm_hubs.c:1194:11: note: Function
> 'wm_hubs_handle_analogue_pdata' argument 8 names different:
> declaration 'micbias1_dly' definition 'micbias1_delay'.
>       int micbias1_delay, int micbias2_delay,
>           ^
> sound/soc/codecs/wm_hubs.c:1194:31: style:inconclusive: Function
> 'wm_hubs_handle_analogue_pdata' argument 9 names different:
> declaration 'micbias2_dly' definition
> 'micbias2_delay'. [funcArgNamesDifferent]
>       int micbias1_delay, int micbias2_delay,
>                               ^
> sound/soc/codecs/wm_hubs.h:59:29: note: Function
> 'wm_hubs_handle_analogue_pdata' argument 9 names different:
> declaration 'micbias2_dly' definition 'micbias2_delay'.
>       int micbias1_dly, int micbias2_dly,
>                             ^
> sound/soc/codecs/wm_hubs.c:1194:31: note: Function
> 'wm_hubs_handle_analogue_pdata' argument 9 names different:
> declaration 'micbias2_dly' definition 'micbias2_delay'.
>       int micbias1_delay, int micbias2_delay,
>                               ^
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
