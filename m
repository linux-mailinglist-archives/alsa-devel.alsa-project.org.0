Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2D4FAA7F
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 21:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA3F4174D;
	Sat,  9 Apr 2022 21:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA3F4174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649532615;
	bh=IRJTpx14lau5YSpeJYb35VkmX3BuzcZq7LLCupqIavM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZMQ+1bhcuhYwVLQD2d2Q+lDmxctwTUUV3q3bgr8TGVT5vW0VAfx7ybEmQg99d7i/
	 hmuI8qohGqpN4rPZ7oc35hFOtGYU1D3/oRwxEHyBxzRAbC317w8kawI4iVtMEeniyv
	 p1TSyyJCYZ1iiVYX1KyS4MlbgnkSfYujWLevzkBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46168F80254;
	Sat,  9 Apr 2022 21:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83F28F80253; Sat,  9 Apr 2022 21:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98A53F80128
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 21:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98A53F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GF6EHM/8"
Received: by mail-ed1-x534.google.com with SMTP id t25so996252edt.9
 for <alsa-devel@alsa-project.org>; Sat, 09 Apr 2022 12:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42SYpNZ4gWGjgkkO1ijhGokL9fRRX2OSgDVpwy1LrNs=;
 b=GF6EHM/8BYVgk6i/cp8erL0+1aRtnZYL8va9Cx0KLXftNNXmvhgYMZ2kvV6jiGWq5B
 qbs6aYgahKTV1GrB3TF/UQpAFOzasPhvv5XYDkeoDb0lZ7LgfeKqN7UOLZAyqvW5sKmG
 +xwxUQOPUPimA7w0CF6VqqnoOe35rZRenALExlcos3YzOORGczMkkOEC/hDqcAobBjVz
 XXAQFlAgvKJzsoPdJm9MUVPWugx5OD/JTAwnOt2wmjVPs6fEx+FKEQZ+7xKAosLvys7/
 YVYcuZGjwqljBJiH4gADEvnJDS0d2uMzDHBho1K+NLDe63mbFC0BbGYQZROtBSU1Axzr
 ZH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42SYpNZ4gWGjgkkO1ijhGokL9fRRX2OSgDVpwy1LrNs=;
 b=t1APqu5VsJk32fPMH8h2hd7nvr1c0c5aEFt2BIWtUdzQzUvSc3cSUO3sPKMN1kliB9
 ve6prYyQkwjgqZMJLBAm4uTTyoOI3h7tLD4tSaL0BtD0n0jpkNtPoPMZJY7xijIcU4ra
 mW10SWM+2tru2r3R/C3p+INjP77w1I7niZuuHYe2/4k89SvLuUB9AqO56SOAxGFJNymM
 C/kQeGC8KJXB7l2RUiOHQ1oaGOHx7JO8TJWnEwwgbV0ig9+AvsY42j8+na4TmvT4hvQa
 LBkVmR7ORO79KJx726vVySivuExnPBH3tVHwsKbAsGxWL7lGX9vMKyxemryffDkBGXLl
 rmtg==
X-Gm-Message-State: AOAM531vkfukzE+WmxmH40KqiCGmTGnJenSM1JeJ8oxSXtWCcN7VsBfU
 17yL6qJSLf72hAF586cp+iDDoKb0r828Y8kWK60=
X-Google-Smtp-Source: ABdhPJxNWiKOFQeQugNVTAzQ+K46ZQj0Xvv0n13qp1/13UzekwGNx8nczlrvWfkw/w00cWMKySS63PIF3ZnNisQEqIE=
X-Received: by 2002:aa7:d495:0:b0:41c:c46a:550f with SMTP id
 b21-20020aa7d495000000b0041cc46a550fmr25526367edr.305.1649532539565; Sat, 09
 Apr 2022 12:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AadRQ6B-xbvZenppf6YHMcWERoYuo=kr_gRx03aPsOeg@mail.gmail.com>
 <CAA+D8APY4RZTF=-i3KNbgQK-m18z6ymvxCaQkgy8w9rb5++oQw@mail.gmail.com>
In-Reply-To: <CAA+D8APY4RZTF=-i3KNbgQK-m18z6ymvxCaQkgy8w9rb5++oQw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Apr 2022 16:28:47 -0300
Message-ID: <CAOMZO5BeNknnpT8St_EP-vWKpJbUFrea0HqxD_8aQHvcXGhK6g@mail.gmail.com>
Subject: Re: imx8mn: Using the easrc driver
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Mark Brown <broonie@kernel.org>, Adam Ford <aford173@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi Shengjiu,

On Fri, Apr 8, 2022 at 11:14 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

> Maybe it is caused by this "constraint is not needed for back end bitstream for
> the sample rate is fixed by dts and the constraint is propagated to front end
> bitstream for they share the same snd_soc_pcm_runtime."
>
> Please try the below change.  this change hasn't been upstreamed yet.

With your patch applied the audio is played at the correct rate

When you submit the patch, please add:

Tested-by: Fabio Estevam <festevam@denx.de>

I will run more tests with different sampling rates.

Thanks a lot,

Fabio Estevam
