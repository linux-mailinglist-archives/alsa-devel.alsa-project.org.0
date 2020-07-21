Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F26227C9B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 12:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5133E1697;
	Tue, 21 Jul 2020 12:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5133E1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595326267;
	bh=/iJGlwPRF/p4iCOj8F01Sy+lHyXZsG1h4xJYB1UA2SI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLqoGJ/LIhWTtodVokvIEnTo+Nelz/QUlby4n1hUYrGK7YbtpLpiEZz8UM776Avpz
	 P5uhYPufhJFIR/BnRRW1hG9cZaRMvNvaazNcSEgxI/fwvgh1b6f5wAMvrPX1kNrIls
	 r9P8EbOBoBUZJLq1o5M5qtf1K4+x7uZBmoWD+768=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC41F8024A;
	Tue, 21 Jul 2020 12:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F22B0F8024A; Tue, 21 Jul 2020 12:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABF08F800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 12:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABF08F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QzHwRgdX"
Received: by mail-ej1-x644.google.com with SMTP id o18so21054528eje.7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/iJGlwPRF/p4iCOj8F01Sy+lHyXZsG1h4xJYB1UA2SI=;
 b=QzHwRgdXSbNje48D0kxAsU06Yiv1WqhyIcd1bG7Jw99+XBwybAzCbTJBv+RDt5luzI
 64pKY4b/JJZqS3KwOvPC8CcPDQVgWos/CHsPtGVGS3Td94lL7JHhUtSVjH84R2RER4zW
 PBrihx/vs311ZHXCK/wF6AgfvUPOLwJquy1hjA887N0BtrwMCglQ+1xujz5ypwsJNXaS
 keRWjxed2RqNN3fCnhDn8lNXNQIfOY7kzuUjGsxfuWtgCl2cav2q7a0nRSnFo4Au86b5
 sf1l/u+LfyQXeYFyXiqqt2ywxmoejYN8XQhAWDrRChbk5rsynQiFhN38tX32DW6w84An
 k8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iJGlwPRF/p4iCOj8F01Sy+lHyXZsG1h4xJYB1UA2SI=;
 b=GbQucbMiNqh14uiAeb9z16pPALOtiQZ8zo3TJTCGlBVpduSuBdsu+Ei9N4f5LKNZzN
 w90f87r0slIEd4y0+d+vBR4znneEUAxY9M3q7RlSAUjPvI5P5wTeJPFjvb0vKjMcG6V2
 JJpxkGBJFmWh+t4vrPYWf1XLrVy7ICdwsRXs3g+YYe+MxxrpQcvNeo+cbage2D3Ofdpp
 hhUbZRsH2jha/tjqtWx6PDOOy+l4kv3myxPLm21223L0ELiuHegbEGN1/AbWkbjRG50u
 AtnE5aIxs6tbwNomu+IJEp16U6qNo7/xL83cUihN7gsHXDhXNO2J8moSar9p38FPaqPS
 coJw==
X-Gm-Message-State: AOAM532Gm7zDaMWXnhe6d7mrdKunPL0zQ3IEOe6wzQVJqgHisHYCSm0n
 6JyGxLCK0920RpT2Ikcx5l6qZMSJ6rlVuA==
X-Google-Smtp-Source: ABdhPJzdZ7ID/DihRb6jZle2mBwLGaJVPw59kty33SpwSXgF6eC38hMosI1vomgpJVaW6D0w9KoN5g==
X-Received: by 2002:a17:906:3b9b:: with SMTP id
 u27mr337786ejf.500.1595326161293; 
 Tue, 21 Jul 2020 03:09:21 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id dg8sm17305094edb.56.2020.07.21.03.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 03:09:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] Move DMA-buffer off the stack
To: Takashi Iwai <tiwai@suse.de>
References: <20200721095748.16224-1-rene.herman@gmail.com>
 <20200721095748.16224-2-rene.herman@gmail.com> <s5h7duxyyl5.wl-tiwai@suse.de>
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Message-ID: <c2b4931a-e1f4-8c69-0e6d-686ca1847785@gmail.com>
Date: Tue, 21 Jul 2020 12:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5h7duxyyl5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: nl-NL
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

I'm afraid I'll now just go do other things again then; will keep things
local.
