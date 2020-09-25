Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113A2783BB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 11:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3FBD184D;
	Fri, 25 Sep 2020 11:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3FBD184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601025313;
	bh=4gpvJ3XuNcvYz1r8KhBvkHAho2pnQGwQkyanMmkTCdc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLONo84puzWwDo0MLsnMLpB4KQTcmoqKgubEnV8AobsUEG64FFo5fzi9zOkzZRIoD
	 PkUZsiOSFBmi8vcDjguWR37kqRrz3TJ2bMnQhpJfPQe3pFEyJewiOReoXVQ3WcYtJr
	 6USv+jVcMsF+h5YOkcF7zWSJDUuGZQl92dbtjOb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4BFF801EC;
	Fri, 25 Sep 2020 11:13:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1F3BF801EB; Fri, 25 Sep 2020 11:13:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CDAEF800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 11:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDAEF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZADbOy3Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 08P9CxNk015637; Fri, 25 Sep 2020 04:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=VTW9Z6nATiVptXlBJyBdVT3cUrJAxe10jV7AlRQnnRI=;
 b=ZADbOy3Zf1lcfYzr11OnLyQmw6SuSaASuvyjQpxSHu3El/NyAyd7T65x3UlTxBicERkg
 IaKHK480QL43xet1M7IF/AfZpXW4bQNGeLYPhXr8kb3H0rfQ/VEsRZkZBARCpwewy3D2
 1OEaTP9oDHjJKYZlxj954TrCniLuJCBl6N6xpPOemgnCc5dcP4dEJFUqGfXTIQrXdonb
 UmP6TS1Gm13B/5M3B65KsovdL4Pp2PASWkvnawgqQlHaayer2u4S3tK83o+ix7hKaqNE
 hsWgfK4DSefmOPF2qVWc1efH5w/Fj0u4ADeY/bbYupELnn3YN7DHT+9lQ0Zgipi8lcTC pg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 33nfd285dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 25 Sep 2020 04:13:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 25 Sep
 2020 10:13:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 25 Sep 2020 10:13:14 +0100
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.158])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D10ED2A1;
 Fri, 25 Sep 2020 09:13:13 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] ASoC: cs47l15: Fix EPOUT->HPOUT1 Mono Mux routing
To: <broonie@kernel.org>
References: <20200925083410.3987-1-rf@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <70e57c4e-c4ec-e2f4-aeda-3b6b0afdd417@opensource.cirrus.com>
Date: Fri, 25 Sep 2020 10:13:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200925083410.3987-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=1
 mlxlogscore=999 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250064
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

Sorry. Left a stray "RFC" on the email title. I'm going to kick myself 
and then re-send.

On 25/09/2020 09:34, Richard Fitzgerald wrote:
> EPOUT is always mono so should have a permanent routing through the
> HPOUT1 Mono Mux.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs47l15.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
> index a591e7457d11..254f9d96e766 100644
> --- a/sound/soc/codecs/cs47l15.c
> +++ b/sound/soc/codecs/cs47l15.c
> @@ -1089,6 +1089,7 @@ static const struct snd_soc_dapm_route cs47l15_dapm_routes[] = {
>   	{ "HPOUT1 Demux", NULL, "OUT1R" },
>   
>   	{ "OUT1R", NULL, "HPOUT1 Mono Mux" },
> +	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
>   
>   	{ "HPOUTL", "HPOUT", "HPOUT1 Demux" },
>   	{ "HPOUTR", "HPOUT", "HPOUT1 Demux" },
> @@ -1268,7 +1269,6 @@ static irqreturn_t cs47l15_adsp2_irq(int irq, void *data)
>   
>   static const struct snd_soc_dapm_route cs47l15_mono_routes[] = {
>   	{ "HPOUT1 Mono Mux", "HPOUT", "OUT1L" },
> -	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
>   };
>   
>   static int cs47l15_component_probe(struct snd_soc_component *component)
