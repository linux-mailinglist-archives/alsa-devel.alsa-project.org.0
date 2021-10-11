Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7AA42A437
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 14:18:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F304168E;
	Tue, 12 Oct 2021 14:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F304168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634041081;
	bh=wWfRa8uv/GcAqQl/MGEPWwyMqaBnNdnywSJcResQUso=;
	h=Date:From:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=Etm0GQIf6OwRLEUUmmZclRYjynM4w/w+PZMUH2UPgqYlKRe4cLkIrN2zVoANxvbFQ
	 GTlhoTZsQzjyHZxZFiU7n44WPvMEef+k3fdHn0jNZhjb8m28gqBZZI0VGOLPLisbHj
	 MJ6TC7zKl9WB+hvSoUNIgiMrVmxQTrVOlFwWnieQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 478CCF801F7;
	Tue, 12 Oct 2021 14:14:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89B8FF80104; Mon, 11 Oct 2021 11:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MISSING_HEADERS,MISSING_SUBJECT,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07285F80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 11:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07285F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DT0TReZx"
Received: by mail-wr1-x42e.google.com with SMTP id r18so53987009wrg.6
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:from:content-transfer-encoding;
 bh=S05pxta+ZXwPiNVHj0o7znwtIKDPx6p1RnfKWR+ZKzw=;
 b=DT0TReZx/UNR7+7KfZsIrJOTewDmtWUi6/vEbJti1KOwSCHy4KF8PrlyuTmwxZdtvq
 w2NpaSZOLyRYrjTVL5oTk3pIcqmTd5VV1KMW+I141BzLO5aybXvk7QZhu9yDRcKPzqY+
 GwwKhBoL6229xhzjEXM2iK53SkwN809iPF1Ufv29Ipjaoz/KIlEnGa/GxOqM9L47/8OM
 dzSyeFHq1SQk5/gDAoG8yhr+zsiIkGXlNQjbiEYUA5Ess+Rr5BtI999GyaSQ8Q7zSY88
 ml9G5kr11m2CcjbkmsUiDYboeAhirYFbvHkJRXTLRDl1IgHeY9ua/TCRvs/J82CmQ0e7
 JuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:content-transfer-encoding;
 bh=S05pxta+ZXwPiNVHj0o7znwtIKDPx6p1RnfKWR+ZKzw=;
 b=P6TdESOHwVwLO9ndL4UBA2s5QvQ4ie5jM2VBUaMRHK1hEk4dU11I8SFKsZZKXS+88Y
 HgQADPmfUSCBEPAg3598P3zEUwyknymRrUztC373/3ViqLVIwt3cWef0kQx/PQ+tR8YS
 Va7eY7Dgxgj9L5vKiQ2NIWJCUte47GlUkJ0wLwIxteB57/0+gpiEq7LZgf7GoeqBsEct
 j1EyClUJcQDHKmNyqndM71iQJD7lhlt+itjFax6qoOq3vE0Ut0ks/nXKj+i/N3AFa2Ez
 HtbLPoLy1gw8CWcLhbEWahzRgKvQVq6wQC5ZAswAHxLQo26P18z2suC+vkDagCac5OcL
 clGA==
X-Gm-Message-State: AOAM531HNCYH1W4WDVrf755ec1oE5UpkHBfovfZElb8JYZOqQOeTeB2P
 CSEkZNVNXUZI+3fKvw6oimlQfQ==
X-Google-Smtp-Source: ABdhPJyP3wjY/iJBjgVdDFmA077hCeDNfCsCtTcxT1vLMGRX936op1X/651y+K7jB41SbpbfC55W6g==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr22826412wrd.24.1633943972843; 
 Mon, 11 Oct 2021 02:19:32 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id p8sm7243670wmg.15.2021.10.11.02.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 02:19:32 -0700 (PDT)
Message-ID: <616401a4.1c69fb81.439b9.441f@mx.google.com>
Date: Mon, 11 Oct 2021 02:19:32 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 12 Oct 2021 14:14:28 +0200
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



On 08/10/2021 16:30, Mark Brown wrote:
> On Fri, Oct 08, 2021 at 07:37:12PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 9/28/2021 2:01 PM, Srinivas Kandagatla wrote:
> 
>>> In that case you should probably consider using regmap_register_patch()
>>> for corrections to the default registers in sm8250 case.
> 
>> As regmap_register_patch() not working in this use case, updating defaults
>> in probe for sc7280 specific differences.
> 
> In what way is regmap_register_patch() not working?

SM8250 and SC7280 has different register defaults values for few 
(atleast 2 that we are aware of) registers.

Initially we thought regmap_register_patch() would help in this case, 
but later learned that it was designed for completely different usecase 
and this will not update the cache values with the new values from 
reg_sequence passed to regmap_register_patch().

What we want was to be able to reflect that default values in the 
regcaches, so that subsequent writes are not ignored based on incorrect 
cache values.

There are two ways to fix this, one is to come up with a full default 
register list specific to SC7280 or reuse SM8250 defaults with some 
modifications, other option is to update default registers based on 
compatible string before regmap creation. I suggested Srinivasa to use 
the second option as 99% of the defaults match to SM8250.


--srini

> 


