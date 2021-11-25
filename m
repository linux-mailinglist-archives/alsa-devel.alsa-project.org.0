Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2A45D3E5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 05:24:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C3317E7;
	Thu, 25 Nov 2021 05:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C3317E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637814268;
	bh=O0aDBe4u+jcf4Tcq8bBjqsKNls0Jj0zcxv5S6inEwu8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVxZ/icfeoTjejgJrZW6ic/mVv8MjeAA6dhSglyNwlFV8Sj/VUTFOtTcLjuAz3nfq
	 oJss2UEXo9hbYAJhdQhRhMEbjHm/vyMP88lR+Ga8i/6iHjz70Mp0btardBes+ln+cq
	 D4s4XK8AwPMAaR2DvsyHztVs0e++gQefD2EEpQJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CAEDF80302;
	Thu, 25 Nov 2021 05:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D87DF8049E; Thu, 25 Nov 2021 05:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDBCCF8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 05:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDBCCF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XubA+7Gt"
Received: by mail-lf1-x129.google.com with SMTP id u3so12927637lfl.2
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 20:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yW96xTqN22+VgfWvofFKJ2uQthCcWS6JMEwqDhv1mBo=;
 b=XubA+7GtvDkj0ES1YstwmKTLp3xvVzHzRaeqB//qspqLlT8c48Wlax7bQSlzp42qNC
 +stMeEnSn6dW90xZoBfnm4+YUAwZdF5NTf56STCg0KHDg5/wUrPGZGtbtfcvcx0EmYAl
 OFb9mNbpoQ1kvJpKgux/RtthQduVob3vB7uRzR1CE5fWlugQqqrl43yTIpGlayo3utdl
 0210Y4AAyzU1iD5uyNIYK87Gvqp2UyfZZZXC1YbpHxShhim6MTnFSYP90wJsv4kHD+iE
 UzBK0TCOQHc8Z5y7fo35nnCF+o829D1RtNIzvCexl4mWWq42ixAFQe632iS1Ianz7p9F
 5fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yW96xTqN22+VgfWvofFKJ2uQthCcWS6JMEwqDhv1mBo=;
 b=Li4DHTLVvfG0HIQHi8HWBZL2zb++TujgDmStrE2S+3G68YrepHC0mwPsiE74js2MSv
 z8VkyUHao/0QVfRNafbegaGks1EvaL7JhL3Lk97HYH/8ZVWRwhMywXTJPkTXDcDnz4VA
 ZBnpfTn6+jBjAwO8tflk7kv7eQ9iB46Bpd/b94/Qzs9767FDohtR4hPJkhvSq0PWTawJ
 nJJIK5St91T0sbFkA6wyTBzc5QGp1Giv5Fz7dBncJnswIJJZ6Vd85yjqvrJRKdwZGufE
 RZm6f7AWIc0wEx+ZZfZsaGRR7S/ENemQT1ruN99bz96yUeOLHv2tFOoFRkkDKeWgicRq
 gjRA==
X-Gm-Message-State: AOAM532vCm8eJvhSRTP6osC2iSrSaZOe7nSfgs7BInO+Tv4lSMP4Z+we
 31x/17qQw2eBwSMQaAXovLA=
X-Google-Smtp-Source: ABdhPJzSViA3nbJpeKg2as0KQ93wxdxlYCRirpiJ3L9FZiRWPS2phT5FbugeHgNJ3EZGhLvHMdIfaA==
X-Received: by 2002:a19:495c:: with SMTP id l28mr21433144lfj.484.1637814181497; 
 Wed, 24 Nov 2021 20:23:01 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id v2sm144156ljg.46.2021.11.24.20.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 20:23:01 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia, tegra-audio: Convert multiple
 txt bindings to yaml
To: Rob Herring <robh@kernel.org>, David Heidelberg <david@ixit.cz>
References: <20211025171927.92332-1-david@ixit.cz>
 <YYBRTK9KGglu/s9m@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <39c21327-c2ec-b9c5-95c2-047ac347fd23@gmail.com>
Date: Thu, 25 Nov 2021 07:23:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 ~okias/devicetree@lists.sr.ht
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

01.11.2021 23:42, Rob Herring пишет:
>> +  assigned-clocks: true
>> +
>> +  assigned-clock-parents: true
>> +
>> +  assigned-clock-rates: true
> These properties are always allowed when 'clocks' is present. So you 
> don't have to list them.
> 

That is a very nice new feature!
