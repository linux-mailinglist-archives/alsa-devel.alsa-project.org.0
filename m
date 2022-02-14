Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D6D4B58A5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 18:36:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD85193F;
	Mon, 14 Feb 2022 18:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD85193F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644860184;
	bh=d1rvKuRRHsBOJZY+pXCwAky74eIaMb44tBhgcEMVP/w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dxDkr/s/aLGDsGVAdWK9HoUFc0dL7qCBHjCyHXoI524mKVGyDEYBoNkWFKFO6CZ1y
	 PIZ1NEMNAnfOaRubXOb8xp5u46bXZYSbzWyBD6npDfZlvtm9cZlc6501dlzrXWqSPj
	 kFu3Txhu4p8rU0vWEdw/WrQBjFJXX/4p7htAMF+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F28CEF8012F;
	Mon, 14 Feb 2022 18:35:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2781F80310; Mon, 14 Feb 2022 18:35:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5AC2F8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 18:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5AC2F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="wDBH5Pdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644860113; x=1676396113;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5XlD8vp21eTKSkpNbt94DxzMkq8qEZEWW+TU+APGf4I=;
 b=wDBH5Pdkt+BH1rmoOb1isEZchY1TwHe1Q7cX4E14UgTPZNeGiADYjKcO
 n8DKvpFobbfHtdX05m/sNNkcub8704xhlk4P8kLdE7wuomK+uYJZNvBdo
 5wssUV56LXAemEVQJPrmH98080/t9GDaRXiniLfX16GuAiMfDvYjSTgVT A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Feb 2022 09:35:09 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 09:35:08 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 09:35:08 -0800
Received: from [10.216.62.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 09:35:02 -0800
Subject: Re: [PATCH v13 07/10] ASoC: qcom: Add support for codec dma driver
To: Mark Brown <broonie@kernel.org>
References: <1644832778-16064-1-git-send-email-quic_srivasam@quicinc.com>
 <1644832778-16064-2-git-send-email-quic_srivasam@quicinc.com>
 <YgppMcVjs0KuE5y8@sirena.org.uk>
 <669f2d39-8c14-68b9-6d89-a26e0e2e8857@quicinc.com>
 <YgqBmvAQvh9WRMj+@sirena.org.uk>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
Message-ID: <3a13a99d-6b8b-bab5-3adc-fdd2565fc93a@quicinc.com>
Date: Mon, 14 Feb 2022 23:04:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YgqBmvAQvh9WRMj+@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
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


On 2/14/2022 9:51 PM, Mark Brown wrote:
Thanks Brown for your time!!!
> On Mon, Feb 14, 2022 at 08:10:20PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 2/14/2022 8:07 PM, Mark Brown wrote:
>>> I only have this patch from both v12 and v13, which were sent very close
>>> together.  Please check what's going on here.
>> As only one patch has update, so sent only one patch. will do resend all
>> patches if needed.
> You should always send all patches in a series, sending only some
> patches at best makes it very difficult to follow what the current
> version of the series is intended to look like.
Okay. Sorry for inconvenience. Resent all patches again.
