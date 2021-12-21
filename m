Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 447ED47C2B1
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 16:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9BC0172A;
	Tue, 21 Dec 2021 16:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9BC0172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640100097;
	bh=BSt8XQOo+JHncej2nLV9PkIRn99jKAHiFT0FSeH833U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jWrp9GH1KhUtoVpPYM9ejTJail0zC5/TNthqXbjd7tmpsE2gOsK6WX4x8qyvBuRit
	 ZPTy2X4NgErb60dmpec7N8N8tRXE8JXTCCuoz4US7NlyVP91w9GkGQWH/lLvuroAol
	 pIyGhSgmUZGUNBAgOGAPXSeJq1+zHBkJYZqsg1LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEB95F80125;
	Tue, 21 Dec 2021 16:20:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 658E3F8032B; Tue, 21 Dec 2021 16:20:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E22EF80125
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 16:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E22EF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f9IEBoL6"
Received: by mail-lf1-x12f.google.com with SMTP id u13so22832477lff.12
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T0/ofZQcXMKN8oGRcoOw+6rBxR+Ouo3vIEIiIJRMs0Q=;
 b=f9IEBoL6YPTDCgse/LTTD0EcTxeFS0YUBjhbUXEiw90ce+dIIX0YifeeKcBEH82ejL
 aVniFH4v7kszbUJQFUMWC305rIEgsTiuRIzcygq7JpLrQQyi52f43Y/H/IMucahYIVCz
 qfpmLnK3GjZFRK3E+cyXC/C4U0iZ8qRjP6qzKOPhh5Z4ZW9nEuTAr0jz8iP63D1v+jfz
 d6nyrV8H5nM5BZkHWy692QH8AO7ZZlhb7V9nsKSEYZPknlMNM7DtnvUZ6JKp0WF5LZv8
 PpwasYPhJBSqPUJow1zplojiUC6+lEDDAvL/vngX12y4ylC9fOHh8hlOGtgMLzQa4xgF
 OHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T0/ofZQcXMKN8oGRcoOw+6rBxR+Ouo3vIEIiIJRMs0Q=;
 b=URFJaRQufcX1BpNsUmPGaapQJVebd5Up3iTxxrtW2Kc6TFj8a3uzQZoUZkVeYxg5fU
 nLtMdmiRVA1YkhZ6diuYQzAMMEigEE/Oab1ETW0j69GYfs+VRslON1+80DKlPc2wCHUm
 397hYZjWYak4bNFE6melFauRys2VfZJLnvmfBFiyPsqS1LlqyG1jVsUl/TPRHhrSTesc
 qkJE4keqRm+Tc5T9Q90Yy/6vQP5ny/PwTA0WeOY3XKj6SEBgivJRoO6KNGEuM10u+pq4
 xwtcRkQ5ApNZK8i3hGMcE+8+hQ9b5LfP/4uYM7WTF7DKScAexR6Rud4iAt5ljpZx/QpM
 AQLw==
X-Gm-Message-State: AOAM5339EVq/j2OprkksjUZA0x7pAY6Y/wblXROlLlkydWHAzonUgpRU
 jmBjJnmyKFd8oQlZ28EaRjk=
X-Google-Smtp-Source: ABdhPJyYwazba8NyvqSG6pdeP0ppzcRxJZtCBWlGDj7aITS6uJyAS6/6FfPvZNUUxuu60HRZMQxaaw==
X-Received: by 2002:a19:4f5e:: with SMTP id a30mr3465355lfk.228.1640100015228; 
 Tue, 21 Dec 2021 07:20:15 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id b10sm1134927lfb.107.2021.12.21.07.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 07:20:14 -0800 (PST)
Subject: Re: [PATCH v2 1/3] ALSA: hda/tegra: Fix Tegra194 HDA reset failure
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1640021408-12824-1-git-send-email-spujar@nvidia.com>
 <1640021408-12824-2-git-send-email-spujar@nvidia.com>
 <f859559c-abf1-ae37-6a0f-80329e6f747f@gmail.com>
 <f65ae56d-d289-9e3f-1c15-f0bedda3918c@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <46acc080-56f5-f970-a9fa-3a9ece0dd2a3@gmail.com>
Date: Tue, 21 Dec 2021 18:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f65ae56d-d289-9e3f-1c15-f0bedda3918c@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com
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

21.12.2021 09:18, Sameer Pujar пишет:
> 
> 
> On 12/21/2021 6:51 AM, Dmitry Osipenko wrote:
>>
>> All stable kernels affected by this problem that don't support the bulk
>> reset API are EOL now. Please use bulk reset API like I suggested in the
>> comment to v1, it will allow us to have a cleaner and nicer code.
> 
> Agree that it would be compact and cleaner, but any specific reset
> failure in the group won't be obvious in the logs. In this case it
> failed silently. If compactness is preferred, then may be I can keep an
> error print at group level so that we see some failure context whenever
> it happens.

The group shouldn't fail ever unless device-tree is wrong. Why do you
think we should care about the case which realistically won't ever
happen? This is a bit unpractical approach.

If we really care about those error messages, then will be much more
reasonable to add them to the reset core, like clk core does it [1],
IMO. This will be a trivial change. Will you be happy with this variant?

[1]
https://elixir.bootlin.com/linux/v5.16-rc6/source/drivers/clk/clk-bulk.c#L100

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 61e688882643..85ce0d6eeb34 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -962,6 +962,11 @@ int __reset_control_bulk_get(struct device *dev,
int num_rstcs,
 						    shared, optional, acquired);
 		if (IS_ERR(rstcs[i].rstc)) {
 			ret = PTR_ERR(rstcs[i].rstc);
+
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get reset '%s': %d\n",
+					rstcs[i].id, ret);
+
 			goto err;
 		}
 	}
