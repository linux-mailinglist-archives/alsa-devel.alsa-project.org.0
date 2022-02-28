Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7264C6C81
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 13:30:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AA171703;
	Mon, 28 Feb 2022 13:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AA171703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646051436;
	bh=CCrphYqm8rwZ0SdHfXwgGj7KQnGHZDzsrt3xKi7HejA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wsv2oYDyrnEmbUpaZniUyj5nzYQuOyJNZ7MjrWIwnYcIJvvbpC5YwKfDyzwwFbvx8
	 cBnhSKj0f99o9mEGTAclc7o5yg4ilBONT3ZVwfOfd9aj7Pii2ngdDXTEJrp4WukHNz
	 c+uM9V52trXuiYEqUjSJYqqxYoxnPT3f5m52zrmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F17F80154;
	Mon, 28 Feb 2022 13:29:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50695F8013C; Mon, 28 Feb 2022 13:29:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA74F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA74F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nubbkVKJ"
Received: by mail-wm1-x32f.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so5673220wmj.0
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 04:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3m/8LVMO7LTCpBsXxemwAuPVvDYz1WN+cMlM6yA9kxY=;
 b=nubbkVKJOt6pPpUFPAXzvawuT0KMOTnmR/ArsjURuO5qHhCCN17RPcNWJ9+0SYtMJw
 c9PXpxXGgga/tAjg8fk12Gbzl0bzlQ+fi7K0CjgdXaFA/zBw0WfMWVPm/PRkZujbv5nr
 C29aQhoZyJaYWagAAnOzdIug7+MVcueFunAXbZmzZNg5GUE8ieTK7Xp6jg6wjLlnu4Cb
 T8+rbvrIBMyLwYiuFgYIdyZQB7+hrafJxwlTVDiK6moHXER+mNHvnPgEvNibeGXCV7eP
 65s5Q5yKrDtTHlgysiZFSoCG70FE+hfiC0RGjlzheILdAG0O6sGJJGeXBWTx68QvHJ0E
 zz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3m/8LVMO7LTCpBsXxemwAuPVvDYz1WN+cMlM6yA9kxY=;
 b=wzv/frwnQc9OzD0AzwudXP2LkWwplYtF6cbmilBi0OBqbDh4oesX7zz3kblIpuhwfE
 DiK+f3XaO57KSSrMDJw8FXKNQwnOd8HfQA/MAWZIR/TudBXBNw1WIDfbTlN86E0Ui3cA
 d7TMvlubivC4pRB9ZkC4h/2dLIC7wMuLT+0bKu8v35h5Ux7rEoHe6M8MbDMWXZ1S1Idb
 IVxByvsOsnvdyErUl2KOf8oqhy02LNhwCPmUmbA2Lkv2PgvUU1Em89xapjmkGa0nnHlB
 txienLxrKtdZggJzmqUi4lBGPmGPcoy5Wo8/FWs8ruEXcahuEdjdeGexrV34bUCqb8DH
 zcQg==
X-Gm-Message-State: AOAM531+UMHsX7Rbs8ewuRlXYavg7TWQzVZ2/2/2/CcQkpva8kdbrpQm
 26OqsEFxmC+BwCTk0jCF1pq8qA==
X-Google-Smtp-Source: ABdhPJz8AQUOEnzRhQuV/keDUymZAQniNbbLWFQoEgLvxUmE0V8buk2RP4ZVIzBAn3hWjwJgM7Xd+A==
X-Received: by 2002:a7b:c207:0:b0:381:6db7:d053 with SMTP id
 x7-20020a7bc207000000b003816db7d053mr2573790wmi.137.1646051356865; 
 Mon, 28 Feb 2022 04:29:16 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm11206727wms.0.2022.02.28.04.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:29:16 -0800 (PST)
Message-ID: <bbd76211-ffe4-81ea-44ac-c6b148dc1e59@linaro.org>
Date: Mon, 28 Feb 2022 12:29:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] dt-bindings: soundwire: qcom: document optional
 wake irq
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
 <20220224133125.6674-3-srinivas.kandagatla@linaro.org>
 <Yhk6L+Z7cOs5z6hr@robh.at.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Yhk6L+Z7cOs5z6hr@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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



On 25/02/2022 20:21, Rob Herring wrote:
> On Thu, Feb 24, 2022 at 01:31:24PM +0000, Srinivas Kandagatla wrote:
>> Wake IRQ is optional interrupt that can be wired up on SoundWire controller
>> instances like RX path along with MBHC(Multi Button Headset connection).
>> Document this in bindings.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> index b93a2b3e029d..bade68f429b0 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> @@ -22,7 +22,7 @@ board specific bus parameters.
>>   - interrupts:
>>   	Usage: required
>>   	Value type: <prop-encoded-array>
>> -	Definition: should specify the SoundWire Controller IRQ
>> +	Definition: should specify the SoundWire Controller and optional wake IRQ
> 
> What about 'wakeup-source' property?

Thanks for the hint, I was not aware of this flag. Will add this in next 
version.

--srini
> 
>>   
>>   - clock-names:
>>   	Usage: required
>> -- 
>> 2.21.0
>>
>>
