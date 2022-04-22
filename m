Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B3450B2DE
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 10:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5ED11727;
	Fri, 22 Apr 2022 10:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5ED11727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650616095;
	bh=qKio00xXUbUiUXZm/vX+CQikpg00hi0mjBYT8PwbFRQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cU5xk6Kj1kEx9yNILFCDy53fRNZZPGrI2PKtWeNjDTVlMTFStSsJdJF7ES4kVvX4G
	 +9o0ZPb3u3JfAINzXllZLUPK8vEOPpyhx/Xyouzk2lekB/+sun6zQsZ+CsbFZxnwv3
	 WQfI+QV5Q/LJMo7KFS6Zv5Szwj037O/KCiWr8FKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37A95F800D1;
	Fri, 22 Apr 2022 10:27:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AB2DF80245; Fri, 22 Apr 2022 10:27:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF2EF80134
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 10:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF2EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="2/I5sgtu"
Received: by mail-wr1-x433.google.com with SMTP id v12so3149154wrv.10
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u7TUP/Txry1UFuyT1GMH6MxIlNWsEqUWlVQuJ3Ycgo4=;
 b=2/I5sgtu6yek/DqrCw3fNAG0CyFOv3PlhCCCJ+GXocYogXRpOANpLUGCSLIL6TXXJL
 ncM/kLDoJ/bNF7oVzLDmvTM1U3qDOvltDLOY94qFOFrVnXCkZfDsjDwyWE2jcRPo5B1P
 ttxqJ8yX7vcodL42mKjo/d0lRMIGPiXtLb17dpL2lYUuxkj6MobpP5XnR8PmKbChBY0Z
 7zmq27Ase+2MLiNJ+AreILAY0VwbdAMekeGiuF36tHqnyXwpBeV6cqPt/OeTETRnDqrU
 +QHBEU1kHUMiZEs4+Xe8l3uwd3L6Dy+ht+n9MPLNoA7z1gb/z+BsoiCI7GOSeiqizJDX
 7PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u7TUP/Txry1UFuyT1GMH6MxIlNWsEqUWlVQuJ3Ycgo4=;
 b=a/IhmuUYkxm2FnVrU9q1A8Q3myvIpbplWuHC+AmzPWZK030VIK3Yp5CsqKfJ4jx5Gr
 /1i6s7ro8rX+UJJXH56/pzBW7PkYwxzoQJP33OM93Evrww9oholKmJbCkrL1MaDDjG26
 x6O6zuvMEExEgwe7kvOXkB0+z69ahZgOIgHgks8H+wn4CECfKJCVR/eUXMBzm3ZdURMI
 jhDgWfntVb8e0POupfI3Zm2tYLj7HNUeMTmoTf4PqOg0mObrBIO8EojGS0yPUX4NTfr9
 wLDUbNqeOy/Uq7/IOtujz4R84Yoqxi//QsSqpRjVWwMwBkXQf2KIhyozC1hHFYI/kCeV
 UU4A==
X-Gm-Message-State: AOAM532eUR+ub5ljMgW3FyqCTLg0dfuScx5zvxTbxatintcPwqCiSBWc
 LJHPJkROOune+29nWH7OebfjSA==
X-Google-Smtp-Source: ABdhPJwc7lC7iXT26SYx3VMbx1Xy9+zwh+M/Yt5wvRZ3xffC5nUuF/FW32z69itymsszmlEUC9PuCA==
X-Received: by 2002:adf:f2cb:0:b0:20a:77c2:3958 with SMTP id
 d11-20020adff2cb000000b0020a77c23958mr2637147wrp.589.1650616021757; 
 Fri, 22 Apr 2022 01:27:01 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49?
 ([2001:861:44c0:66c0:3ce1:1ed1:5e14:cd49])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm1335208wrq.97.2022.04.22.01.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 01:27:00 -0700 (PDT)
Message-ID: <b6029a92-04f0-9ae7-291c-621f9871280b@baylibre.com>
Date: Fri, 22 Apr 2022 10:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
 <YmGSeVbwWtyHP/Tz@sirena.org.uk>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YmGSeVbwWtyHP/Tz@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Dmitry Shmidt <dimitrysh@google.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

Hi Mark,

On 21/04/2022 19:20, Mark Brown wrote:
> On Thu, Apr 21, 2022 at 05:57:24PM +0200, Neil Armstrong wrote:
>> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
>> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> 
> One other thing - these should be Fixes: tags, that helps tooling figure
> out things like backports.
> 
> Also:
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

Thanks, I'll think of this for the next time.

Neil
