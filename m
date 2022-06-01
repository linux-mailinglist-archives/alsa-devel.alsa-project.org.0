Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C253A619
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 15:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5CB31701;
	Wed,  1 Jun 2022 15:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5CB31701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654091015;
	bh=fv22tQG8X7hiVrbGkd50uv+wLJ4CBjtSpoEAuFDCYnI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKhQYBea4zAkjrMlMWeEy7q6c3m7cUdNGIREm5V0n6abkvEPU/dNff493od2lHBN8
	 yPDu80Jqpdl/C/AQpkEaoQOAWeWpz1OVplQWjXYJDtHsNPwgIrv4xLrniPPfC8n1oC
	 g3DWFJs8mQ7gMd2A7aureUsZg2RgyVk6HHYqEXv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40005F80238;
	Wed,  1 Jun 2022 15:42:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18DC6F8019B; Wed,  1 Jun 2022 15:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75E3AF800BD
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 15:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E3AF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vkNdWZIn"
Received: by mail-wr1-x42d.google.com with SMTP id u3so2433595wrg.3
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 06:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0GytTj9uVTzJjxEXvcs09ax+kKcNDhJOHsmTGe+kH8w=;
 b=vkNdWZInZ7+8GlW7lJ8mbeICVbcaP8DQoN8ZodMXz63//NHmpWtnr9eII0esKGgrJ7
 XZYBnkrr/L3WwHZ8NWSVcJnc0y8O0CKd/oiv2XSilDkMaPN5i8KVJRKsC/hPW24GHylB
 54AL2z6qZj0V3FbKgFf+vjfTlrH8rXmrt1f7q9DazKENMR+nluo+ffa+1nO4G5bQ7sSc
 v2M78eXcOhW+t4BcTtF+Bxy/0iWu1NsuO0my9VSoIk+281lWAsZo28aNYazzWoN5si3Z
 pzuXUwv/h9Iqp9KRhqZRzgiHF9iW4Z9pvq8vLWzBaE61/yL/BNOcVhI8MTRK33xydOlV
 d1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0GytTj9uVTzJjxEXvcs09ax+kKcNDhJOHsmTGe+kH8w=;
 b=Hxfhi+hxBV4mYxPNIKjrpMvHX+CUs3CpcFis6YymlC2dhMiMGt0Dmuxw3fjO/eMZgE
 OGvpCm7mMa5gq26ufZm/T9uWFmERHH+U7mtzYYX2HCo4JZa48Dq5Qg+542saAcBw3n4d
 wbbbs9oMzXi89nT8oc2uwkiuQqUZzYJ/TMPPKs+8fv5/G8Bp9z4ralSsOw89QsodsbVB
 csQLWLxGct94u7i/jPtH+AJ124eDdkNQqHBt7LYTux588oF/AW/YBsXJFai6xuv53rS+
 M+xyIN/a20nu3SdzFPdH3tGkTVPEe9008vKNzzxwWwGBz3kIY75y2OxPlC1j7ybl0SlS
 15hA==
X-Gm-Message-State: AOAM531quNRT/YIEn3Q9q+0gH8ONL+0rgV3FhsWp1hdkKTEVQge6iO77
 8rMUb3l/3xI4fJl1tEaEbnhB3g==
X-Google-Smtp-Source: ABdhPJw0w+np9l1PjYluSYsyZUX4C+fqmoxAweXAcsxF3ASzI26AfWihFIw/6vfhS7xpLk/6VmugwQ==
X-Received: by 2002:adf:f789:0:b0:210:3534:636c with SMTP id
 q9-20020adff789000000b002103534636cmr12231263wrp.273.1654090952330; 
 Wed, 01 Jun 2022 06:42:32 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 j26-20020a05600c1c1a00b003973e27b789sm7304163wms.27.2022.06.01.06.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 06:42:31 -0700 (PDT)
Message-ID: <2a520eaf-c1de-aa91-3029-83f5469cdbb0@linaro.org>
Date: Wed, 1 Jun 2022 14:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Add support for controlling
 audio CGCR from HLOS
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>
References: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53g9rWks+euk5KHBzmJNEB3xLbJzMgCxN52DO5x+9-Wgg@mail.gmail.com>
 <51b8aca1-e038-4907-e973-ebdbebaf9b28@quicinc.com>
 <YpaXZ6KfApGebkBy@google.com>
 <7c74868d-624b-c18e-b377-026e70813fcc@quicinc.com>
 <1ec64a99-cfcf-c903-935b-d1bb0617c284@linaro.org>
 <61c151e2-c44c-3b84-9fed-a83abef83c17@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <61c151e2-c44c-3b84-9fed-a83abef83c17@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, vkoul@kernel.org, agross@kernel.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, judyhsiao@chromium.org,
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



On 01/06/2022 14:15, Srinivasa Rao Mandadapu wrote:
>>>>>>> +       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, 
>>>>>>> "swr_audio_cgcr");
>>>>>>> +       if (IS_ERR(ctrl->audio_cgcr))
>>>>>>> +               dev_err(dev, "Failed to get audio_cgcr reset 
>>>>>>> required for soundwire-v1.6.0\n");
>>>>>> Why is there no return on error here? Is the reset optional?
>>>>> Yes it's optional. For older platforms this is not required.
>>>> If it's optional then either there should be no error message, or the
>>>> error message should only be logged when the version is >= 1.6.0. There
>>>> are few things worse than a kernel log riddled with misleading error
>>>> messages.
>>>
>>> In that case, it can be done like below. Kindly let me know your 
>>> opinion on this.
>>>
>>> if (ctrl->version >= 0x01060000) {
>>
>> This is not true 1.7+ variants do not require anything as such.
> 
> I think it applies for all upcoming versions as Qualcomm Hardware team. 
> Here is the not from HW Team.

Am testing sm8450 which has 1.7.0 and it does not require/have such control.

I dont understand what is the issue in adding a flag to
struct qcom_swrm_data.

This should give finer control rather than matching anything > 1.6.


--srini
> 
