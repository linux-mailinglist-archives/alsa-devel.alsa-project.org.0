Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24D5A10FC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF22E11;
	Thu, 25 Aug 2022 14:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF22E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661431699;
	bh=Lk/DxQhfvCJxeyQel/6veoFAQ8WKsRdqHm+mqYKTGQk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lauZoK0GzwumqiXWNMAR8GyBUkbDXCxNQSh2r8RD/N2MwO5JLv2Go5m3v/l3y821O
	 nwMJQfDygc9gjASWkxY316hBvZz2Q2NFt3Ebf0GyuZ4jveHozDC+Vh7larv3OqfvC5
	 oKiw50FuK+rcPFKHRpryIhhzg05aLyzNKFEGOd3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C89FF8014B;
	Thu, 25 Aug 2022 14:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88559F80245; Thu, 25 Aug 2022 14:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A64AF80271
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 14:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A64AF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XXecB8T8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P6MivD004380;
 Thu, 25 Aug 2022 07:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=uKgQUlJmcmP4REZEU3yL7St1zJeaxt/MEKziZRAgg9A=;
 b=XXecB8T8xJR8GV3rjt3ByVt0HnaBh5h9sMrMRL0+YzT2IPLmlW7zK6HHW8O2DqIfe2Pv
 vDMfuygkv31JJpypSXkgEWIfBtyx1KXhcXZTn08y4c+Fkxdq9oAOSoL5oF4mZ/pAPrme
 gNCxxrX44ozByhlyNwBTqEB7QIOs7TEHQdlyZ2f8WnNfXLw1XeDrnZ59KD7F0XG7K5zu
 XrN9HU6yveks19W0DhiJnJShNhHfhPQIi5I5fA8jRvlNRNYRpl08RF6rK37acMtJFC7d
 y+NxGJCbACpfsVBq6USnhCmCsHdVpVgJe7BmyO+qLShgnz3counLVzjdRrCNFV6rvIsi mQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3j5a3ra0ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 07:47:17 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 25 Aug
 2022 07:47:15 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 25 Aug 2022 07:47:15 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C563145D;
 Thu, 25 Aug 2022 12:47:15 +0000 (UTC)
Date: Thu, 25 Aug 2022 12:47:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Silent parsing error on loading speaker
 protection fw
Message-ID: <20220825124715.GM92394@ediswmail.ad.cirrus.com>
References: <20220823133347.919706-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220823133347.919706-1-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: guwl9vZJAsBrCJ4edLUxyUeAgGWGsnDl
X-Proofpoint-ORIG-GUID: guwl9vZJAsBrCJ4edLUxyUeAgGWGsnDl
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vlad
 Karpovich <Vlad.Karpovich@cirrus.com>, linux-kernel@vger.kernel.org
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

On Tue, Aug 23, 2022 at 04:33:47PM +0300, Cristian Ciocaltea wrote:
> The tracing capabilities for the speaker protection fw enabled via
> commit c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker
> protection FW") are not be available on all platforms, such as the
> Valve's Steam Deck which is based on the Halo Core DSP.
> 
> As a consequence, whenever the firmware is loaded, a rather misleading
> 'Failed to parse legacy: -19' error message is written to the kernel
> ring buffer:
> 
> [  288.977412] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware version: 3
> [  288.978002] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: cs35l41-dsp1-spk-prot.wmfw: Fri 02 Apr 2021 21:03:50 W. Europe Daylight Time
> [  289.094065] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware: 400a4 vendor: 0x2 v0.33.0, 2 algorithms
> [  289.095073] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 0: ID cd v29.53.0 XM@94 YM@e
> [  289.095665] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 1: ID f20b v0.0.1 XM@170 YM@0
> [  289.096275] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Protection: C:\Users\ocanavan\Desktop\cirrusTune_july2021.bin
> [  291.172383] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Failed to parse legacy: -19
> 
> Update wm_adsp_buffer_init() to *not* report the ENODEV error when the
> firmware type is WM_ADSP_FW_SPK_PROT.
> 
> Fixes: c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker protection FW")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  sound/soc/codecs/wm_adsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index cfaa45ede916..7514fc03b468 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -1602,7 +1602,7 @@ static int wm_adsp_buffer_init(struct wm_adsp *dsp)
>  	if (list_empty(&dsp->buffer_list)) {
>  		/* Fall back to legacy support */
>  		ret = wm_adsp_buffer_parse_legacy(dsp);
> -		if (ret)
> +		if (ret && (dsp->fw != WM_ADSP_FW_SPK_PROT || ret != -ENODEV))
>  			adsp_warn(dsp, "Failed to parse legacy: %d\n", ret);

Fixing this for a single firmware probably doesn't really make
the most sense, if we are treating buffers as optional these days
I guess really the best solution would be to make this either an
info and slightly rephrase the message or make it a dbg message.

Thanks,
Charles
