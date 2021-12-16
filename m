Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17428477D8D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 21:27:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A6B3203F;
	Thu, 16 Dec 2021 21:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A6B3203F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639686473;
	bh=YpG8fmI6EYu8zj33KysKLZWEXHrD6MYP7mG7y+42ooI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J8L2kpFLR3GDXo0KZGV1c1QW5uqFfnP2y1oQpLJMvjXrg4h/RVO41siSblhgMbimZ
	 9ONeek+yk1oNBqL1SsZ2Pvi8s41NmURiU1gsTVhOt0f2Gmyt3Kj5IsUyjCy7EzPORR
	 N53ezWvtB5Nf4Q6OuilbeaBLcLMEgj0wqgp2mBwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0EA0F8015B;
	Thu, 16 Dec 2021 21:26:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 277DBF800DE; Thu, 16 Dec 2021 21:26:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26CE9F800F4
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 21:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26CE9F800F4
Received: by mail-oi1-f171.google.com with SMTP id t23so585010oiw.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VAHsOmoKZyoBT7TuowZZp3s93ad+PpY4Cw++GIrZPSI=;
 b=mVGPAwB4mxSzvyrq7lJfrKp9sOa3mrIU0HQFZEA/kNql7beuTJNiTbHi9TGgobI93O
 A3ffIxj2GaF8z6fVlPkt3vaB9usUek5G7QLN1NLlCdWD6Q4ftf/6Nm54ntStI4tEgcLP
 0gQozlZn57SQ75FuF6pOLvOSxHa/6ZEle3Scm/vnAeMkNoQMmtD57XkwjQGsrRZjJSJ0
 1G1o01RTrBJDZmnse8IenRQ3rgMtg/1QowWzSBvfUJAKMMrudtLzHXpzUfEx1yPrOm7y
 IAxdq1JulQNO/EOOkn8z3wyVg4uoEEV4RdweQ2RjXQVeL02TcM5llTCp9+ylRA9lYgVM
 H9xA==
X-Gm-Message-State: AOAM5315OtICnOMikM2ocqz5sI0Fx4qfI+U0eKlKVVgPQJLt6yENfXAH
 zkcZJzf5D4fdj2z41OTMFQ==
X-Google-Smtp-Source: ABdhPJwhKc3yi9lCRkn2unz0i6KwmvfrqsBUjOdnbC8mOswIYWCG0PjgSnsyarL7pxdWm3rertkJoQ==
X-Received: by 2002:a05:6808:aa7:: with SMTP id
 r7mr5655925oij.120.1639686396316; 
 Thu, 16 Dec 2021 12:26:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w71sm1135988oiw.6.2021.12.16.12.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 12:26:35 -0800 (PST)
Received: (nullmailer pid 698243 invoked by uid 1000);
 Thu, 16 Dec 2021 20:26:34 -0000
Date: Thu, 16 Dec 2021 14:26:34 -0600
From: Rob Herring <robh@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [RESEND, PATCH v7 1/2] dt-bindings: sound: tlv320adc3xxx: New
 codec driver
Message-ID: <Ybug+nar13glk69Y@robh.at.kernel.org>
References: <alpine.DEB.2.21.2112151806100.27889@lap5cg0092dnk.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2112151806100.27889@lap5cg0092dnk.se.axis.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
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

On Wed, 15 Dec 2021 18:07:37 +0100, Ricard Wanderlof wrote:
> 
> DT bindings for Texas Instruments TLV320ADC3001 and TLV320ADC3101
> audio ADCs.
> 
> Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
> ---
>  .../bindings/sound/ti,tlv320adc3xxx.yaml      | 137 ++++++++++++++++++
>  include/dt-bindings/sound/tlv320adc3xxx.h     |  28 ++++
>  2 files changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
>  create mode 100644 include/dt-bindings/sound/tlv320adc3xxx.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
