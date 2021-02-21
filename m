Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B736E3209A5
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 11:55:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 415B21676;
	Sun, 21 Feb 2021 11:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 415B21676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613904908;
	bh=MYJlR9KCecVfd71qMJBSON+Tddz23IjRE+TY6yLU7iY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSyomkzWQnW0E3DbrKda9Hnq/olijQZv/RycmMDRsbG3iqKNv+Fi0ufsqFnhv5sCu
	 JU8RVgOop2FgJuAhzcMF3ifJBV7ZR0ZygeIxl19XEGzqqnXo6Df3Crzk5D5bO8vOLZ
	 22wG6+hkhf4HLTkynO02YxZHAS9B0f6K2FLlun7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80AC6F8016D;
	Sun, 21 Feb 2021 11:53:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5049CF8016A; Sun, 21 Feb 2021 11:53:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ACC1F80152
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 11:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACC1F80152
Received: by mail-ej1-f48.google.com with SMTP id n13so24152073ejx.12
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 02:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oawewo00a3TeuB7CeQxlnb3r7CXvKJcptWq+Osnwyzs=;
 b=lr19zHUXjWOLboPfLhDUjX6nSWJ7HDme2eonAR0kIiM3w0+TLZV0BQA7grW3CWiZcK
 3Ed24POU5MTHEDVpQVQ0NbqqCyPHfkPN36mX/SacE0prv4ZksBHljsp4+K9sbUzR57t+
 kWzwlAjJQ6CotoL8jCtu4tTxa3HXtSgOt+5HzZ5UMy26zw4+fQ+KXSm6aCO+UeQLoitc
 OGXARp5vARAt7RcS/scD2oqHBGML4wetBLM9dQRN+a3RdkiBFBEbh6APBbAYbyl6S08t
 CxD7cfEmBL/dp3hOoibJxqcpW6ID2FPatq7pULQuLanGF2uZ5qqcIDCTDMYw7GdJEo1q
 oFFg==
X-Gm-Message-State: AOAM530XtBjsVQirR/lA1TadyXHhhZUvTlpwF9L2T3bfKOrTi1BrTs0s
 KA/H8lPq1mat4XSe7TOqwmqSEjuwTn0=
X-Google-Smtp-Source: ABdhPJykuopV+UCsliOsnSs8LMJBHZnPUmb6VjPGikftHVrqwHSJrqKV61nevT8q6oXQGEATowe99w==
X-Received: by 2002:a17:907:1b12:: with SMTP id
 mp18mr16845634ejc.128.1613904808609; 
 Sun, 21 Feb 2021 02:53:28 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id a7sm2916251edr.29.2021.02.21.02.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 02:53:27 -0800 (PST)
Date: Sun, 21 Feb 2021 11:53:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/6] ASoC: samsung: i2s: remove unassigned variable
Message-ID: <20210221105326.sf7f5zblsmljw6ml@kozik-lap>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <20210219230918.5058-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210219230918.5058-2-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Fri, Feb 19, 2021 at 05:09:13PM -0600, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/samsung/i2s.c:1159:18: style: Variable 'dai' is not assigned
> a value. [unassignedVariable]
>  struct i2s_dai *dai;
>                  ^
> 
> This variable is only used for a sizeof(*dai).
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/samsung/i2s.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
