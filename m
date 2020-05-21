Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6421DD3F6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 19:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7951845;
	Thu, 21 May 2020 19:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7951845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590081062;
	bh=3MU9IkqS+BLUcfN9GchjkQ6nlyviY4AlYVd5E3vN+j0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KuCTlIcwVYqWvl1rLBvd/m+8fmRF+IetdzOF2RJuu6b0GdDQoucRTW5RmMTryQV/m
	 0eg5DKHcKRT51H01KfmMthCJmmT6WGU9YKZ74D419fAPy1JNWxjzpInozcKZ8h6432
	 KyGGJEgpvo0XjaOSueZJlM3qCwP1Z8rFiCUKFTIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74ACFF800E1;
	Thu, 21 May 2020 19:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 922CEF801D8; Thu, 21 May 2020 19:09:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9656F800E1
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 19:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9656F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="i2gnUCbS"
Received: by mail-qt1-x82b.google.com with SMTP id m44so6054943qtm.8
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 10:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3MU9IkqS+BLUcfN9GchjkQ6nlyviY4AlYVd5E3vN+j0=;
 b=i2gnUCbS9oKe3leRPnwVoRevCcbxje2AdlR9f0Syg/kpivOJMVhIwzCr7p6luFW6as
 +WCJ22vuZr9UiKWGI5nWK/839+nqYWAeIw70VWGRwnGen85rrr7QJwWkeOvUAimcnYCq
 pUJIdNTBz9fxTJD/ADtVVv2tVzSLFdCDXyLcIUWK3v0pDwelixva5S1MoSCaknhWgWv+
 SNERz/v9le+cGdhLgW9KmYB+7q+d+nzBj7JosQyNVDvBGA+oXVn2u1/4gm99mjprvUE9
 8UaT7AatU+9M/1KzFx2DswUpjVl6ZKpM6qxh6td/noVVVBHo5rL5E+PCIAsITwp699Vd
 AzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MU9IkqS+BLUcfN9GchjkQ6nlyviY4AlYVd5E3vN+j0=;
 b=s/w7QVmQsxPwaepIW3W5BvYrOuGHs2ST+8viII7yXUmNL+ifwUtYWVBt2VTxcybhlg
 F85sZ3dDgmXElKMO1QJwq+nb2WZ+r9uF6OSU/bq3TS9D4B0pQnqj99OdjPXJkkCyyNzV
 F/aqGOga1tuZzOadSop2+NChbSCme+Btxx8f1P/0DGYtADiyfd5XHp5LLlvmQU3CcKUP
 W8FC1oQUabQG2oQelI/XfC0nQ4LygDZzrqu+iykwiJmq/Wt8CSQ9oszANKD7yfjKC1Ft
 Q+fkYsmSJc767RkdeKhtSxnvkUy47evXW1P/ADD8aIKl88wWsg1Iy/1zfOhInVM16PBM
 3flg==
X-Gm-Message-State: AOAM533ahTnOVZTWQfq1O52Xrel4R4ZwcO/nCFaFt9Q7gCeNgTxAcphR
 s9uITgoFJUtAI3ZkY40pPEMu4nx0hWWqaEnZZRCHrA==
X-Google-Smtp-Source: ABdhPJxIV+9MqTyhFhp7uNn4PmSjtHyz2Tgn6CqCypla9gMwmSmVBU83xxn/aSrQf2JAa1KNxuNQ4s4QbrD0sBMlGO0=
X-Received: by 2002:ac8:5693:: with SMTP id h19mr11528025qta.252.1590080950102; 
 Thu, 21 May 2020 10:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
In-Reply-To: <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Thu, 21 May 2020 19:08:59 +0200
Message-ID: <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bob Brandt <brndt@google.com>, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@chromium.org>
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

>
> don't add a new dailink, this is not right.
>
Can you advise a better solution how to assign different fixup
functions to mic and to speakers? I was looking at "dmic01" dailink in
skl_nau88l25_max98357a.c as an example.

Best regards,
Lukasz
