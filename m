Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DB637747
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 603C316ED;
	Thu, 24 Nov 2022 12:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 603C316ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669288483;
	bh=EMZfw34a95hucjihNdRYXMHgKxqSZJZM7O/TQPcfAqI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iji7aW4e425SDcRrOXwmO2dawz+zvuy6zi9dv9JKlGM6F5vsPbjOCEf+fnyonbuSh
	 Xd36BEePG9UIxzAv7BbwbCfnkHfOUBR7gwxi4yQ9tLWQzd+Gzx0XmRv1jS05V3fAVS
	 n5H/3Q2lE2qHyuWwyVL7k+0W91Q9jBO7wUSF7Tmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E00F8014E;
	Thu, 24 Nov 2022 12:13:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41DF8F8014E; Thu, 24 Nov 2022 12:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0903BF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0903BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pkukmm3c"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO7cYDD023037; Thu, 24 Nov 2022 05:13:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=KzIVxiaUzFmwVmBqr6IdozjqkXgomj00FNdz4ozpdfc=;
 b=pkukmm3cD4KghaY8vpf6MnEx8wFqu1SRJxVpU5spAVt/aRGhnd1JdWf6JoCuWFliCWoE
 aLzqg2BVVki88jQAtDV4pRHr1CWp85xplq/MW4db87SSRWkZrtTvG5kh0mVkUrgxl3l+
 il5+7Zu1tq/W7b8TSLUzTlIzdGXb1RwBU1eZWqDRHtDxdDyhfELL3yWF1OXkuhVpo/dF
 52SR6CEbrR2rkG/qIMwAb9ApQY58E/LS1DCS5KKWvrm4C2iHp0QxLthG0fU743jEMroN
 lyo0XC3l2nhIjpEXyR+diR9DX6TV731DTLeTxLji7ibwx0W5KXsW1/5v4BNexF13bUUm HA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet621g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:13:38 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 24 Nov
 2022 05:13:36 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 24 Nov 2022 05:13:36 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 88ED1477;
 Thu, 24 Nov 2022 11:13:36 +0000 (UTC)
Date: Thu, 24 Nov 2022 11:13:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Subject: Re: SOC_DOUBLE_R_SX_TLV controls broken in cs24l51 driver
Message-ID: <20221124111336.GE105268@ediswmail.ad.cirrus.com>
References: <CABDcavYdsk-O4x3oPX4i4+T5wsoZV26_kpEq6JvpD8A_cAGHxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CABDcavYdsk-O4x3oPX4i4+T5wsoZV26_kpEq6JvpD8A_cAGHxg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: mCedHBN3rX4G6ParltJ3gVv_xnRlraUI
X-Proofpoint-GUID: mCedHBN3rX4G6ParltJ3gVv_xnRlraUI
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 Tan =?utf-8?B?TmF5xLFy?= <tannayir@gmail.com>
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

On Thu, Nov 24, 2022 at 10:57:34AM +0100, Guillermo Rodriguez Garcia wrote:
> Hi all,
> 
> I am using a dev board with a Cirrus Logic cs24l51 codec.
> 
> This used to work fine prior to kernel version 5.x, however after 5.x
> it is not possible to set certain values for ALSA controls from
> userspace.
> 
> I believe this is related to the input validation that is mentioned in
> this thread: https://lore.kernel.org/all/Yph8C3bRxcr6ogW7@sirena.org.uk/T/,
> and possibly in this commit: 4f1e50d6a9cf9c1b8c859d449b5031cacfa8404e
> ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")
> 
> For the cs24l51, all the controls that fail are using the
> SOC_DOUBLE_R_SX_TLV macro.
> 
> I have traced this to the checks in snd_soc_put_volsw_sx, specifically
> the (val > max - min) check:
> 

Can you try these two patches:

https://lore.kernel.org/all/165236477046.1016627.15470197691244479154.b4-ty@kernel.org/

It looks like they somehow got lost around 5.18, I have been
meaning to chase up what happened to them.

Thanks,
Charles
