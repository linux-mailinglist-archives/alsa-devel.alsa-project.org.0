Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E429733A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 18:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8E2183A;
	Fri, 23 Oct 2020 18:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8E2183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603469283;
	bh=ywfVxIkoFDsBcrvLV1pjtTufyraHImIfGlzO+R8i2LQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H3+SAhF+S5R2RJwZbpTfsDwNsG9PfjDufTLnD4TyyQ47Tr8vw3irChda/6ONN7Bt+
	 wep5VZIWj7BvKBewwf71pnlHC7jExT+Sdn5ZDeZptkEcXi+UOdRllwWAvle4Y3Pyk9
	 u1SEZnnS8qJ2gZa/YjrbZGg/Y6i2mnK+m1Wr9TPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA837F80253;
	Fri, 23 Oct 2020 18:06:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E82EEF8025A; Fri, 23 Oct 2020 18:06:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FA48F800BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 18:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FA48F800BD
Received: by mail-ot1-f65.google.com with SMTP id m11so1799521otk.13
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 09:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X8IBdl4HpWRyoqCDl398qjaa9I/DDIbUBEJ/psCdV+k=;
 b=idor1NnVSSnOu1eY17IqzImEuzmqefoJZtCnjka7rqsA3ARGm7BPgKB48jcjjbPpGj
 5a1BFN4bpRTI/MQ6HuqQcDJfIs4l0XPhjGn0jH1krgNyurRFD3ix9nOlM7/jWUBof+Qv
 sJ9DNtzwPA8kGvLVHrc+XY2KCnkS/cpGe/SRYS1tvgtK0MmO7TPrK9MXWkLX4qwF6l5B
 b/QCak76+uAzLNOxKFa7vscBKOatK/TQd4yAEZtIXv2j01CkvA5feLmh/gwQ/KkuPzum
 JNki1oLeaXs0W/6Xo/HTZe1avxJnniYNMaxQS40yBo8aCu/TWkpWr/B56vuBs40W/yF4
 H5pQ==
X-Gm-Message-State: AOAM533FVOAtmlnuYo+Cf1wuu+zOIt92TW71AZoecmeofgaU3B7VVY0l
 9Z5jaT24qZjbsZJT2ePPug==
X-Google-Smtp-Source: ABdhPJxgp+fqgYJIOoRdYSwh8gYFkLSwHlaCjUajGcOQFwYPWrbx3MebN1I++Pj+IWGuxwR2UdkTSw==
X-Received: by 2002:a9d:2389:: with SMTP id t9mr1972940otb.329.1603469180512; 
 Fri, 23 Oct 2020 09:06:20 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 33sm470562otr.25.2020.10.23.09.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:06:19 -0700 (PDT)
Received: (nullmailer pid 2789709 invoked by uid 1000);
 Fri, 23 Oct 2020 16:06:19 -0000
Date: Fri, 23 Oct 2020 11:06:19 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 2/3] ASoC: dt-bindings: renesas, rsnd: switch to yaml
 base Documentation
Message-ID: <20201023160619.GA2789005@bogus>
References: <87a6wfay7t.wl-kuninori.morimoto.gx@renesas.com>
 <877drjay6m.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877drjay6m.wl-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>
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

On Thu, 22 Oct 2020 09:46:36 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> It is still keeping detail explanations at .txt
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.txt           | 520 ------------------
>  .../bindings/sound/renesas,rsnd.yaml          | 456 +++++++++++++++
>  2 files changed, 456 insertions(+), 520 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:19:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:22:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:96:15: [warning] too many spaces after colon (colons)
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:101:15: [warning] too many spaces after colon (colons)
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:105:19: [warning] too many spaces after colon (colons)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1385840

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

