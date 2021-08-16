Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159A3EDD31
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE66D1689;
	Mon, 16 Aug 2021 20:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE66D1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629139116;
	bh=y2S0gJfx3+A23AkSmsttRYREHcSu1hnTBSNpXVTn2Y4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GVFtmOVWCdMpskAgy6kFbpf/MqnD3d6ebop6y+S1KonuQr+wDeNIMgwqw9QkdrUuo
	 nuGQ3bIldDp07V2oJtcliLZ5c/xshf9PF7vxldQZW8lSy7QJAKyLtTCtkxWaxTlS0y
	 EGrx+bSc4MVOCPDbUO+RcMHGsDL+6CKaWc63zsoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DFB2F800AF;
	Mon, 16 Aug 2021 20:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9BAEF80249; Mon, 16 Aug 2021 20:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61C66F800AF
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61C66F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Krt2XuzE"
Received: by mail-lf1-x133.google.com with SMTP id d4so36281127lfk.9
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b5nG1Sn4hEdSmCIfBVPgAPJIisiduFp0SMRlWQtkxmg=;
 b=Krt2XuzEx+T0LB6/+Mqg7SLTP0H1Ms829dCOLPBmV+PMoYsLuoTj4BkFpOgyLD1Cud
 rHN1gLifgizAPGHBd8TE7qFQO/K3OIdj1NfWl4BwlWApnFTf/9J36pYUdEXVjGeira4T
 CT2CcnchOItqMUDKXtLxC8QqohujzXsw2OyxtJMwLLWy0Q0S9dNKkHZOHTJAj5elcFuY
 Hq7Jk52ICxtTIMm3xp0o3CRGDH2gmRv2fMN5kjFdTaci+9Nf/haebpwlbLozd+sv1ke8
 5dJPz79F7y1SqyCj/1XkeVISdXEt06Tm9cmNM1sS61Xg2DazBPZhH+7jw4ZIrGHcpBbt
 jYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b5nG1Sn4hEdSmCIfBVPgAPJIisiduFp0SMRlWQtkxmg=;
 b=X/jDi1wTQHZFpyOby4SpWuQb+/gBMZwO5o29DaR+i2ctNH5nk2PHF4ZoKY+TCOyLnK
 IVp8/qIfRCQaLdeIQ49Tjn9hI6QsCosgbhKhpNyvWhXOVpbWpbZzsMiBy6mB8G3ktHbU
 6VoWhe1jyYkjdjCIZwGCrnTTbpYtm2knyMhsIRki4hyGKtzycIk4wfz0hAq5ODz5aeMi
 e/7mkvyA9faQNuaFaDzMxYoM1aN9DfLREeyXo1kMXAXGV+6HPc0B6kobYaQblR0VZads
 t4o/N8gO5ZrVbkitd9mUvEVXzHvCDu1nyaKw6T4lCh2tkxRzMnBi4O/QcRTvRPLrqkcA
 0FDA==
X-Gm-Message-State: AOAM532LOkpiLz9hT+wj1YBQsr6ZNw5yqQV5B1BAvpm0dBueJ8BzFyjR
 89FsNnWfAEAzAoGjoLl0yO8=
X-Google-Smtp-Source: ABdhPJwY2sNOrA2E597YG4aWdgHZYmP6uRwu780vRZDNWrG8dd9L2RvW7GPQGpmMe+aIsQYFnvUfVA==
X-Received: by 2002:a05:6512:c1f:: with SMTP id
 z31mr11205955lfu.373.1629139018394; 
 Mon, 16 Aug 2021 11:36:58 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id b6sm2203lfv.167.2021.08.16.11.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:36:58 -0700 (PDT)
Subject: Re: [PATCH 0/3] ASoC: ti: Use of_device_get_match_data
To: Aakash Hemadri <aakashhemadri123@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <cover.1628972198.git.aakashhemadri123@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <e7a5274a-3605-9f49-e77b-51343c060b94@gmail.com>
Date: Mon, 16 Aug 2021 21:37:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cover.1628972198.git.aakashhemadri123@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bjorn@helgaas.com>
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

Hi,

On 14/08/2021 23:19, Aakash Hemadri wrote:
> Hi,
> 	This patch series will apply cleanly on for-next
> Prefer `of_device_get_match_data` over `of_match_device`.

All three patch is wrong.
Mark, please do not pick them up.

> Aakash Hemadri (3):
>   ASoC: ti: davinci-mcasp: Use of_device_get_match_data
>   ASoC: ti: omap-mcbsp: Use of_device_get_match_data
>   ASoC: ti: davinci-evm: Use of_device_get_match_data
> 
>  sound/soc/ti/davinci-evm.c   | 2 +-
>  sound/soc/ti/davinci-mcasp.c | 2 +-
>  sound/soc/ti/omap-mcbsp.c    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
Péter
