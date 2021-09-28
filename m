Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6641AC08
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 11:36:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E56216A4;
	Tue, 28 Sep 2021 11:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E56216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632821775;
	bh=7lpQXa7LqD5rkl4CG1rjcI8Z/EdtffNO/uv5aA6ajVI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQSMm1/hr8HTAzltx1yC4OjR7XzOkEFJdbjYf6Zzb9QPNUJY3DXV7Qzkq3Wxeo9Q0
	 TYmkEWCTEfrTQk/ukQ2e+stgSvsUINa8YqnbhTrh4svBBhJX4aj8SfQkL4DBeAaWId
	 teOWRImk6wk9GykDerq8f89ZINUGBcy4jcabzNEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08353F80105;
	Tue, 28 Sep 2021 11:34:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25241F804AD; Tue, 28 Sep 2021 11:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBBB8F80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 11:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBBB8F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="U3gK7RNa"
Received: by mail-wm1-x335.google.com with SMTP id
 r11-20020a1c440b000000b0030cf0f01fbaso1552581wma.1
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+W9aJf0EmxrO92oeUCfttwGgO8htvC8XeZ6ScNOCkEQ=;
 b=U3gK7RNaFxd9qMHOrid8Eo5TlzU4hKRvBpUW0w80ekspMBdigx3bYRC8Q0empgjQQ7
 b+EVONDhbBQmp19A9p/BJlwxPqYZne/vMvUjjvjtn0px51e2cwQVPAoNFe0sRoHcAMp3
 TdwQCRlPz5uxqUqDK+MHip+NH9rse9QASm91gsButbn7OFAnFLQPux7uY559RU2/Z5bN
 BjGpIHd8vwuwGZCRvOX+nsTCtYN4q9GGJ3RobhXOBEFwSlcJCaHQwVieOcg/0u5imGuq
 yIXxTGizCokKXaCvpZDUdqImsW5F6pBjA6YH3rPI3nyRrekD2Gu8tcIVAZNDo1P6xn94
 XtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+W9aJf0EmxrO92oeUCfttwGgO8htvC8XeZ6ScNOCkEQ=;
 b=g3bcczXuzu6dDC0rpMImiZgpYMx/pJxMw8MN/iC6sZfQA/+nzKhVTOIQ80psjYxOAd
 VGfYe+8yMLCRjnNc5/qQhmq0r7BVJ+wMMyhu019SwXjBIZosynm+QRuSPYzUlkbULscE
 7koXVLYyUVhvQJVfMDyCzCVN2C04js+PQ5rqrnUjZhvstE7CWu+LPkoGqNV3OL8Ux7Zx
 1V5ENX2pxc8I8xLlMtJ+BccIL9OT2d2s8xtgEKVLk/j9RQ6dLXDEfdURChzR9Nl/CFHv
 kVsYlsj3dQQIDHtNqPatSvc13gbh9eCv49ZJmw5OBgeS+hedQVXLoUJZf163KI7PbBvQ
 bgnw==
X-Gm-Message-State: AOAM533OT/EzkEQ7GS6vj2SnlM1YbqIXQagDxSY0cE74EGUZYWupyy05
 PJ2oLkxKqfwHE7AUuei8n/qL3A==
X-Google-Smtp-Source: ABdhPJwvCIHs/V58eqkhRPAnECcR0pGi+za099CKWU3IQiPQFqDp1szchuKGBBVy1BMdxR7gq4LGtg==
X-Received: by 2002:a05:600c:3646:: with SMTP id
 y6mr3612017wmq.61.1632821689003; 
 Tue, 28 Sep 2021 02:34:49 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u5sm20508832wrg.57.2021.09.28.02.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 02:34:48 -0700 (PDT)
Subject: Re: [PATCH v8 18/22] ASoC: qdsp6: audioreach: add topology support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-19-srinivas.kandagatla@linaro.org>
 <f2009225-22b5-97ed-9cb5-87a43b2c3039@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <535723fb-d354-4d90-ae5a-8981ed6c3fde@linaro.org>
Date: Tue, 28 Sep 2021 10:34:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f2009225-22b5-97ed-9cb5-87a43b2c3039@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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



On 27/09/2021 17:21, Pierre-Louis Bossart wrote:
> 
>> +static int audioreach_control_load_mix(struct snd_soc_component *scomp,
>> +				       struct snd_ar_control *scontrol,
>> +				       struct snd_kcontrol_new *kc,
>> +				       struct snd_soc_tplg_ctl_hdr *hdr)
>> +{
>> +	struct snd_soc_tplg_vendor_value_elem *c_elem;
>> +	struct snd_soc_tplg_vendor_array *c_array;
>> +	struct snd_soc_tplg_mixer_control *mc;
>> +	int tkn_count = 0;
>> +
>> +	mc = container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
>> +	c_array = (struct snd_soc_tplg_vendor_array *)mc->priv.data;
>> +
>> +	c_elem = c_array->value;
>> +
>> +	while (tkn_count <= (le32_to_cpu(c_array->num_elems) - 1)) {
>> +		switch (le32_to_cpu(c_elem->token)) {
>> +		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
>> +			scontrol->sgid = le32_to_cpu(c_elem->value);
>> +			break;
>> +		default:
>> +			/* Ignore other tokens */
>> +		break;
> 
> indentation still off
> 

its fixed now


--srini
>> +
>> +		}
>> +		c_elem++;
>> +		tkn_count++;
>> +	}
>> +
>> +	return 0;
>> +}
