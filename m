Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82762D1DE6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 00:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A2E16E9;
	Tue,  8 Dec 2020 00:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A2E16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607382148;
	bh=77sr8HFtHvJZAreczLwfeNUOat5H4YEjQTSP+cQ/HsU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CuLune9i7YXe9OgpPw6/UPzAMsQkNMfvnFxELYx197fcfB34iO5QOOE8QUDHf4Ljm
	 0fSIGM9/i8sX6GMmdgBjWtU3kowLhf9MG8p58rlUHZHcuFNo5Z89uUWVlCXyLXmKV6
	 6NZOhekfswAogpE+lpLykBY+hXrlF+yNSQIt+jFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 700A5F80217;
	Tue,  8 Dec 2020 00:00:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16FA6F8020D; Tue,  8 Dec 2020 00:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E005F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 00:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E005F800E1
Received: by mail-oi1-f194.google.com with SMTP id y74so17338123oia.11
 for <alsa-devel@alsa-project.org>; Mon, 07 Dec 2020 15:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pOtnxwSjj67drQwIquaFUTWelLm5egSP5rxIl8SU7vE=;
 b=W77u3L4M+veAMmoAwrYRbtZoiw8MTdTk7qGz/x7NA8PbIAEzQPORm+R2JybfM43UEW
 7XlPJk2IQPZZcOiLAWDDntJe92mGJ6pkRlPCSYtfjYsVvOotPi7yqY/IVrricYKKWXxA
 C4qUPEwZV3N/zQBSo/kryjPSdeT0txABzvISDZKqVUm8cOSVDi/h4WHlVjYs08Hc1A92
 UiTy1B1p9PQ5h6WmboTlAtsHXtYRWbQxccL+XLqnU+UUwfU4vEb6hGV+2RYgzguSVuYa
 I1BfkvGR2QYTP44PFzYfJ/KglGamXXbCP78PRUDnCOXCaHjynexifJp3Xp7SymKTNBWU
 rleA==
X-Gm-Message-State: AOAM532qGwsMrFkviyqQXcICWOFWBAMkmcADelZaKNaPFUvO1p8nQdAg
 Ko1UItgRIIkm7qkDPFdFDA==
X-Google-Smtp-Source: ABdhPJzzP5lELAlv2UEEAGXv4tTBLCWDom3PpfzErxjtr7d2lasDJWYeKkDrSw+fq0+Y82sgW/YXPA==
X-Received: by 2002:aca:1110:: with SMTP id 16mr814160oir.12.1607382040321;
 Mon, 07 Dec 2020 15:00:40 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y204sm1866830oiy.38.2020.12.07.15.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:00:39 -0800 (PST)
Received: (nullmailer pid 1007513 invoked by uid 1000);
 Mon, 07 Dec 2020 23:00:38 -0000
Date: Mon, 7 Dec 2020 17:00:38 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] dt-bindings: mediatek: mt8192: eliminate yamllint
 warnings
Message-ID: <20201207230038.GA1007457@robh.at.kernel.org>
References: <20201207031430.1345-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207031430.1345-1-thunder.leizhen@huawei.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, 07 Dec 2020 11:14:30 +0800, Zhen Lei wrote:
> Eliminate the following yamllint warnings:
> ./Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> :10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
