Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D545B7C28
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 22:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E46F17BC;
	Tue, 13 Sep 2022 22:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E46F17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663100561;
	bh=tUXKYHjwiN7ADxIDmFGJP9C09zbeMp4yuFuggWwBh8g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBKt5sJd3eoTT+x+pteiFhId1ywqo+70/NA4RCKiZXNCcgtvxXrsvuodHyg/oPncJ
	 V9hJ9QXA1ukFsPy7MvNEmVMvXebLWAdLyDXU+NgwHRnmuMKR9pATRNN5s3bqy+OnBh
	 1AHPY4sva3mybpXxx8vT+oPzvYKbKI01wdFPr79w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D803DF8025D;
	Tue, 13 Sep 2022 22:21:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D85F80224; Tue, 13 Sep 2022 22:21:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E575F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 22:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E575F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org
 header.b="VPYxLNq/"
Received: by mail-io1-xd2b.google.com with SMTP id z191so10603720iof.10
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=hvA7f1e70eZNisribXBaUlpwC7EMEv0cHfgluSEMJ+0=;
 b=VPYxLNq/A8L3gEZHrUwDcoUnPkNmYHwG9R7k93b4XkSnlgyVRTTuF0O77jbNmGZoIO
 fdkM8HmeOpQpWtqZPyf/TvCIxnU02BuqCVAm/R7KpqMDY9pXP01TznUpG3VpHJ9t/OYj
 eUOiHs7lGwCuJU0/YT9WAeKvqZ79yq/a06L8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hvA7f1e70eZNisribXBaUlpwC7EMEv0cHfgluSEMJ+0=;
 b=jgLD1eCoug/l2acT10qfRqfmSsFC6JVhMm0X99ywM3O1GrwPD2VkzMtyBGDzeAqxEI
 5NsOUoqy0rzoH7lwbVPs5VyoYZqtRaS941+oh9qkoHNBo2T135EWIntDrByRoJ/TjCXR
 SfqebR0Jw5jVSbb1JpMEbQokD3U69x2BK2jt/5akeEp3j0yvKsPwbf3/i63TnEXdu96p
 yZipu9czCCsyseKgRQtP2BXF9nQ5+4zF5te3fUNYQWIfyr7vGxZYfaDjOWfcHF+/J81x
 eidxc57IzyalukUjtOJVbe3klkzlQZol8EYQtw8bnQ/HjATEwe+++ERawkjte2GHNt7n
 2vrQ==
X-Gm-Message-State: ACgBeo1fQdRHAE5CG7IlOGSTgNqR/POSnRqwoerUik29cTHbMH8XgkMi
 3pt9mMne6UapGBIYGJewy0niEQ==
X-Google-Smtp-Source: AA6agR7bLInJc4dGlF3FU+bR5qg/fCB3+Slbgvu5j48T3Dz25FTGl4WwJnDiLCEX7WWA0v0QFQAfow==
X-Received: by 2002:a05:6602:2f13:b0:6a1:730a:dd9d with SMTP id
 q19-20020a0566022f1300b006a1730add9dmr3702301iow.114.1663100492023; 
 Tue, 13 Sep 2022 13:21:32 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
 by smtp.googlemail.com with ESMTPSA id
 d4-20020a0566022be400b006a102cb4900sm5436906ioy.39.2022.09.13.13.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 13:21:31 -0700 (PDT)
Message-ID: <ac428312-745c-490e-dfb4-2208913c27c1@ieee.org>
Date: Tue, 13 Sep 2022 15:21:30 -0500
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
 <f2fa19a1-4854-b270-0776-38993dece03f@ieee.org>
 <5b0543dc-4db8-aa33-d469-0e185c82b221@quicinc.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <5b0543dc-4db8-aa33-d469-0e185c82b221@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 9/13/22 1:51 PM, Jeff Johnson wrote:
> On 9/13/2022 6:58 AM, Alex Elder wrote:
>> On 9/12/22 6:25 PM, Jeff Johnson wrote:
>>> Change ff6d365898d ("soc: qcom: qmi: use const for struct
>>> qmi_elem_info") allows QMI message encoding/decoding rules to be
>>> const. So now update the definitions in the various client to take
>>> advantage of this. Patches for ath10k and ath11k were perviously sent
>>> separately.
>>
>> I have had this on my "to-do list" for ages.
>> The commit you mention updates the code to be
>> explicit about not modifying this data, which
>> is great.
>>
>> I scanned over the changes, and I assume that
>> all you did was make every object having the
>> qmi_elem_info structure type be defined as
>> constant.
>>
>> Why aren't you changing the "ei_array" field in
>> the qmi_elem_info structure to be const?  Or the
>> "ei" field of the qmi_msg_handler structure?  And
>> the qmi_response_type_v01_ei array (and so on)?
>>
>> I like what you're doing, but can you comment
>> on what your plans are beyond this series?
>> Do you intend to make the rest of these fields
>> const?
> 
> Hi Alex,
> My primary focus is the ath* wireless drivers, and my primary goal was 
> to make the tables there const. So this series, along with the two 
> out-of-series patches for ath10k and ath11k complete that scope of work.
> 
> The lack of the other changes to the QMI data structures is simply due 
> to me not looking in depth at the QMI code beyond the registration 
> interface.
> 
> I'll be happy to revisit this as a separate cleanup.

Sounds good to me.  Like I said I've wanted to do this
myself, and as long as you've gotten this far I'd like
to see it taken to completion.  Compile-testing is most
likely sufficient to make sure you got it right.

I cherry-picked the one commit, and downloaded the series
and found no new build warnings.  Checkpatch would prefer
you used "ff6d365898d4" rather than "ff6d365898d" for the
commit ID, but that's OK.

Anyway, for the whole series:

Reviewed-by: Alex Elder <elder@linaro.org>


> /jeff
> 

