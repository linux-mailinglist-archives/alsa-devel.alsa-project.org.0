Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2285B9AA1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635EF18C2;
	Thu, 15 Sep 2022 14:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635EF18C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663244500;
	bh=IDvW+qok6EOC1gqVl71A0qYv+r0a2m1Tp7WBNvzOYPc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fFlK+Wk0iYRVZ5x57aDCawmindu2VMkbRXZgBaWBs16oWXYWNf04jpwMMDe9yDEnN
	 pYQpJFs+BnqzrK9tQa4Ikdwy1hGPrF4MvHknTPojlINFWm4EelxMlMHTioh2aulpkx
	 Pr2Blhq0KW95enG/3qD7920oWXOtMDdXwc/Jdhr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E98BF8027D;
	Thu, 15 Sep 2022 14:20:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CBB8F800B5; Thu, 15 Sep 2022 14:20:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F84F800B5
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F84F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="V/9llfCj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F5erk7015415;
 Thu, 15 Sep 2022 07:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=CUUZCN8CbQjdSUIzRh++MknIDM7YeGQKIOTWG5m6Yk0=;
 b=V/9llfCjSPnhOow+ROHdKUa1UlshXzdMA3N+MpTbafilTn9IBHJymHgTFfKI6XruT3Bk
 Dx5Agbd0n/SH1Eu6Y52pa/pJC7FH647QXWtkUIOV+WZtfuHgK0ppxI8ug+tDFn34CJDj
 dqzUqa465i3h6CHoKjHVdgSRtJuFOm9txFrGdXo7AW7ngrMnfgiyFbs2orFB8Xq2hLXj
 s4NRnrlS2EmfFJ6+iTzpObSsm2LJp8DJs3Sw7gYJSUbPxVWqGNWEn3CpHZqU8Q7KTcxp
 L+evTk9rqOTw8hIWoKxTlHEUK1TG25zqm7ZKgSkedXCAVkVayYWgOI8BYNOZ7Q2lpADM 5Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jjxyr2ac4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 07:20:31 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Thu, 15 Sep
 2022 07:20:29 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Thu, 15 Sep 2022 07:20:29 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E0C66468;
 Thu, 15 Sep 2022 12:20:22 +0000 (UTC)
Message-ID: <2839a437-a57a-ffc4-da8e-dde9a9a9a5cc@opensource.cirrus.com>
Date: Thu, 15 Sep 2022 13:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 04/11] ASoC: cs42l42: Split probe() and remove() into
 stages
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>, James Schulman
 <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, "Lucas
 Tanure" <tanureal@opensource.cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>
References: <20220915094444.11434-1-povik+lin@cutebit.org>
 <20220915094444.11434-5-povik+lin@cutebit.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220915094444.11434-5-povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y3RD2Dp-yKLUCoYgbRs2U3VWByN4ed9F
X-Proofpoint-GUID: y3RD2Dp-yKLUCoYgbRs2U3VWByN4ed9F
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
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

On 15/09/2022 10:44, Martin Povišer wrote:
> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> To prepare for adding SoundWire the probe must be split into three
> parts:
> 
> 1) The bus-specific probe
> 2) Common bus-agnostic probe steps
> 3) Initialization of the peripheral registers
> 
> Step (3) must be separate because on SoundWire devices the probe must
> enable power supplies and release reset so that the peripheral can be
> enumerated by the bus, but it isn't possible to access registers until
> enumeration has completed.
> 
> The call to devm_snd_soc_register_component() must be done at stage (2)
> so that it can EPROBE_DEFER if necessary. In SoundWire systems stage (3)
> is not a probe event so a deferral at this stage would not result in
> re-probing dependencies.
> 
> A new init_done flag indicates that the chip has been identified and
> initialized. This is used to prevent cs42l42_remove(), cs42l42_suspend(),
> cs42l42_restore() and cs42l42_irq_thread() from attempting register
> accesses if the chip was not successfully initialized. Although this
> cannot happen on I2C, because the entire probe would fail, it is
> possible on SoundWire if probe succeeds but the cs42l42 is never
> enumerated.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
>   sound/soc/codecs/cs42l42.c | 127 +++++++++++++++++++++++++------------
>   sound/soc/codecs/cs42l42.h |   2 +
>   2 files changed, 87 insertions(+), 42 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index 11cb659f03e0..427b29db2252 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -1627,7 +1627,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
>   	int report = 0;
>   
>   	mutex_lock(&cs42l42->irq_lock);
> -	if (cs42l42->suspended) {
> +	if (cs42l42->suspended || !cs42l42->init_done) {
>   		mutex_unlock(&cs42l42->irq_lock);
>   		return IRQ_NONE;
>   	}

This doesn't apply to broonie/for-next. Needs rebasing onto commit:
ea75deef1a73 ("ASoC: cs42l42: Only report button state if there was a
button interrupt")
