Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B4332ED0
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 20:11:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D94189A;
	Tue,  9 Mar 2021 20:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D94189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615317115;
	bh=rGhveete8wtIwV6aC4PJe+Jq9aY7wefVxCB4EEzRxy8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RcotcN9CuE3b32V5BHwXRWjzXo5K9Rz3VIafPywymZtZ2cXSguU+zzo7S+eUdHyyk
	 YU7GWt8u8m5MVyQ23tMv0YhAbTXiOOiT3iJjsknw9E0nj8omQafjSS/q5Sy0O3KGGg
	 ctp3GVEmkzizusoP8jrObklHeYXxjesokTUbLdzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75410F804D1;
	Tue,  9 Mar 2021 20:08:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80BDFF804CF; Tue,  9 Mar 2021 20:08:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9452F8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 20:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9452F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eHr4XURQ"
Received: by mail-lf1-x12a.google.com with SMTP id p21so28912764lfu.11
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 11:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZtjmevkTD4OwnVekKT3y0VDqJKshXYG7EZriwiqfrM=;
 b=eHr4XURQG7ueBti6UgZfsaOJ82SLWkchlP0UMKAOZVYpvAAINpOK2r2zoV9feZAy2S
 LGrWrwaHz+XMPpMa2XXT/qyXcp2G44njqEEO2ME93vfPP+r4FJnUvL4Y5hJunsJU2n3D
 8nVmVTvOXSpRoP0qE9iqsbYNWv6/EiAI7OBiUzln1CGUpKPI5ZSDH9DnjSp1xSCfxpdx
 rrYpEw6uzKv8P6+nH1UQqP2CdcrjWcoFxrxo33Q8G20Y5UMo+fMthyggJOD/hOylDIce
 7Yh8WClm98Wm+Pz9yOKpoJmZKQFXLkIK7YYqKtUjmCPlJ8JnkNz7zo7RtOLBl4Q5qgMW
 1aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZtjmevkTD4OwnVekKT3y0VDqJKshXYG7EZriwiqfrM=;
 b=PQZVHbCrYHuE1XfgC18b7ibnwUyjo/g5Buc87YrEfRYM9rMH1D99AYlN6RUjwZgaIQ
 v6J7AwuL+uwXwvs6A7a9eoOk2StrZvXnlU91EhoDckiOpOFtvECX9Uo7X2EFiiI6IXpi
 DbmaBgyaV0AhnKjQvDNwBJaYzliDryPGXzoFc1DM8qQW6SK14muFJTpmThuocJj6j/4K
 7Qn/vDjrAJF8Tc2C/mLEUfgTl1GOo9X3xzYboRlk2a5ywxxd6VQChr4MDicmfg6A3wtj
 4EruU/NcCxnOV9eMGIGMkz04CwMbqCdbckDi75a9Jxus6OiI+1wmKuKN+TLxv2AB03xZ
 tlow==
X-Gm-Message-State: AOAM533hi5AWi6PQJNzQj7IWjPwsG2pV3DQTeUo33d/ohDHGdlQProiU
 srpQPxd7Uo/KMMtmwS3BDC2w8gB1rD/xdCosfCApgw==
X-Google-Smtp-Source: ABdhPJxi4EkLPvb3adcLZHV8k26dgNv1asUlJdCPJWrCcvaEh4Bcr4aFXpSmVPW7eIrxmlqmq3zw37dHXDqoDWOHzY0=
X-Received: by 2002:a19:7fc3:: with SMTP id
 a186mr17385948lfd.626.1615316892281; 
 Tue, 09 Mar 2021 11:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 9 Mar 2021 11:08:00 -0800
Message-ID: <CALAqxLVf2_GJg=krRmwoqX_GxDMsuR6BYOoZfWoFk0dC0xVhOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: sdm845: array out of bound issues
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Tue, Mar 9, 2021 at 6:21 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> During testing John Stultz and Amit reported few array our bound issues
> after enabling bound sanitizer
>
> This patch series attempts to fix those!
>
> changes since v1:
>         - make sure the wcd is not de-referenced without intialization
>
> Srinivas Kandagatla (3):
>   ASoC: qcom: sdm845: Fix array out of bounds access
>   ASoC: qcom: sdm845: Fix array out of range on rx slim channels
>   ASoC: codecs: wcd934x: add a sanity check in set channel map

For the whole series:
Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for fixing these up so fast!
-john
