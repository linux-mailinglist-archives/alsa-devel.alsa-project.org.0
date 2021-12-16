Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4514774AB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 15:30:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6524F1FCC;
	Thu, 16 Dec 2021 15:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6524F1FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639665043;
	bh=IkK7nbtbk0D3k1w1SIdACaDba1aPrwc5ymSyc2sSo18=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hz4+cLMm/L0XhK2RLyzt4U/68nMa6fPnAW6mn9ox/ukZpmVBZ/oofhwfojCpGB5OM
	 co6zZffRgrNyNkAUnB/CQIxerFGoWcStRMCOsT3C5MRM/foe+nVFnj2jAiFyva31P0
	 JHfN2SRX3JNmrlNsVkxbfBSrTg953fLcAGJqU6tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9558F8015B;
	Thu, 16 Dec 2021 15:29:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F3C0F80116; Thu, 16 Dec 2021 15:29:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0335F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 15:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0335F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PG2xS2vL"
Received: by mail-lj1-x22b.google.com with SMTP id i63so38808534lji.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jmTSSpcNWtwfnBOzQ4SXDAvbSBKcOFTBcwOus93VJW4=;
 b=PG2xS2vLUFH54ArG56D+Q342pRiH3jdFwS4K/6S4B/nw7Y2ox89atjJk4nUylobM1w
 NrHXA+Tp2PDubHrme4IATwGXahvbiRKJuyOVxiVfbp5OAZ1zmFUCcW6ZTHCAOPDO5KlI
 DxcIaap5F+3oy943AsuTQKyhGmbBEC2vAL9N9Jd51tukt9puT+E1/DGPgWx+TlMEKCDN
 5YgH36A3+Qtej4UaSRMEuzvcu3V528Qz5qi2f7ql7nGF8SNkDPSArnuPKmx4B69FToTJ
 sRGISFsX6sRbqbBLyA6brQjtFl6WHtcyGZxxs/CGupN+c+fr/VXwcQJizLEipEpvTTOx
 GTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jmTSSpcNWtwfnBOzQ4SXDAvbSBKcOFTBcwOus93VJW4=;
 b=NEXd7yPkEwM/smNysdiubV2e7qYAaDyeihjvEqfv3ofhFm2FkhcqRW7DHfp1NTPh1L
 YAsh2vENoVgbG48mLbLeNDSY8dW15VT4bGevbF2Sct3mrJ8vwdJIrKiNCYKr50wBR3Gd
 G9EVMZRt12jpLo9904zwaZE4+eI7naeA+ToZ9wqiID9bpowDaEkW3hhhbmGiUisMP2Ai
 oX1xwSUdQkrFK1SFojYg62VbcYGcED06VY76rt+NO9cO1cNCwuCWNVAEkdY3kokURKG/
 HhvQn84GnljvkddFzrhrZ6d7h9IG7SgT+QHsn072qqMJHnG7nvqex5xput29f3jdPrWy
 uLeg==
X-Gm-Message-State: AOAM530uFE4bud1KuBuQt7fSXvCxgB2Yayt6z0Ghex3LKGb80IbZdsNQ
 zJo2TpCRgsnFyn7oBNjyJPU=
X-Google-Smtp-Source: ABdhPJwHopng7TTn6djyhWoM581vIPB/7Ea84WYzSp8kNNJXVSzEf+3IcwroTLJc3Wygi8UzwwagkQ==
X-Received: by 2002:a2e:8e88:: with SMTP id z8mr15090638ljk.197.1639664966914; 
 Thu, 16 Dec 2021 06:29:26 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id d10sm898153lfv.114.2021.12.16.06.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:29:26 -0800 (PST)
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
From: Dmitry Osipenko <digetx@gmail.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
 <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
Message-ID: <7179a409-d838-0e9e-4600-785e69c3e3a6@gmail.com>
Date: Thu, 16 Dec 2021 17:29:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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

15.12.2021 22:19, Dmitry Osipenko пишет:
> 15.12.2021 21:57, Mark Brown пишет:
>> On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:
>>
>>> I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
>>> that removes obsolete slave_id. This eases merging of the patches by
>>> removing the merge conflict. This is a note for Mark Brown.
>> That's not in my tree so I'll need either a pull request with the series
>> or a resend after the merge window.
> This patch is included as a part of this series, please see the patch #6.
> 
> I saw that Vinod Koul already merged it into his DMA tree [1] a day ago,
> but there is no stable branch there.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
> 

Vinod, will you be a able to create immutable branch for us with the
"dmaengine: kill off dma_slave_config->slave_id" patches [1]?

[1] https://lore.kernel.org/all/20211122222203.4103644-1-arnd@kernel.org/
