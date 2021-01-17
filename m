Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2B2F963F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 00:33:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E83177D;
	Mon, 18 Jan 2021 00:32:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E83177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610926402;
	bh=E5aBlD0K4O6q2grlIR3UjUFBLfop0P8ckkAz8R/4ras=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umhempidoDwR85wq19uqZOdKLRzqoGHaH7OX3wtdWW0uJdvJkFqU9h0NH6HpnXgh1
	 Bx5gBJeELN7KCUy/Sln5DkBhaBbixRHjxMV9pF7EDjSCVI8Nw+10rZk84ULdAj6HbM
	 2RP2XxA8EqVd7J2wP7SFdRnhrK1sCA6RkgJZAJ7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85741F8010B;
	Mon, 18 Jan 2021 00:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9A19F80257; Mon, 18 Jan 2021 00:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CD01F8010B
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 00:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CD01F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JQu0gkJL"
Received: by mail-lf1-x12d.google.com with SMTP id o19so21484952lfo.1
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H8Z9/ZSAEmrFlwkMVk+Nep1g2PRuUGd/OosI/Tv5lXU=;
 b=JQu0gkJL/B6HWq2ogRHgtMZLnQLXsJOVvt+rI116ay6gI/1lMjFX5HG8utTEIS9PX0
 kJ3pNAyXpW3CZ8YUIFC+fB51sG2e4Jsq7Hp/GhYW8l8TPc8bWNDAHm99fvrkDP/yyHOy
 fqkdHhnqTFsm48UEhxJ6ceTMnwWQRBxUiQBPlsMytcWhwoOMvHWTfyxHi+nFWoWcBmAP
 1PsilHTJFi8+Zd2JHYkZvEzfEExitcnf/3J7J/7AtJF/7q9X4x6+OCZOfeCglFl0RcXm
 XQ1S/+IcGXCaYVjv4kK3tTYwi6bcuL07fPHHGcndj+1WFjW2woYXyeSoUE6eAQgJuVeK
 a8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H8Z9/ZSAEmrFlwkMVk+Nep1g2PRuUGd/OosI/Tv5lXU=;
 b=sypDV6m0NDhVpEkp+u4mVpP2lJVNLBY/u5g30EypHgtXJhMq+vm3kZcq31U5l0+oFr
 2dRavwnYhx5tzFb4T5XiXrl5lQ4E7RjYsqpvj8F8I/5+vdQJpSMbxXfl99z98wr7R9Hf
 YK0teAb454kzBXOkx1637ORdWARRvpAIPpNRB7G3MPlPcoVQtAclvDcqdtRa4t0I8EJb
 E84fCx0yA2Sp54GTqvoy9O4pjumbcZq0g08bX1dGGTrqBMXd3IxsT/DyqrgfY+HTY/NS
 2iqzX9wGAv2dLHxZQvR4nY0OzwV+62sPCoHmgmb0iLHf+Yop2Nr+ZYigafpnAkAMEIgQ
 l2DA==
X-Gm-Message-State: AOAM532oeuWFR/OqQKzUzZEjmOkYYDwkvW0kUE6ocN1L0msr1wM3AGb8
 eG8IrugmqW2LGr1gDWW6Ixs=
X-Google-Smtp-Source: ABdhPJy/vM8U2unQrywODC5Emgj5gvRF91iUTa4Q5N7Bh8b9f0OsJb2+9RRhl4ybkEkyC7BdEJCYUg==
X-Received: by 2002:a19:48e:: with SMTP id 136mr10074687lfe.357.1610926296882; 
 Sun, 17 Jan 2021 15:31:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id e9sm1700913lft.104.2021.01.17.15.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 15:31:36 -0800 (PST)
Subject: Re: [PATCH v1 1/5] ALSA: hda/tegra: Use clk_bulk helpers
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-2-digetx@gmail.com> <YAGzJM7BJqLV0xxY@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b84c6d9f-e113-e249-cd76-248e2cd646ff@gmail.com>
Date: Mon, 18 Jan 2021 02:31:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YAGzJM7BJqLV0xxY@ulmo>
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

15.01.2021 18:22, Thierry Reding пишет:
...
>>  static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
>>  {
>>  	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
>> @@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device *pdev)
>>  		return err;
>>  	}
>>  
>> -	err = hda_tegra_init_clk(hda);
>> +	hda->clocks[hda->nclocks++].id = "hda";
>> +	hda->clocks[hda->nclocks++].id = "hda2hdmi";
>> +	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
> 
> Originally the code did this in this order: "hda", "hda2codec_2x" and
> "hda2hdmi". I don't expect the exact order to be very relevant, but was
> there any particular reason to change it?

The reason was "to make code look nicer". This was a conscious decision
since indeed the clocks order shouldn't matter for this driver.
