Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB731090D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 11:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0901675;
	Fri,  5 Feb 2021 11:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0901675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612520945;
	bh=uEEI5xtUaoAp1LiF+kaYyz2ytNilCFuoW/X58aiO4i8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GXbfMXJUXJOwvklTuqCW5/Hh0Jq8ugaUOxk+JShHbMZeLRMTqS6OfQf2HlGcvJl3C
	 zFM0Pv9QqcHATG9ab5vOEAgU/aPhyEvqk9BvN2VinqcaTJnfgzsVOItlkxYKX0cyD0
	 WDaQH3dF/qQGm6DTmp0jEOPd5lhiepNpLvqStpHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5585CF80139;
	Fri,  5 Feb 2021 11:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9A49F8015A; Fri,  5 Feb 2021 11:27:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B5E0F80152
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 11:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B5E0F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Rb3OZVEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612520836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Rp1DAXoKwp5REwuto3wxp77HAsY8NDKCCfTe7Gd61I=;
 b=Rb3OZVEMJjo21/Yq5gTBM6bAOaxU8xt0rVDsMcl4bqN+PjinEA97+Vs/d+kKoRND6+sf2y
 ZGDUTyKtEK6EC5Xd8+bjLSCXaGcGm4xmvQrqreC5gBb9diqUwDgE+fnCiu1nG0WYCKP2bn
 O8PChRj/1ycf6n749SZP5sxgrEKBurg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-t2x4AOLFM8CtxFDAkvyemA-1; Fri, 05 Feb 2021 05:27:14 -0500
X-MC-Unique: t2x4AOLFM8CtxFDAkvyemA-1
Received: by mail-ed1-f70.google.com with SMTP id g2so6737994edq.14
 for <alsa-devel@alsa-project.org>; Fri, 05 Feb 2021 02:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Rp1DAXoKwp5REwuto3wxp77HAsY8NDKCCfTe7Gd61I=;
 b=Np5yQ6ydlS2mEuPJoKyG+bprcwagf4zGM41aeFknmgi70lju9GFdIzuk8VP7q7bHfG
 OpHThKsWuZ7j4wJr74gQkNunKJkYhK3sCgQd3WMsDbeCmfoA6p2jUtSdGN3DNS2IihKS
 bqPIehakr/Xu6Tampqx+KapCOQM/2Oon1iopqFxA/rJny0W5G81WktHitrNyKb9NsJW7
 wBQ01J3F1bg5EoCi1Z0I9B4O4Kc6ZPMzJXMqSu1iU8fIQ1E95ppm+t4DA6bmYyi1Ec1f
 6lTHYFcAn1tj+D2gj9Vsg6uaSuC4Rsyuywn+Nl/NqQqVDhpEXCLCt+cLyrITNRt6+UIu
 9+0Q==
X-Gm-Message-State: AOAM531gM34ZmKm82u0wYv9YWwYmY4wLcDVuaHs8WADVgoFhterx38Gh
 aLj+M9mZ2jDAuZyDnlBoVFxfrKyJewLSfHn0g5BPevSw0s1yRtwPbu9n1KfnHuzgDNA5CrsL/Q1
 T0RxdXJdW7/Bqn6n5CuNCYnTFXWEhz/p2zmE6KDo0Sj2CyhsEcOPuqDLs+M4hZcwtQVuTnREg6c
 E=
X-Received: by 2002:a17:907:7785:: with SMTP id
 ky5mr3476377ejc.176.1612520833014; 
 Fri, 05 Feb 2021 02:27:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMeg8vtWuCF2yvK1oMI22FhfdUctuk7E5CMiQad8OqQUhNz1iB2hVXUKr+G1e2k93ewhGYbA==
X-Received: by 2002:a17:907:7785:: with SMTP id
 ky5mr3476355ejc.176.1612520832790; 
 Fri, 05 Feb 2021 02:27:12 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id f6sm1044759edr.72.2021.02.05.02.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 02:27:12 -0800 (PST)
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <CGME20210204112515epcas1p27a866811ba15a8cd8b0be9a3f7bf86e5@epcas1p2.samsung.com>
 <20210204112502.88362-1-hdegoede@redhat.com>
 <49c77228-75fa-8e0a-0cb9-57afdd3f6b86@samsung.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <cf5cbd8c-2e00-03ef-5c38-dc6a5b80cf85@redhat.com>
Date: Fri, 5 Feb 2021 11:27:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <49c77228-75fa-8e0a-0cb9-57afdd3f6b86@samsung.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

Hi,

On 2/5/21 3:00 AM, Chanwoo Choi wrote:
> On 2/4/21 8:24 PM, Hans de Goede wrote:
>> Hi all,
>>
>> Here is v4 of my series to rework the arizona codec jack-detect support
>> to use the snd_soc_jack helpers instead of direct extcon reporting.
>>
>> This is a resend with some extra *-by tags collected and with the extcon
>> folks added to the "To:" list, which I somehow missed with the original
>> v4 posting, sorry.
>>
>> This is done by reworking the extcon driver into an arizona-jackdet
>> library and then modifying the codec drivers to use that directly,
>> replacing the old separate extcon child-devices and extcon-driver.
>>
>> This brings the arizona-codec jack-detect handling inline with how
>> all other ASoC codec driver do this. This was developed and tested on
>> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
>>
>> This was also tested by Charles Keepax, one of the Cirrus Codec folks.
>>
>> This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
>> support for Intel Bay Trail boards with WM5102 codec" series and there
>> are various interdependencies between the patches in this series.
>>
>> Lee Jones, the MFD maintainer has agreed to take this series upstream
>> through the MFD tree and to provide an immutable branch for the ASoC
>> and extcon subsystems to merge.
>>
>> Mark and extcon-maintainers may we have your ack for merging these
>> through the MFD tree ?
> 
> 
> About patch2~patch6, I agree to take these patches to MFD tree.
> Acke-by: Chanwoo Choi <cw00.choi@samsung.com>

Great, thank you.

Regards,

Hans


