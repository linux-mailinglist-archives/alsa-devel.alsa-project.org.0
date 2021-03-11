Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F180336EC0
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 10:24:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B22C172E;
	Thu, 11 Mar 2021 10:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B22C172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615454644;
	bh=/uTw5fid3KcGyTXp1BfFF6lcDhUhbbejde1nnH4j89E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EnEVRhUpErZJ1mR846oWK8C3V45YDWemze2CYe+ynQckh4NLqIqhX4On5qFI0WG2j
	 It0FGng86xMfOtApO8kzQ3iAPpxJ6AHCyOoKqOIS+xImaWhs975IiIrKKHKd3gpLHF
	 mnM/mB9EDtx1yLDoBlQsLzMZCbgg1RvOmgq8Py8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67D5BF80256;
	Thu, 11 Mar 2021 10:22:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1144EF80227; Thu, 11 Mar 2021 10:22:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA1E0F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA1E0F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="N1A2D/xy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B9BRAW015584; Thu, 11 Mar 2021 03:22:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Qu2f0+4ZncctLJUnnZmwbMWRTQpS9bfdBkdHl1iQXtI=;
 b=N1A2D/xyBxHX648Drw8niiUoDnE2tJtnJDNtnUiDRClIDjQ/30pmQXb5jUJEWO4pEvP/
 i6Q6w19ZZnIeJCORgIp1Fb+RJhZOYQQ3vupOdj10McwY87T6zt/n1cEZPbPlMkS40l6g
 Lr1+G4iw+jrsAWvgBMID0pBHrCPaSgmOsNjkASnXZ0FFC6QHdYbzPWLNCItvEV8H4+ip
 m4JXFE7EQucv3uAyQ5NarXh7FBPkY9zoglzluGmzy4b9l3V5rhC3rcJTApsHqA8GgPje
 /1AB8yvRxOxndRNr273oCuySZFkTSztZ3Cmdml5dG/+5Sr2bJZ5a2CktiSuR/S467Bup fw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471vx123-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Mar 2021 03:22:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 11 Mar
 2021 09:22:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:22:05 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 545B611D6;
 Thu, 11 Mar 2021 09:22:05 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:22:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 01/10] ASoC: arizona: fix function argument
Message-ID: <20210311092205.GI106851@ediswmail.ad.cirrus.com>
References: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
 <20210311004332.120901-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210311004332.120901-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
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

On Wed, Mar 10, 2021 at 06:43:23PM -0600, Pierre-Louis Bossart wrote:
> Cppcheck warning:
> 
> sound/soc/codecs/arizona.c:2042:53: style:inconclusive: Function
> 'arizona_init_dai' argument 2 names different: declaration 'dai'
> definition 'id'. [funcArgNamesDifferent]
> int arizona_init_dai(struct arizona_priv *priv, int id)
>                                                     ^
> sound/soc/codecs/arizona.h:320:53: note: Function 'arizona_init_dai'
> argument 2 names different: declaration 'dai' definition 'id'.
> int arizona_init_dai(struct arizona_priv *priv, int dai);
>                                                     ^
> sound/soc/codecs/arizona.c:2042:53: note: Function 'arizona_init_dai'
> argument 2 names different: declaration 'dai' definition 'id'.
> int arizona_init_dai(struct arizona_priv *priv, int id)
>                                                     ^
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
