Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581384954FD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 20:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69062CE0;
	Thu, 20 Jan 2022 20:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69062CE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642707448;
	bh=Gykduj2+6cCiOHfzT+au7vOMO/MOcJZyIrmVlUEboCM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GugrqUF9najjGGEDN3Zq1KQRrNXfodlOQRiQhSaJVCAGt0s9aodHlM0Bfobah9Y1/
	 iwkc8DLPm5HbvD2YWs84uP6UpG3RLAHRYfrmAETusQqTb5NnHyPdDJTdoeMSKm0JQG
	 0IBjWqiEJf05PlMnCetJlJqTElX1M+j/5uTuvneM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59571F80134;
	Thu, 20 Jan 2022 20:36:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8873F8012E; Thu, 20 Jan 2022 20:36:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C348DF800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C348DF800F2
Received: by mail-oi1-f182.google.com with SMTP id y14so10394371oia.9
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 11:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bOq7x0yVaTljW1EjDfxCdNhTg4DVSwDiAfuhm2P6J1I=;
 b=2eaSctUrhzrferMsaUAyIYfEjABiCllfK796CXuupaf2oen8XM3xusu5Xz+Ma1yJrz
 VFRbaR1iIz6IMufSGfh7/+ZEmANyYfEF8FLDmZyTzCAXP0H6OegDo1nvyKYCvmM5l+DF
 WkikxUVUaSGCQ64KhCzszBbtwb2lm7ZYPsnVWLsQFs1T18tM00xJ+YdGr8eF4Tr/AbgC
 r9XVj3yZunR07jGXd6L/ETUVQnxRIdin5LS+BhdL1Bqnd81OiS4t6skNabO52gh0Qwt6
 U9LBQ4VJQc+zRlHLxP/o3k1JQtKkttYO9SUMn6q1q+HZcL1OXuZ8peY36X9GLmh4+DF0
 4X4A==
X-Gm-Message-State: AOAM531SiTkRrxEpfuVxRTFLzk5xXUTSa/cWnYgG8lH6ai3FxvW+fX7I
 4Uk07agJOYRuE5nFfQknEA==
X-Google-Smtp-Source: ABdhPJwxCLpHCyhx44N9LfWQt9YtGk58bPTzZASlbBG8+oBHuLazjY74dmWVhanjP/4/nIwa5mMguw==
X-Received: by 2002:a05:6808:159f:: with SMTP id
 t31mr9087116oiw.60.1642707375490; 
 Thu, 20 Jan 2022 11:36:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bn14sm62895oib.8.2022.01.20.11.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 11:36:14 -0800 (PST)
Received: (nullmailer pid 1814592 invoked by uid 1000);
 Thu, 20 Jan 2022 19:36:13 -0000
Date: Thu, 20 Jan 2022 13:36:13 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: cirrus,madera: Fix 'interrupts' in
 example
Message-ID: <Yem5rQ7RFG3bUUxV@robh.at.kernel.org>
References: <20220119015611.2442819-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015611.2442819-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>
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

On Tue, 18 Jan 2022 19:56:11 -0600, Rob Herring wrote:
> The 'interrupts' properties takes an irq number, not a phandle, and
> 'interrupt-parent' isn't needed in examples.
> ---
>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied (with my Sob added), thanks!
