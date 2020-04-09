Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F731A38C3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 19:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355CE1662;
	Thu,  9 Apr 2020 19:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355CE1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586452544;
	bh=ZegXz12DdIsJlnz4kDm9DmHEUC4wRVyDwbHbcg0xq3Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwIqodUvCpagyxlAEfMTmenQ3yNV3SxAje1SV7Qa05waye05kV9TorRh+td6ytonR
	 fQ+of2+6zZ9AbjvS730hOQVSGXNUXHuoMmP44sRHaDT4n2kVKsfu6MJ1CWDoO1VWG5
	 b+A7Q74I68phDdjyM71xT/AE+v7OS68GeSnGrDRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DEA7F80107;
	Thu,  9 Apr 2020 19:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66247F801DA; Thu,  9 Apr 2020 19:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7BCDF80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 19:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7BCDF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TgZGStOX"
Received: by mail-lf1-x144.google.com with SMTP id m19so186781lfq.13
 for <alsa-devel@alsa-project.org>; Thu, 09 Apr 2020 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j5y9erjap5VmHy0BQLWCh9oVMJ7PdliECGnV0deEBC0=;
 b=TgZGStOXa5YzcE/XeS59qlX6qIX4dKczf+omjTRlYVc7kUr+CaxrRkwrJqreMAAO3Q
 P0X2hEjUYmMKnQMlHldzMz64AcvhudBeAnFqfyuzNLDVkwuZiFUVl6GiRn/mOm4dmPlg
 Vcxl0iRHBtyOcX34+UNkZGfSwroNn7P440DSyaeDDOWbdAjbNfJcc9ObMi8fJS8NbODD
 Q9xg7pYCHLLwxDQRSA0DwaQTLoWcRIYM3licsf7mnjoC7S07X3koZpY8pV6K50XjZK+Q
 /RDHJOAU1VGceZJl0hY5o/BVxBAUWl00hD6Bc1fEGBP+sShBLFjTUCzk4M+AtyMn0uhE
 4PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5y9erjap5VmHy0BQLWCh9oVMJ7PdliECGnV0deEBC0=;
 b=C6SzkDnY9Woc6vZNhH/e/bETbJhRpxAJJ1HlWVskpIExettFKgVBTXjSVY8PHdt0bd
 cMok2LI0hfCCVyOKNLS3pa09OPP/n69FOGcautfU95Bwc+DHySqbkD2KoFA+RsajgP5S
 AwlDPw5S1egDcxy+q1iGr30p6NYYtmKxnnN+MsdLQhNSt6YwyqooD7BsyLIMbTBDSiG5
 Ni2jSJ9FiVZtBHlKCKktB30UbOTaOCPz4XW2her6OOu3imlxz+N2NTmPFFVjkKkl2QB8
 zluYsXmV4DKQmJzYcXUpDwRNO/lpJdMUbnSceR1VCvh/iy8CRQMxgayWFliCnswAaL6o
 6Zrw==
X-Gm-Message-State: AGi0PuaxS/V8h0bhS/53h5NZetve4AJmOOGt5zp8GRdOSizRMDlnZT/T
 SdYaQVchhJHW4UNOFcc5oYg=
X-Google-Smtp-Source: APiQypLZXt4t1Gkrg5L1En5p1CGXycKYgR724EWJAl4RMO/nyeZQwzbZ97CZnMFl6YDIVLqtyOEw8Q==
X-Received: by 2002:a19:f611:: with SMTP id x17mr182866lfe.51.1586452435969;
 Thu, 09 Apr 2020 10:13:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id v9sm15934908ljj.31.2020.04.09.10.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 10:13:55 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] Support headset on Tegra boards that use WM8903
To: Stephen Warren <swarren@wwwdotorg.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
References: <20200330204011.18465-1-digetx@gmail.com>
 <5c9c995a-a571-e543-e680-30739cb1561c@gmail.com>
 <848cc6c5-e8e4-2796-3ee1-3e12a3e92c54@wwwdotorg.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a7159a8e-4987-0c08-ce3a-fa82d926218e@gmail.com>
Date: Thu, 9 Apr 2020 20:13:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <848cc6c5-e8e4-2796-3ee1-3e12a3e92c54@wwwdotorg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
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

09.04.2020 19:54, Stephen Warren пишет:
...
>> Jon / Stephen, are you okay with this patchset? Could you please ack it?
>> Thanks in advance.
> 
> It looks plausible based on commit descriptions, but I don't remember
> the details of those APIs well enough to actually review the code change.
> 

The code change doesn't affect any of the old users, so it should be
safe anyways.

I understand that you don't feel comfortable to give an ACK if you're
unsure, but I assume that Jon is in the same position, and thus, I'm not
sure how to move forward.

Mark, could you please help with reviewing this series?
