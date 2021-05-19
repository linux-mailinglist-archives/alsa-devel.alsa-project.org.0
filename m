Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56F388EEA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 15:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CAA71687;
	Wed, 19 May 2021 15:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CAA71687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621430497;
	bh=Oe+uI+4LSggJKMBLqaso5Y9xo2SAyhJDiofajUHj9mM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V9zcnSIJy3ed22ZYh3HTTUA0Bxpsbijf6pyXgfDjbJjVxBjb4XTdepmSylaGCIV/I
	 3oJySZYhdH0T+2Hji4rtWJwPnVnztEJYZkzrWR8Q/EkLgcm+HHqob/jLN8pp6HR0Sg
	 GxuKuDSxZJOGJfSW1tdbuS1zGDNueeTy2yxTf7b0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B86F80127;
	Wed, 19 May 2021 15:20:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70573F8016E; Wed, 19 May 2021 15:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA57F80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 15:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA57F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mqWWHjRZ"
Received: by mail-lf1-x131.google.com with SMTP id i22so18905792lfl.10
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K0tyFpLNzaxBLTrHlN/nxnuC6O2P+PiZwClq7ZqWBaM=;
 b=mqWWHjRZOghl8Z76kF+UyaEuEdY9mINqCmF9GBzGn4E5R1ojPV/v1mUhYAHOuv0qNc
 vpOp59VpbwxswUFAeO3r0hzEC6ScaBwSlbD0LoSUMx0vDP1bViiAumgeBjDfPM5apLWi
 n5HdU09HXaaB8y1QtfLllNeOcWVMpb5DLm/tfDAfzT3lFkrTFhECBq5Yw5bYlylfRP+Z
 Ji/pgEAnO3YKsPFR3WdBEw0fkGSoIXERvmbhZdwUnpR31dLW+f29qMSBDpy1V4CfPDsy
 F54rTpLeA44phJL3SIemAOeKLjJbVTsQ85xgmMJYlBENkgwfs4AzjWIfbqbde2YP2Ywo
 bwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K0tyFpLNzaxBLTrHlN/nxnuC6O2P+PiZwClq7ZqWBaM=;
 b=AsUGm0OJ6JIDBSVDEO2ZTKPVwd17A6kQW9DUQtVUj/3Z4kY0Y++TowgCytxlt781pI
 ZF6EY+lWUE2WmgFfVuFwKe5u5RlxDgYzOBv7kHTeQvXkNGXlQHAS7A1AgPxWdE6T+PQS
 K9ldHZuqRSV4B0oLhWW6sQKDfdZqlC0PbKTQq+FbzGreH6bpOUzOSkEdxkoeWBGMWCeW
 saoR5QYEAj3fe3d+ZtDD+vdE+cWFoT6kTtsvqPcubRrQHbdXnq6FxSto6mWy8sLUWJzF
 EttvgDZ1glYS/IT+OkthPzhiH+y/ajeOseEsy6fo92RTuj/jOxrAcGdcG1h8tABN4ngn
 vW5g==
X-Gm-Message-State: AOAM532y3/YHpwGJO9/Mjiy8eCN+LVNt9Pu3yFHbdKolOPPw7zi5R6z/
 tCV6MHMUrYRbdY15HhceITU=
X-Google-Smtp-Source: ABdhPJyHl3qOihv/iXmc4cZoDNOJr2jrkCw3AxpksFtYZPExomt097pp4S/ac07ioJGNxmW5qvVP2g==
X-Received: by 2002:a05:6512:b98:: with SMTP id
 b24mr8475964lfv.216.1621430400378; 
 Wed, 19 May 2021 06:20:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-55.dynamic.spd-mgts.ru.
 [109.252.193.55])
 by smtp.googlemail.com with ESMTPSA id t15sm3773514ljk.99.2021.05.19.06.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 06:20:00 -0700 (PDT)
Subject: Re: Question about Tegra UCMs
To: Mark Brown <broonie@kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
 <20210519113805.GA4224@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2da02135-2173-fb63-474f-aa63ad6f4a90@gmail.com>
Date: Wed, 19 May 2021 16:19:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519113805.GA4224@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh@kernel.org>
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

19.05.2021 14:38, Mark Brown пишет:
> On Wed, May 19, 2021 at 01:31:28AM +0300, Dmitry Osipenko wrote:
> 
>> Mark, could you please help me to understand the UCM naming scheme that ALSA uses..
> 
> I have no real idea, sorry.  Most of my userspace work has been with
> Android which doesn't use UCM.
> 
>> IIUC, the "ucm2/Tegra/codec_name" scheme [2] that the current ALSA UCM
>> uses simply doesn't work at all. Is there anything on the kernel side
>> that I could change to get a working naming scheme? If yes, I may try
>> to do something about it in the v2, thanks in advance.
> 
> Could you elaborate on the way in which it simply doesn't work at all?
> I'd expect there to be something in there that first tries to match on
> something to do with the specific hardware platform to take account of
> plastics differences but that'd be a userspace change.

I also expect that there should be some kind of fall back matching, but
I don't see it happening. I will work with Jaroslav on this trouble.

> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.
> 

I turned off the word wrapping for that email to make it more readable
in a generic email clients since it contained long lines which shouldn't
be wrapped.
