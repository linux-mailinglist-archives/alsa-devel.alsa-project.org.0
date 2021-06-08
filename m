Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74939FA45
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 17:22:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA8A176D;
	Tue,  8 Jun 2021 17:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA8A176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623165730;
	bh=Dm4pfdgj4YIx5G69IZShOSG5MgdFU0jHrDbyR1GwNdE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/KlSOBVi+4kz97rQvsiwyTIdM/OEZlgb8KCe87cBdV/NAG6eP1iFHwEwKJ04XJ95
	 Qu+Oq970dlZztSV4xg4NmCkR3JQnF88rRDiHqFlIZtwPvTvWU2zawCPnfBAWe/0Sg7
	 K0gG8lBi89yPq+0LpYy86f8mi/GuUpETEDDtCSPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F37F80218;
	Tue,  8 Jun 2021 17:20:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB04CF80218; Tue,  8 Jun 2021 17:20:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7144CF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 17:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7144CF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PpTPauAE"
Received: by mail-wr1-x42f.google.com with SMTP id e11so11814878wrg.3
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KMZoeM4tw0htYY4QWpAC+ev8zaiQVRwGUrBB7esHPik=;
 b=PpTPauAERRjBh68cUEvmQNnKdOcUUlbri6ZAm2HwfiSjlYibi9w6TZ/rMb91W4oQ66
 sHH9gOxASpdZfk/Y0nFhWUNZdaOuEkG/tPNmim7T89626VfyYp8dT9pf38atshqjtZDo
 4jOTX8oQizbVYJoZUUBU9RTh5EQgVMoalzO5xWkTYR3Uxm01PO4seuVVfLmoDNuyO3mh
 EHv+aBMKOsW3nGFdohprs4b3Xna1uKJq8oOFyhehTz2ax5proeuN5saE/04Yn0BvaJgY
 MJGNlrw9YdYPctZmFvsYz5eXtE4/O4s/C3sezz9re7qbGTgryrp7oY8lXR80gCOoV+hZ
 A6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KMZoeM4tw0htYY4QWpAC+ev8zaiQVRwGUrBB7esHPik=;
 b=ZmDNYNlgazGosjrISuQUKne91j7sG3jQWe9UYU0qDKcDSyWvMaigzMYPLUVK8YCJi2
 IKhP4EkiXa784lKwGE7qiZTH2AfKOKsMtejttchpKkU/jEw77w7krsgRKjNUdakTmu2t
 lDUdraBkHaMFLvpfi4p7YE3GkccX0b6U+p5oGtNVLjrYg5jTQYFH8zvyTkuuctTd3S80
 7N88Qs7+nUj4hqFke77ODZ4VV5s8eqmT2K2C+OpiWkUeVjZjSiNQ/1vUNAZGEb9XFW92
 bpWDqMyzKSbj76taFVsTMP05Z4K3bbjC6hpkXpk/7CaddjeL2Cr17bykVUrau2l4Bx1H
 x1Dg==
X-Gm-Message-State: AOAM5314UBowE4MngX7Z1WdUe0G4xE33Wtun5JhkoRNr+3OeScAr4vX2
 sUt5dNpefwCxRs+RbBSBIK5wBg==
X-Google-Smtp-Source: ABdhPJxC82LsQQVwkWI8GVVxhjHkvMS5AzTGBd/sGHtaEic4jOy4D4GSdfgNGucNLArxxfT8qrF8oQ==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr23596492wrw.262.1623165627367; 
 Tue, 08 Jun 2021 08:20:27 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i2sm17456251wmo.40.2021.06.08.08.20.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:20:26 -0700 (PDT)
Subject: Re: [PATCH v8 3/9] ASoC: codecs: wcd938x: add basic driver
To: Mark Brown <broonie@kernel.org>
References: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
 <20210601113158.16085-4-srinivas.kandagatla@linaro.org>
 <20210608141209.GF4200@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a6ce009c-0946-fab5-3452-9ef2e2b6c79d@linaro.org>
Date: Tue, 8 Jun 2021 16:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210608141209.GF4200@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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



On 08/06/2021 15:12, Mark Brown wrote:
> On Tue, Jun 01, 2021 at 12:31:52PM +0100, Srinivas Kandagatla wrote:
>> This patch adds basic SoundWire codec driver to support for
>> WCD938X TX and RX devices.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/Kconfig   |    4 +
>>   sound/soc/codecs/Makefile  |    2 +
> 
> It would have been nicer to add the Kconfig and Makefile changes last
> for the benefit of bisection.

I agree, will do that in next version.

--srini
> 
