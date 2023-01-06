Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3965FEA0
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 11:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D97FC7207;
	Fri,  6 Jan 2023 11:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D97FC7207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673000241;
	bh=JGaKCQH+O2J92bRKAJaVSwFsM3fHXgkTTHOLAXQHooY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OVmvHgMO6jJKMCXSfGoruve+yWfW98nCLEZ/Z+xEkP6XVL+r8z8WFc6TBeh5KCUaZ
	 MyGF7cTujKGV0R1kgfPRxY0rO2Yti9MDtcEIjdrjM4zr4lqELsctxb63V8F6hCC6se
	 z+GfMpkphIcunehmhzLmFD7LayKOOKrDTjch2Q3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25627F8025A;
	Fri,  6 Jan 2023 11:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA040F8025A; Fri,  6 Jan 2023 11:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C51F80238
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 11:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C51F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KhitYrfe
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so3214860wmb.2
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 02:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mayf8YyUfDaw4Cx2t4dPC5VLFeVdf9MzuFNbFN9Dcio=;
 b=KhitYrfea4FwMxD6tM9Ow4Ln38XmheuEBqc/uQPDE4Imfkdmv2QDqXEwfey8SERFgX
 Qwz5VvBvYsZvGQQb5tNP9V45Wbej9jxv4EexH3QmZR6pwtdW+DCYkDqwzEXFFUvw/UfX
 kLpW60lWS5xzCOHpwxQB21iPlM3OAtUM1pPl5MSeSXbviqaF6f0IZHqtZrJFiaC6HdkU
 b3L1BFJx03f/1eavQ7XW97vgs+WWSjj4NRusUAZpe6dCQxy6qoIWZQ/aTTSOzZgjXlSI
 DdGNL+mEYLpPpQEwmSYF6P6H5Jm8eF0dy/pqyRM6uOOBtZZUFLabm2uVXVolKDJhdMkH
 DB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mayf8YyUfDaw4Cx2t4dPC5VLFeVdf9MzuFNbFN9Dcio=;
 b=lBO77fumqc6sMOGYH83plK8kBLfcvbG+ySxUyI6uFb9PmleMo2OFxzdCUJ0ihowSq+
 YPWZbrxb/gkqaDVLkU9etfMWaJozingSLrE5AX8/I3Vj6l0m8SnnqxHoKdAsdQMos7nP
 HG5L7hNnOqyHuk790PnwLY/eG00u/FpRTSOa8xtv6uZ71DPSgRFcV8Dypr/xjSPw/bzd
 Lfvx7gYcLI8EnfQ8Mnla4yvh8A40+gjlG0mGGhFMUXUs/v3LkX3YXdLmPR4zVs/NtWYI
 Vbf2s8iNNLdgq1OqiTGTYJctO60KK1T2Q/PWWysotiW3AKefdZ5Zv5LZ1HtzViaGXbwx
 UUKQ==
X-Gm-Message-State: AFqh2kpR4Q2aem/q7O9bIrBm4RRs79tfaPpii5424r2l0UthiJB+Io8M
 6Fdg/Bdx4Ows3H/leFgVqc6OsJc6GFXWVQ==
X-Google-Smtp-Source: AMrXdXull42GSVjLoiR8DDBmnCs+dV/KU9gLZ6b7uWN6Er8R8NL3ArRpnN9/hAsA0bRWmnE4XX7REw==
X-Received: by 2002:a05:600c:3b90:b0:3d1:f0f1:ceb4 with SMTP id
 n16-20020a05600c3b9000b003d1f0f1ceb4mr39212643wms.19.1673000177068; 
 Fri, 06 Jan 2023 02:16:17 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c301300b003d6b71c0c92sm5961532wmh.45.2023.01.06.02.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 02:16:16 -0800 (PST)
Date: Fri, 6 Jan 2023 13:16:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Message-ID: <Y7f07Fa1LNpLP7ok@kadam>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com>
 <Y7fplQ18qyhKDC44@kadam>
 <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SLXP216MB0077B3BA3C18AD8F5A10F9708CFB9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Application <application@irondevice.com>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 06, 2023 at 09:55:43AM +0000, Ki-Seok Jo wrote:
> >> @@ -772,12 +772,13 @@ static int sma1303_add_component_controls(struct snd_soc_component *component)
> >>  	sma1303_controls = devm_kzalloc(sma1303->dev,
> >>  			sizeof(sma1303_snd_controls), GFP_KERNEL);
> >>  	name = devm_kzalloc(sma1303->dev,
> >> -			ARRAY_SIZE(sma1303_snd_controls), GFP_KERNEL);
> >> +			ARRAY_SIZE(sma1303_snd_controls)*sizeof(char *),
> >> +			GFP_KERNEL);
> 
> >I am surprised checkpatch doesn't complain that spaces are required around the * operator.  Please just use sizeof(sma1303_snd_controls).
> Otherwise you have to use devm_kcalloc() to avoid checkers warning about integer overflows.
> 
> I lost space between * operator. Thanks. (why didn't checkpatch check it? :(  )
> 
> But I don't understand why I use 'sizeof(sma1303_snd_controls)'.
> I only need to know the number of 'sma1303_snd_controls'.
> In 'sma1303_snd_controls', it has only 3.
> 
> So ARRAY_SIZE(sma1303_snd_controls) is 3, but sizeof(sma1303_snd_controls) has the value of 144.
> I think it's not necessary. What's the best?
> 

Ah.  Sorry, I didn't have enough context.  But could you instead use
sizeof(*name) instead of (char *) (it's the standard kernel style and
not just my opinion):

	name = devm_kcalloc(sma1303->dev, ARRAY_SIZE(sma1303_snd_controls),
			    sizeof(*name), GFP_KERNEL);

Also please declare name as char instead of unsigned char.
Also there needs to be some error checking for if the allocation fails.

This driver is going to need quite a bit of cleanup.  :/

regards,
dan carpenter

