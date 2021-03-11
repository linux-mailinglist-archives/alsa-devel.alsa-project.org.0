Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2358A336EED
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 10:32:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2AA917A5;
	Thu, 11 Mar 2021 10:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2AA917A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615455139;
	bh=8Y3cYEjAb0oI0OOXyM5iFkUC/TkZVwneGfeIWrtFLY0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3mICJ0y8MS0rEXj/IupZj3gq+2VCOn5uIZSRpAp+r4IbnpLRe8ZUb2AZpmExtLnr
	 +h2CR9TQg1++uEUmvULlVu4npl7dMh0Bn1MPEHE4y+tqiRsf/q6/e4+rgsQYvgrs+E
	 ZFhKX6bAGsq1GyyPKnIuH3e61JLLYGHTNJyc1G08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB87AF8042F;
	Thu, 11 Mar 2021 10:30:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A24F80425; Thu, 11 Mar 2021 10:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BB91F8032C
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB91F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UYmN8Mtq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B9BRB5015584; Thu, 11 Mar 2021 03:30:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=xKIVoRJXQfj6Ah7VYOKRbsjw58fV3m5Eoz5I3C0GyqY=;
 b=UYmN8MtqbpZTyJnSwJ+8TUSw3b46LLG90B9CTz/ka94rf1PYJqRS2uENie1kCndyJYVk
 x79ke+2GioBy45GXhIoKRIY2rjn9Sa833ecAhFaZSsomtLW6iLeLM43CvlmN3VCIZmSL
 4g2z/FX3KE1pYfVsXNalV1rvK6szFlS7J1VIZZpkotLk4iqrcNc8gAd6sTw+ggFtI8dQ
 xvlZCFspXWSok7f+ez5iqMwuz+g5CGcbRnTlzVLztxIV4TkpBohLA/+oO1jI4uGEoI6x
 cSv8HnyP+s1ouy662fsd2zJHenj04voatIqCMIvJ3wwroWJzDJ1vNuz928gQVzBTatvB Ig== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471vx19d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Mar 2021 03:30:32 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 11 Mar
 2021 09:30:30 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:30:30 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9A78911D6;
 Thu, 11 Mar 2021 09:30:30 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:30:30 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 07/10] ASoC: wm8994: align function prototype
Message-ID: <20210311093030.GO106851@ediswmail.ad.cirrus.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
 <20210311004332.120901-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210311004332.120901-8-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=954 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110050
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

On Wed, Mar 10, 2021 at 06:43:29PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/codecs/wm8994.c:3923:26: style:inconclusive: Function
> 'wm8958_mic_detect' argument 3 names different: declaration 'cb'
> definition 'det_cb'. [funcArgNamesDifferent]
>         wm1811_micdet_cb det_cb, void *det_cb_data,
>                          ^
> sound/soc/codecs/wm8994.h:53:26: note: Function 'wm8958_mic_detect'
> argument 3 names different: declaration 'cb' definition 'det_cb'.
>         wm1811_micdet_cb cb, void *det_cb_data,
>                          ^
> sound/soc/codecs/wm8994.c:3923:26: note: Function 'wm8958_mic_detect'
> argument 3 names different: declaration 'cb' definition 'det_cb'.
>         wm1811_micdet_cb det_cb, void *det_cb_data,
>                          ^
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
