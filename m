Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493714BCA56
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 19:58:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83E516B9;
	Sat, 19 Feb 2022 19:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83E516B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645297086;
	bh=+8SOjm7LWtOqw+f3KeDcIojQ1tl2JKaYHuGgRWgideo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VOu2tY2un5Mg4L/d8BLAF3OcOO+A6267JrKu6y+IAi5rxsaLoGWDCzNjIhztjX8An
	 PMOR1/bQZAjjtRiB7sIKPyQ/MHzqfmpZIItEIwJX5rqiIkyPBOhj5mXXOnnejwQ00v
	 fhOCcpfFn2W+gXTR308SjsnrQr6ByUI/4+DTeXS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49DF5F8016B;
	Sat, 19 Feb 2022 19:57:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99CD7F800EB; Sat, 19 Feb 2022 19:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDEA4F800EB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 19:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDEA4F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="DD9O0jAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645297017; x=1676833017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OEri4uDqfVq3Sq55bw1JpjblsjiHhv7blHvy92mJyQM=;
 b=DD9O0jAOfo8T2jUnw3VgwxkUcFQTGWC994X7Cy8VA/oaXpzF106DDg2j
 qNORkUp+Uut5DXJcuMZzRmRA5VYzR3ktDQpPBB2/Uo7mH/loeoonaNI7g
 aQwHuuzONIGY35UKbyITfmd9nY2rUxqk9KGC36T+U/vdZRuFau/3emtEL o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Feb 2022 10:56:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 10:56:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 19 Feb 2022 10:56:52 -0800
Received: from [10.216.20.52] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sat, 19 Feb
 2022 10:56:45 -0800
Message-ID: <e279b9ec-92af-1b86-9ea0-09c9c36e1404@quicinc.com>
Date: Sun, 20 Feb 2022 00:26:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RESEND v13 08/10] ASoC: qcom: Add lpass CPU driver for codec dma
 control
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@codeaurora.org>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <perex@perex.cz>, <quic_plai@quicinc.com>,
 <robh+dt@kernel.org>, <rohitkr@codeaurora.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
 <1644850708-11099-9-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n52jD_BvQm4CeTkiR723-3uKC9G4fFeynFbs5Ukg_S762g@mail.gmail.com>
 <d70291a6-7e3f-0406-2826-3a30f2d5650b@quicinc.com>
 <CAE-0n51zr2qZ4qSzsC4=3d_jCYGvSxh8_3znrEQFaNrGfRU2Gw@mail.gmail.com>
From: "Srinivasa Rao Mandadapu (Temp)" <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n51zr2qZ4qSzsC4=3d_jCYGvSxh8_3znrEQFaNrGfRU2Gw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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


On 2/18/2022 1:23 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-02-16 01:42:42)
>> On 2/15/2022 7:03 AM, Stephen Boyd wrote:
>> Thanks for your time Stephen!!!
>>> Quoting Srinivasa Rao Mandadapu (2022-02-14 06:58:26)
>>>> +       struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
>>>> +       struct lpaif_dmactl *dmactl;
>>>> +       int ret = 0, id;
>>>> +
>>>> +       switch (cmd) {
>>>> +       case SNDRV_PCM_TRIGGER_START:
>>>> +       case SNDRV_PCM_TRIGGER_RESUME:
>>>> +       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>>> +               __lpass_platform_codec_intf_init(dai, substream);
>>>> +               break;
>>>> +       case SNDRV_PCM_TRIGGER_STOP:
>>>> +       case SNDRV_PCM_TRIGGER_SUSPEND:
>>>> +       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>>> +               __lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
>>>> +               if (!dmactl) {
>>>> +                       dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
>>> This same message is in many places. I really hope it never gets printed
>>> because finding out which line it got printed at is going to be
>>> impossible.
>> Okay. Will add function name in each print.
> Are they useful prints at all? They seem like development prints that
> won't trigger after the driver is developed. Why can't we just remove
> them?
Okay. Will remove prints.
