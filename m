Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0C463BE0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:35:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B531233B;
	Tue, 30 Nov 2021 17:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B531233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638290102;
	bh=opMAp361KP5liz1gZEs0ZUJlXSfb3EZNmu0sVXW9JKE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MhU3brL10fjbrtA33HJ5TSUkcJZUOGcL0776jRQKsb7fKCdyV52E5PYQxj9uyGfuC
	 /j/aLnYMtDIu6ILJ7lGge09miaYLehMSyhRBiYeBHIYQ4+oZagX+lUBrlJAcq1XOkw
	 KNVvSx2+PiEUo65eugIrlSLI0u+d9GnoDY65SqRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F894F8020D;
	Tue, 30 Nov 2021 17:33:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BCFCF80290; Tue, 30 Nov 2021 17:33:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F012F800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F012F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="P0thRGyl"
Received: by mail-wr1-x429.google.com with SMTP id u1so45683599wru.13
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HRnctZBN3KhAIJkBe2HZYJWNwVrPzx0pDMVoslI75XM=;
 b=P0thRGylkwgkwe5JrcvGJEUyRiKjZaaVV/oow9f9vVq0QSt5xQL0NDr4uvHuqheUew
 XrvKbxvZ/TyA6p68OGvEJKqzxsPewzFwIR9g2aAAoQTS7IvGBEsxRzb6hG8N00HqgHZF
 vWZ9JGHbAVV091c64Qde1cvjR19LiIqfFgRat+Cxaa3B3SJhh61gWJ0IGCu++7BauNu1
 W9Isf2WGFXwxEeZz16gNViyZSn5VCq1rMUED1A1eobCGk+tf4Vs+bViUodqAt2wosY/+
 4xk87MeAWqnQc6ge/zsURP7UAb6zuNL/eWqxLoltJ7zlniTHqxyy1vybnpqcz0qkmluU
 cqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HRnctZBN3KhAIJkBe2HZYJWNwVrPzx0pDMVoslI75XM=;
 b=EP9jHi/nHuMpxO7aII+Nban3Q+kw/NCj0KZV7IP5eZrceBBf6T/TJFV5wEYycghXrB
 Vxr8E8/Vmw944OANIOwgUaqyRqEixCkFJvQh+3DafWXinblVAFg6bkxJ4SKfWOdGCkbm
 EEiiHC5ljPARJRHDsVvF75mfy/8R4Fxmyz3/WhJxNjiS28X6cvT57nZuugVGijDbQ42E
 2q6QJHnb/rv6teGESSK9ODRImnVK7mc7PeGmsoSvMuZY/UmIIq2vUfxeC72z8VdH/Ogq
 1TMYSvv33EH94H0Kht9wRpxccM/rUORNchYTzoXl9y7F63NIkYjhxtiLOWkheMgL9DJe
 yCCw==
X-Gm-Message-State: AOAM533M6Cmv0n+D2ZG+NApSdayr91ryKBfdNuMBp0vrZMaUA27nDUpz
 8LWGfLQMV5TCk5Lg13o/S6dZVg==
X-Google-Smtp-Source: ABdhPJxDvVSIxypQLPI5sKKXXwPixI86qAmokC49hWqFpxnWDPCBTHPW5JcCFMMIkxCEwqb7AKMsQQ==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr33081wrv.102.1638290020056;
 Tue, 30 Nov 2021 08:33:40 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id t17sm3325441wmq.15.2021.11.30.08.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 08:33:39 -0800 (PST)
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: remove redundant ret variable
To: Mark Brown <broonie@kernel.org>
References: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
 <20211130160507.22180-3-srinivas.kandagatla@linaro.org>
 <YaZR56MLanjnQH1p@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8279f250-59cc-368d-13aa-b46cc3cb108e@linaro.org>
Date: Tue, 30 Nov 2021 16:33:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaZR56MLanjnQH1p@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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



On 30/11/2021 16:31, Mark Brown wrote:
> On Tue, Nov 30, 2021 at 04:05:05PM +0000, Srinivas Kandagatla wrote:
>> return value form snd_soc_dapm_put_enum_double() directly instead
>> of taking this in another redundant variable.
> 
> Cleanups like this should come after any fixes in a series.
> 

Noted, do you want me to resend a v2 fixing the order?

--srini
