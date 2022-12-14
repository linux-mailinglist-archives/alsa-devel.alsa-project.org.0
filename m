Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4D564C9C7
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:10:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07712320;
	Wed, 14 Dec 2022 14:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07712320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671023418;
	bh=ep6Lu2SUs/mDKbDhFufDEeedC1/5elbwLNdzrjhj7qo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NNk6y+6lAkwaODZ4t2u7XFCw0s1gLyCoXOFrgAculkF55xTiTwjPkpFnLWd3Wcai7
	 LwTDu8Qoaz3jdk9Q8BU5m15YQ7V+DaMagObR/sE6JhHr4E0apywZzyAUZ0fDqXpC3I
	 dMZ3vyMz8LydtworUWgRcPpJKijTU2V2FljoFvso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 456F9F80141;
	Wed, 14 Dec 2022 14:09:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9A0F804D0; Wed, 14 Dec 2022 14:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34CE3F80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CE3F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VkfOpCFd
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEAosGN030155; Wed, 14 Dec 2022 07:09:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=UyzhN43ccI1JWqdgjhhFSuz2hJR6kaTdH3csHQRjZNU=;
 b=VkfOpCFdzjvKij6H3afTftDJEW+hPOLjxbrehvbAcYv2vDUgwz57XSlKcWjzAxwFDjMD
 tDhza+UblELd9qwAHvHkm1+f6rpegq7YWglN9MjQsuUB3JdBjf5Mp21Z3W5nIATiF2ub
 YNoKps06aK8d0UfjG0CIEPlguLjenbYfP8XMtb/zfKcaI9hZSYrWwxFZfyICd5pwYNVM
 dR/R+zz9u31ovyqwR2Af7NkOqtWyGo4dbmYAWxfu2IxTGeZXA+NlOWl4mKy+3vhbouki
 GNk8ty8JJwZlQ5Ae47JcMcfAo2c1vieO/mQvDRWR6ZWRT9xOZvCRZZQuzGO2hPVNJR2o Cg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3mf6rh8dge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 07:09:14 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 14 Dec
 2022 07:09:13 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 14 Dec 2022 07:09:13 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F29E011CB;
 Wed, 14 Dec 2022 13:09:12 +0000 (UTC)
Date: Wed, 14 Dec 2022 13:09:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 3/4] ASoC: wm8940: Mute also the speaker output
Message-ID: <20221214130912.GN105268@ediswmail.ad.cirrus.com>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221214123743.3713843-4-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221214123743.3713843-4-lukma@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: fS8F40HtUhvDkvdpvoBXyFUigz4aIK20
X-Proofpoint-GUID: fS8F40HtUhvDkvdpvoBXyFUigz4aIK20
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 14, 2022 at 01:37:42PM +0100, Lukasz Majewski wrote:
> Without this change the BTL speaker produces some
> "distortion" noise when test program
> (speaker-test -t waw) is ended with ctrl+c.
> 
> As our design uses speaker outputs to drive BTL speaker,
> it was necessary to also mute the speaker via the codec
> internal WM8940_SPKVOL register with setting
> WM8940_SPKMUTE bit.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> +	spkvol_reg &= ~WM8940_SPKMUTE;
> +	if (mute) {
>  		mute_reg |= 0x40;
> +		spkvol_reg |= WM8940_SPKMUTE;
> +	}
> +
> +	ret = snd_soc_component_write(component, WM8940_SPKVOL, spkvol_reg);
> +	if (ret)
> +		return ret;

This bit is also controlled by the "Speaker Playback Switch" so
you probably need some locking between them to stop them
clobbering each other.

Thanks,
Charles
