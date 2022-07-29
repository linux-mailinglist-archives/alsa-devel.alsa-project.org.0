Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3778584FF3
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 14:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E532E15F2;
	Fri, 29 Jul 2022 14:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E532E15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659096302;
	bh=5ATU6p7EgKdtSbw4rTU57wnvMnFqgQgxspwLWuEq4vw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOsB1GRV53MaFK0pl4PZ5vV2sCm/7nkpNlAP8Lmirz7OB1g7w79NmWdlxDju01YaS
	 FMQSSAW60EyFucDO2KbmFCv3i7Z66z686zlm41+AqDCqQNga/hEt5cCvUZGrCntUjN
	 EL5dxEvzFbIeeMpIhnq0Jn/fUGMS7Djce7fp5Fx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 431AAF804B1;
	Fri, 29 Jul 2022 14:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3414CF8015B; Fri, 29 Jul 2022 14:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A41A6F8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 14:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A41A6F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="zkC3STGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659096234; x=1690632234;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XOAdHZkPV7ADdDAhCaojbFXiiCwa7LMrSGb8t7JH/qw=;
 b=zkC3STGahAdrM8whPu8dWxCSBFzpiUV8QfmxPBoU0zNRGKnEAgBy6odB
 aB5zZQBe7kwPMSN53W+IRTMgs8YsMNnlHBzWHBjq6ZTna1sht5oD54k5z
 jHIkv5F+ztbzqjPKV7kyPEVa1VNxnAEQfIcIt6xJ81B8kcI2VOO0I8OL4 0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 29 Jul 2022 05:03:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 05:03:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Jul 2022 05:03:47 -0700
Received: from [10.216.46.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Jul
 2022 05:03:42 -0700
Message-ID: <f350e75c-d1af-83ad-c7aa-8d29e2b74544@quicinc.com>
Date: Fri, 29 Jul 2022 17:33:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: qcom: SC7280: Add support for external DMIC bias
 supply
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Mark Brown
 <broonie@kernel.org>
References: <1659016789-9933-1-git-send-email-quic_srivasam@quicinc.com>
 <YuKbpXVOeGn2l2gd@sirena.org.uk>
 <a92891b1-1fd0-82fa-3dc4-34282e6c2ef3@quicinc.com>
 <278edf67-834b-b673-8d71-88213130d4c8@linaro.org>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <278edf67-834b-b673-8d71-88213130d4c8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


On 7/29/2022 2:09 PM, Srinivas Kandagatla wrote:
> Thanks for your time and valuable input Srini!!!
>
> On 28/07/2022 17:09, Srinivasa Rao Mandadapu wrote:
>>
>> On 7/28/2022 7:52 PM, Mark Brown wrote:
>> Thanks for your time Mark!!!
>>> On Thu, Jul 28, 2022 at 07:29:49PM +0530, Srinivasa Rao Mandadapu 
>>> wrote:
>>>> Update SC7280 machine driver for enabling external dmic bias supply,
>>>> which is required for villager evt boards.
>>>> +++ b/sound/soc/qcom/sc7280.c
>>>> @@ -356,6 +356,7 @@ static const struct snd_soc_ops sc7280_ops = {
>>>>   static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
>>>>       SND_SOC_DAPM_HP("Headphone Jack", NULL),
>>>>       SND_SOC_DAPM_MIC("Headset Mic", NULL),
>>>> +    SND_SOC_DAPM_REGULATOR_SUPPLY("DMICVDD", 0, 0),
>>>>   };
>>>>   static int sc7280_snd_platform_probe(struct platform_device *pdev)
>>> Don't you want to connect this to something?  This won't do anything
>>> as-is.  I can't see any references to DMICVDD which might be failing to
>>> resolve in the current sound/soc/qcom.
>>
>> The connection is being done to "VA DMIC"through audio routing in 
>> board specific dts file.
>>
>> Will post the changes once the main dts patches are landed.
>>
>> Ex:-
>>
>> &sound {
>>      DMICVDD-supply = <&pp1800_l2c>;
>>
>>      audio-routing =
>>              "IN1_HPHL", "HPHL_OUT",
>>              "IN2_HPHR", "HPHR_OUT",
>>              "AMIC1", "MIC BIAS1",
>>              "AMIC2", "MIC BIAS2",
>>              "VA DMIC0", "DMICVDD",
>>              "VA DMIC1", "DMICVDD",
>>              "VA DMIC2", "DMICVDD",
>>              "VA DMIC3", "DMICVDD",
>
> You should just use "vdd-micb" instead of DMICVDD.
> There is already a SUPPLY DAPM in lpass-va-macro codec.
>
> --srini
Yes it's available in va macro. Will test with vdd-micb DAPM. if that 
works,  I think we can drop this patch.
>>              .....
>>
>>              .....
>>
>> };
>>
>>
