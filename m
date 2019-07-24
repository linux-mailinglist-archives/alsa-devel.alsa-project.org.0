Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB672B89
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 11:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A2A19FD;
	Wed, 24 Jul 2019 11:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A2A19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563961049;
	bh=dP9OflyFMJZeBDrG+6OOsj9aoKOQ2KTbpRkq4wVAM4U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XnyksfJQJcuqpypoBGJ5rTK5oCoEXQqPh5eB6E1df2BoxDtAbkM482E5AZYJZkl9e
	 srYHZ4TkVXpmjmtzcpm33+gDbf8CaU6LKnhyKuqnn0mlJ44o/Oa3b3VGnRT4E8SZX6
	 whPXoJEL7zRaUVj6ic+vq/EqDX1dFc0EAcFgxHG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE413F803D6;
	Wed, 24 Jul 2019 11:35:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49B2BF803D1; Wed, 24 Jul 2019 11:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B1A1F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 11:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B1A1F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="m19EezwQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6O9YG17006379; Wed, 24 Jul 2019 04:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=QUGVxkFu/PJhfO8Pae7IUoj4Zrdj84YghAtZLMmAcgI=;
 b=m19EezwQSlHbQiGKW7axs68821fhtXl7SCNVQ6JKRQZde5qO9ihWZrTSZGVVkwhaLXWp
 z/TwCOj2pi+MZfPQJl/gHydz7cTJp1YVUqzWaDEdkj4O0RisfRkog4R2mZHKg41V38bU
 aaplUhN1fOoypVP+L2UjFW/qC7HBrZQIyvZ7AVO3HILGwGRQlkIp6YOz2yELFS31AKR8
 x3BTldA6+5QST9MIyVk/mq0Zp98/2O5l7XMCuwQ8I6aig0yq7YeMSadRRttIiOte5kP2
 XIOj1ln8C1lvXxoJuQNcMqPemi1rm/rWl558gJyGSIITsR7uaTGaOsaoujuA2Bo6X1Qr Kg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tx61s15ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Jul 2019 04:35:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 24 Jul
 2019 10:35:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 24 Jul 2019 10:35:35 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 033C545;
 Wed, 24 Jul 2019 10:35:35 +0100 (BST)
Date: Wed, 24 Jul 2019 10:35:35 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190724093535.GW54126@ediswmail.ad.cirrus.com>
References: <8736iwurtc.wl-kuninori.morimoto.gx@renesas.com>
 <875znstd4h.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875znstd4h.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1907240107
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 23/25] ASoC: soc-component: move
 snd_soc_component_seq_notifier()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jul 24, 2019 at 10:53:22AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch moves snd_soc_component_seq_notifier() to soc-component.c
> It will be used at soc-dapm.c :: dapm_seq_run(),
> but no effect by this patch.
> 
> 	static void dapm_seq_run(...)
> 	{
> 		...
> =>		if (cur_dapm && cur_dapm->seq_notifier) {
> 			for (i = 0; i < ARRAY_SIZE(dapm_up_seq); i++)
> 				if (sort[i] == cur_sort)
> =>					cur_dapm->seq_notifier(cur_dapm,
> 							       i,
> 							       cur_subseq);
> 		}
> 		...
> 	}
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> +void snd_soc_component_seq_notifier(struct snd_soc_dapm_context *dapm,
> +				    enum snd_soc_dapm_type type, int subseq)
> +{
> +	struct snd_soc_component *component = dapm->component;
> +
> +	if (component->driver->seq_notifier)
> +		component->driver->seq_notifier(component, type, subseq);
> +}
> +
>  int snd_soc_component_enable_pin(struct snd_soc_component *component,
>  				 const char *pin)
>  {
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 573192d..84ded01 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
>  static int snd_soc_component_stream_event(struct snd_soc_dapm_context *dapm,
>  	int event)
>  {
> @@ -2736,8 +2728,7 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
>  	dapm->bias_level = SND_SOC_BIAS_OFF;
>  	dapm->idle_bias_off = !driver->idle_bias_on;
>  	dapm->suspend_bias_off = driver->suspend_bias_off;
> -	if (driver->seq_notifier)
> -		dapm->seq_notifier = snd_soc_component_seq_notifier;
> +	dapm->seq_notifier = snd_soc_component_seq_notifier;

If we are updating this to always set a seq_notifier would it be
worth removing the NULL checks in soc-dapm.c? At the moment I
guess it will end up checking twice, DAPM checks if dapm->seq_notifier
is NULL but it never will be, then the helper checks if
driver->seq_notifier is NULL.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
