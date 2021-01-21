Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1902FE7C5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 11:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8453A18B0;
	Thu, 21 Jan 2021 11:38:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8453A18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611225567;
	bh=09w1/LRg41MYvE15PW/p5ZetDg6neM/I0s1ep/Sz1ow=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8PlFdkrTQI5iq/V2k+fZw8luSmJeU3xBbOaCl9DNaGktBNgdvuhX3a6A5Qk1fn0d
	 W+e53G6wjdccBkfTtqzMTcvXHaZjPmitZQdlog2IdrmfEVZiV9EEg71IvT+7UHtolR
	 Wcnhbl5N9YJnzXb5TvdmZJk+QlxEPXj9tS1xhRU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A686F8026A;
	Thu, 21 Jan 2021 11:37:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C4B7F80257; Thu, 21 Jan 2021 11:37:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346ECF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 11:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346ECF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jlrdbbY+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10LAZnJd032763; Thu, 21 Jan 2021 04:37:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=xLdqq6hhO8/n0d4Thnqw0F4ZlNDIuO5MhIN1bKH6sOE=;
 b=jlrdbbY+w12fsHVVNULS/SmejqKgpuCP9IxK4d/uibyh0Lr+jcN/n+H3AzXeu+Huqbv+
 ll1xw68vbp5fM+4eiRlXROynEhOGsIcGlz8FKy4ambhjEZA2yCsdiQYLK+jTYVa3WzJh
 MXae1++MTQMLwHzOVVyPqr+ooKmerm51UAws9hy2Gnipn2IFUV7w63Wcl2C2pmPjpLX5
 glq7bUd6w31R5dDOnTJNbggh7gqRxmOLFFW52oOXFUUTHYkuPi5XxDHAPVQGZkLD04Le
 kRNqwwWsoo2dDB7vYQtQSGZw06q5yeVaBD3w7rO5ifHfV2Lsq+XFXYXaRTTwUpXl9o6C Yw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36692r9xws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 21 Jan 2021 04:37:42 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 21 Jan
 2021 10:37:40 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 21 Jan 2021 10:37:40 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 25CB445;
 Thu, 21 Jan 2021 10:37:40 +0000 (UTC)
Date: Thu, 21 Jan 2021 10:37:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 5/5] ASoC: Intel: bytcr_wm5102: Add machine driver for
 BYT/WM5102
Message-ID: <20210121103740.GE106851@ediswmail.ad.cirrus.com>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210120214957.140232-6-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210056
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Wed, Jan 20, 2021 at 10:49:57PM +0100, Hans de Goede wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Add a new ASoc Machine driver for Intel Baytrail platforms with a
> Wolfson Microelectronics WM5102 codec.
> 
> This is based on a past contributions [1] from Paulo Sergio Travaglia
> <pstglia@gmail.com> based on the Levono kernel [2] combined with
> insights in things like the speaker GPIO from the android-x86 android
> port for the Lenovo Yoga Tablet 2 1051F/L [3].
> 
> [1] https://patchwork.kernel.org/project/alsa-devel/patch/593313f5.3636c80a.50e05.47e9@mx.google.com/
> [2] https://github.com/lenovo-yt2-dev/android_kernel_lenovo_baytrail/blob/cm-12.1/sound/soc/intel/board/byt_bl_wm5102.c
> [3] https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel
> 
> The original machine driver from the Android ports was a crude modified
> copy of bytcr_rt5640.c adjusted to work with the WM5102 codec.
> This version has been extensively reworked to:
> 
> 1. Remove all rt5640 related quirk handling. to the best of my knowledge
> this setup is only used on the Lenovo Yoga Tablet 2 series (8, 10 and 13
> inch models) which all use the same setup. So there is no need to deal
> with all the variations with which we need to deal on rt5640 boards.
> 
> 2. Rework clock handling, properly turn off the FLL and the platform-clock
> when they are no longer necessary and don't reconfigure the FLL
> unnecessarily when it is already running. This fixes a number of:
> "Timed out waiting for lock" warnings being logged.
> 
> 3. Add the GPIO controlled Speaker-VDD regulator as a DAPM_SUPPLY
> 
> This only adds the machine driver and ACPI hooks, the BYT-CR detection
> quirk which these devices need will be added in a separate patch.
> 
> BugLink: https://github.com/thesofproject/linux/issues/2485
> Co-authored-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
