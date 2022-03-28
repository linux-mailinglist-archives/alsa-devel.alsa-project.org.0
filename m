Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 839474E909F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 10:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07CD21732;
	Mon, 28 Mar 2022 10:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07CD21732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648457843;
	bh=uAhOfQ6M+hG0hdbnUgIVpbXWK3CHGAQPRr3sSBpFn/g=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nbCRr3si7TLkqIQO8k3ihgLoZ7+P6AedVhY3HAvJ7rLlLQ0SgagrvFRLN9LaQWU5+
	 lGZTXHkJcWoz+PJ5FmSjNiK9XkNLw87Uyh+96WPtdrbZh0zuHLByCJvWkM+va5lInj
	 4uhfatXAWnv0EEHXBqyZPp3oJ9xQYr99iIuNK3Wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D362F8026A;
	Mon, 28 Mar 2022 10:56:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18166F8024C; Mon, 28 Mar 2022 10:56:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F006FF800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 10:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F006FF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZjQgqRAn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8AHoZ030601;
 Mon, 28 Mar 2022 03:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=PNJshl1a9Xjzrf7Egu3dTISGJzl4Q0ChRdPkYTDWM2I=;
 b=ZjQgqRAn4MDo+iyZHk5q0va1NVNzRC82SYt3Sy4Vbb0ietHATH3MM3+EPMq6RhTrE3Rq
 eJ0q2qBSVXoZvlJghKdnXRi/RuZzd+3t5G5/AH8k8MLq9J7f9Eya1tZxvRFIqEZ/BSU+
 Hf0/G3gjTsiTZSA5wqvczDZCA3CNlLxMMcY3Y7bpUmi4f0hqHHJt2IMwzU1wx6WeUYwo
 ca4PGi+2HQy42EZ6sssbF3YTvekfhg6sko3RWqyvyV36DQYzumROf7Qv3Uss+mTMnF9A
 qoez0qZXlDdWmz+Uo4KeUGx5JomUyCNqlmYkCNrxwgKZgoy5WD2iVAHihMJuJ29AMlRG sw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f2081aeq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 03:56:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 09:56:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 09:56:04 +0100
Received: from [198.61.64.146] (EDINB751011.ad.cirrus.com [198.61.64.146])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8301A46A;
 Mon, 28 Mar 2022 08:56:03 +0000 (UTC)
Message-ID: <263781d6-00d5-dd7a-d7a1-dc102448811d@opensource.cirrus.com>
Date: Mon, 28 Mar 2022 09:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] ASoC: cs35l41: Don't hard-code the number of
 otp_elem in the array
Content-Language: en-US
To: Hui Wang <hui.wang@canonical.com>, <alsa-devel@alsa-project.org>,
 <broonie@kernel.org>, <patches@opensource.cirrus.com>,
 <ckeepax@opensource.cirrus.com>
References: <20220328042210.37660-1-hui.wang@canonical.com>
 <20220328042210.37660-2-hui.wang@canonical.com>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220328042210.37660-2-hui.wang@canonical.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DLs6mwc1xKCa6vXu1oFO6HokTwp7hZ50
X-Proofpoint-GUID: DLs6mwc1xKCa6vXu1oFO6HokTwp7hZ50
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
> The CS35L41_NUM_OTP_ELEM is 100, but only 99 entries are defined in
> the array otp_map_1/2[CS35L41_NUM_OTP_ELEM], this will trigger UBSAN
> to report a shift-out-of-bounds warning in the cs35l41_otp_unpack()
> since the last entry in the array will resuilt in GENMASK(-1, 0).
result
> 
> To fix it, removing the definition CS35L41_NUM_OTP_ELEM and use
> ARRAY_SIZE to calculate the number of elements dynamically.
This a plain out-of-bounds access issue, you could just say that.
And at the end, you could say that UBSAN reported the issue.

Also the title should start with Fix, like:
"Fix out-of-bounds access in cs35l41_otp_packed_element_t"

> 
Fixes: 6450ef559056 ("ASoC: cs35l41: CS35L41 Boosted Smart Amplifier")
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

You are missing the Fixes tag.


> ---
>   include/sound/cs35l41.h        |  1 -
>   sound/soc/codecs/cs35l41-lib.c | 14 +++++++-------
>   2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
> index bf7f9a9aeba0..9341130257ea 100644
> --- a/include/sound/cs35l41.h
> +++ b/include/sound/cs35l41.h
> @@ -536,7 +536,6 @@
>   
>   #define CS35L41_MAX_CACHE_REG		36
>   #define CS35L41_OTP_SIZE_WORDS		32
> -#define CS35L41_NUM_OTP_ELEM		100
>   
>   #define CS35L41_VALID_PDATA		0x80000000
>   #define CS35L41_NUM_SUPPLIES            2
> diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
> index d0a480c40231..30c720af98d0 100644
> --- a/sound/soc/codecs/cs35l41-lib.c
> +++ b/sound/soc/codecs/cs35l41-lib.c
> @@ -422,7 +422,7 @@ static bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
>   	}
>   }
>   
> -static const struct cs35l41_otp_packed_element_t otp_map_1[CS35L41_NUM_OTP_ELEM] = {
> +static const struct cs35l41_otp_packed_element_t otp_map_1[] = {
>   	/* addr         shift   size */
>   	{ 0x00002030,	0,	4 }, /*TRIM_OSC_FREQ_TRIM*/
>   	{ 0x00002030,	7,	1 }, /*TRIM_OSC_TRIM_DONE*/
> @@ -525,7 +525,7 @@ static const struct cs35l41_otp_packed_element_t otp_map_1[CS35L41_NUM_OTP_ELEM]
>   	{ 0x00017044,	0,	24 }, /*LOT_NUMBER*/
>   };
>   
> -static const struct cs35l41_otp_packed_element_t otp_map_2[CS35L41_NUM_OTP_ELEM] = {
> +static const struct cs35l41_otp_packed_element_t otp_map_2[] = {
>   	/* addr         shift   size */
>   	{ 0x00002030,	0,	4 }, /*TRIM_OSC_FREQ_TRIM*/
>   	{ 0x00002030,	7,	1 }, /*TRIM_OSC_TRIM_DONE*/
> @@ -671,35 +671,35 @@ static const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[] = {
>   	{
>   		.id = 0x01,
>   		.map = otp_map_1,
> -		.num_elements = CS35L41_NUM_OTP_ELEM,
> +		.num_elements = ARRAY_SIZE(otp_map_1),
>   		.bit_offset = 16,
>   		.word_offset = 2,
>   	},
>   	{
>   		.id = 0x02,
>   		.map = otp_map_2,
> -		.num_elements = CS35L41_NUM_OTP_ELEM,
> +		.num_elements = ARRAY_SIZE(otp_map_2),
>   		.bit_offset = 16,
>   		.word_offset = 2,
>   	},
>   	{
>   		.id = 0x03,
>   		.map = otp_map_2,
> -		.num_elements = CS35L41_NUM_OTP_ELEM,
> +		.num_elements = ARRAY_SIZE(otp_map_2),
>   		.bit_offset = 16,
>   		.word_offset = 2,
>   	},
>   	{
>   		.id = 0x06,
>   		.map = otp_map_2,
> -		.num_elements = CS35L41_NUM_OTP_ELEM,
> +		.num_elements = ARRAY_SIZE(otp_map_2),
>   		.bit_offset = 16,
>   		.word_offset = 2,
>   	},
>   	{
>   		.id = 0x08,
>   		.map = otp_map_1,
> -		.num_elements = CS35L41_NUM_OTP_ELEM,
> +		.num_elements = ARRAY_SIZE(otp_map_1),
>   		.bit_offset = 16,
>   		.word_offset = 2,
>   	},

