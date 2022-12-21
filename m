Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802C653822
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 22:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABAD616FC;
	Wed, 21 Dec 2022 22:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABAD616FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671657391;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mZr647aXq6D+agHM9rV3MsGxPLmCqpsHT/NoedFZOUneCLO7s5D5HiVwsx9/c+f3O
	 e2Tlcc0xGAA63VF4YELCSOBMMsHay2wHt4OvjNLklI4S4R0/3SBJlMIgJy0ybOzlSF
	 QK3djpyFZvol7hTRKWl91A4BoMg5YG5u7/DZl/y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37F34F8024D;
	Wed, 21 Dec 2022 22:15:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83C93F8024D; Wed, 21 Dec 2022 22:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE6B3F8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 22:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE6B3F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VwHJCbXb
Received: by mail-pl1-x636.google.com with SMTP id w20so63571ply.12
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 13:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:message-id:thread-topic:subject:from
 :date:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AZDdkmaRZkPMCYhGc5lbFjK3sLKWoOrA1I5czMFtYrk=;
 b=VwHJCbXb1gO+vjG9YsKb7OwDVDG5mRgn5vzQWTkomrPnxa7EKZzmdZyKLBGLcj3EFS
 gZDYdtDiHBpgSqysCMQjJ5fTiH1WdOERAIHDfki1AY8VqVxl/koMV5f4/YUGUxAuv089
 y33ZmYFadEJIagOpq3XND+cV5IjxTOn+JFNKtzjVd3uX5+TkUawLqELHC+A7+y5D10NL
 Y6CIg04MnqA8GzXpCfMJ2o9aVG19ONadjg+pKJgEAxE6p+qParUQL4rZ9Sym9V06bc0U
 ZOuw4bfGY2+QDtu6ZMimLLmxl2NZzF01MvAxfpbleosOdVJmJvvWV1gsOhA2rO56UiYZ
 8iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:message-id:thread-topic:subject:from
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZDdkmaRZkPMCYhGc5lbFjK3sLKWoOrA1I5czMFtYrk=;
 b=UOscL4b6wpplFrPqsgT4lVbem2K/pmv2jLACNcgR/XFVjO9UtHouGVZccQzmW1P6lz
 VpVfFiCCtePVqOr4JcKd7G1g5NyJ5xxlHM9cboMWAma6zPUsfO8tIxERlH2sCo6svjsA
 5Y0iMZNRK1y4yc3nf6kleIIoeKCCMD2OPuaHL7FkaoFAKx9m9dXOfHfUZFm5aYWUJH+W
 mxM4ZHSdfSNjJC8DKmPVliZqk7osqQ3XNuoxuvmj1k1QokN1+2TUlQvhAne+stlpLMWc
 IP1dHrgM9W/g0YLUHvDslYQrea5NxJ3aDfywZY5B+Q3MZ3a0mqFx6J5Cj5T3ECvDdA86
 UuiA==
X-Gm-Message-State: AFqh2krbSTCrbv6HoyWsQGzC9SFQl4G+DOYmN5KPWgwVSD5xm5vZDEiU
 QzKGhAGIwM5JWWSlRQyrUbiT0E6vQ8uvfA==
X-Google-Smtp-Source: AMrXdXtbQhQ1R1KHuAFkWozPqwQXyKytQXICIbomvBTdFzjsTFyqWJb52qwCue0fTDXwVFNg1QBI8Q==
X-Received: by 2002:a17:903:40cd:b0:180:f32c:7501 with SMTP id
 t13-20020a17090340cd00b00180f32c7501mr3909849pld.0.1671657332719; 
 Wed, 21 Dec 2022 13:15:32 -0800 (PST)
Received: from DESKTOP-OQV70FD (76-253-1-78.lightspeed.sntcca.sbcglobal.net.
 [76.253.1.78]) by smtp.gmail.com with ESMTPSA id
 e11-20020a170902ed8b00b00191152c4c6esm8590634plj.152.2022.12.21.13.15.31
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Dec 2022 13:15:32 -0800 (PST)
Date: Wed, 21 Dec 2022 13:15:30 -0800
From: CoolStar <coolstarorganization@gmail.com>
Subject: Re: Re: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
Thread-Topic: Re: Re: [PATCH] ASoC: Intel: avs: Add support for RT5663 codec
Message-ID: <60FD2E00-2A51-4F48-84A1-378276A56053@hxcore.ol>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

