Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C7161E5D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 02:02:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AB05166C;
	Tue, 18 Feb 2020 02:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AB05166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581987722;
	bh=cPu0yeLIOxtLIBiES+iYkVIZVwZc3MSy6vA8v5xhFjA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsDRxa8RNNzTKoXm95YquPrbb8cMgrPo4MmS8480dVY0W5/L5Dk6uwZDWvqOUivnC
	 kKtU1LetNwF0mNLYxZjuChAELRaL7OubEavUjov7cs7satS5ZnrEfeDiLAFATefjw8
	 6oxHfaMFPzJxzn29qiIGgSfKEzif7t736ezxTRRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6417CF80172;
	Tue, 18 Feb 2020 02:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6626FF80172; Tue, 18 Feb 2020 02:00:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0E59F800B6
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 02:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0E59F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sfe5YN1O"
Received: by mail-lj1-x243.google.com with SMTP id d10so20912147ljl.9
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 17:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N3Wa2BGzPuFtAt4Hvp1UfThMFJPTB2GMc1k1np2GKU0=;
 b=sfe5YN1OtoDO+kekL/Xz4/fWFMfVhU6pzKL8YOgzJQD3luNHeLeXmr+NtbNbHzHNfl
 h18FQuBh6ucdum9WYBnUXurSnMOIOo3TblCnfNS/ccQYsk2SJvl1IeNKXGYG07FV6+bR
 cfi1uJFeJeqzQ38t5O1sa1j1E/kOKKvT8WZ9BP+uIh6Gq3x1u2fO9QvV8hIXnS71uzqV
 ruveI2mT8tKWW5IvQjlppD2rsCGC9WwkGeVAglKs+Wj7VFhSaIJO2Vsqbh/ZHWcyj4M6
 DXJhh7TexQlxvg90SIt8vXVqe14SKpbTmey9+55/e/D4Q4jD4vz+s5if9U/ErQPfoFS1
 I7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N3Wa2BGzPuFtAt4Hvp1UfThMFJPTB2GMc1k1np2GKU0=;
 b=TmaK7hwz+BIlDQYQyprp2vrG9nuGYQnEh6OXcIQz9hJlG8MBW9Dki7UmuaKLDRCceC
 2fDovMo3dv12zLmDPqt9CrsgK/lywCpNYoSw4bcvd0DEFDxXFhWtT+rdroVeLP6MSIor
 /FkXeGuxB2JYXH03EFBNjUZ5Y+fvqsmKeheELnTgw8jaDqJsuFro11LNN6F4cWRQzie/
 fXN1iXQZe3CGcs1wr3rxQ4PbSb7300h9g2+6FeN/fRR5wbie6OeF6uSf/OAyK0mchgXw
 3htL2dl9vrB3SjsuPzAS4e0pKFHR1oLWKMAh0q6eItTkioBNXzd6FHvy5ifvFH5ZLrTv
 K0qQ==
X-Gm-Message-State: APjAAAUbRHh6yVDxQrkxTkh8wCamFCYZ9C59qDHN3PRcw5IB/W+f92rf
 pD3e0ojsT8h/y5QZ/KqYpfQ=
X-Google-Smtp-Source: APXvYqxl0e2saUaXkBe5/Mraz7tV+hghoh3F+M045Hp3wjrFqzmf1QxgPCmplNEo0DL99MdfIIB+4A==
X-Received: by 2002:a2e:809a:: with SMTP id i26mr11565660ljg.108.1581987615650; 
 Mon, 17 Feb 2020 17:00:15 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id u16sm1315815ljl.34.2020.02.17.17.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 17:00:14 -0800 (PST)
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
To: Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
 <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
 <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
 <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
 <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
 <c6022a93-b79a-c691-1d75-d007d0b64ead@nvidia.com>
 <3b42c858-733b-0d17-f457-8043d97f5058@gmail.com>
 <62b8ffbc-aa32-ae44-6cb4-b176b8ba9b0e@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <847739f8-6f54-cf64-54b8-94707944850b@gmail.com>
Date: Tue, 18 Feb 2020 04:00:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <62b8ffbc-aa32-ae44-6cb4-b176b8ba9b0e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, atalambedu@nvidia.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

14.02.2020 17:05, Jon Hunter пишет:
> 
> On 29/01/2020 03:41, Dmitry Osipenko wrote:
> 
> ...
> 
>> The !RPM case isn't supported by Tegra anymore in upstream kernel. I'm
>> trying to help to make yours driver better and gave you reasons to
>> remove the unneeded code, while you're keep saying that "there is no
>> harm to retain it", which is not a reason to clutter up the code. I
>> don't feel that it's worthwhile to continue arguing here.
> 
> On further review, it does look like a reasonable argument to get rid of
> this now completely. Like you see less clutter and the soc-core should
> ensure that the card is shutdown before unloading. OK, so fine with me.

And the RPM core ensures that state is synced on disable, sorry if I
didn't make it clear before.

+1 for less clutter :)
