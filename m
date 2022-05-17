Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C08752A4D2
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 16:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D566E1FC;
	Tue, 17 May 2022 16:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D566E1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652797617;
	bh=eg1rDzK5JCZNTQiZTyS2uIYaQeJShEwHUBL9c5hb3TY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AE+UX66laLQXRTukR9hnM5QclOznulIDTmO/2rnhcvt5o5eom9lnEOO1m0GXxStw7
	 e5Z58gF5IQnq9dDoPcGnA2VJ/lOvRzI52ZlT+kkKW+SUMo7eHQgQQSuX87rlch97aN
	 WlPEVCLFrl5fH5DVlBqk+Zjf2lvW+TeeZGi7jX2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 405C0F80310;
	Tue, 17 May 2022 16:25:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D64ADF802DB; Tue, 17 May 2022 16:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 486E1F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 16:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 486E1F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hYYzgjZY"
Received: by mail-ed1-x530.google.com with SMTP id n23so7715264edy.0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:cc:content-transfer-encoding;
 bh=8V6VIcJkal9li7ymSO5VT9QRNhGf46wYnc+DQ/xNrQ4=;
 b=hYYzgjZYsXnTltezQHqu8cqCOr+iZl6efeLeI2JZo9OeKs+Bsm5xYaXICnRQ/3lUGv
 2GSBXSGhUz1HfQ/QvNO8miRufVCvrzHKNwCNHON2TEZPPHwkk76Y34XnQN50K9z9Gchi
 ejjoGqxTxfVZfRXs53gi23BYshTQVpXMX60L3ptwbr9egBA5VuiPRakD1vUBoGw6EPzp
 p/UF4FAfRfl5UwxLMv+gpErf0awlm5LgmNrYJNN989XJQunb7LWYY0ef8YadXal8VDLt
 V0jn/ytSvuMw95GKaPQTvFcP8231GZICJOrDpNhNQr6+RbBMWaUIOTtqavzFPxG87LJ3
 PQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to:cc
 :content-transfer-encoding;
 bh=8V6VIcJkal9li7ymSO5VT9QRNhGf46wYnc+DQ/xNrQ4=;
 b=WWc2qBEKGvHRgeVoYpbTZQ/goW80UJz3vf8WjnWawl3gYmEqec5GfGpQtn8fIMgg6S
 62f31k7SH3DbZ5JlCqxAwtA4Wcngm2+efdgIDnSDT7kJGj63Q7A9VxHoNbMaHEGf5iWZ
 /frEcAc9Wz7DVp2SXpHH9bY+LMNKAjT0mFC9Sr1bqpCuYXJt+B6uERKdYeLvhI6HSI8g
 N+KXjo3S1EyJZP2DWv90X8SggMm0NXc35kNFuFDZ4+tddwDuAX0MPQZBu7A6Qnzbnk6u
 ST4kzfMEGh+MZ8EMd3/Fv2ibaAFfmr1ijwuyHcEHC4NqgRBI+v4H8eh9UBJakKY9ZOQU
 sCgQ==
X-Gm-Message-State: AOAM531VudIP6Mvw/xmX3ynWvNMj57YsvPvf7brK4chTUGYHm0P0t3VM
 FjQAgdlJ2gORhF9Ez0xxRkY=
X-Google-Smtp-Source: ABdhPJxL3eUfhDCs6Vt0GByDLaP/ejwfMbHQOvPJKHWjVxA5eBbfamKWaoJQJc2KgJG60u9FeJ0zyw==
X-Received: by 2002:aa7:dbd0:0:b0:427:4e6e:d779 with SMTP id
 v16-20020aa7dbd0000000b004274e6ed779mr19480761edt.27.1652797553214; 
 Tue, 17 May 2022 07:25:53 -0700 (PDT)
Received: from [192.168.1.110] ([178.233.88.73])
 by smtp.gmail.com with ESMTPSA id
 c28-20020a1709063f1c00b006f3ef214e63sm1088604ejj.201.2022.05.17.07.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:25:52 -0700 (PDT)
Message-ID: <2f331adf-6f95-06c1-a366-ea81b5bf6ec2@gmail.com>
Date: Tue, 17 May 2022 17:25:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ASoC: ops: Fix the bounds checking in
 snd_soc_put_volsw_sx and snd_soc_put_xr_sx
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <c2163c71-2f71-9011-3966-baeab8e8dc8f@gmail.com>
 <20220517011201.23530-1-tannayir@gmail.com> <YoOdauC5Q8POpHLe@sirena.org.uk>
From: =?UTF-8?Q?Tan_Nay=c4=b1r?= <tannayir@gmail.com>
In-Reply-To: <YoOdauC5Q8POpHLe@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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

 > No, the minimum value we expose to userspace is always scaled so that
 > userspace sees a range starting from zero and that's where platform_max
 > is referenced to - we're applying this limit before we start remapping
 > to actual register values. The code would be a lot simpler if we didn't
 > do this rescaling.

These are the results that I got from debugging my phone
which has a wcd9340 audio codec and a kernel version of 4.9.314:
The control is defined like
-- SOC_SINGLE_S8_TLV("IIR0 INP0 Volume", 
WCD934X_CDC_SIDETONE_IIR0_IIR_GAIN_B1_CTL, -84, 40, digital_gain) --

Now the OEM mixer_path.xml file defines the value of the aforementioned 
control as 54
which is read by the user-mode Qualcomm HAL, the HAL then uses the 
library libalsa-intf
to issue an IOCTL to pass this value directly to the ALSA driver.
At this point, the snd_soc_put_volsw_sx is called and the $val is 54 as 
expected.
$mc->platform_max is 40, $mc->max is also 40 and $mc->min is -84.

The problem is that the snd_soc_put_volsw_sx, checks the userspace value 
that has a range
starting from 0, directly against the $mc->platform_max value mentioned 
above
which is set to 40 at that point so it checks for the incorrect range.
