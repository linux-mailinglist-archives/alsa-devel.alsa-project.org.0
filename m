Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4952C2624
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 20:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE2A1665;
	Mon, 30 Sep 2019 20:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE2A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569869975;
	bh=ud91WaGpsa0snH4NH0fjqkJ02SyVl0aqvNoKF7iHQ8k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ha5KtId4tNKkBfKID1DFvZvQEhSdJoSW2l7I8HkEHeV1OqePcV0AuDPYugS+idvnw
	 rE1fRhvNGayknQm4BqCu5w1jPfqowUWf512/qYBXARTsQf/ASUybo5uQBvSA3TAuqp
	 cvfX0HXMgYhV/RFFE5g69LMxVMPrr+eDxvQ/SuIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74AF8F803F3;
	Mon, 30 Sep 2019 20:57:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 516F7F80391; Mon, 30 Sep 2019 20:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 692C2F800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 20:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 692C2F800D0
Received: by mail-oi1-f195.google.com with SMTP id i16so12113525oie.4
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 11:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BHeCpN2463mRdVd4Een2eG9NLKq6PLofbIreirL6ULM=;
 b=iWxoPsLNek0UweJ6izs/4464fYBmt/nUpl3bKKv/og0+6v41w5oa3esDPCS51OO60l
 1Z4UfOKt5RW5GJHtAxv7djwjc+RyX17VezSsiERhUmh2zAMdvN1iuPxj7VseGd7p1o8q
 5kOHFILAALBzpszInKxGzZ6HUDRkcqIM3KPuXTe1dD/5ZomIleCDpO/nkU3DWuaIk3Iv
 E2BPHTx1FsygvMyvm4SCKAbZ0H/MWwafkJOivy2dMGrzCTy8GzX22cn70oqOmFcLSlcO
 8LAuPiKIDGbWI8IgCeq8D0hSPTUjlOWhYNtn+hXw0rQknYkphLoJ0oZG6vCuk+4yxzgG
 D+BA==
X-Gm-Message-State: APjAAAXZdnse4gCMJJrrJ9HMmv/XiCOxYfrwMTY6tb7CmaVzmdxQSL29
 drDnBiovyfPgVrxf0S2cpQ==
X-Google-Smtp-Source: APXvYqwwR+as++oOAeBfzG/uIVrhnm3yF5hx+JyUgYRKMiH7ZEmlrV6X71etrsLz0P1tGpDCcgNPZQ==
X-Received: by 2002:aca:d846:: with SMTP id p67mr550811oig.144.1569869862328; 
 Mon, 30 Sep 2019 11:57:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b5sm4531019oia.20.2019.09.30.11.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 11:57:41 -0700 (PDT)
Date: Mon, 30 Sep 2019 13:57:41 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190930185741.GA18160@bogus>
References: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V2 1/2] ASoC: fsl_mqs: add DT binding
	documentation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 13 Sep 2019 17:42:13 +0800, Shengjiu Wang wrote:
> Add the DT binding documentation for NXP MQS driver
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2
> -refine the comments for properties
> 
>  .../devicetree/bindings/sound/fsl,mqs.txt     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
