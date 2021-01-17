Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 429512F964B
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 00:41:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DA317A4;
	Mon, 18 Jan 2021 00:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DA317A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610926884;
	bh=EQns6O3/HANrtmtX0iOc9erm4CUfL5eHcVWAQ3NtVfg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPL2PKLBlvpEWbpBOq39/QSeSuuV+sL6ofCj+pxc1GMlx5wPtAl5OSAUs+w1iKurz
	 4XDK6+BuipLSKFIub4BCe5H/DN67dIbYe8Kof8qUT0d9Jo4UW2dAxCvluBEDRzxkfz
	 r6tk75t3gnsugirUmLX8REUF2MzcxtXXoLUdnPMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51CA6F80255;
	Mon, 18 Jan 2021 00:39:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1246F80257; Mon, 18 Jan 2021 00:39:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7CBAF800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 00:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7CBAF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pr4QwEDq"
Received: by mail-lj1-x236.google.com with SMTP id w26so16408144ljo.4
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 15:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NngRK7zKNQEF+k0hgglhDJvcUtXRLFvpYKiRlc5M6rc=;
 b=pr4QwEDqGnedesfeXXPipZLlwCKrn6jQpn8s0M9nhIOoANbd0LkoDrZ1TENqBjv7DQ
 BqzJNy99yIusnGtFVQ83ovXwG4RaUOgfuyXTJfFqquIrdsms0VBOg25p7Ut4fqD1M+Nj
 NUcnOClla9QqliHtwsVnnekGNiPl19vJTBDiCeEh+okvdKD70lQY38mvcNYgbz+4MPso
 7Ny5vci36OYriOUiqDnbVS+zFOzZGnaV1CJcUTD4QNOH3bEfLSmNnVUzPYgjdMc4rXT7
 OtkBsZhzKah+jSo8C0/si4Vsf2dBUcQ1fRLOAdgj977IU7mfwS1K8rfsvp5a8V6HKoTd
 R+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NngRK7zKNQEF+k0hgglhDJvcUtXRLFvpYKiRlc5M6rc=;
 b=H2pOT0gUCLqxAYNs7RxT//pvaIBD/DygwSFoH3bQdTPXmCBOAuiCVReZzht43JZETh
 yFZzLqWiX/i2CnUA6LCrvi6P84heAWqJXROR4DV6B07jBzLnTv8LzptqF5FKEPB+1vec
 4O0UDnb1n0imrWdbv9kdYElCICxHcZWaadh4iZqvOO691eNKZPxtapxx/vEORiGybnpU
 La6WG555LVt1X28zqX72F7oSBcnaLW/RVzlc7w7htquxkPRaaDfi+v2LPu4djvE0bLpv
 mXnt7BLF6juKIkIwnkKTeegnRW2ayu5Mh8Tkl+MvBs0MUTXUBQSaUIpgjwqPLvLYMz0X
 rZyQ==
X-Gm-Message-State: AOAM532H1G6HrLOoH0H73OJUdEWcWd61SCeKQxbhhIIaEixLymzOVvB5
 e6q/yyaU/uaca7Ru3Au1P7c=
X-Google-Smtp-Source: ABdhPJxGEV31xC98dlLp7kilDrh+7rKsEeO12+SULku6Sq8uVrJGDj4ACHuNWm0Cel+Su8Atu+R8lA==
X-Received: by 2002:a2e:b6d0:: with SMTP id m16mr9116160ljo.133.1610926778317; 
 Sun, 17 Jan 2021 15:39:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id y24sm1522328ljm.125.2021.01.17.15.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 15:39:37 -0800 (PST)
Subject: Re: [PATCH v1 2/5] ALSA: hda/tegra: Reset hardware
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-3-digetx@gmail.com> <YAG2K4CjtCdSs6P2@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e26bac65-7cde-439f-a353-3b960691096f@gmail.com>
Date: Mon, 18 Jan 2021 02:39:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YAG2K4CjtCdSs6P2@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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

15.01.2021 18:35, Thierry Reding пишет:
> On Tue, Jan 12, 2021 at 03:58:31PM +0300, Dmitry Osipenko wrote:
>> Reset hardware in order to bring it into a predictable state.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/pci/hda/hda_tegra.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>> index 4c799661c2f6..e406b7980f31 100644
>> --- a/sound/pci/hda/hda_tegra.c
>> +++ b/sound/pci/hda/hda_tegra.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/moduleparam.h>
>>  #include <linux/mutex.h>
>>  #include <linux/of_device.h>
>> +#include <linux/reset.h>
>>  #include <linux/slab.h>
>>  #include <linux/time.h>
>>  #include <linux/string.h>
>> @@ -70,6 +71,7 @@
>>  struct hda_tegra {
>>  	struct azx chip;
>>  	struct device *dev;
>> +	struct reset_control *reset;
>>  	struct clk_bulk_data clocks[3];
>>  	unsigned int nclocks;
>>  	void __iomem *regs;
>> @@ -167,6 +169,12 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>>  	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
>>  	int rc;
>>  
>> +	if (!(chip && chip->running)) {
> 
> Isn't that check for !chip a bit redundant? If that pointer isn't valid,
> we're just going to go crash when dereferencing hda later on, so I think
> this can simply be:
> 
> 	if (!chip->running)
> 
> I guess you took this from the inverse check below, but I think we can
> also drop it from there, perhaps in a separate patch.
> 
>> +		rc = reset_control_assert(hda->reset);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>>  	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
>>  	if (rc != 0)
>>  		return rc;
>> @@ -176,6 +184,10 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>>  		/* disable controller wake up event*/
>>  		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
>>  			   ~STATESTS_INT_MASK);
>> +	} else {
>> +		rc = reset_control_reset(hda->reset);
> 
> The "if (chip)" part definitely doesn't make sense after this anymore
> because now if chip == NULL, then we end up in here and dereference an
> invalid "hda" pointer.

Okay, I took a note for the v3.

> Also, why reset_control_reset() here? We'll reach this if we ran
> reset_control_assert() above, so this should just be
> reset_control_deassert() to undo that, right? I suppose it wouldn't hurt
> to put throw that standard usleep_range() in there as well that we use
> to wait between reset assert and deassert to make sure the clocks have
> stabilized and the reset has indeed propagated through the whole IP.

The reset_control_reset() does the delaying before the deassert, i.e. it
does assert -> udelay(1) -> deassert.

https://elixir.free-electrons.com/linux/v5.11-rc3/source/drivers/clk/tegra/clk.c#L133

The reset_control_reset() usage appears to be a bit more code-tidy
variant in comparison to delaying directly. But I don't mind to use
delay + reset_control_deassert() directly since it may not be obvious to
everyone what reset_control_reset() does.
I'll change it in v3.
