Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADF8186E7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 13:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EEDA83B;
	Tue, 19 Dec 2023 13:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EEDA83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702987372;
	bh=DYBIPyzTDX4DrE8BJLW2OwzGk5Q0dmTKbtsTF4nQkyk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c5CGYizyju9C4Av0j55bng7nJ1Y71AC80irpBs2DDEPiTT/Mu8KiMlx1IgGBJqtsN
	 /b48JHlbp6jAg3tvYCGc7uTmoWkZuxCD+J3I3rZDhT0x+YrgnZ9H3k8cep8YdvvrH3
	 gnwu5fh4wjGBmwaKQKvtpx4PCo1wEh5V7JUgJuJg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5429EF805BB; Tue, 19 Dec 2023 13:02:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CDFF805BD;
	Tue, 19 Dec 2023 13:02:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7024DF805A9; Tue, 19 Dec 2023 13:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12CEAF8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 13:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12CEAF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IGwCTj++
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1f33c13ff2so364480566b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 04:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702987311; x=1703592111;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVvvKQRps43iz6LpvgBs+AvFLcUj1lrxhvkgfLbhk5Y=;
        b=IGwCTj++WQwSV0DsuUkbFBNY13CdR8N+7qg9jvvnkISdWebA7lqAeIHzrQb71NeRlu
         cX+JZDYB2iv9FQEkPE7aWcvFNUSxGG8fpAXVcH5LKTtbdnAy3l34TKYmD6OEwNtZfBWN
         93bz+plvEPFGAcMNyjU97BRsV7FuiGSrGcgwgHNhuyZoqD6TsF8qCmtRKmAwd/jSTnEW
         Kccg0jalgCGuyEB9oogqTxC2vyGE2jeQ2z3dvw9Wkgz9k/RXseXQOjJ+7pjF2VluTTvv
         jpe2cUkGmEq4gBEVwyOh0GZ0ioqGrnrtqYwZmfkyCKhuk7zrjdCFWCTAxoLQUD388A8s
         P1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702987311; x=1703592111;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVvvKQRps43iz6LpvgBs+AvFLcUj1lrxhvkgfLbhk5Y=;
        b=LB/CP/TS/GaZ9APv6VZWEov/XVkvnBK+WB1KqgejYkUIEG3uRBblNxo5Nu1l8c/Dot
         PETtlzhApm4zby1NwS0vTPVKQRwsASo/2aV1dujMcipHp2Ietq60n3wyTUH2utIgaKiy
         zO4lHdG+Ex9mVASORl7WbOcL234Hg9WKYYaCK4/56Vsik6OmiV2ma+F3y4DPAah1siC+
         lyPQeMOLbrrP9zhftoEzv3v/xmsGRrxQs42dPgxj7FQK/7kS6+T65xCRtKpX2FN74lAD
         nJHrxS8qV5eo2syGueDjlIz6BN/vpeqd2eRGJhGnWM9Fq0mcBLjggp4PxIFFW+7tdy82
         9CUQ==
X-Gm-Message-State: AOJu0YxIDSDdik5n63vQCgVNotlm9C8Uw5KImQrDRZUXiAOgEEgO/6TK
	rmKHXIJVXvdrVVRg1gzXfUkOdA==
X-Google-Smtp-Source: 
 AGHT+IHfEJcj5sqilHKdlPgFubmK4nI/7tH8em/CPcCCZeiKmAjLc3BZXIWyh3bOrm4xpr41lMaPbg==
X-Received: by 2002:a17:907:9016:b0:a23:339f:3313 with SMTP id
 ay22-20020a170907901600b00a23339f3313mr2181362ejc.55.1702987311149;
        Tue, 19 Dec 2023 04:01:51 -0800 (PST)
Received: from [192.168.199.59]
 (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1db76f99c8sm15508227ejc.93.2023.12.19.04.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 04:01:50 -0800 (PST)
Message-ID: <da5df198-6e17-46f0-a12e-0083a5601785@linaro.org>
Date: Tue, 19 Dec 2023 13:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/41] ALSA: usb-audio: qcom: Add USB QMI definitions
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20231215214955.12110-1-quic_wcheng@quicinc.com>
 <20231215214955.12110-19-quic_wcheng@quicinc.com>
 <4b644ed4-358d-4caa-bed8-ca76e0baadb3@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <4b644ed4-358d-4caa-bed8-ca76e0baadb3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XOQUQGIXAP5M4DMFBVRTQRXSSXUTNDV7
X-Message-ID-Hash: XOQUQGIXAP5M4DMFBVRTQRXSSXUTNDV7
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOQUQGIXAP5M4DMFBVRTQRXSSXUTNDV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19.12.2023 13:01, Konrad Dybcio wrote:
> On 15.12.2023 22:49, Wesley Cheng wrote:
>> The Qualcomm USB audio offload driver utilizes the QMI protocol to
>> communicate with the audio DSP.  Add the necessary QMI header and field
>> definitions, so the QMI interface driver is able to route the QMI packet
>> received to the USB audio offload driver.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/qcom/usb_audio_qmi_v01.c | 892 +++++++++++++++++++++++++++++
>>  sound/usb/qcom/usb_audio_qmi_v01.h | 162 ++++++
>>  2 files changed, 1054 insertions(+)
>>  create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
>>  create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h
>>
>> diff --git a/sound/usb/qcom/usb_audio_qmi_v01.c b/sound/usb/qcom/usb_audio_qmi_v01.c
>> new file mode 100644
>> index 000000000000..bdfd67d980eb
>> --- /dev/null
>> +++ b/sound/usb/qcom/usb_audio_qmi_v01.c
>> @@ -0,0 +1,892 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/soc/qcom/qmi.h>
>> +
>> +#include "usb_audio_qmi_v01.h"
>> +
>> +static struct qmi_elem_info mem_info_v01_ei[] = {
> can these be const?
Sorry, it was already pointed out.

Konrad
