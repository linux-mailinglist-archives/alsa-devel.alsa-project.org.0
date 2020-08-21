Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DB24D49F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 14:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE061688;
	Fri, 21 Aug 2020 14:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE061688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598011530;
	bh=PG5ptCpNTSWQo4tv2+ei6JOTCoVH4AsIIpLu3Ak880Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNd8fW9nElJkjSdA5oJqf4MbEOXtJCirKldrWpbBTebksXGcGt7j02kotoVVMi9uG
	 BSXss9LY9hPpVltQX9HMlWN+aqiktIy73rvhUYIjaIWy7Bztz3ZD05hxjgA3X2OXuB
	 wImh2sW3McaIz5wOOOWNAXcBp9/IP3G2h/sEr8q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D5A6F800D3;
	Fri, 21 Aug 2020 14:03:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39053F800D3; Fri, 21 Aug 2020 14:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511F1F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 14:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511F1F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="J+JItTlP"
Received: by mail-wm1-x32e.google.com with SMTP id t2so1349619wma.0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 05:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p48NazErvhXBSdYpUlvISqTMlZJT39nGGGYPAsW05Y8=;
 b=J+JItTlPxkd8PGUzEzDb+iSatRgqlFbWcWmqbJKZGj5oAfyDQWTt2GQnpnmA25sLoo
 XTJljeDCbD57Sq/8tymAMFkUrOwkn9jqvYZ73X5z/ZpvGFaBgP/UGTxhz4IdC8dBSuqb
 D7JcwBY37rtw0yXd9sgEhLPRMJDZButEDi7G8o3HO95l4Nyo/H0rd3Zl61SV4IIiXUTK
 kPfC0UfMPAf032NVUA+Pml0ujuaLS2U0EsPadbVcAXPyrVrEODeNOfm2kSqLg2Y6DjSF
 2Zb5thpLJMNQ1sEEOPMmgHc4BV6z/VHIC4JtITECyofc26wuM6B6PWMZaRP8qDrIWprA
 sjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p48NazErvhXBSdYpUlvISqTMlZJT39nGGGYPAsW05Y8=;
 b=Q8Xg+T6uTo5dN8TYFcQSnyl8G+yOJ03Uuf7N/Djf/2RzwFtAw9tN7ZXVK9+ej4CoDi
 BFmxnIZEKF/XdujUSvB/NV4TJcph+SBbpwSPu4aFPVp2SCTKtyhnlCI9PR92yY7vsaZD
 7qpYUEZTy5goOb40NvPTBfP0bV/MNjgNFMW7A/7RIpTYAH7FNw/22mzjm3O9dI9CqMxs
 DEjQrp75xx3Q2HAWkDtoqkiA5NjfeP3D+d1YNKDx5SU9HFWgEJkVHb7O65/zjKNFJIbH
 i/zkSwLhrpA2qsAuhed28593qujSuDs/qnWASgl4hmzGfNrbZFkZqpGGnL1oAatjmnIh
 Qnpw==
X-Gm-Message-State: AOAM53283eWqvTMhQI18BMjq9SLB9xqmEh80RCPxcNhJDSXwYTZiwclm
 uXm7RRiMtpv0ljBAtkVeQ3US38xuHmYULedw
X-Google-Smtp-Source: ABdhPJz1WdpesdXI3Zf3He85rrZsNEOrGv+l3CF2FeaQCK3Yebl6xj2HTifoSOvjnvuE9SF5teWLiw==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr2995311wmj.90.1598011412074;
 Fri, 21 Aug 2020 05:03:32 -0700 (PDT)
Received: from kamdesktop.localnet ([2001:8b0:be0a:29af::201])
 by smtp.gmail.com with ESMTPSA id f6sm5986050wme.32.2020.08.21.05.03.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Aug 2020 05:03:31 -0700 (PDT)
From: "Keith A. Milner" <maillist@superlative.org>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Attempting to understand odd snd-usb-audio code and
 behavior
Date: Fri, 21 Aug 2020 13:03:30 +0100
Message-ID: <1812050.cYJzfEYQ9C@kamdesktop>
User-Agent: KMail/5.2.3 (Linux/4.15.0-112-generic; KDE/5.36.0; x86_64; ; )
In-Reply-To: <20200405021415.0e7c3f44@rosh>
References: <20200405021415.0e7c3f44@rosh>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Ilya Dikariev <dik_again@mail.ru>
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

On Sunday, 5 April 2020 02:14:15 BST Ilya Dikariev wrote:
> Hey Keith!
> 
> I'm working with Roland R-26, and have pretty same problem here.
> Was you able to solve yours?
> 

Hi Ilya,
No, sorry. I also didn't have time to follow up on this. I get the feeling 
there's a lot of Roland/Boss devices out there with this problem, and that 
fixing one of them will fix them all.

Regards,

Keith


