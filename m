Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C9538264B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 10:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B941666;
	Mon, 17 May 2021 10:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B941666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621238947;
	bh=Rj0L/FnUEtP1IP5LeiYanzKByRtgvd0iZLL9bhNAOds=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ogDQJTabOgIpp5ZEb5KSyDhsz6J2u7+4liR09f/mt3vXI24FAnYDIAzW0b6eXrLMK
	 zYbFYAllm+oREZ+VfEeGWpJr99G+rmQunz0j4TFBz+o1VlereI2fbBpdXdyGhgMO1e
	 xJ77Fob9S1GXPnJxw3vXdk83NRMlyiNy/CQp1F6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 324CEF80246;
	Mon, 17 May 2021 10:07:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA580F8020B; Mon, 17 May 2021 10:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79057F80082
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 10:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79057F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fk7lEsgV"
Received: by mail-lf1-x129.google.com with SMTP id q7so6111159lfr.6
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 01:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PsWxchSj6IsfblxIjcdWW7ZX83ze5SRG4vA70cLrM7A=;
 b=fk7lEsgVhMM8fOmwyUfed66RSTd8ey3C8TrJYxrYuVdaJCaxGJpgFmswJvDOyJ2kA2
 2COMzLfb9TrxQc4G2WItTgb/jKu7DfkMaUlHaBEmtlr43KuMCzYJ/5ubVWZW9jjc5h8r
 RymapGTPQLOeIFURsfPiJ0ji+P6njJCBpMJo79Nvmkcb4L+nb8YmqTsH+0uQj8yA6mrS
 efsv8tPZNMaF2xIW6pmfY7AzXlulWce2I+CR/F7uNsZvxNKJw7Ldbw4A/LDOE3sUYtlv
 /w9QnUDplcUQokTFyNHhWWsoju9/RSNh2EKnTnbjJC4weixNYSQn00oDfTejeJ56/g6V
 1YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PsWxchSj6IsfblxIjcdWW7ZX83ze5SRG4vA70cLrM7A=;
 b=YvQTVN+r8gcPZXJeP4Llh2wX9CYdm9x+dTKh6Ypgcz7i0bJWd6ygMkB8Q433icYuvj
 Xk92BeoozhuZQoon0/FV0KQCHSfUX2VM3CIy87tdl0SP7TCddll6HUYCuJMLo+HNqj0G
 ev9iscgCGa1prg1iEfCmUdVRAbnA2wnecz2Z0gzD5gK+uTC8ETlRFc89LQoRJytnQx1a
 tMnsUjzah3aRxYJRIMTGJiwyBfJ8qjnSvIvXWSgbl/1TPNAK5Q4eGlycuWp96u8ODF5y
 Zv9+k5gum1JfA0HdPar4HFax6ho7szMl5gwP33blT0YP8Ruu850APMIAO5mYjd5B18uA
 CV0A==
X-Gm-Message-State: AOAM53205lBAs0Kn+ymD0CnaUZN56FRLMZNzGoDtZSk5b/3W/IHEmFGm
 AQk9bTkYGczk3hVxXlVSokg=
X-Google-Smtp-Source: ABdhPJw1SjBEjNJNPkIQKq/gztKPKO5hpbNaaCpp2o7nB24mtW8/2D/Ia7pjqpFncXqQH3yiuumtxA==
X-Received: by 2002:a19:c511:: with SMTP id w17mr10749915lfe.113.1621238831207; 
 Mon, 17 May 2021 01:07:11 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id z18sm1902645lfd.180.2021.05.17.01.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 01:07:10 -0700 (PDT)
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Mark Brown <broonie@kernel.org>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
 <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
 <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
 <b86ad586-9513-8fa9-54e3-a0b4a3a7fd92@amd.com>
 <070b4e5b-b7bd-b8a6-beea-593a94ec3078@gmail.com>
 <26c79eec-5e74-38bc-465b-0ca2b2d9a6f5@amd.com>
 <9b689495-e956-6242-0784-af3ccf7c3238@amd.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
Message-ID: <1c875eae-88f2-5bc7-849b-f1c4afb29dbe@gmail.com>
Date: Mon, 17 May 2021 11:07:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9b689495-e956-6242-0784-af3ccf7c3238@amd.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 amistry@google.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Alexander.Deucher@amd.com, nartemiev@google.com
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

On 10/05/2021 20:27, Mukunda,Vijendar wrote:
>> Hardware signal broken between ACP and Designware I2S controller with
>> re-ordering the sequence.
>>   > It is surely not a designware IP issue, trying to solve it there
>> is wrong.
>>>
>> As it's not a designware IP issue, initially we started idea with
>> introducing quirk that applies for this ACP version based AMD platforms.
>>
> 
> Hi Peter,
> 
> Any suggestion on the work around for this issue?
> How about declaring a flag in sound card structure and this flag will be
> set in stoneyridge machine driver.

This can only be solved in the core, that's clear.
If this issue only affects this version of ACP with dw I2S (the same ACP
version works fine with other audio IP), then it is more like machine
driver level of quirk.
If this ACP have the same issue with other audio IPs as well then it is
platform quirk.
If the this ACP is only used in this setup then I would consider machine
level quirk as it might be simpler to implement.

Other thing to consider is how other setups with similar issues can use
the new quirk/flag... Some might need to make sure that a component is
first, not last for example.

> Based on flag check trigger stop sequence will be re-ordered.
> 
> Thanks,
> Vijendar

-- 
Péter
