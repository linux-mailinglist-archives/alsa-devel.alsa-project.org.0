Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CA3504ECF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 12:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82B08167F;
	Mon, 18 Apr 2022 12:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82B08167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650277435;
	bh=yoVudKljwdK/PGMzPgjOQdLKdgcWdHj+ek76FWJ9tis=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXxyGViicNRkcViIFENKRaZjoXoHqwM4Jm3I/U0bnd+vMpAkWbp7jS45v/1U0ZlIp
	 /Dct3qA8wSjER9wm4vXhTOX2/2/3s+sjcggU9aRf3745xcUCW9k9mvf8YI1pKkiZVY
	 ZGZFgVAlq/33Yo7tyQAiQc22xcUFlbJP7/rg9dWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C51F800F5;
	Mon, 18 Apr 2022 12:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0824F8014E; Mon, 18 Apr 2022 12:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C197F800F5
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 12:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C197F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="HnoKMVQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650277371; x=1681813371;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rB+m8JZE7AYNY8EyI4x/rhw3euV04Ab2K5l6+kXn58I=;
 b=HnoKMVQSstChwkCHErkeRl7pAgTx6L5JAg70bapTOq8pLN7GIB7gWzbg
 ah68QxC3iFTgpDeCYDXTUUlwQMLyfZJGE4spxsQrgRN/5ad8KNmN2saPm
 LEKXUB9yqGF6mN6EG6osvabxjYF4KtG/Lt33HQLuaC0MYOYCXg70eRG53 I=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Apr 2022 03:22:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 03:22:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Apr 2022 03:22:45 -0700
Received: from [10.216.27.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 18 Apr
 2022 03:22:39 -0700
Message-ID: <24d7180f-dd97-3329-93ad-700bf2dcf0fc@quicinc.com>
Date: Mon, 18 Apr 2022 15:52:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v12 6/7] pinctrl: qcom: Add SC7280 lpass pin configuration
Content-Language: en-US
To: Matthias Kaehlcke <mka@chromium.org>
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
 <1647447426-23425-7-git-send-email-quic_srivasam@quicinc.com>
 <YloAMeEdb2kGvDSY@google.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <YloAMeEdb2kGvDSY@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 quic_rohkumar@quicinc.com, quic_plai@quicinc.com, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
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


On 4/16/2022 5:00 AM, Matthias Kaehlcke wrote:
Thanks for your time Matthias!!!
> On Wed, Mar 16, 2022 at 09:47:05PM +0530, Srinivasa Rao Mandadapu wrote:
>> Add pin control support for SC7280 LPASS LPI.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> ...
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> new file mode 100644
>> index 0000000..d67ff25
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>>
>> ...
>> +/* sc7280 variant specific data */
> nit: the comment is a bit redundant in a sc7280 specific driver
Okay. will remove it.
>
>> +static const struct pinctrl_pin_desc sc7280_lpi_pins[] = {
>> +	PINCTRL_PIN(0, "gpio0"),
>> +	PINCTRL_PIN(1, "gpio1"),
>> +	PINCTRL_PIN(2, "gpio2"),
>> +	PINCTRL_PIN(3, "gpio3"),
>> +	PINCTRL_PIN(4, "gpio4"),
>> +	PINCTRL_PIN(5, "gpio5"),
>> +	PINCTRL_PIN(6, "gpio6"),
>> +	PINCTRL_PIN(7, "gpio7"),
>> +	PINCTRL_PIN(8, "gpio8"),
>> +	PINCTRL_PIN(9, "gpio9"),
>> +	PINCTRL_PIN(10, "gpio10"),
>> +	PINCTRL_PIN(11, "gpio11"),
>> +	PINCTRL_PIN(12, "gpio12"),
>> +	PINCTRL_PIN(13, "gpio13"),
>> +	PINCTRL_PIN(14, "gpio14"),
>> +};
>> +
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
