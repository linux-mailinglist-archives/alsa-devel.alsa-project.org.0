Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182CB1C734C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 16:49:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9E31777;
	Wed,  6 May 2020 16:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9E31777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588776551;
	bh=ZN/X3ypAULXEfxoa00g6h3pu+Cy9PT0RR6krBhxk6ZA=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGnMT/BIulb6Y/KvID2w9qyCTgFpOlafhlj9UrudatMTI5tv8n89f6v93N46bbQ1M
	 3Xe92Snt8HtD6YrsJz4PGJRuB3bqhORwJH3BCtIiZzZnH+xnykreDs1a71qZAcqCgp
	 rHs8rwPDT3hhtTUEHRTodSEfnJW9bJwhGC3WyWoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3832F80234;
	Wed,  6 May 2020 16:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F25DCF80249; Wed,  6 May 2020 16:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C8DF800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 16:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C8DF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="aQ8oRcJt"
Received: by mail-wm1-x341.google.com with SMTP id r26so3019772wmh.0
 for <alsa-devel@alsa-project.org>; Wed, 06 May 2020 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=GCrHnOXne5LQYzx7qf0NksizLMHmLnAy47QVPvHQx6Y=;
 b=aQ8oRcJtVr1zvX95yYSbWP2oNTN5fvt0CC45Cl7XST4LmLLIUB0Z5rH+qEGbVSq8uN
 HrnvEE797zkZYYvYvQAxdEDEoWA6HB0AQHlI6Y2QsuJ4QFfIHzE40Qv/JrzKq7GRnkRO
 lTSt9sDho5oc0qjvX2JGIvh7fsU8XfakYdWizNHOJeahQZkyDfsaIn2FqBT0vMCiSCHG
 Z764PkLLvz1Zt4RrV2Sge3Oq7EhCEJ47VED4tH7CdYQtGLEQW1PisQAcIdHR8ayn4ZDo
 OEYvf6/dT8FRbonulUDI+aPa6PU9B4SNuzdva6MC75yTL6iHx4DRj4DeS4ALwIJ7vnZH
 A+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=GCrHnOXne5LQYzx7qf0NksizLMHmLnAy47QVPvHQx6Y=;
 b=s+6coVF6ntxBgNQIDuLNCdt/txz58BZERMuYiZvzWb+8pItoz56uP6hpRWeUm2ZPf4
 QSLLWjcY1W+RUYlMPYMBMNmOFIIFWfFjnwAx/iZd83C3fpWfGOQfqlxixpMnPl/bKjd9
 wzb0JXDbZRtpShJ8Ulv1DENGEDtfQF9u4iZpT8zNPNQh9ZQTeQfjVTHJFa7yI447E1HS
 ms8MOeM+54q6PQXxpcg5f16GOfxdODIHkvw98f54h3WWHq73kLhWWJGgfGF/Kplal70U
 B/utuhCmI7AkbGX0X2dnL7PoNCrx6soJxdrzhlrIEyMBoSHB/jgauRFwVI+6/396Yd4T
 lgJw==
X-Gm-Message-State: AGi0PuaFb+1OvnplSKJQl5mre6Dy6hwvdtlWVHU6UQnGiZmZpMcu8P3B
 sNyvkhAKEq9ZTgIP6cA7gb3hpA==
X-Google-Smtp-Source: APiQypJUCJR76CQmyVGoW6s3CFc3WW+P6Hh7M9OerXMmN1I0H8y+YBedIb2KvnRIymXqkCvI/lNSlQ==
X-Received: by 2002:a1c:7f91:: with SMTP id a139mr4594836wmd.164.1588776431739; 
 Wed, 06 May 2020 07:47:11 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id c19sm3185436wrb.89.2020.05.06.07.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 07:47:10 -0700 (PDT)
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
 <1jzhalffhh.fsf@starbuckisacylon.baylibre.com>
 <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, kuninori.morimoto.gx@renesas.com
Subject: Re: [RFC] DPCM for Tegra
In-reply-to: <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
Date: Wed, 06 May 2020 16:47:09 +0200
Message-ID: <1jwo5pf7de.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: viswanathl@nvidia.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, atalambedu@nvidia.com, nwartikar@nvidia.com,
 thierry.reding@gmail.com, sharadg@nvidia.com, digetx@gmail.com,
 jonathanh@nvidia.com, rlokhande@nvidia.com, mkumard@nvidia.com,
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


On Wed 06 May 2020 at 16:12, Sameer Pujar <spujar@nvidia.com> wrote:

>>>
>>> |     Front End PCMs     |  SoC DSP   |     Back End DAIs    |
>>>
>>>                           *************
>>> ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
>>>                           *           *
>>> ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
>>>                           *    XBAR   *
>>> ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
>>>                           *           *
>>> ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
>>>                           *           *
>>>                           *           * <----DAI<4>-----> MIXER
>>>                           *           *
>>>                           *           * <----DAI<N>-----> ...
>>>                           *************
>>>
>>>
>>> Follow up queries
>>> =================
>>> Based on the above experience I do have few follow up queries and request
>>> for your inputs on this.
>>>
>>>   a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>>>      program required switch in XBAR.
>> My 2 cents:
>
>> DPCM should activate any BE which has:
>> * a valid DAPM path from the current FE
>> * a valid BE stream (ex: can handle the stream direction)
>
> Yes, this is taken care.
>>
>> AFAIK, you can use any combination of DAPM elements to model your
>> components, including the XBAR. Then, it is the job of the card driver to
>> link the DAPM widgets of the different components together and bring the
>> system to life.
>
> XBAR currently exports all routing widgets which can be used to
> interconnect multiple components and thus implements Mux widgets. Fixing
> the routing paths in driver would limit anyone to try a different
> combination as per the need, unless driver is modified.

I did not mean that you should restrict the routing ability of your SoC,
quite the opposite actually.

You should just expose it correctly

From the diagram above, each comp (ASMAIFs, BE even the XBAR) should
export AIF_IN/AIF_OUT widgets. Think of those as the interfaces of your
components.

The connections between those interfaces are fixed, the
represent what the HW is (IOW, the wires). They could possibly be
described in DT (audio-routing prop)

The XBAR should implement the N to M MUX and export all the necessary
kcontrols to act it. The routing magic happens in this component.
There is no limit to the flexibility this provides, unless you set one
;)

> Device tree (DT)
> can be one of the solutions here, but currently static paths can only be
> added AFAIK. Even if this is extended to include routes with Mux widgets,
> still it won't give the real flexibility.
> I cannot re-use a component for a
> different routing path, unless DT is modified again.

If you implement the XBAR capability in the comp, not a use case, there
is no reason to change it.

DT describes the HW, changing it to describe a use case means something
is wrong, usually.

>
> Hence a Mux widget with user space control could offer required
> flexibility.

Exactly, your XBAR comp should provide the widget(s) and related
kcontrol(s).

>>
>> If your XBAR is widgets are not provided by a component which also
>> provides a dai_link in the sound card, you'll need to add the component
>> to the auxiliary device list of the card for the widget to be available
>> in the card.
>
> I registered XBAR device as a component having a dummy DAI just to allow
> routing paths to be available

From you description, you XBAR should not have DAIs, just DAPM widgets
and kcontrols

> for the given sound card. Are you suggesting
> I can register XBAR as an auxiliary device so that all the routing paths
> are available?

Precisely.
I have been using the same method on Amlogic cards.

