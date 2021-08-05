Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD0D3E1124
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 11:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3804D1690;
	Thu,  5 Aug 2021 11:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3804D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628155089;
	bh=n6xZhK12Se4ahPZDzFznDTncKL2ff5Tg6BN9jPadMv0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d0zWOZ7CdRNWmzTPV29eCCOPFl7gaqT+pp9NwWVUkBntOsuWPeGnqYzE1rJt8dfaN
	 PqZC9GDEZZku7MZt6mB1GXoOB9AatXnKki1XdDoyDYgGZP5FBFzzQqB5VeUltaJ8hX
	 BXHZNHosldqIxEm7Kpfp/8fpNGFdoZ0XRNN8ZcO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C327F804AB;
	Thu,  5 Aug 2021 11:16:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF5AEF8049E; Thu,  5 Aug 2021 11:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 835C1F8032C
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 11:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 835C1F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="i16exZGM"
Received: by mail-wr1-x431.google.com with SMTP id k4so5617606wrc.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Aug 2021 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5jE1jJ3HRbslBVGRDPvT7b3oVRlZpjy3URhBkDAgyTc=;
 b=i16exZGMnMbr03+df9TQRG83WeyPHxUrZx8tZnpskwXFeJwe5UXTubo+cY/8Y4op7+
 dl828Q6+rpH/iAeJ8dBFAxACLadgaCFVS6RahKojIqkAOaMt9ukvWExMvu/RCtv4YgLj
 9wR867Gfpsf6r0ib+ffd/m+sImDQgYQhFPJT35/DxhCTbUlaA0vbrEHDXcsLrCejPYm6
 cTMLm5wof6LBPoC4SMkFAVCcVu6efc80xuAcK1T1EWEDAXZmlhuJtkbmjRgOlEAggpal
 88idRQq1Jy4XCNRrQUj3DOe6eyyn/KmgiHmWyX6r6C/OP5BTUBUo+pg14mG5u6CjYcHt
 8QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5jE1jJ3HRbslBVGRDPvT7b3oVRlZpjy3URhBkDAgyTc=;
 b=EIZXalKP/zVEUDBujj+JFyQ93YkUc/v+otlePHPG4jXzdQV4P1CcDhY1NUY1DkHfhd
 SxUV07eyg2IDVArNfCVodKOFonL7WJRJJ4VALQPeom8F+/eo/55Y7iCW0X0RijfHaTW2
 c7csqtJzgT3OHvfgcCw0k00d703PnRaxLgCYgFZDmQcGV6Dz2eow2SGhsytC0XkIPn4M
 VrlyM42kT9bKcuYKU7SpYJLT/GdC1ErTMFKZJImFdUG0xw/qmoN6na+xDvL+iOHAOHBr
 JbISIIep9DBTf00nHHKBinhNq4HEwEcattvUaQyusZRDJxcWlCkLSl64W7ofjMu7GRj0
 udTg==
X-Gm-Message-State: AOAM531X7Ed51o8OED+6O3zA5SqAOYchhn/Zq3I0opTf+AhPhIg6w+oW
 FXCP3tPGes+9uDxjVkQ7fuWNKQ==
X-Google-Smtp-Source: ABdhPJyyt86m5iDuECTUERkaKcwI75LLXlfz4bHoRCp83YyMjjT6bx74NweyNqXo9WxDp8Tz4tPxTQ==
X-Received: by 2002:a5d:44c9:: with SMTP id z9mr4066925wrr.302.1628155000516; 
 Thu, 05 Aug 2021 02:16:40 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o17sm5307958wrw.17.2021.08.05.02.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 02:16:40 -0700 (PDT)
Subject: Re: [PATCH v3 10/20] ASoC: dt-bindings: q6dsp: add q6apm-dai
 compatible
To: Mark Brown <broonie@kernel.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-11-srinivas.kandagatla@linaro.org>
 <20210804180111.GF26252@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c975b55e-7300-67b6-b91b-4783f129f1f3@linaro.org>
Date: Thu, 5 Aug 2021 10:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804180111.GF26252@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, bjorn.andersson@linaro.org
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

Thanks Mark for the review,

On 04/08/2021 19:01, Mark Brown wrote:
> On Tue, Aug 03, 2021 at 01:54:01PM +0100, Srinivas Kandagatla wrote:
> 
>>     compatible:
>> -    const: qcom,q6asm-dais
>> +    enum:
>> +      - qcom,q6asm-dais
>> +      - qcom,q6apm-dais
> 
> What do these two compatibles mean?
> 

Old Elite QDSP framework has service called "Audio Stream Manager" aka 
q6asm which is responsible for managing the PCM/Compressed streams and 
Pre Processing.

With New AudioReach framework this functionality is managed by "Audio 
Process Manager" aka q6apm.

As we are using rpmsg device model to link these audio service channels 
with linux devices so we endup with prefixing the compatibles with 
service names(like q6afe, q6asm, q6adm, q6apm, q6prm ...).


--srini
