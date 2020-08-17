Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E4246357
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7B31698;
	Mon, 17 Aug 2020 11:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7B31698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656490;
	bh=tvchmmlmMWIYMwE8lGy6IWF3GqgBIN1CAsccQ9ySHhI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FvkDNcLy/s/O83jzvu0iuOjU0/f5i/RFkjUP9RCz2fASHqYQsKfxle31dR9YhjykC
	 55QsIDqDY8JhKcbVoOSNNk1uV6F7DpGWjHFtd2u9k5iUVkXUba/5LMcMa4daN98WgS
	 Ya2imVLAinw7tKf1RT5OxajnfFCASC5PBcDCR39U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C70AAF802DB;
	Mon, 17 Aug 2020 11:25:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B9FF802D2; Mon, 17 Aug 2020 11:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7812DF802C2
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 11:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7812DF802C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mntKRLbI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07H9ESQh010070; Mon, 17 Aug 2020 04:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=TOMG9uggUh7oDX4aK+NWCK0xxwHG0y+9ef6Fql8ClsU=;
 b=mntKRLbIat4GaFeijS/y5Klnuk8lqyCtlPff+2LLi77AocgXIYB2b5xIg27JCHlHVZfb
 yuEy2eSLpXOtP72l0i6I/7BB3clegneo4nbeQLDPHgifTQNncRLqwdIlgyrMGfYDdpK9
 W06t3Mt/4M37JPbtAqQN3pcmXwExn7HZ2tKYM+2Y2NX5f5pyxQYMYv1c/Zztt8a6aabR
 yWBy26gd7i2NHLplpaIKBIWk1dVOJ96xuceMy/72s9P7fibynnP6qobI2aGNTS/pNw3j
 GcMBKHGCUFw+ca4iHc2eTUSxEBQqMC2jLgigOMZrXD/qzAouVN+g6Gk3n8WiYz9c1F3I uA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 32xd42t8ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Aug 2020 04:25:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 17 Aug
 2020 10:25:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 17 Aug 2020 10:25:05 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 35F5F2C3;
 Mon, 17 Aug 2020 09:25:05 +0000 (UTC)
Date: Mon, 17 Aug 2020 09:25:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC] ASoC: wm8994: Avoid attempts to read unreadable
 registers
Message-ID: <20200817092505.GF10899@ediswmail.ad.cirrus.com>
References: <CGME20200731173856eucas1p292d2bc7319aa6a9af9b0e48b89ae803b@eucas1p2.samsung.com>
 <20200731173834.23832-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200731173834.23832-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=631
 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170070
Cc: simon@lineageos.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On Fri, Jul 31, 2020 at 07:38:34PM +0200, Sylwester Nawrocki wrote:
> The driver supports WM1811, WM8994, WM8958 devices but according to
> documentation and the regmap definitions the WM8958_DSP2_* registers
> are only available on WM8958. In current code these registers are
> being accessed as if they were available on all the three chips.
> 
> When starting playback on WM1811 CODEC multiple errors like:
> "wm8994-codec wm8994-codec: ASoC: error at soc_component_read_no_lock on wm8994-codec: -5"
> can be seen, which is caused by attempts to read an unavailable
> WM8958_DSP2_PROGRAM register. The issue has been uncovered by recent
> commit "e2329ee ASoC: soc-component: add soc_component_err()".
> 
> This patch adds a check in wm8958_aif_ev() callback so the DSP2 handling
> is only done for WM8958.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Sorry for the delay.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
