Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A452E7047
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 13:02:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2551700;
	Tue, 29 Dec 2020 13:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2551700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609243342;
	bh=0I8OKKek2uY1WTLPkUEo6bhbKNQ4A6brsTt9K0AY/TU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRzHBNiqUFYOjQ3x/v5ElGdkR8K88NkeX5d7VRswcuWWtfZC+KwUxEVcBOE1KO9Hw
	 18oC3DuKU4WqmdfDe/b2Q/WvlClvImqxH9gMEuS5KzV7/rN4N2tU7G2pMOCVuHpjHz
	 9f08argu/3CmDHR5k1FuIzbPfDC4/IyFNe2syzJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F066F8020C;
	Tue, 29 Dec 2020 13:00:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DC02F8022B; Tue, 29 Dec 2020 13:00:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 085ABF80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 13:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 085ABF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gjDWEht7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BTBrbs9003695; Tue, 29 Dec 2020 06:00:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=JuJssSRaUYe6JFnUlHct2u9BzdB+OHvVGf7j9G8SCnk=;
 b=gjDWEht7MTPdC2ANpFk4QDdsLrwOG5527gEQW30S+7wwr8RYyGLZEHgM19AFkdS5C9t8
 JbF8/yDzqc2xpNW58TlGbCvoLD/SeB98HlFkEBv/epxCvgaJeqx7yQsjnoGfw/eUNVu4
 2QlKvTsrXqrDPFlLnZ1OU0apWZ67TEpEaTUcEhzw7OYBW1E/hw35I311OJtClfaDLPri
 rGT95wqF+dhoyKBboolXaTFW33CetXYhmPl3UZtGhvlVjoX3Tdz4bt3WBRLLsqopTPvU
 b6aZSS97MsRoVierL4rl8iPu6QLK3D9A4JztTxkJAxIKMNfi3NDRp/mka2/92eacpRH5 pg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35p2fs2a5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Dec 2020 06:00:41 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 29 Dec
 2020 12:00:39 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 29 Dec 2020 12:00:39 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6C2E111CB;
 Tue, 29 Dec 2020 12:00:39 +0000 (UTC)
Date: Tue, 29 Dec 2020 12:00:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/14] mfd: arizona: Allow building arizona MFD-core as
 module
Message-ID: <20201229120039.GI9673@ediswmail.ad.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201227211232.117801-5-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=935 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290075
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

On Sun, Dec 27, 2020 at 10:12:22PM +0100, Hans de Goede wrote:
> There is no reason why the arizona core,irq and codec model specific
> regmap bits cannot be build as a module. All they do is export symbols
> which are used by the arizona-spi and/or arizona-i2c modules, which
> themselves can be built as module.
> 
> Change the Kconfig and Makefile arizona bits so that the arizona MFD-core
> can be built as a module.
> 
> This is especially useful on x86 platforms with a WM5102 codec, this
> allows the arizona MFD driver necessary for the WM5102 codec to be
> enabled in generic distro-kernels without growing the base kernel-image
> size.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

I think this patch might still cause some issues. ASoC has an
idiom where the machine driver does a select on the necessary
CODEC drivers. Select doesn't take care of dependencies etc. So I
believe if you build the machine driver as built in, it then
selects the CODEC as built in. If you have the MFD as a module
the build then fails due to the the CODEC calling some Arizona
functions.

arizona_request_irq, arizona_free_irq, arizona_set_irq_wake

On Madera we made the equivalents inline functions to avoid the
issue, the same should work here.

include/linux/irqchip/irq-madera.h

Thanks,
Charles
