Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 151FB5843D0
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 18:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BC6815CC;
	Thu, 28 Jul 2022 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BC6815CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659024675;
	bh=aHSpnqsw9DiLrVk+Irz3a7YNwJzSVC5esnzpXk2gQjo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qo3OyXiyU7TqJj96Srg7V8mitTaXfTPwhv8n8i44JfLpIoOqshj8ADoMlqQQCXWZy
	 dEqGhAVbEUyuWVqbHMdCQVw+LOgYBOaa5nmq9wXLsW1oi6sBSSmmu4/4OV2k0BwuL1
	 gFL2pFkvzHdh/54T1Xil0u+TLTxLuB/ePyBZdbMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14061F80508;
	Thu, 28 Jul 2022 18:10:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 851CBF804EC; Thu, 28 Jul 2022 18:10:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BADB8F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 18:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BADB8F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="rGe5ogkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659024613; x=1690560613;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X9/vv1OubhiRjvTagiSFmkEub0PKOyPJQmKKSarsRW0=;
 b=rGe5ogkvqrDvKOUZz5xL7Q/SFt1C6kPh76LwIXQpeu/1ZRMwAHGICF/W
 NQd8TVX56Ox45Yne7xpTtz5MJ+NHBkcCh4e8gUKEXEGbtUFfRF1QNAnwr
 V5j11H50cLykKk+v+FX0sefZuF35LuF4knZjd9y6PJdiIbbQN8BhKxHiw g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Jul 2022 09:10:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 09:10:06 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Jul 2022 09:10:05 -0700
Received: from [10.216.19.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 28 Jul
 2022 09:09:58 -0700
Message-ID: <a92891b1-1fd0-82fa-3dc4-34282e6c2ef3@quicinc.com>
Date: Thu, 28 Jul 2022 21:39:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: qcom: SC7280: Add support for external DMIC bias
 supply
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <1659016789-9933-1-git-send-email-quic_srivasam@quicinc.com>
 <YuKbpXVOeGn2l2gd@sirena.org.uk>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YuKbpXVOeGn2l2gd@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, judyhsiao@chromium.org,
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


On 7/28/2022 7:52 PM, Mark Brown wrote:
Thanks for your time Mark!!!
> On Thu, Jul 28, 2022 at 07:29:49PM +0530, Srinivasa Rao Mandadapu wrote:
>> Update SC7280 machine driver for enabling external dmic bias supply,
>> which is required for villager evt boards.
>> +++ b/sound/soc/qcom/sc7280.c
>> @@ -356,6 +356,7 @@ static const struct snd_soc_ops sc7280_ops = {
>>   static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
>>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>>   	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +	SND_SOC_DAPM_REGULATOR_SUPPLY("DMICVDD", 0, 0),
>>   };
>>   
>>   static int sc7280_snd_platform_probe(struct platform_device *pdev)
> Don't you want to connect this to something?  This won't do anything
> as-is.  I can't see any references to DMICVDD which might be failing to
> resolve in the current sound/soc/qcom.

The connection is being done to "VA DMIC"through audio routing in board 
specific dts file.

Will post the changes once the main dts patches are landed.

Ex:-

&sound {
     DMICVDD-supply = <&pp1800_l2c>;

     audio-routing =
             "IN1_HPHL", "HPHL_OUT",
             "IN2_HPHR", "HPHR_OUT",
             "AMIC1", "MIC BIAS1",
             "AMIC2", "MIC BIAS2",
             "VA DMIC0", "DMICVDD",
             "VA DMIC1", "DMICVDD",
             "VA DMIC2", "DMICVDD",
             "VA DMIC3", "DMICVDD",
             .....

             .....

};


