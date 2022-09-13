Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BB45B6EB7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 15:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4801757;
	Tue, 13 Sep 2022 15:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4801757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663077578;
	bh=oFANoyfts/yItbi+/SCgdWLy1yKTwU+/xkb03U56zt8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1vbYJ/hbPeCWdBxqFZhk66kBLGtoRHY5A5suHxqrjO5gefDE9+Ors0iAL/zv+S0o
	 YlNUKxJuGfCH1U5h0jMBLIRMOfUvghG/+Nrz80R61rKMwvAeKrYeBGqERBi4HKjd7F
	 6LIMuoSGEMbwgT2BEV/Ip/VyvW8+v0dyZHHHnjYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32677F8025D;
	Tue, 13 Sep 2022 15:58:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A9AF80224; Tue, 13 Sep 2022 15:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61108F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 15:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61108F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org
 header.b="IY8xOwXp"
Received: by mail-oo1-xc33.google.com with SMTP id
 t4-20020a4aa3c4000000b00475624f2369so1178571ool.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=j4b3AwKXnbNOc68U591Ba49SYpbjEmsPStwHugruFXY=;
 b=IY8xOwXpGjE0SdIJPzybMxmP4m2T8KAbKGM7JrPns4diuJRzQQdTrR9uBMLZMZ1lZO
 K/HcgHm2G7ER+vdjQDjBa7FWLUTbtkNCQz2jT5oIF9qIbknckvE+l63mEgLKqMIJlf5J
 fC+8+JnPKboKqHH/11hZPFYExWokI2U45amkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=j4b3AwKXnbNOc68U591Ba49SYpbjEmsPStwHugruFXY=;
 b=PCEBjobfbtxs4JFz60sKMAezLLRE376XRqeJrzV0eSxXuOde73c+RzpYWobK3sBFHn
 B6d+WwEi57yGPSPPKExfTTIMiHseS/wj4FMtngd0vc6slq/4gkIg8qTwpXz86fKh3UEN
 uPqpUuh+O77GTfVi7qZ6ErrzZjmLs1BB6UY+/v50H6TK2BJMn6w+muEQpXWFcn/sV6DL
 HJQWnJfklHMrb6duOFGKKGZQOpA15GDgE9o4pgKO4SpODFRokWmtoQRATiazWJMXHgp8
 SVtwgJjKHR1ADQNssokSIiVEIpA7o7PSKpVeBlpSqhOapq8mT2W9L0Jf6Q81vB/asyRR
 jf7w==
X-Gm-Message-State: ACgBeo3K6YCt2kGEzpXmqtGnbzeGxqOgk6ikPRd5ZQElyByDmnTA9BGD
 qtLDEG2omYJqxKu3+epblFnf6g==
X-Google-Smtp-Source: AA6agR6Tr6upEAKirqfcck1pCLrIPjxxEXBfXhURgmYde0fXkAmfIiiM2LtbTbWlyIGlUU6Bd09Etg==
X-Received: by 2002:a4a:8e81:0:b0:475:811f:3f9e with SMTP id
 p1-20020a4a8e81000000b00475811f3f9emr2603836ook.35.1663077511837; 
 Tue, 13 Sep 2022 06:58:31 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a056808069a00b0033a11fcb23bsm5212658oig.27.2022.09.13.06.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 06:58:31 -0700 (PDT)
Message-ID: <f2fa19a1-4854-b270-0776-38993dece03f@ieee.org>
Date: Tue, 13 Sep 2022 08:58:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Make QMI message rules const
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Alex Elder <elder@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
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

On 9/12/22 6:25 PM, Jeff Johnson wrote:
> Change ff6d365898d ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules to be
> const. So now update the definitions in the various client to take
> advantage of this. Patches for ath10k and ath11k were perviously sent
> separately.

I have had this on my "to-do list" for ages.
The commit you mention updates the code to be
explicit about not modifying this data, which
is great.

I scanned over the changes, and I assume that
all you did was make every object having the
qmi_elem_info structure type be defined as
constant.

Why aren't you changing the "ei_array" field in
the qmi_elem_info structure to be const?  Or the
"ei" field of the qmi_msg_handler structure?  And
the qmi_response_type_v01_ei array (and so on)?

I like what you're doing, but can you comment
on what your plans are beyond this series?
Do you intend to make the rest of these fields
const?

Thanks.

					-Alex

> This series depends upon:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=ff6d365898d4d31bd557954c7fc53f38977b491c
> 
> This is in the for-next banch of:
> git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
> 
> Hence this series is also based upon that tree/branch.
> 
> Jeff Johnson (4):
>    net: ipa: Make QMI message rules const
>    remoteproc: sysmon: Make QMI message rules const
>    slimbus: qcom-ngd-ctrl: Make QMI message rules const
>    soc: qcom: pdr: Make QMI message rules const
> 
>   drivers/net/ipa/ipa_qmi_msg.c    | 20 ++++++++++----------
>   drivers/net/ipa/ipa_qmi_msg.h    | 20 ++++++++++----------
>   drivers/remoteproc/qcom_sysmon.c |  8 ++++----
>   drivers/slimbus/qcom-ngd-ctrl.c  |  8 ++++----
>   drivers/soc/qcom/pdr_internal.h  | 20 ++++++++++----------
>   5 files changed, 38 insertions(+), 38 deletions(-)
> 

