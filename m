Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 057F02743B4
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 15:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 909EE1721;
	Tue, 22 Sep 2020 15:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 909EE1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600783175;
	bh=ynBjVWh9o2dxKvBCNDTWVT6qgwYYPCdMGKlmWcUUVW4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bXDzSKhnQHM94J1178h2HqdA3p8Tq4sp38f4MInU0G8rPIg2h9oBCUhoh2fFvw206
	 lbBvn76pfMcs1BLgEqGKQ12KWGD7vuYAFpvpQ3MoQkhu8Z4TumYbCWyfROzEpIu0P0
	 zEWQtaxpvjCAaql1bNP7SlPc80Ix2XeXoGHEL/F4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB5E3F80234;
	Tue, 22 Sep 2020 15:57:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C423F80232; Tue, 22 Sep 2020 15:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C30B1F8010A
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 15:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C30B1F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UT3Jyknq"
Received: by mail-wr1-x441.google.com with SMTP id t10so17193875wrv.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DGZVXpkjzjAC3dg7W3FDDgroJ+KRU7eRW2TjieEPGOs=;
 b=UT3JyknqdxpX0GVGQvqz0KGFU3G+44tECHiTJakqfTgxQfmfx17OKkiR9ajC1sX3Xp
 CJU05LOZPCOyqUTWXjt12eYomA14K1WKduDmbnwifPLFF9XhOKtdIvFriDxX++0LtvoH
 RAYdkKwHwnaO1+1qdGGZvBsTpGkC9ve/8ljnfOll4DsvuNHOfTKfwg2+dYqhevVNxFy8
 N4IU9aO89d7RpgKoIp1V+7YDO3BvOYxl1MxeR3Gk2v/sQ1Npv5ytDindtqat7oiEj0XC
 x6E1dlEo8ScoTW37+iY14WChjlKXgt3h+aHwvG4SSYZerJY5INGU78zahzWQOgUoYXHw
 FBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DGZVXpkjzjAC3dg7W3FDDgroJ+KRU7eRW2TjieEPGOs=;
 b=ZHl6ePYyzrA77SmcuBrSzT+LcSnJLJEvhjcrCKyj7T5bSQapd+s5bPAHTbVuHGlTxf
 N6+0JfWW+FKEjp7QifKFFHRVFWlQWv+t6qxzzCoix4Gl6aRncONWAv2z65dhyJXfajT/
 TOgSU6Qa2oZMC5kTbliqA6iJxak+cZAYwowkHglbu56N+2e9z4w4i/IPHDy/1ZPEAzTr
 EwqkCydmM6xnF1AEdjHjkuyVtXIjl+ZQHIlcXIHAKUckXxZ4WV6c5lvfTMniAUMKA56S
 Fd8My8VGDTO0hev440QUGIICxDjvCBlrkqFq5B+sCAW5vTaFQwFcQD9hFkxzOHOAnDyL
 W4Qw==
X-Gm-Message-State: AOAM533LFaTAuRN6yaZ/qYuISi29GQjnIpFr0r+9zKxgAJ+cok//qxq2
 INb7CXiYnaQxuy0exmXvQzadXA==
X-Google-Smtp-Source: ABdhPJxpJEG80evddGcTBWHxSsTnTTMSk1RXYjfsOksHLJyqxlBLEQ6HPFNPDCpHk8sVBsEHqBKKew==
X-Received: by 2002:adf:e852:: with SMTP id d18mr5881170wrn.40.1600783062860; 
 Tue, 22 Sep 2020 06:57:42 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z9sm5085802wmg.46.2020.09.22.06.57.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 06:57:42 -0700 (PDT)
Subject: Re: [PATCH v6 3/5] Asoc:qcom:lpass-cpu:Update dts property read API
To: Rohit Kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-4-git-send-email-srivasam@codeaurora.org>
 <040290a8-26a3-ab9c-04dc-beb23ee827e8@linaro.org>
 <20200922110825.GN4792@sirena.org.uk>
 <3866ce69-b7d0-5eb5-e0aa-874d150cd47a@linaro.org>
 <20200922114319.GR4792@sirena.org.uk>
 <7f682cf9-0f2a-0227-d5d8-8bedf1f06b00@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6b80f060-cb96-1cf9-69bd-f56f7934747a@linaro.org>
Date: Tue, 22 Sep 2020 14:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f682cf9-0f2a-0227-d5d8-8bedf1f06b00@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-kernel@vger.kernel.org
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



On 22/09/2020 13:53, Rohit Kumar wrote:
>> That's very much specific to reg, it's not true of the use of names in
>> general - Rob mentions cases like interrupts for example.
> 
Ofcourse using names suffix for clocks and interrupts has been justified!

I don't mind having dependency on reg-names as long as Rob is happy with 
DT Bindings!

--srini


> I see that patch to support hdmi adds another reg-name along with 
> "lpass-lpaif".
> 
> So, platform_get_resource_byname() is better option.
> 
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, 
> "lpass-hdmiif");
> 
