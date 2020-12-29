Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1972E6FFF
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 12:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF6716D7;
	Tue, 29 Dec 2020 12:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF6716D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609242164;
	bh=95z6yo3wKGwhk2HEYbCgFeknxDdUALOC/J2yZjL0LDo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuSS51zdi3TfhV2+IvRovakatFw59XjrKcatwqx2j9RnFnHFUKP9fZCr9bno6wSJ4
	 anldJORpYBd+ewBwQWP/9vGWQsG69BTcnDPZ1gpF1bIiVOdTfw2MWWGv9qaHl6vzNQ
	 u6/9r0z6cNDvPhbSmQxrKWiicRHZluFPWPZLm/+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AF68F8022D;
	Tue, 29 Dec 2020 12:41:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9FDF8022B; Tue, 29 Dec 2020 12:41:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69FA0F80143
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 12:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69FA0F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="b9X6z/yj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BTBd0IG001283; Tue, 29 Dec 2020 05:40:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=2xtBZ1d+TCpg6I9iqVlmPO8l3el6VdhLDsfmtyqgneU=;
 b=b9X6z/yj7WPnBRLgRHVQsnh4lVaiM7ZKLEBV7yIQzCqCEHWCGtP4KxuNjbJUy9Jar3zg
 ClohS/WdyT1BFXas/9SiW8TEIl6t3tYNNpDVpKxR+EU1dZopB2ik8sdVXClIiZAcQuWL
 sOk/y6G6SmzI/CnsSjs4XQEL0WLzlyi1ct8LEuom+yNv7S/4I1QecJwO0iQVOhBpggTk
 55JALUX3wIaOX0ysIKfQ/tvjFfAghb1Hb6dXsmHnlg1I8gUqVgaLfKWC4ziNfwNhX3wi
 yB9z3oVX9ZkQKw89adZ2hKrwck9Vm9PY5pRYwLaK8gMcDivdT3lfLBzFAHeR9N9MX49f dA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 35p3f7a8as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Dec 2020 05:40:56 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 29 Dec
 2020 11:40:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 29 Dec 2020 11:40:54 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9CA3F11CB;
 Tue, 29 Dec 2020 11:40:54 +0000 (UTC)
Date: Tue, 29 Dec 2020 11:40:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/14] mfd: arizona: Add MODULE_SOFTDEP("pre:
 arizona_ldo1")
Message-ID: <20201229114054.GH9673@ediswmail.ad.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201227211232.117801-3-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290073
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

On Sun, Dec 27, 2020 at 10:12:20PM +0100, Hans de Goede wrote:
> The (shared) probing code of the arizona-i2c and arizona-spi modules
> takes the following steps during init:
> 
> 1. Call mfd_add_devices() for a set of early child-devices, this
> includes the arizona_ldo1 device which provides one of the
> core-regulators.
> 
> 2. Bulk enable the core-regulators.
> 
> 3. Read the device id.
> 
> 4. Call mfd_add_devices() for the other child-devices.
> 
> This sequence depends on 1. leading to not only the child-device
> being created, but also the driver for the child-device binding
> to it and registering its regulator.
> 
> This requires the arizona_ldo1 driver to be loaded before the
> shared probing code runs. Add a doftdep for this to both modules to
> ensure that this requirement is met.
> 
> Note this mirrors the existing MODULE_SOFTDEP("pre: wm8994_regulator")
> in the wm8994 code, which has a similar init sequence.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
