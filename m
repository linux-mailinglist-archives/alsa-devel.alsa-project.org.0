Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107F4E9055
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 10:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6411706;
	Mon, 28 Mar 2022 10:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6411706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648456886;
	bh=Dtxy9Y3CFF3yRUuKbbvNkGPf0QMsyt2RPdAlkYifFZA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcZLs/RICHk/fosGN4UJpLvAQx0e0AGumr7bO1j5St5QPwVfYA37wLdDB5fR2IsR2
	 eaRaqaWB3ljxhaLTpnzCspWuvtRmTTtYNBXeQ9+SVXsolf+BRetp7nc8udHMTmL31c
	 MjSK6GAvI2uILgBOaX3fqculay5IxBXMcmgwgz6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6252EF8026A;
	Mon, 28 Mar 2022 10:40:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9319FF8024C; Mon, 28 Mar 2022 10:40:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63917F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 10:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63917F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NLYXKi4F"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8AHo3030601;
 Mon, 28 Mar 2022 03:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=3oFP1oYvXTugyH7f6Ik8a/Rkut54A9WqLGqk4PBDlUQ=;
 b=NLYXKi4FT4BKB1V9mXZ08KZleYP5Gp/nhbthO/Hwov0uBdOdoabNplC7R2Z6D/BVoYxg
 DtJ/2n2otsjosA41m2hywdvYnf4tXe6eS339Y4r7APcjSbytkw/rs8+qBmAEiCB2hCp0
 WHKv4AcT+4z/gZzWgcPA8cG84J2/JDDOUmLguxmxmFXaXIX004BZIjRswpDRnDc98dDF
 R/cEMtKHvD+A/0lRk+Q56sbIGnxEDnZ01QUw0E1vJoMIcJnIvFPKi0RtQj0DDYe1Lqpy
 Hwl/RPL9xgZ2uSVWaSlRIdLDJJNk/xQQbfsx0b+QL7+1HODQGq5sUFwmWwml/h7GOK6G /Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f2081ae94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 03:40:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 09:40:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 09:40:06 +0100
Received: from [198.61.64.146] (EDINB751011.ad.cirrus.com [198.61.64.146])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9AF3B16;
 Mon, 28 Mar 2022 08:40:05 +0000 (UTC)
Message-ID: <ecd0aa29-886a-a9f4-e6c4-dbbe2dce4372@opensource.cirrus.com>
Date: Mon, 28 Mar 2022 09:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: Add one more variable in the debug
 log
Content-Language: en-US
To: Hui Wang <hui.wang@canonical.com>, <alsa-devel@alsa-project.org>,
 <broonie@kernel.org>, <patches@opensource.cirrus.com>,
 <ckeepax@opensource.cirrus.com>
References: <20220328042210.37660-1-hui.wang@canonical.com>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220328042210.37660-1-hui.wang@canonical.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dej2TKMAOCFA54UDJFD8elIGC7MxOxM4
X-Proofpoint-GUID: dej2TKMAOCFA54UDJFD8elIGC7MxOxM4
X-Proofpoint-Spam-Reason: safe
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

On 3/28/22 05:22, Hui Wang wrote:
> otp_map[].size is a key variable to compute the value of otp_val and
> to update the bit_offset, it is helpful to debug if could put it in
> the debug log.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   sound/soc/codecs/cs35l41-lib.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
> index e5a56bcbb223..d0a480c40231 100644
> --- a/sound/soc/codecs/cs35l41-lib.c
> +++ b/sound/soc/codecs/cs35l41-lib.c
> @@ -822,8 +822,8 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
>   	word_offset = otp_map_match->word_offset;
>   
>   	for (i = 0; i < otp_map_match->num_elements; i++) {
> -		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
> -			bit_offset, word_offset, bit_sum % 32);
> +		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d otp_map[i].size = %d\n",
> +			bit_offset, word_offset, bit_sum % 32, otp_map[i].size);

otp_map[i].size is u8, please use %u to print it.
And add an "," between "bit_sum mod" and "otp_map[i].size" to keep 
consistency.

>   		if (bit_offset + otp_map[i].size - 1 >= 32) {
>   			otp_val = (otp_mem[word_offset] &
>   					GENMASK(31, bit_offset)) >> bit_offset;

