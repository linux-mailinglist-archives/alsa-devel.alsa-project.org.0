Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0305838FD93
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 11:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D72AF171A;
	Tue, 25 May 2021 11:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D72AF171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621934131;
	bh=lL9eXp4vEha513nDRmeE4MJ1uaEYl1egcgiNPHZ6DFo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qIFJAI/dwYmsHnI53lKRcIeyvOFntzWKBy7iEfwkHiOY+ErvgS6s7YD0feTc0CP6E
	 EgOn/vP4+E7MATSBgOOyB2Ay6E0nAMUSoghQwrM8IKKjiXFxFk+9bYuz/mVCdShsAW
	 ub3iXaOek4Vb5WtecKa+yDfmnBJy6rmhgTSU95uM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 285D0F8026B;
	Tue, 25 May 2021 11:14:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D6C2F80274; Tue, 25 May 2021 11:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2BD5F801EB
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 11:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2BD5F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QjOkjaDu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14P9DIRP018137; Tue, 25 May 2021 04:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=zCNZJw/UWHdG8Fj+nxSNa6SNKzt7nYh5//+2DTbASI4=;
 b=QjOkjaDus9Ai6+D9kKa69w7KK64WY/mrroZz7qYdTCuYRp+WxrsOdDV7tx6HBSPrtfi9
 RR8ITbS1BxC6EGzX1t7kbf1Zrq2r7AMKg6JuLsCAWqWPvEE/gXrcE5vbhp4SACbYvZjp
 9QYJTcnheplKpCqu/ChfsoVo1OJXlJyQPtnmZAFFUINeKp9j4uIOh5/QzdExfrPJ4xPr
 hG2xFORUcFB19GrjDVAtIT9zJjNqbeeNoT2ZY9zqj8cmS46+ubd8O50ug8jZ4d8BEoVf
 LHOcfAWik2ql2enoUSGQYkxF58tNFC0aIQFoTe4RxqBmnCUxoBvQnAxDqCsuHutAuQ8b UQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38r28v1kqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 May 2021 04:14:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 25 May
 2021 10:14:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 25 May 2021 10:14:34 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4FAD511CD;
 Tue, 25 May 2021 09:14:33 +0000 (UTC)
Subject: Re: [PATCH 4/4] ASoC: cs42l42: Check jack status before reporting
 button events
To: Lucas Tanure <tanureal@opensource.cirrus.com>, James Schulman
 <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210525090822.64577-1-tanureal@opensource.cirrus.com>
 <20210525090822.64577-4-tanureal@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <1c4a4537-f47f-8916-6138-10665ffd3d6a@opensource.cirrus.com>
Date: Tue, 25 May 2021 10:14:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210525090822.64577-4-tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2EtFHMMtJjBZzPkqtiR-vlgTZeyezFUb
X-Proofpoint-GUID: 2EtFHMMtJjBZzPkqtiR-vlgTZeyezFUb
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250062
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 25/05/2021 10:08, Lucas Tanure wrote:
> Jack must be connected before reporting button events and
> if the jack is disconnected button release must be reported
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs42l42.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index 8260de81b56c..eff013f295be 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -1478,6 +1478,10 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
>   				default:
>   					break;
>   				}
> +				snd_soc_jack_report(cs42l42->jack, 0,
> +						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
> +
>   				dev_dbg(component->dev, "Unplug event\n");
>   			}
>   			break;
> @@ -1489,7 +1493,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
>   	}
>   
>   	/* Check button detect status */
> -	if ((~masks[7]) & irq_params_table[7].mask) {
> +	if (cs42l42->plug_state == CS42L42_TS_PLUG && ((~masks[7]) & irq_params_table[7].mask)) {
>   		if (!(current_button_status &
>   			CS42L42_M_HSBIAS_HIZ_MASK)) {
>   
> 

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
