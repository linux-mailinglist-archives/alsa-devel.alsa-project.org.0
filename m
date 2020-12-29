Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1727C2E708E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 13:12:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9764C172B;
	Tue, 29 Dec 2020 13:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9764C172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609243945;
	bh=1op9XOU4m9YdVBexxkkRktdJGYfoGSCkWTjZoPhFyZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CNn9DYlRJxwTG7uBEgSv3pPfqMhY4hkUJPXNEo5qGiY/AR9AXqIY9+ctHAeGHZkfk
	 jIvguYmjJ2mBbQ16iLsz352JLDZSWoUy03epXqgESGV9ZKXkJiHqmtXNVSwGRGQklc
	 kpRXmSP/S2QsdB3IhXHp+54lLkPOrP3K639iSCP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05B9BF8022D;
	Tue, 29 Dec 2020 13:10:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68C15F8022B; Tue, 29 Dec 2020 13:10:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A9AF80143
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 13:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A9AF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qVaYrJjO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BTC6OiU003407; Tue, 29 Dec 2020 06:10:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=b2p/w4UnxX8C3PmPAuMuKiC0cnORaVzXsa0NBHbWtOM=;
 b=qVaYrJjO3xxPjDkZnyjzxkfnmd4dcrDco/F4/9nTokm/23ZhF1e+24ekZK6tOrck+LYS
 +MWGnsU2aViYcHHjLEu+PO1KHdJdnd9c5/TWMrWgi55kCLccUQDNvW3VWglIoglegzTo
 oImtnZQXS3bGIcS7EMJ7gykErNkBVhRhjvJkAzytDXZ4TvDaPMqMftzex0U96a10mOjc
 QlTLssPcl9EtDjWZxfK3EiKfU0HWu/DxzONW5L/d/j5I82KnU4ojX/blaFzRaABLaUy4
 kxBzsXVINXQlC+ps2BBfY8woZk+lzFOn5dYNj9V86RspsiwxgCwg7GzvMW2ZK6KlT74K iQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 35p3f7a8wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Dec 2020 06:10:39 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 29 Dec
 2020 12:10:37 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 29 Dec 2020 12:10:37 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9AB902AB;
 Tue, 29 Dec 2020 12:10:37 +0000 (UTC)
Date: Tue, 29 Dec 2020 12:10:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 06/14] extcon: arizona: Fix various races on driver unbind
Message-ID: <20201229121037.GJ9673@ediswmail.ad.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201227211232.117801-7-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=995
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290077
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

On Sun, Dec 27, 2020 at 10:12:24PM +0100, Hans de Goede wrote:
> We must free/disable all interrupts and cancel all pending works
> before doing further cleanup.
> 
> Before this commit arizona_extcon_remove() was doing several
> register writes to shut things down before disabling the IRQs
> and it was cancelling only 1 of the 3 different works used.
> 
> Move all the register-writes shutting things down to after
> the disabling of the IRQs and add the 2 missing
> cancel_delayed_work_sync() calls.
> 
> This fixes various possible races on driver unbind. One of which
> would always trigger on devices using the mic-clamp feature for
> jack detection. The ARIZONA_MICD_CLAMP_MODE_MASK update was
> done before disabling the IRQs, causing:
> 1. arizona_jackdet() to run
> 2. detect a jack being inserted (clamp disabled means jack inserted)
> 3. call arizona_start_mic() which:
> 3.1 Enables the MICVDD regulator
> 3.2 takes a pm_runtime_reference
> 
> And this was all happening after the ARIZONA_MICD_ENA bit clearing,
> which would undo 3.1 and 3.2 because the ARIZONA_MICD_CLAMP_MODE_MASK
> update was being done after the ARIZONA_MICD_ENA bit clearing.
> 
> So this means that arizona_extcon_remove() would exit with
> 1. MICVDD enabled and 2. The pm_runtime_reference being unbalanced.
> 
> MICVDD still being enabled caused the following oops when the
> regulator is released by the devm framework:
> 
> [ 2850.745757] ------------[ cut here ]------------
> [ 2850.745827] WARNING: CPU: 2 PID: 2098 at drivers/regulator/core.c:2123 _regulator_put.part.0+0x19f/0x1b0
> [ 2850.745835] Modules linked in: extcon_arizona ...
> ...
> [ 2850.746909] Call Trace:
> [ 2850.746932]  regulator_put+0x2d/0x40
> [ 2850.746946]  release_nodes+0x22a/0x260
> [ 2850.746984]  __device_release_driver+0x190/0x240
> [ 2850.747002]  driver_detach+0xd4/0x120
> ...
> [ 2850.747337] ---[ end trace f455dfd7abd9781f ]---
> 
> Note this oops is just one of various theoretically possible races caused
> by the wrong ordering inside arizona_extcon_remove(), this fixes the
> ordering fixing all possible races, including the reported oops.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Sorry yes there are a few rough corners on the extcon stuff, I
have clean up series I have been working on as part of
upstreaming the Madera extcon hopefully I will get that sent out
one day.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
