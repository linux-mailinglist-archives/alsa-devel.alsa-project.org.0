Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59212308B64
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 18:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDBFD845;
	Fri, 29 Jan 2021 18:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDBFD845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611941481;
	bh=o6W8a4N2PWdiL0MIBXXMjCaT18XZOAOsBps9lKs1LWo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KSe7IYBbAoJBjuwrrOa4ubYTklGXIkT9HORVxQcNeoLX72rLbIJDOxjeVY8mL31Jd
	 28y6fAjPXY8XjQpOJfbOU9kV4dwlVT6BEm0QIxER3W2ffSW0d9b3tYyRe6eXgkaH1H
	 mGAqx/dy4RmmQTcM1jBfrtJkiRCuFlIQ9tYUk4HU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C11FDF8025F;
	Fri, 29 Jan 2021 18:29:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E3C2F80130; Fri, 29 Jan 2021 18:28:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF928F800EB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 18:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF928F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E5Eq5LjE"
Received: by mail-pl1-x62f.google.com with SMTP id h15so5583590pli.8
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 09:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=i4YXa9+oUVNsluWZqNeovQVGehxzdePq9D0BS8DMKkI=;
 b=E5Eq5LjEJ+KIvRT+gUvCHdCqXHtL+2IBSs2+2T3BN1qup9kTDA7YByXqA0IL8aQCA/
 x+qK5yuFPe/j7VNGh/QciE3y4YK9+JTq2zA/52IfvaA57pBXYpLG9pIlJOL+F582OtUt
 20ueM+D5WkPieuuGVSmqiY4PacI3HgmgXys73AnadyATMeI+VHwG3X2GuMCLu0SS7jzZ
 CZTTKAPH2VNFMRlxapHzPj8c6nE4qPns+rxkJjZGRng1F2/FeP93J2MU7snAR1TgkMv9
 7c1y15pcyyISmV2BiGhVPS9pOzjyT3SH9uvK9Rr9hMfI0X2gM8eIeIlIkzyBcMc+Ul3w
 pB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=i4YXa9+oUVNsluWZqNeovQVGehxzdePq9D0BS8DMKkI=;
 b=q+wh3i+0SYiJnFU5OahVb0N2oYmmTYGmGGVCk0rabxwvFxgvYVB+6AD44+lqq1BMFB
 WoqfuhKvjuHu2bFxSSLTFVdJTqJR5xC+v37taW5Dz9GNpX7H4xIiCDvG127VUhhw2yRc
 mY1pw8bXNHyAi4LRaWwAqrwM+IYyPBCXIraR1zqa7j3uALnlU6IY43RGFLx/TsovaYVJ
 V9AHBrTi6muO0HOLTIp5fxMWtRrHH9M/42zSr96+v28Ps0GOl6lCs94/HooGjLfuytXe
 ibkEaZFXsw+CRRIrJCNw7k6C9BtALi7r3xr5je3jBRIg6/Z41P/CwmJkC0GwqVqf8Si4
 sZhg==
X-Gm-Message-State: AOAM530dBSw5q4Vc40DhZu8Qla10trJMZ0DtfX7fsmF2l3xg8+g2dbNJ
 g9fQlE+8nF1jcj+mUK7CQaE=
X-Google-Smtp-Source: ABdhPJwpob9XLa+enm1Bvj+AMTD2zpUuszy1UGCflSG1OYghuF+vKjPh09cWTnrk+73gxOglOxlNWg==
X-Received: by 2002:a17:90a:4bc7:: with SMTP id
 u7mr5447970pjl.51.1611941323248; 
 Fri, 29 Jan 2021 09:28:43 -0800 (PST)
Received: from [10.25.100.162] ([202.164.25.5])
 by smtp.gmail.com with ESMTPSA id w186sm9110790pfc.182.2021.01.29.09.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 09:28:42 -0800 (PST)
Subject: Re: [PATCH 4/8] ASoC: tegra: Select SND_SOC_RT5659
To: Mark Brown <broonie@kernel.org>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
 <1611920470-24225-5-git-send-email-spujar@nvidia.com>
 <20210129124454.GB4560@sirena.org.uk>
 <d6cb9252-246e-d6c7-7500-5f1d1823325c@nvidia.com>
 <20210129154858.GE4560@sirena.org.uk>
 <a5a8df4b-21d1-0a12-df7d-9e94c353e2b5@gmail.com>
 <20210129171954.GF4560@sirena.org.uk>
From: Sameer Pujar <dev.spujar@gmail.com>
Message-ID: <2f7e3949-e6b9-6940-94a4-6c1cea3b8db0@gmail.com>
Date: Fri, 29 Jan 2021 22:58:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210129171954.GF4560@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 lgirdwood@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sharadg@nvidia.com
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



On 1/29/2021 10:49 PM, Mark Brown wrote:
> On Fri, Jan 29, 2021 at 10:15:51PM +0530, Sameer Pujar wrote:
>> On 1/29/2021 9:18 PM, Mark Brown wrote:
>>> If the user wants a given CODEC driver then they should enable that
>>> driver.
>> Above card driver is intended to be used on multiple platforms. DT has
>> already a way for user to describe the CODEC connection required for
>> specific platform. So idea is enable these CODECs from driver point of view
>> for this card driver and platform DT can use what is required. Also the
>> CODEC driver will be a loadable module here.
> No, you're missing the point of a generic driver here.  This will mean
> that if someone wants to build the driver into the kernel for their
> embedded board they will be forced to build in every CODEC driver
> someone has decided might be used with this generic driver, and even if
> they're building things modular someone trying to cut down the size of
> their kernel images is going to at least have to spend time building
> CODEC drivers they don't want to use.  Distributions should just select
> all the CODEC drivers that are available in Kconfig, people configuring
> for a particular target audience should be able to build only the
> drivers they know they need.

OK, will drop this in v2. Thank you for details.

>
>> If above does not seem fine, alternatively can I just enable CODEC config
>> independently from defconfig?
> Yes.

