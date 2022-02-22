Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4624BF7E7
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:09:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DC01853;
	Tue, 22 Feb 2022 13:08:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DC01853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531788;
	bh=2xsCHpCyx7kuEWTAM3M4Y6cKiosErpYJQ699xEO+fa4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJHRk2QOyxsO5Bmw6qDjM55qu8Zk5+qJWldRorhXqvEQpXJPihXgcB+4PQsJDZDjZ
	 QrDnD1pUooCqs0JFtzxtvnNl0livS5J2WQUBvM3qyXXhapOv7Aosmx9ZzYzHpw1kxS
	 ykCnYyuUPAfE6kSeJFPw7rfLVSMM+ehoqzEeEVkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C43E0F801F5;
	Tue, 22 Feb 2022 13:08:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E29F801EC; Tue, 22 Feb 2022 13:08:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FFDEF800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FFDEF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Z4OMOOvg"
Received: by mail-wr1-x430.google.com with SMTP id e14so379854wrc.2
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 04:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yL3pDh0UdEVLDaNpndoSvDFj+AT3Eq41Xkt0nDOjcQ0=;
 b=Z4OMOOvgcGbdmLQhjzNiQ8E9w95cVCCHZuMtJ6oBvC6QGBKNZ3jVzKkvnj2lFgvZ/q
 oeb5xRoiwPJ6hnsUrppVfQ0NiiUoWzK7RpYF48MHxn3PlWY/25BkcCjtZRyJv7bPcfjg
 ErOt9/wFCOdRMhM5ust8XjrJnf+SQZDXl7xM6fa+7nURbAZ5Gvagn9EtCJUno4oHicdq
 ykdXYvZHopS0ldd8WtV8vJLfZ1Ffng6D9yixLjUDjtk+vyNcRkHTKlWk6A7SFrrGTa/5
 CD4ZFWjzrzT1Xe+7S3lFiOPeIwIG2ScznqEsoAnYUfEaknTcxdmzGNjPBi9NmMFivpY8
 LnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yL3pDh0UdEVLDaNpndoSvDFj+AT3Eq41Xkt0nDOjcQ0=;
 b=B3LKjKjc4SwTanPXI1MyjGdXFmbsvmAon5RIlczUgtFON2j41lnQe2CdgbRr6xQI9S
 HlaqeKTHZwmP6DeDWXJQoUY4HwQ40Esw32H/7aJEy9VEo/F5NqlpSV64yFF8J5WFnrZV
 qspFjMcCtyp4945MTDuJcnqV4NeaiJjr4Y2VxHrNLUclVwaWrbDEReVC8nL8F3k7aJ4T
 TuMrkqfkZmwKybebIcD7YymAKmc4MENo75IcKkR4MYEguUPm10wR1ylodb7jFzgFv50d
 t+uARkqFsRhuJhO7Ck4PIl0TYKiMTmVFBujPbsb1pk5rJeB/eSrtK1nLWjicnIobQ0mf
 humQ==
X-Gm-Message-State: AOAM531NreP+cO80I15wioozcpxUG8zHJA5YnHENGVt20LLIJUq0FppR
 nkXXriyZEBm8372YeQr34y30cw==
X-Google-Smtp-Source: ABdhPJzp3KFQ+SQsem4sfDVHru0HVSXjbyVlnsS4yDRYWFDop64xr0sAk/GbsLri3TUvPPegU5uVew==
X-Received: by 2002:adf:8bc6:0:b0:1e3:200d:a363 with SMTP id
 w6-20020adf8bc6000000b001e3200da363mr20189447wra.105.1645531708678; 
 Tue, 22 Feb 2022 04:08:28 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 p20-20020a7bcc94000000b0037d587d4841sm2157977wma.42.2022.02.22.04.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 04:08:28 -0800 (PST)
Message-ID: <c5cd6811-d1d2-0ab1-067d-b200e225438a@linaro.org>
Date: Tue, 22 Feb 2022 12:08:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/10] ASoC: codecs: tx-macro: setup soundwire clks
 correctly
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
 <20220221131037.8809-10-srinivas.kandagatla@linaro.org>
 <YhOx+nQ/G+HNRXbq@sirena.org.uk>
 <d8f1db40-33ce-671c-2041-5f12608afee5@linaro.org>
 <YhPCWDmS2PV/AD1E@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YhPCWDmS2PV/AD1E@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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



On 21/02/2022 16:48, Mark Brown wrote:
> On Mon, Feb 21, 2022 at 04:11:56PM +0000, Srinivas Kandagatla wrote:
>> On 21/02/2022 15:38, Mark Brown wrote:
> 
>>> A lot of these commit messages sound like earlier patches in the series
>>> introduced bugs which isn't going to be ideal for bisection.
> 
>> Yes that is true, I did think about sending this as a fix.
> 
>> Adding a fix tag would not really make any functional difference as we will
>> be hitting the issue only when we enable pm runtime in codec and
>> SoundWire controller, so I did add this as part of pm runtime patches.
> 
>> Without runtime pm the clocks are left always on, so it worked so far.
> 
> You still need to pull this before you introduce changes that cause
> trouble, not after - it needs to be preparation for those other changes.
I agree, Will reorder this in next spin.

--srini
