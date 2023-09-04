Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF187917BA
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 15:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DFEB83A;
	Mon,  4 Sep 2023 15:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DFEB83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693832630;
	bh=llcHQ4/tuM/tB/3yOSpMtp6fFrJIrZLcCI99t3dB1AY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=saBp5IbW4gWJrygele5xRGxTJmGAnBIT18fZ1GnsnRSRgCKNCHS8FMoRWUkYfwHzC
	 +jvb2pd4UJT+5Hk5lPXt7ojXpuP0V6LwA7oao02VVOLShHPtPcfierOW7OXjq8ce3o
	 stoyNodMBBCwXqph7DLd67VndVox8PlRFG75PC4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 989A2F804F3; Mon,  4 Sep 2023 15:02:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 529B0F80431;
	Mon,  4 Sep 2023 15:02:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE46CF8047D; Mon,  4 Sep 2023 15:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 085EEF800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 15:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 085EEF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zwV4x22I
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce52ef4so1986905a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693832553; x=1694437353;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sP6V8ajHXT6yKSyr1cE3yHGsY7qGhYago0ofT+AYzCU=;
        b=zwV4x22I5n/BS/3ohn/9gjZwGACmWTckIGl0nGaYdwhJxCyjAYYm9QSXErihXz224L
         3AbcKhMxIL7t2sriei+fsXj0EQ/5sAkW+5jQSDLizzUK1huHCA6k0jpQM2F6jF+ru7fC
         efNd/alt80gQYQfpG1r1Ud+V0JbFUK0fnHFtgyAF4AF6i+od9vkbAqip78ZDm9pPUUQC
         S23ahs5UfoqMN1yvI7zgUYmYbmvptGKV4CfaRVl36CiArRX1nNBKKFKxNfTs4hg0GiaS
         pkAlLnofcPdndy2q+KJwd+ifIu2a3sAiy1RTFgR67DRyVk7qvS6dcbr8YVNDUq6QW60S
         pcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693832553; x=1694437353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sP6V8ajHXT6yKSyr1cE3yHGsY7qGhYago0ofT+AYzCU=;
        b=QrCzqOjMvtQNX5lDTilTt9jMTbXeD3ccdgToYsT8KTeR+eLrlcer7hfzFd+7GoYqaH
         JNhMmidg69rMjf2ja+jqq0ma7R3W+j+RdK/wTDyyVvjc5KLEF0lr+QHz0VhQ6vOjURFo
         s7WJT88o2y6KMreXKxQbhXl8WTAify83LOXjQv6YZrWYFnp1iTN08lWlPteEc1xROpop
         VYMSVoyo2n+sn4s8ieMwLz5jvySJG7LZLyLs8stlL3At59NKTfUe9uhVsV0hhpOCylF/
         6JBD5bd7rUE+2p6s54rLCmmccidavCwz7geXP7P4Bastf8RaFVpznbefZGHETIxjFjPE
         JAxA==
X-Gm-Message-State: AOJu0YyipHGLZmqpntVnUKD6ZjqQdkLAROMJKUIXOFEZWzKs5wGYsYMP
	X2ToTCq44lTqL2BGUckGx+CYmw==
X-Google-Smtp-Source: 
 AGHT+IEJBeHsLqYueJWcEkffCP4VVC/CZWWv9130Yc9xYYY+tD0WJm6tOAoS2L8e8K1eUs77UXHirg==
X-Received: by 2002:a05:6402:b30:b0:523:4057:fa6e with SMTP id
 bo16-20020a0564020b3000b005234057fa6emr5866008edb.42.1693832553657;
        Mon, 04 Sep 2023 06:02:33 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 x26-20020aa7d39a000000b005257f2c057fsm5839006edq.33.2023.09.04.06.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 06:02:32 -0700 (PDT)
Message-ID: <0360d279-b535-f3f2-9651-07dff2df2e37@linaro.org>
Date: Mon, 4 Sep 2023 15:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw87390 amplifier driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: wangweidong.a@awinic.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, rf@opensource.cirrus.com, herve.codina@bootlin.com,
 shumingf@realtek.com, rdunlap@infradead.org, 13916275206@139.com,
 ryans.lee@analog.com, linus.walleij@linaro.org,
 ckeepax@opensource.cirrus.com, yijiangtao@awinic.com, liweilei@awinic.com,
 colin.i.king@gmail.com, trix@redhat.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhangjianming@awinic.com
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
 <20230904114621.4457-4-wangweidong.a@awinic.com>
 <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
 <598febde-429e-4319-98d4-4306a7f8bfe8@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <598febde-429e-4319-98d4-4306a7f8bfe8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5BTTQTBVDPR4YPEAVDKX6W4YLXFZPOKG
X-Message-ID-Hash: 5BTTQTBVDPR4YPEAVDKX6W4YLXFZPOKG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BTTQTBVDPR4YPEAVDKX6W4YLXFZPOKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/09/2023 14:30, Mark Brown wrote:
> On Mon, Sep 04, 2023 at 02:17:43PM +0200, Krzysztof Kozlowski wrote:
>> On 04/09/2023 13:46, wangweidong.a@awinic.com wrote:
> 
>>> +	ret = regmap_read(regmap, AW87390_ID_REG, &chip_id);
>>> +	if (ret) {
>>> +		dev_err(&i2c->dev, "%s read chipid error. ret = %d\n", __func__, ret);
>>> +		return ret;
>>> +	}
> 
>>> +	if (chip_id != AW87390_CHIP_ID) {
>>> +		dev_err(&i2c->dev, "unsupported device\n");
> 
>> Why? The compatible tells it cannot be anything else.
> 
> This is very common good practice, as well as validating communication

No, it is neither common nor good. The kernel's job is not to verify the
supplied DTS. Rob also made here a point:

https://lore.kernel.org/all/CAL_Jsq+wcrOjh7+0c=mrg+Qz6dbhOUE-VEeQ4FoWC3Y7ENoyfQ@mail.gmail.com/

> with the device it verifies that the device descrbied in the DT is the
> one that is actually present in the system.  This might create hassle
> down the line if there is a backwards compatible upgrade but that's much
> rarer for this class of hardware than cut'n'pasting of device trees.

Best regards,
Krzysztof

