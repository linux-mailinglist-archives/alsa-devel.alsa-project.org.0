Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40087566464
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 09:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C3916F3;
	Tue,  5 Jul 2022 09:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C3916F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657007774;
	bh=NFPdBZyWYMVilC2m0XdJ+zSMYL0JnFAPX+nNRkDHud8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XDQ/fzuaVqI95m4f7O/JfWDrEHSg1f4ObUX/1x9xq+BH3aGpoJHy2iNL5rO6IkHdP
	 Z5EB5I9iw3UCZfOWUq0zDOCTtVTxGApa9fb4bhgGWw1Mkipu9agO/OWah59UhlUESL
	 ijmkp+9sxI6qSG4B1nb+5uJ2YXlmzUDv1ZJKkzAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7474F80104;
	Tue,  5 Jul 2022 09:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 453B7F8015B; Tue,  5 Jul 2022 09:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E636AF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 09:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E636AF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="AC4el096"
Received: by mail-ed1-x52a.google.com with SMTP id k30so6079160edk.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Dd+03ltwb0A3OCeiLRuPRch6yR6Hqx8MxtfMOc1/kN4=;
 b=AC4el096uzd63l5aciUqinEEpLgrlQWcC38O1EV98cJQ+ByiExghvMKJ5nL3kIlWkL
 YKM1Ob0cdII8rY/1W0Hm2TclvjJTpEyoX/IlUYIJs1a9hWdUn4928i22OObOwAOs6gdT
 4a/mYN0TvFarKgGV0Dc1njO3U2NRo+Gvd7MMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Dd+03ltwb0A3OCeiLRuPRch6yR6Hqx8MxtfMOc1/kN4=;
 b=Kp0bWNFZTLNTChA7Odg+wyg7Wu9nWoBUk5lB0/2pTNPrtCqcNB6oYttl0TDwaeBIaf
 hRDBlqEqKFC5xOYsLhGuFICrKJ/Fmv4NJmgOsYK+TjC27Gw5zEo2EVtGiYTTYumxL/E6
 r7UZcnQKUb/BRctqupzdA1dTi46xW1lDiFBSw97VC65HUyyFgmJako9elEMz5xMieUZI
 aFoqHb3HznqkLOc44MyZymUEnTFuXAQIjOv7bffclvfi1C2R9j5q5lXdnKFz9GoSdiYK
 ELUckr+a4zXvl0HESTI+kFvKfbnzmYb5lt8HfLB1SBcLNM9NbVSPXuo/J8RXSb2lSiAR
 pvZw==
X-Gm-Message-State: AJIora/6w8hj++6puPESannjOqluBW4jJ3oWuN7pW3BhALlBrHygzdad
 JIVqJ4zWP3UPb0ZhsR1IFP1x1Q==
X-Google-Smtp-Source: AGRyM1vZKXamGSOdwS9rEBAHE6ehIF1mBvlnL7rtFuNKTsGNH8m5LvWDVWe9ZGbwOaYm136qfE84Og==
X-Received: by 2002:a05:6402:4507:b0:43a:5b42:2be5 with SMTP id
 ez7-20020a056402450700b0043a5b422be5mr11728385edb.392.1657007703459; 
 Tue, 05 Jul 2022 00:55:03 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a50fa82000000b0043a64eee322sm3421430edr.28.2022.07.05.00.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 00:55:02 -0700 (PDT)
Date: Tue, 5 Jul 2022 09:55:00 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Subject: equalizer cfg in max98088 driver
Message-ID: <20220705075500.GA1987744@tom-ThinkPad-T14s-Gen-2i>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

Hi Mark, All,
Just a question. Can you explain me the proper way to configure eq1 and
eq2 of max98089 using sound/soc/codecs/max98088.c driver?
Could be a valid solution fetching eq1, eq2 bands params from dts?

Let me know.
Thanks in advance
Tommaso

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
