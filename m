Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335346B8CE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 11:24:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05AA4242C;
	Tue,  7 Dec 2021 11:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05AA4242C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638872641;
	bh=3hL+WO8QLaU1ryAw/olj3C/iuNqGXfYfQp2qtX124yc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRO+Da2TmCvE/xZ1HXUZWEdBgp4ulXPjEpqqvFg3sUtgt0NCUfgXOZ+lEeBUXMbel
	 Uom3JUDEy6hrcxNX6BEl12uxTrvIjC19+Sq3ZikYCdHnE1PmRH7RvBTH9KvR5nfa/r
	 Yipw2WHMINGgprwXxx30meZLPLKVWXTMHV443TO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62CB8F8032B;
	Tue,  7 Dec 2021 11:22:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C50E5F8028D; Tue,  7 Dec 2021 11:22:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A18F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 11:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A18F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QX0Oq1SA"
Received: by mail-lj1-x229.google.com with SMTP id p8so26527851ljo.5
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 02:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zn4bh7aDtipPvIQajdqUH0g7HydWjfXn6rvGe1BMNUA=;
 b=QX0Oq1SAxkO6tVEodTmKdzTn3o3oXRNoD1cv2vYJCr+21mmrHt3JLRdQZRSiTE2jX8
 REup2kvzdfpFTnvbfjSuQjq+qNCgxuaIJohZHc/yJYd520QTmIZQXfGQ2MpYCM7AYjBD
 0IFrCLqGfJkCFLPIyJKbyisgH4vsavf7WKBq5V+LA8w9LAMZvg+SDAf4Y6NFGTv98KOB
 5AdN1q9YmwkDlLQcj32OBvTAD1soULHez9BkU7GXJhOK8dA4MFNxgO298FDJsGueYRUM
 z0IvpCD3p/Adh1xCzlNGwArIrZEMsL2NJJQNIJj5HqdACjbu9MqMGms70PR+63oaUfmC
 a3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zn4bh7aDtipPvIQajdqUH0g7HydWjfXn6rvGe1BMNUA=;
 b=7nMwaasH8jrs2RvYx4uOGfE8SVDfI4MfJQ+8F+zQAtVeG3q/m5uvuafLKOEpWVyMdx
 NUypmcSvJ65xLFcObmuKptdfHPkt35kwKSYOLQAZTBabtua/1Zq71r1YHUY8JusNK45o
 ouLfIYymHeucbd/haPSj6yhaXYW2QSlyAz/0w05DSJzm+n3PKYdWQx6vaRmaRAOO4geu
 smsENeRhoThWnjFc3r2Oldfr0cgNX9F9XAbho64ky8VwMxSI9oITOrLd2F2lepH5Bve/
 0HanBIWr6jwG68oNGsv6HE4uwsVVlPPdwl89Ue8AZitRC3oU/wpBG7V1mjrZTy9zFyWN
 uWfg==
X-Gm-Message-State: AOAM530cXt8z4qEtWLkRDvRo3WdCjXMIkWKE7NSoHCyr2m7u3CAaPDVj
 JBTwHy4wFsME7Kq1LA3wKfRBx0PbdSc=
X-Google-Smtp-Source: ABdhPJwa9mQuwpzBTlt1YakBtu9w7COZcAvYbJk3NFERAIkQSUu9HoZB4XdVRfP08MqzECPAi0qGOQ==
X-Received: by 2002:a05:651c:1687:: with SMTP id
 bd7mr42558183ljb.305.1638872550008; 
 Tue, 07 Dec 2021 02:22:30 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id l5sm1568500ljh.66.2021.12.07.02.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:22:29 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
Date: Tue, 7 Dec 2021 13:22:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638858770-22594-2-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
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

07.12.2021 09:32, Sameer Pujar пишет:
> HDA regression is recently reported on Tegra194 based platforms.
> This happens because "hda2codec_2x" reset does not really exist
> in Tegra194 and it causes probe failure. All the HDA based audio
> tests fail at the moment. This underlying issue is exposed by
> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
> response") which now checks return code of BPMP command response.
> 
> The failure can be fixed by avoiding above reset in the driver,
> but the explicit reset is not necessary for Tegra devices which
> depend on BPMP. On such devices, BPMP ensures reset application
> during unpowergate calls. Hence skip reset on these devices
> which is applicable for Tegra186 and later.

The power domain is shared with the display, AFAICS. The point of reset
is to bring h/w into predictable state. It doesn't make sense to me to
skip the reset.

If T194+ doesn't have hda2codec_2x reset, then don't request that reset
for T194+.
