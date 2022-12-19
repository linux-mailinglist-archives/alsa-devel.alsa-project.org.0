Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA576509B0
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 10:59:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87F7C2BDD;
	Mon, 19 Dec 2022 10:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87F7C2BDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671443992;
	bh=LuxpFvZjSTMr36mVDWKrbtdysi8eAy7lEgCJYNJe6tk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kbsfs94wSypmycjaBiEvb2zd0F9WGk/ztcmazjrqrvD5pp0uJTCjsekGYgFT4v6x0
	 NlDBTl6I28Ubqgpq+u7pRJl2T8gqWS7XsRKcPWgIL8TNHr0thtBnUO6Osa5lGxdsmh
	 AjNK8mpIu8tEEP3C0GUQixNMfbsnzP3Ub2Wqd3tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F9CF801C0;
	Mon, 19 Dec 2022 10:58:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC50F80423; Mon, 19 Dec 2022 10:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B57CFF801C0
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 10:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57CFF801C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lCgUmekZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ7OmV6029670; Mon, 19 Dec 2022 03:58:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qXn/bJV1DX5QQQ9G3avNSKeTDlziEr16YH3fTzCVmIg=;
 b=lCgUmekZ8Go6Oej13PwBEjN1f48hAg+41nqr5klOnUgs92E4NiOY+zSF7kXRXO9BKw2k
 /Bx8Wpnzgm7d08bT2JdWDgbka25WesZQwjSGA1Y59Q2oa33XnAKGEIme+cimfDbWBLG/
 j9LtbestVBlhIolMLIjpqOgAq5zFYtrRFhfDWkOfrnYQk2Wnq3IsCXMxDVcP/wvJcMWv
 cpuaRxx2vdI/grxrZciBjrqPuugiLbJL4l0WaGkcHhOBpftGzVNNPNO6BWCUJr6/H99t
 VF8FMOqqcvhTeC+U6LIzZll4RlU7l8CBo4nsKCQ57GPIYnEoqLNpavhqxGc+5yrI1DFn ww== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mhc27ae08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 03:58:48 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 19 Dec
 2022 03:58:46 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 19 Dec 2022 03:58:46 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B04B111CC;
 Mon, 19 Dec 2022 09:58:46 +0000 (UTC)
Date: Mon, 19 Dec 2022 09:58:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: wm8904 and output volume control
Message-ID: <20221219095846.GC36097@ediswmail.ad.cirrus.com>
References: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: O3kkblowbZYisSbfE3cfMjGMtDzpqrnu
X-Proofpoint-GUID: O3kkblowbZYisSbfE3cfMjGMtDzpqrnu
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 emanuele.ghidoli@toradex.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, Dec 17, 2022 at 12:47:14AM +0100, Emanuele Ghidoli wrote:
> Hello,
> I have found that output volume is set to the default value after a
> limited time (~4 seconds) after play stop.
> I have analyzed what is happening:
> - at first play the volume is the expected one
> - After stopping playing + ~4 seconds wm8904_set_bias_level (...,
> SND_SOC_BIAS_OFF) is called
> - Chip is reset and regulator is switched off if "possible" (not in
> our case, it is important to note)
> - at second play wm8904_set_bias_level (..., SND_SOC_BIAS_STANDBY)
> is called. wm8904_hw_params is also called just before.
> 
> I see that all I2C transactions are good, registers are written as
> expected, especially volume control register (even the silly
> HPOUT_VU bit, to do a volume update is correctly written).
> Reading out this register, using i2cget (bypassing regcache), report
> the "expected" value. But the real output volume correspond to the
> default value (hw default, that it is the same value in
> wm8904_reg_defaults structure).
> 
> I checked that SYSCLK_ENA is 0 during register writing (needed if
> MCLK/SYSCLK is not present). I do not know if there is some other
> constrain on these registers.
> 

Yes this might be my guess as well, I wonder if the HPOUT_VU bit
needs SYSCLK to be present to take effect.

> If I rewrite the volume control register, a second time, the volume
> is set (tested with i2cset, from user space. And from kernel space,
> bypassing regcache).
> 

When you write the value the second time is that still before
SYSCLK is present?

Also does just writing one of HPOUT volumes cause the other to
get updated? The HPOUT_VU bit should trigger an update to both.

> I resolve also by reverting e9149b8c00d2 ("ASoC: wm8904: fix
> regcache handling").
> I'm not here to say that the commit is wrong. I analyzed it and seem
> perfect (in few words it align the hw with the regcache avoiding
> potential incoherence).
> 

Yeah I think that commit is fine, I would wager that your system
doesn't turn off the regulators so without that commit the
register retains the old volume across the "power down".

Thanks,
Charles
