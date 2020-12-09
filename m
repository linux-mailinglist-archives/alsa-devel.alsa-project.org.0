Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3C2D4B71
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 21:17:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B151516AE;
	Wed,  9 Dec 2020 21:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B151516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607545049;
	bh=7nmEM/p3sP2B+Q91cmncNJOr+oCAWzPBNHiCvQFhK9Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=igWUkfa2mbhT/tWKGhInUy5tsLYO/WWMd9RFG09b/lqjPU+NI54eFkhhvkifKVc1k
	 i0LiFC75ShOpNsf+GYXat4pWlK50dW/oL2znxljJiZFc84tHmjBlLdwos1ERQusO7b
	 QTnij3GkB+niTbZJeYF1dD9sYOehgQuD98BIYBbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA1D2F804C3;
	Wed,  9 Dec 2020 21:15:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DC6BF804C2; Wed,  9 Dec 2020 21:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70C80F8027C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 21:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C80F8027C
Received: by mail-ot1-f67.google.com with SMTP id q25so2651313otn.10
 for <alsa-devel@alsa-project.org>; Wed, 09 Dec 2020 12:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8uhElzcobLmvJ4CJ8rrknqlI/sKGj1GFlEu7d86pG6Y=;
 b=JxCS8Fs3JSW5T2EU+W2ooCDePj3zfUK7lckFnGeclQj2kLde7+dwLxNGma9ysKmnml
 zraW9Akz4fkV9zrQOMjRzN6cSS4qi7/cDbBiBSYpz+c2WaA42wtPsMXL1xlN/DsRlYul
 KCwvxJKotNfmyhRzuoZT9hMij7N9ag/I+xJsc/54h03cYLk6Lw+NHiZpPeL5FxcDsQrX
 5Vc6oTNJqtbgNJDqqVLZ038zmpM8gOx8wzCg1XRGWQp56Y5ae9Natxr+uHjvdVgjGvNx
 7sC8g740SBBmbH1uflYEJW+tdYOsBXHnMbC7AwGLwE/F99cKj88n593rjuz721P730Th
 yXJA==
X-Gm-Message-State: AOAM530MpyS4/rW+IFT/MoJlfB3goA61ZHN5u7e1dBmIljndOWbW0H4a
 BKX1fRRyqUX2C0ASThA/IQ==
X-Google-Smtp-Source: ABdhPJybi0Z6Obt2cspPMGRt7yCnDYiVdU/vAftLj6qWIRBhe1uxzVYP6NeDiR9hYoTckA/bE7t1pQ==
X-Received: by 2002:a9d:2946:: with SMTP id d64mr3240127otb.214.1607544949663; 
 Wed, 09 Dec 2020 12:15:49 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a24sm529252oop.40.2020.12.09.12.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:15:48 -0800 (PST)
Received: (nullmailer pid 867803 invoked by uid 1000);
 Wed, 09 Dec 2020 20:15:47 -0000
Date: Wed, 9 Dec 2020 14:15:47 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RESEND PATCH 2/2] dt-bindings: tegra: Add missing HDA properties
Message-ID: <20201209201547.GA867682@robh.at.kernel.org>
References: <1607006202-4078-1-git-send-email-spujar@nvidia.com>
 <1607006202-4078-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607006202-4078-3-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org, thierry.reding@gmail.com,
 sharadg@nvidia.com
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

On Thu, 03 Dec 2020 20:06:42 +0530, Sameer Pujar wrote:
> Document the missing properties which are currently required for
> Tegra186/Tegra194 DT files.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
