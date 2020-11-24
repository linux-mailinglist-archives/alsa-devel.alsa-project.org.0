Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E12C21E1
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 10:42:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B80EF1685;
	Tue, 24 Nov 2020 10:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B80EF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606210976;
	bh=ZyQhaeC1f3y590E9PLSJVZD9uosWJi51mVy5r0mmyWE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnA1AK5xVh/InQ3R0/I8GRP/J3P2ueETEbEG2+CVAj/3korvs5dL51fgrB4g8l8s9
	 wu126MMb61hwBgAcAHCh3/P55XxbyB0DYKHIiIAxA0BDqKu2kOPQwH3qvuiPqQliwd
	 NsAaVcAyygCgbSq5bLgw53cc24312bkhOS5zJxMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F889F8015A;
	Tue, 24 Nov 2020 10:41:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53429F80165; Tue, 24 Nov 2020 10:41:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92650F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 10:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92650F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UcPqNQTw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AO9V7rO007990; Tue, 24 Nov 2020 03:41:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=ew8YBX9M/HtMep1XlSldekdQRv2oEtl4nGiX+DInckY=;
 b=UcPqNQTwz12SqBY3avB5PH7GsRRekvtZjEN1M3CTvkmb3kdMc5qhn72oOi+6ypXbpXcZ
 aRn0oetUF7mD/wLOc7dVR6NXFNDeHaXBYkZ5jAMr18IPoC04piSN65D0LbdCZsFMTzmL
 QXpilyWlTbpPEcJfUX1azH1QXr6maTrnjRM2EqKRzpDNMWyrHRuY80+pfig/p0KxlN1k
 A6Ppzus40+6VFDxhFFg0RICyPEZ7HFyTwQgpkXVTDfj0x5utwD5SmCgq+wgs4/KrFON6
 BB/Y8I24S1l0UYKcId02agk2p+Wqe4qXpAAMXZ81HNqXS7hDDvr2m//MjEqUNSeI3XBL Jw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 34y06tmfq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 Nov 2020 03:41:09 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 24 Nov
 2020 09:41:07 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 24 Nov 2020 09:41:07 +0000
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 44BF92A1;
 Tue, 24 Nov 2020 09:41:07 +0000 (UTC)
Subject: Re: [PATCH] ASoC: wm_adsp: fix error return code in wm_adsp_load()
To: Luo Meng <luomeng12@huawei.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <ckeepax@opensource.cirrus.com>, <kuninori.morimoto.gx@renesas.com>,
 <Vlad.Karpovich@cirrus.com>, <ranjani.sridharan@linux.intel.com>,
 <Adam.Brickman@cirrus.com>, <james.schulman@cirrus.com>,
 <piotrs@opensource.cirrus.com>, <wenshi@opensource.cirrus.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
References: <20201123133839.4073787-1-luomeng12@huawei.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <32f1ee2a-6134-cf15-da58-0f1aad45ca29@opensource.cirrus.com>
Date: Tue, 24 Nov 2020 09:41:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201123133839.4073787-1-luomeng12@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 clxscore=1011 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240058
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

On 23/11/2020 13:38, Luo Meng wrote:
> Fix to return a negative error code from the error handling case
> instead of 0 in function wm_adsp_load(), as done elsewhere in this
> function.
> 
> Fixes: 170b1e123f38 ("ASoC: wm_adsp: Add support for new Halo core DSPs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Luo Meng <luomeng12@huawei.com>
> ---
>   sound/soc/codecs/wm_adsp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index bcf18bf15a02..e61d00486c65 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -1937,6 +1937,7 @@ static int wm_adsp_load(struct wm_adsp *dsp)
>   			mem = wm_adsp_find_region(dsp, type);
>   			if (!mem) {
>   				adsp_err(dsp, "No region of type: %x\n", type);
> +				ret = -EINVAL;
>   				goto out_fw;
>   			}
>   
> 

Acked-by: Richard Fitzgerald <rf@opensource.cirrus.com>
