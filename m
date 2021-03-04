Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7332CFE9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 10:44:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B981AC1;
	Thu,  4 Mar 2021 10:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B981AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614851053;
	bh=FIJiafEf6khFY2RAj4QGuyHrR4IiW85Ufl2KkSNMOB0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCjQ4AYig9IqbRmD7BwItQ/uqiqEDpFi9Tw7v/4ADPv9dXW6sOQt3+T7ew0bEdgQ+
	 oO0j8zAlsQLuysvUqHzkM5pKbodZy98NptPgkWOTn93kfoFUymucp8HogUO9ULZhwF
	 pkdxAmn/L7PDseba0lrtJbPt9/DbGiDkOBtgUrsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F429F80271;
	Thu,  4 Mar 2021 10:42:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7868F800ED; Thu,  4 Mar 2021 10:42:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A6CF8007E
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 10:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A6CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MoIboQDU"
Received: by mail-lf1-x12b.google.com with SMTP id u4so42125474lfs.0
 for <alsa-devel@alsa-project.org>; Thu, 04 Mar 2021 01:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bEHZ/Frn9iwzx4diKW6uN1aBQ3lfmU4krVx1yJhDOA4=;
 b=MoIboQDU+NHyjg+PGQjitOqCTdZNe7jYETiwVCov73FkhT/WyUvCnqjTZlx4A8GmF0
 OIWew0saIIX+QnCvMdjsg7wKg+BlbKxOcfCGALVX9LG5HPd1mrb3/865f4wnWHriQ7Ez
 0RZHySAEchv/sekCYdT1+HrvImzUFLj2art5hVnN/BL9u2qLynJd1T3aQYyFJnhMPZX1
 wTvXT1dpo7nkiJmBhLmGmWZcuy2l5UkomZP0TqXkuu9CazCfi/IEMlqGPVCi062NE5L8
 msK4XEFkZzFbK1yvts1H5IJAOde4tE8I9PL2qYmv9vUTOJ0sFCmIbh7lx68Jx8oqElwL
 ROQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bEHZ/Frn9iwzx4diKW6uN1aBQ3lfmU4krVx1yJhDOA4=;
 b=kuQa/KHg17RAu37BlFWpyQ3+0Xf/k0jMEL2Ori+3GJmN124O/TqqNNeiIvc2RJsIfQ
 R7AL7reV5YVAWAL5uZd6unX1jRFNfAurwHsjgNctjNwtIeFsNm/1fV37RJF16m6YtMXb
 uRGUnKAfDaGGtO9lW3XZBKB8cfqwSDV1EScGmtQaTsmaqZ8zk8493pZglMvK7uQVZgAA
 fdNgHsR01z5AnXjL4WEOwGCnN3ziCznwQmAMExSOAVsHQbqDHk1XQHAG3yqW42C1J0Di
 W6Ho4DnqKGaZElF1Bo6YEgviRX/Pnk4VoVMCLiX6Hnaq6+8lDMga0sVTbqA4l4vRmt9b
 eySA==
X-Gm-Message-State: AOAM530OvMnzBKBVpqQUrAmPTwQw0ndBLkFOa4C5VOaGLMhuuldVj0ys
 2DnUQuFsEt2lQvIh6XUTFe0=
X-Google-Smtp-Source: ABdhPJxiTZQIWODAtj6+oKhwC7rv65S7mwjUAbzllukSkqBegigEZuay9DFOE/w38bc9b6Ft8KD7PQ==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr1730346lfr.421.1614850950963; 
 Thu, 04 Mar 2021 01:42:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id r11sm1638373lfn.30.2021.03.04.01.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 01:42:30 -0800 (PST)
Subject: Re: [PATCH v1 5/5] ASoC: tegra30: i2s: Add reset control
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Paul Fertser <fercerpav@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
 <20210302112123.24161-6-digetx@gmail.com>
 <cbb1f0d4-ddc5-733d-896d-dd76ce01ca69@gmail.com>
 <f581865a299091371a8450349e23ffdc8abb7b37.camel@pengutronix.de>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <26e504b7-1077-d43b-07c7-abe2bcf50cc4@gmail.com>
Date: Thu, 4 Mar 2021 12:42:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <f581865a299091371a8450349e23ffdc8abb7b37.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

03.03.2021 15:09, Philipp Zabel пишет:
> Hi Dmitry,
> 
> On Wed, 2021-03-03 at 11:28 +0300, Dmitry Osipenko wrote:
>> 02.03.2021 14:21, Dmitry Osipenko пишет:
>>> The I2S reset may be asserted at a boot time. Tegra30 I2S driver doesn't
>>> manage the reset control and currently it happens to work because reset
>>> is implicitly deasserted by the Tegra AHUB driver, but the reset of I2C
>>> controller should be synchronous and I2S clock is disabled when AHUB is
>>> reset. Add reset control to the Tegra30 I2S driver.
>>>
>>> Note that I2S reset was always specified in Tegra30+ device-trees, hence
>>> DTB ABI changes aren't required. Also note that AHUB touches I2S resets,
>>> hence AHUB resets are now requested in a released state, allowing both
>>> drivers to control the I2S resets together.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
>>>  sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
>>>  sound/soc/tegra/tegra30_i2s.h  |  1 +
>>>  3 files changed, 47 insertions(+), 4 deletions(-)
>>
>> ...
>>> @@ -579,7 +587,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
>>> +	ahub->reset = devm_reset_control_array_get_exclusive_released(&pdev->dev);
>>
>> Thinking a bit more about this, it looks like we actually want something
>> like:
>>
>> 	devm_reset_control_array_get_exclusive_released_named()
>>
>> that will request resets by given names and in a given order, similarly
>> to devm_clk_bulk_get(). This will be very handy for both Tegra audio and
>> GPU drivers. I'll prepare a v2 if there are no objections.
> 
> I do have an untested reset control bulk API patch that I've just never
> finished, because I had no user. I'll send you an RFC, let me know if
> you can build on that.

Hello, Philipp! Thank you very much for sharing the patch, it should be
very useful!
