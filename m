Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4F638825F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 23:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2C41708;
	Tue, 18 May 2021 23:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2C41708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621374417;
	bh=6zQvaRNWpDEZkuYUpBPmd4hJybwLlLSTRxZqXoVOpM0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0g287eff+RPBeA5YpqXkc84X/1x7gaG8VuR13ysiYBqdZ1NMqD4e6H0yYqq0l6fG
	 qA1abkCgkfCWrNFhcZKdHZ2kenA5TXGODLgwZ0jYSGjxMH2dcxrxlzUeA/4JsOGkwo
	 IhD71CWMj+LmJNjPXo+KLyuSCyPzDmdskzBkgByA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D55B5F8014C;
	Tue, 18 May 2021 23:45:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AFBCF80217; Tue, 18 May 2021 23:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91123F80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 23:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91123F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l2FFG8EP"
Received: by mail-lf1-x12d.google.com with SMTP id x19so16044459lfa.2
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 14:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zq8Oj0D7oak1Vt4kV54mr1ZTCVcZbOhaIw9L0IBs9T0=;
 b=l2FFG8EPiN3vjj4EafWKp8FVGmDqN3MACtnwZCAHjEyaKq0ByGblwx9z9oUGFFqzjh
 ZIWvcDQWDjlRNkhQP6YpWYgl00aCM02ts8vijCHXKa9L2Xt+encl3y47O5AGwIUIpE2b
 joGZEqrwpnr1nYpEeJKj7hEYIthii8xUcMb7T+uAZWCVEqI85gReLfVbMHFWAgdWLX3c
 MeOq2BlFNOHaigcy5h6BauK9gVc3tvfWBMPip9wwAtWA2PeEZCpVv8cOzwX0kDB0af2x
 EWjxVtEN0kWy4wtT9U+eysxOAha7+KyHLrEHVX/O/AvlYzbS1LXxRN4nhK5MFqK2hNEN
 FVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zq8Oj0D7oak1Vt4kV54mr1ZTCVcZbOhaIw9L0IBs9T0=;
 b=hKiKQytFK7vg4FWkR+WBJeeVhpFZr05sX6JsRYj9uVGTg2aKu0Cb5Nqzhu52A4KKX2
 ZfsWmyHja31JdFhmXqgkMe1NiOR3lQ4DqycKh8Sb8ohPDtCsY5t3Ssm9hmmLzDIogOvw
 ld7Ua4/qjzwiIAVN0Dx9SR92eWzyjgKO5/VAC4hn/tSpWK60dYSuTyErbxbTdPyE5TWY
 x/+0cedocOyNyzhonwT/BL5UH2npP0cCcKzmte+jvsNRAehd8M7zs39npxnB2qSUuVIa
 c2OHprjq8yPfRxMud69QIOBJQnxdLh2oQ41yn2jM0Fg8txRLjDjycqu1kJbagPinMP2z
 MbkQ==
X-Gm-Message-State: AOAM530F5Kflj/13Yl6CZh96u8j7ba4cl/nRWRKUuk2vmSVTOs/76QOm
 tgMAMzfacthtc9/fFeJ9Ci0=
X-Google-Smtp-Source: ABdhPJxh5+b5L6ZRRyHsSrTpjq+R+4xiVVCh52oF+kqhQNv1TVL1AeH/w7K17KfxyxbG0Kf8MuzQ8w==
X-Received: by 2002:a05:6512:1192:: with SMTP id
 g18mr5531306lfr.659.1621374319358; 
 Tue, 18 May 2021 14:45:19 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id v1sm2015837lfo.179.2021.05.18.14.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 14:45:18 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: sound: wm8750: convert to the json-schema
To: Mark Brown <broonie@kernel.org>
References: <20210512205926.780-1-zajec5@gmail.com>
 <20210518185511.GF4358@sirena.org.uk>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <edc9e00f-1074-8a9b-1666-ba4a0b9a08f6@gmail.com>
Date: Tue, 18 May 2021 23:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210518185511.GF4358@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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

On 18.05.2021 20:55, Mark Brown wrote:
> On Wed, May 12, 2021 at 10:59:26PM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This helps validating DTS files.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Oops, "ASoC: " prefix is quite unique, no many subsystems use any prefix
before the "dt-bindings:". I didn't think of checking that, sorry.
