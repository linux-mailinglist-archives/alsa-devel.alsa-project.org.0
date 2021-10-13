Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F242B9DF
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 10:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795EC15E0;
	Wed, 13 Oct 2021 10:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795EC15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634112433;
	bh=+10BMlMCeXQCWBLkM0K9dXOth+p5wru9OhZ1q9Bnq9U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CBx1ghEvxLitMjq6yHubUImri2WRhArdlpFrQ5ogHm+eOKr+xV28H8iFRba/Uv5Z8
	 WDkb3VFHu/npeWcVzZEJ3FdrSodYsqnYyQer1EktU2rX+0lu+fxmDIH1vYYos4ArTW
	 njJ08O6/6LE3cO/CVcQI+x5e2Q0XjYsYphXhtRuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC4CCF8028D;
	Wed, 13 Oct 2021 10:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07CA2F80269; Wed, 13 Oct 2021 10:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E23BBF80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 10:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E23BBF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qVlRbrN4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D5M4xr003946; 
 Wed, 13 Oct 2021 03:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=xN3HwVR8Olq4c8b80ksL+6F0RWwTIzqvH/ci+40/9ys=;
 b=qVlRbrN4ezddF/g1zdnAe2813XEyb02o8yc47aiOwvXm9fuSFUpldFxOrgnIRvho7mmX
 AsXyMzlcCBdK/2MQJNT+7QUeigFXV+Y8XIv8v8NfHJi5PhUNYhcwsJOh88jDF1CP4bDV
 OWzTtal8VNJfIumLEFXQ9+KPQpF/fuYtm5WUnqLYtj4rGo2CckH3VP1r4jsxVORqHXYQ
 bY1cGQRCVpZFV7RfbUSB6AwOKBoYANX58WK7fUt2oBjjVjHRYEXvfDgUay46Lm0tvtaD
 LquR9/UunkXphtLHJglDF2f8Z53b9PtXweXJXETrVU3HVSMDrfPPYwhyz++qxyY5B1vh EQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bnkc08hm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Oct 2021 03:05:46 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 13 Oct
 2021 09:05:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 13 Oct 2021 09:05:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E483EB15;
 Wed, 13 Oct 2021 08:05:44 +0000 (UTC)
Date: Wed, 13 Oct 2021 08:05:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8960: Fix clock configuration on slave mode
Message-ID: <20211013080544.GB28292@ediswmail.ad.cirrus.com>
References: <1634102224-3922-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1634102224-3922-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: NbTush4FL2ZubP2MgG4FZxPUgVnVB4Bx
X-Proofpoint-ORIG-GUID: NbTush4FL2ZubP2MgG4FZxPUgVnVB4Bx
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Oct 13, 2021 at 01:17:04PM +0800, Shengjiu Wang wrote:
> There is a noise issue for 8kHz sample rate on slave mode.
> Compared with master mode, the difference is the DACDIV
> setting, after correcting the DACDIV, the noise is gone.
> 
> There is no noise issue for 48kHz sample rate, because
> the default value of DACDIV is correct for 48kHz.
> 
> So wm8960_configure_clocking() should be functional for
> ADC and DAC function even if it is slave mode.
> 
> In order to be compatible for old use case, just add
> condition for checking that sysclk is zero with
> slave mode.
> 
> Fixes: 0e50b51aa22f ("ASoC: wm8960: Let wm8960 driver configure its bit clock and frame clock")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
