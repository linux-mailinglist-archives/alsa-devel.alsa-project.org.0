Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565092F7B28
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 14:00:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8FFB1704;
	Fri, 15 Jan 2021 13:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8FFB1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610715647;
	bh=YPpsvYwRa7vTuZiCqSPOpUelaLdBAflBP77yfuC8RWU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EcirE4KXjVWcQcC1PfyHQpoK/2lJEM74EpXdd1FP69wMEpEO3UDYVbNMM62CrNuz+
	 54hGUivBorI+xlhAacCvFAVPVnwk60kQHV/lBo31dA2P3Vz52zEP7+mcki6ksdplXK
	 d2DWEUsCnCDmI+kYktLpT2uLbakFXSEL8Qqv5eM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAAAFF8016D;
	Fri, 15 Jan 2021 13:59:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF9EF801ED; Fri, 15 Jan 2021 13:59:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5383BF80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 13:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5383BF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MhqrXC/d"
Received: by mail-lf1-x135.google.com with SMTP id m25so12952012lfc.11
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 04:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z88+UL1Kj6t4xLAfVZNrkkERr8HUHthYkN4y2Wjje3c=;
 b=MhqrXC/dYh36OxJjw9QxGR7fCLRbvk85JQynbg3YfDCRakvYIS2Kj7eLzV+qQseEZV
 I2fFwjm/LEiIi7w5QxR5ao4tXK9SNBWkBzwZpyvOreKbXTXhqBKbD0uWpuABKNazhKiH
 fxNhIsXG4Pgq7BgK9x8CvW123eDyZEzJo9v1yJM2YeyByXtqQBm2TewW3+kD4BvRHurr
 6Yk2+vbRYWhRL/5ftCxTyERNtjR1txQt4T6RDbefYMnjYipT5Hc2MKh4yqPZ4majDo3n
 f7UzJC2/z7cuJCur8u1TMvomCullcaLWJ+kQXuFurardizuUImGxfDRBr7ew1i6KFJvx
 FvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z88+UL1Kj6t4xLAfVZNrkkERr8HUHthYkN4y2Wjje3c=;
 b=qu6Y693Vc0J/Mz1Ll1HpRlfpjOM0MyTamLRNBmrMPJtBGftKKbTG3JN22vz8coJHt8
 VSlUiPD8GcAyFk8Rj/lOHaVZhHL5/ouRbxycsOTvlxCOB62kBRE8pLKPDEVV30HXVQfX
 fhRx0aWHFeJEA7c/X3TLRuUhMroDjrK2jfMpwZO01MsOANdPRMUZML5Up4X5gG8TBG/4
 NlhmY5daPyvxPosEf0xq0DjDZlnQ+t84+lrCwf1iTFx+FjzzUAGCcs6Qod8uY2k2JCvk
 fkPGKOi4qNWyVoQIN8Ee+bPcRpwhzG2KdHuo/37iCCcIDVpn9j6FFz6/ERvV/SOg8LMS
 yX3Q==
X-Gm-Message-State: AOAM533VTLg7pd6j9q9o2l0ruHuRNvEBHTf1FC5vRwblAW1r/lXOOidi
 Wq7JNrypsnJh5Wuufn4L8Mg=
X-Google-Smtp-Source: ABdhPJyEfV1U5TCVbyHg3GM67rUvvGiwT27nwjAQZNQRykEEs3obQTaas/aimmSJGg9/+8LvfXgtcg==
X-Received: by 2002:a19:4352:: with SMTP id m18mr3722258lfj.107.1610715546746; 
 Fri, 15 Jan 2021 04:59:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id s5sm909129lfc.150.2021.01.15.04.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 04:59:06 -0800 (PST)
Subject: Re: [PATCH v1 0/5] Clock and reset improvements for Tegra ALSA drivers
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
References: <20210112125834.21545-1-digetx@gmail.com>
 <d09b6953-fc74-9fbc-e66d-556df4674746@codethink.co.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fc95043e-1bc4-61e1-7d83-61aa7797ae0e@gmail.com>
Date: Fri, 15 Jan 2021 15:59:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <d09b6953-fc74-9fbc-e66d-556df4674746@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

15.01.2021 13:52, Ben Dooks пишет:
> On 12/01/2021 12:58, Dmitry Osipenko wrote:
>> This series improves the handling of clock and reset controls of
>> NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
>> resets properly, which needs to be fixed in order to unblock other
>> patches
>> related to fixes on the reset controller driver since HDA/AHUB are bound
>> to fail once reset controller driver will be corrected. In particular
>> ALSA
>> drivers are relying on implicit de-assertion of resets which is done
>> by the
>> tegra-clk driver. It's not the business of the clk driver to touch resets
>> and we need to fix this because it breaks reset/clk programming sequences
>> of other Tegra drivers.
>>
>> Dmitry Osipenko (5):
>>    ALSA: hda/tegra: Use clk_bulk helpers
>>    ALSA: hda/tegra: Reset hardware
>>    ASoC: tegra: ahub: Use of_reset_control_array_get_exclusive()
>>    ASoC: tegra: ahub: Use clk_bulk helpers
>>    ASoC: tegra: ahub: Reset hardware properly
>>
>>   sound/pci/hda/hda_tegra.c      |  86 +++++++++------------------
>>   sound/soc/tegra/tegra30_ahub.c | 103 ++++++---------------------------
>>   sound/soc/tegra/tegra30_ahub.h |   6 +-
>>   3 files changed, 49 insertions(+), 146 deletions(-)
> 
> I wonder if this will help with the issues we saw when the tegra is
> the i2s clock slave.

Probably no, this series shouldn't fix any of the current problems. I
will be surprised if it does.
