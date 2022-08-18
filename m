Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85F598A12
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 19:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4E51671;
	Thu, 18 Aug 2022 19:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4E51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660843014;
	bh=qqslpfIigCvZWhnKd6zOGTfvu57+aHqVXC9rID9V8q4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=If8K+EIS9ZTNCYJkaHWmgGj6AE+Z6CiWwsOTocKJEYXB7UlDLhJsuL8IjinUay8+K
	 yaElrJTuGnZGU1ADA2VglUx8/arlrj+6WY93FC5zw1/1Y0MxdZJCEsFABU1G2Z+FvT
	 1dic/wVqS/0IE3lmwCd5kTfAouzTdEkl3yd5CDa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FEB6F80495;
	Thu, 18 Aug 2022 19:15:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3441F80430; Thu, 18 Aug 2022 19:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0C28F800B5
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 19:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0C28F800B5
Received: by mail-il1-f173.google.com with SMTP id b15so1122043ilq.10
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 10:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=UWsf+zlgyhNyjO5Y7JQSuQwv4XP3mzyiE5nZk/xIkL0=;
 b=mqJFpw3+lPi5OaQjbG4Ak4PSa3p8nhoBdCo0+hT9KmZYfKtyCqOYbweS4ocpsjyTcT
 hXx/VP3YQVM2qktI3odK4Wuq8c8O/Y4nzIFGA7Ncc+ScJCYQRX7iBd9lUJ9vAKxyr3OK
 NWuHFjXd7PH8V1RDnO86Gp0JhY35p0TxbQlcSZv/X9BqShR8d1spIZ3kHhiaV6dRjPIO
 v+U9rJ9LKkEGNHRT0EC0fdtD41hXBHjAgkMy0UXBTb8682yT1DhT8lAItwc7Y3nRt6hy
 kiNMAyetG3iZ/BKuh2x1DoVTnR/GdKb/jUFpmBddo2ivoV3a0bLCGZ64LmGQXh8h+vF0
 L0Lg==
X-Gm-Message-State: ACgBeo2Nts0WV/yQ5ed9/xSE+tV2BLtc/70LScKrpuuA9izGfQts39cv
 I3Q7ENptjrjIlr7brVUh/A==
X-Google-Smtp-Source: AA6agR5Veo8vJr6OZE+PXLhrBYUKE7szY3eTD73CFkv6Jb6VaIbgetV13AQzlMpPWH/NxWZ9e3NNVg==
X-Received: by 2002:a05:6e02:1685:b0:2df:2dd5:80f3 with SMTP id
 f5-20020a056e02168500b002df2dd580f3mr1870031ila.17.1660842946004; 
 Thu, 18 Aug 2022 10:15:46 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:647:4ff2:3529:f8cd:d6cd:ac54])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a92de44000000b002e904093c5dsm828143ilr.44.2022.08.18.10.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 10:15:45 -0700 (PDT)
Received: (nullmailer pid 2050959 invoked by uid 1000);
 Thu, 18 Aug 2022 17:15:43 -0000
Date: Thu, 18 Aug 2022 11:15:43 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,sm8250: add compatibles for
 sm8450 and sm8250
Message-ID: <20220818171543.GH1978870-robh@kernel.org>
References: <20220818135817.10142-1-srinivas.kandagatla@linaro.org>
 <20220818135817.10142-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818135817.10142-2-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
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

On Thu, Aug 18, 2022 at 02:58:15PM +0100, Srinivas Kandagatla wrote:
> Add compatibles for sm8450 and sm8250xp based soundcards.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
