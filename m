Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49B6338EE
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:47:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5B5D1663;
	Tue, 22 Nov 2022 10:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5B5D1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669110446;
	bh=rGPf51VEsLPucXXGen3i+nx1SWl7mNtP+QuEScPVVK0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jETvmZNT9Ej9BPvHGFT7jRU9S4t3PvlQX+HXdbPaA761+1zj6N28Opa3eIgjxDPD2
	 gNUj+6vrWBhpMUgiQJ2Xly7M5N1odq9CuINTxHMrOjnPjetpjeQtkAsD/6KkiMyPdR
	 9aKUBBxQdkfsNBky9J0eJlYxwrR/fWckvq6u3t/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7317DF80310;
	Tue, 22 Nov 2022 10:46:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA0BF80115; Tue, 22 Nov 2022 10:46:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4942F80115
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 10:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4942F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VG+5W1AW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM6ApYg019336; Tue, 22 Nov 2022 03:46:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=QMTY0w/7oPP0F09tWAPTqPEFCSNS1AjMpxoLVGnMMZE=;
 b=VG+5W1AWOL/sRYeWuR9Z+ohM8oFCxpCTQstKtFqrpKgJtHt3n5qktjx9VtrpAZrt4vjC
 GmpKznKoUX30Sgh4rVwnqr3H5gEQOrkGglpROzRxsBIKqPS2fmc1jTJn0160H5njbLB8
 Ldj6QbTKFrOzs/ck3BvCnF5WtRsVpSYCSVVyIMJfiHc4mS0UzXKDtF8iBhDnhho7MsUE
 VfSFTsLl38jQikStdiMbCAVix+/SSBE2pKFgA1C2w7O68nrztqThurLglDMpccupQ0Tw
 dy4fE1eh86iuOUq+iom8i7VXXi4gIMgVNlaJiGEQs5W1rrqKnYUN4yGTRErOYOMoN/Xo gA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet3bn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 03:46:18 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 22 Nov
 2022 03:46:16 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Tue, 22 Nov 2022 03:46:16 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE0C92AA;
 Tue, 22 Nov 2022 09:46:16 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:46:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 2/9] ASoC: max98373-sdw: Switch to new
 snd_sdw_params_to_config helper
Message-ID: <20221122094616.GV10437@ediswmail.ad.cirrus.com>
References: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
 <20221121134608.3713033-2-ckeepax@opensource.cirrus.com>
 <22df3cf2-ab22-59c9-106c-d06dc2a6060d@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <22df3cf2-ab22-59c9-106c-d06dc2a6060d@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 1BBVXw_sX86Ymeje_aM-hgB0OK3mqe9P
X-Proofpoint-GUID: 1BBVXw_sX86Ymeje_aM-hgB0OK3mqe9P
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org
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

On Mon, Nov 21, 2022 at 04:31:42PM +0000, Richard Fitzgerald wrote:
> On 21/11/2022 13:46, Charles Keepax wrote:
> >The conversation from hw_params to SoundWire config is pretty
> s/conversation/conversion
> 

lol oops thanks for that will resend to fix that up its the whole
series.

> >  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> >-		direction = SDW_DATA_DIR_RX;
> >  		port_config.num = 1;
> >+
> >+		if (max98373->slot) {
> >+			stream_config.ch_count = max98373->slot;
> >+			port_config.ch_mask = max98373->rx_mask;
> >+		}
> >  	} else {
> >-		direction = SDW_DATA_DIR_TX;
> >  		port_config.num = 3;
> >-	}
> >-	stream_config.frame_rate = params_rate(params);
> >-	stream_config.bps = snd_pcm_format_width(params_format(params));
> >-	stream_config.direction = direction;
> >-
> >-	if (max98373->slot && direction == SDW_DATA_DIR_RX) {
> >-		stream_config.ch_count = max98373->slot;
> >-		port_config.ch_mask = max98373->rx_mask;
> >-	} else {
> >  		/* only IV are supported by capture */
> >-		if (direction == SDW_DATA_DIR_TX)
> >-			stream_config.ch_count = 2;
> Has this special case gone missing or is it already guaranteed by the
> DAI config?
> 

This special case is still there, it is just below where you made
your next comment. All this case equates to is if direction is
TX/CAPTURE set the number of channels to 2.

> >-		else
> >-			stream_config.ch_count = params_channels(params);
> >-
> >+		stream_config.ch_count = 2;
> >  		port_config.ch_mask = GENMASK((int)stream_config.ch_count - 1, 0);
> this is already done by snd_sdw_params_to_config()

Not in this case because we just forced the channel count to 2,
so we probably need to regenerate the mask too.

Thanks,
Charles
