Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD31A4A6E2E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 10:54:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366E1847;
	Wed,  2 Feb 2022 10:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366E1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643795667;
	bh=qotgH7PICJZt8koBL3hX7aG3oKI06jRcFkkY3bFdLqM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qsZWMIeQhNb6x3vmHZVBuXa2Oxh+bbXqKLwJBysoXz/KOzplCuFzrZRypGP2UO+3p
	 ZFuZO0UXZIvHaCL4oaFHoyIy9J8JVsG2LN6GpYzw9PzuQzVfDx4toqvHRwipzHd4cE
	 J+qEJhopRv9NFb4a+lE+7TGXFozbj2VStO1l5LkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96AEEF804B1;
	Wed,  2 Feb 2022 10:53:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D9EDF804B0; Wed,  2 Feb 2022 10:53:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BCAAF80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 10:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BCAAF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gPTi0zjt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2127g84s006428;
 Wed, 2 Feb 2022 03:53:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=osO9KjR3bNrSyyc47IFvkhgY1OPmSrYcZ1TDlZ7ETus=;
 b=gPTi0zjtPWsyB6bTqhLGz2zhHja4sCnuJn+m3rvJ9dwCz3YXFr7HOwhXGYG2NAyqyfcx
 YpavuU1TcWyvQz/QoSniawml788WZq4NnFKiv/hwFAM4vUOEmd5KSzeKnml6yQMAEsUz
 83LCb4AVdYf+wz3z03Z+vk1bkpLyv25wuPPfcadRYK3p7ZujNwrgZnnVKMldpEDx4lhj
 UnXyLc6NezDss7XzZzLm8Yx99chYTUgDLkMhOFW6jlAEiLB1/byvVbsI0w8M43Y4gTVp
 9phiAO6+WjUyBinyaVZ/zUNi3Po+P6D5ezrr8H9btxedJwZ1s+GNMKv+Mbhk8H5CF2d0 NQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dxksx2pq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 02 Feb 2022 03:53:03 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 09:53:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 2 Feb 2022 09:53:01 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8BBD9B0E;
 Wed,  2 Feb 2022 09:53:01 +0000 (UTC)
Date: Wed, 2 Feb 2022 09:53:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220202095301.GZ18506@ediswmail.ad.cirrus.com>
References: <20220201150113.880330-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220201150113.880330-1-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: kmkrBuGaHY3iEJN73PF59qxOdXEKyDS0
X-Proofpoint-GUID: kmkrBuGaHY3iEJN73PF59qxOdXEKyDS0
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@puri.sm, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org, geert@glider.be,
 daniel.baluta@nxp.com
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

On Tue, Feb 01, 2022 at 04:01:13PM +0100, Martin Kepplinger wrote:
> In order to use the external mic we need to switch DMIC_ENA off.

When you say external mic do you mean an analogue mic connected
to the INxy pins on the chip?

> I know when DMIC is not used at all, the codec driver does
> snd_soc_dapm_nc_pin(dapm, "DMICDAT"); but I'm not sure how I'd create
> a control based on that.

snd_soc_dapm_nc_pin should be called on DMICDAT if the GPIOs are
not configured for use of a DMIC. And if called DMIC_ENA should
never be set by the driver, since it can't be used as the pins
are not configured to operate as DMICs.

> I'm not yet looking into detection - only making it work when selected
> manually, via ucm. Although I need detection too later.
> 
> While this works when I set the control in ucm, AFAIK the way I do it
> here is not correct though due to dapm.
> 
> I guess this conflicts with the widget:
> SND_SOC_DAPM_AIF_IN("DMIC_ENA", NULL, 0, WM8962_PWR_MGMT_1, 10, 0),
> 
> Do you have any advice for me on how to do what I want?
> 

Yes the DMIC enable should be controlled through DAPM when the
relevant audio path is enabled.

Just to check I understand the problem correctly. You have a system
that has both analogue and digital mics connected, and the
problem is that DMIC_ENA is then permanently enabled, meaning you
can't access the audio from the analogue mics?

Assuming I am correct above, looking through the DAPM graph it does
look like the DMIC is oddly wired. It does appear to be hard wired
into ADCL, which would indeed cause it to be permanently enabled
if the pins are configured for DMIC. Assuming there isn't some
reason the chip can't switch between digital and analogue modes
(I can't see an obvious one in the datasheet), I think really there
is a DAPM mux missing here. There should be a mux connecting both
MIXINL and DMIC_ENA to ADCL/ADCR, rather than them both being
directly connected that would let the user switch between
analogue and digital inputs.

Thanks,
Charles
