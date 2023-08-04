Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9EB770231
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 15:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A6A7F8;
	Fri,  4 Aug 2023 15:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A6A7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691156945;
	bh=GSQRoi7hD9Uq1dfWMcv1+DQaA5dzzQwjbYGfEFOdL8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2x8HyCmNeCLu/PnrGPCm2Z++Tua18Puu4WRglg2U+GbkXKq9yXAAayJ7YKOz+s2w
	 fqWrDgU4jRbTrcYkN75Xm9fFCdlaaz5TDYatTHS+nJJ2vVScl9I3XBIg6XvswBjLZT
	 GJDgS+JT01FbC462iqljY8rcq/1bmkTCEQG8GphQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC399F8053B; Fri,  4 Aug 2023 15:47:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51466F801D5;
	Fri,  4 Aug 2023 15:47:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF2CDF8025A; Fri,  4 Aug 2023 15:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 405C0F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 15:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 405C0F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=resnulli-us.20221208.gappssmtp.com
 header.i=@resnulli-us.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=FbpksK0a
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so1905928f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691156861;
 x=1691761661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WvbyZl7o3izzZQLp7Y0b9RIMj8QAxcAwWaunav84SDw=;
        b=FbpksK0asFziyiy+hK5v4TcQeeIaIR1NUXNvp0T8YwIEs6vbTIzOOo5KfzF6tSkBgO
         +OdFIboek/+rGTvwJN79ftPr13X8lXu6aHUbX1g+9fbgNpR9v7UIn2dpeeOfg+CW28K6
         IXUq18aclWGyg78WIg5kIQmrgzHvo//yDiiOnUyM5YsU0X/AYIQ6lbBi+7LZ0qtVEZZ/
         dpCzQLrCgHa7TCAU5XGJIgQQf/npJHeGH/CIU1W/Np8jwk5rYm8oNkXIQLm81oc/WcY9
         KTwJHeXxbI4QdnwLIUNXypwa12L+YonKHEMlefiMtlgb9HuxhmpKQzLV5h27Mk+Qarn3
         tY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691156861; x=1691761661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvbyZl7o3izzZQLp7Y0b9RIMj8QAxcAwWaunav84SDw=;
        b=MBiul4VYxPN3X8RFxVdtYPPjYjR75q2Es0vVGQgxIerSdiwXR3ewJoSgsMV49uRrND
         8U5+uV2I0K5GcbKIQrupWTtXX9ynUjRvSnYJ+zxgA42mFCS39xncVDf+2kEQ4HTjFC6q
         6++kpEOuhwx6H7PiSQWpVJxWW2b0gYyOQBsq8QCqMXUF9BY5cKhdbptLTB272BDd3HpS
         yWgvtyWQCohAsGFVEUGFqS8ZhKoLLhbblx8buGUxSFp7xFWGlfqLgMk42S/NSKJpl1iL
         LXj3F6H3YwiCcXi842Vr++bkzhlnKrRC0YEXDt9sAwxsHiDnbLWAH/srQQ6o9JPY30c0
         4f8Q==
X-Gm-Message-State: AOJu0YxjrCH8SSAXX3NSeGLkI3PaNwi+lf7GyLbxuXe0WqFutueHjuqR
	TGYv2h0jW2VMyPbDjmv3BBXuVg==
X-Google-Smtp-Source: 
 AGHT+IGtmkXCcqnZuQaRYwvop1xV5GK+cjBPXEH1CvswNseUlrG58a4yXauQA15UyMe4/lX00LOAFQ==
X-Received: by 2002:a5d:4a4a:0:b0:317:6175:95fd with SMTP id
 v10-20020a5d4a4a000000b00317617595fdmr1319065wrs.43.1691156861110;
        Fri, 04 Aug 2023 06:47:41 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id
 q14-20020adfcd8e000000b00314329f7d8asm2594246wrj.29.2023.08.04.06.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 06:47:40 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:47:39 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: nicolas.ferre@microchip.com, conor.dooley@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, maz@kernel.org,
	srinivas.kandagatla@linaro.org, thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de, sre@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
Message-ID: <ZM0Be8S8zII8wV4l@nanopsycho>
References: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
Message-ID-Hash: 7NTD4HQ5NCJJJZBMQQ53LURFH732Q7E3
X-Message-ID-Hash: 7NTD4HQ5NCJJJZBMQQ53LURFH732Q7E3
X-MailFrom: jiri@resnulli.us
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NTD4HQ5NCJJJZBMQQ53LURFH732Q7E3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, Aug 04, 2023 at 07:00:07AM CEST, claudiu.beznea@tuxon.dev wrote:
>Update MAINTAINERS entries with a valid email address as the Microchip
>one is no longer valid.
>
>Acked-by: Conor Dooley <conor.dooley@microchip.com>
>Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>---
>
>Changes in v2:
>- collected tags
>- extended the recipients list to include individual subsystem
>  maintainers and lists instead using only linux-kernel@vger.kernel.org
>  as suggested initially by get_maintainers.pl

Consider adding entry in .mailmap as well please.
