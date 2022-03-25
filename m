Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB4F4E7929
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 17:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DE517A2;
	Fri, 25 Mar 2022 17:44:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DE517A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648226739;
	bh=Vu4WpI0yVTq/wgw8xIIQM2bHJJSekZAaTfxP3RBjlTI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSInuCqczLtpHPI4yeiV1bLYcsy1w+dm6gThjfKWxVLwbRiuGyXUBH31QXIQZjN80
	 ZV1edOq5UOkfo3m7tF032MjqZU30ygIE8Ta1UNU6RZd7Ky9qd/OKpWx3HhXvb5bgL8
	 SQggRHDNYZ6QCJpKXflGFu+z/cxmJDAs6VQ5ioio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED91EF801F7;
	Fri, 25 Mar 2022 17:44:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D1E2F80162; Fri, 25 Mar 2022 17:44:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E0A6F80115
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 17:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E0A6F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EIz9PPns"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22P7Lx62029586;
 Fri, 25 Mar 2022 11:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=Ms4/8mJzaf1nd7Y4IpX9mSwQ9zEMY/JyWRFKQqLgC+M=;
 b=EIz9PPnsymJ1JPgpDzjal5+LXFvwIxrTncUCsBqBKamThRuOSMwLBQqoMosla14b8/XE
 iMZUqAishTLtKjxKkwiG22iHA3x4tUk2mo71dmVY4zKxJo4PjBEaH1HKsFyNGd8+AV3z
 z+fvgYSA4fInFHk9yFz+9oZeYuUhZ/s1Wgqj9jADVFhvBcOAlR649YdOBb+J+Ok271og
 HO/ILC/iGblpfDqsecwmIBGIY3XBjK92X3pJ63YzdgVz9U/n3F5oENVSEXCutv60BMR2
 0bT3fhtZ+Obc72gtfcqWXYygijZh6H/OO9Njsk6MhQFk+p3m8VJS0uwaQ9mvMGscyfVD +w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ewck1hd2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 25 Mar 2022 11:44:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Mar
 2022 16:44:20 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 25 Mar 2022 16:44:20 +0000
Received: from [198.61.65.125] (unknown [198.61.65.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 640CDB10;
 Fri, 25 Mar 2022 16:44:19 +0000 (UTC)
Message-ID: <19eb314a-0f34-ab6d-8d6a-4f7c35933525@opensource.cirrus.com>
Date: Fri, 25 Mar 2022 16:44:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ASoC: cs35l41: Add one more variable in the debug log
Content-Language: en-US
To: Hui Wang <hui.wang@canonical.com>, <alsa-devel@alsa-project.org>,
 <broonie@kernel.org>, <patches@opensource.cirrus.com>,
 <ckeepax@opensource.cirrus.com>
References: <20220324081839.62009-1-hui.wang@canonical.com>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220324081839.62009-1-hui.wang@canonical.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sXqHQVu7rPs0-8hNri2079SnnMHXCKXi
X-Proofpoint-GUID: sXqHQVu7rPs0-8hNri2079SnnMHXCKXi
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

On 3/24/22 08:18, Hui Wang wrote:
> otp_map[].size is a key variable to compute the value of otp_val and
> to update the bit_offset, it is helpful to debug if could put it in
> the debug log.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
Reviewed-by: Lucas Tanure <tanureal@opensource.cirrus.com>
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
>   		if (bit_offset + otp_map[i].size - 1 >= 32) {
>   			otp_val = (otp_mem[word_offset] &
>   					GENMASK(31, bit_offset)) >> bit_offset;

