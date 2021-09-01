Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2C3FD98A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 14:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 608061687;
	Wed,  1 Sep 2021 14:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 608061687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630499262;
	bh=3C7HE0Njru7uoQVblWzu6YmFO0Wwvbh4ekqLadoQUx8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M6dRho3+AXpC9nQeoj8eSd3pffE2CysXKHTRdgrj9MU3+5JFmqMdb+Z/KZFU8U603
	 qGGzYt/K/7O9PMzg4BubBKN8RcfXzVHHYKt7NAkAETu/dEVdlxlao4+2h7AqDfrBkz
	 MbUtutBq2+lsYlDGJXibSwj4Lz76OMMmvyHqD70g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E8B5F804E3;
	Wed,  1 Sep 2021 14:26:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 340CDF804D9; Wed,  1 Sep 2021 14:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CABB3F80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 14:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CABB3F80218
Received: by mail-ot1-f51.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso3157797otv.12
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 05:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L89W6KN905uzz2b8RDSBDwMiSN6z+FJPmQF6g2PVDTA=;
 b=QuSUKk4SoJFkKcFD2DTtmVhtN2Z/ck3CHKNtUBROKp7nqQKhqOajI5c8VkuWtizBdY
 UI6NtSEeCG7RCgpIVilQ3fWJyL3qqIJBHpH9IDGjClc0BKsueN+6BclhBZamrxtJxPH5
 KQihmuXYbmd9Pz8zAjrnDyAjsbxoZ90bgXKLsw370Vv8VFOJVl7JZeNf+MghQPLbDw1b
 wjQSArdxX/+H1X0zbF+E1g/0mpuCQZV+qiINjlv7IjRhP01Y6pr86VcBSgKybwRYqmAW
 m0G6Mm18u5t4nnsGWMlMOiBS7ah+yOR9siQQegGIxLrrM3eexIkFf7oyvPDTvXxLeLZS
 RBqA==
X-Gm-Message-State: AOAM531QqA35ToMA5qrWqA8rtjiBMstfIXW5FAYSALX726LEPgErDYl8
 kj9karoIPInfkXYOJQMrjA==
X-Google-Smtp-Source: ABdhPJx0CXfS8DC+222kUyjWme9cZzPaq6kS6t7YMfxn9z0mNz0nwgmlnC/Q96XBYqx3b7I5mb8U9w==
X-Received: by 2002:a9d:6c08:: with SMTP id f8mr27993005otq.368.1630499180322; 
 Wed, 01 Sep 2021 05:26:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l21sm3684049oop.22.2021.09.01.05.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:26:19 -0700 (PDT)
Received: (nullmailer pid 1941367 invoked by uid 1000);
 Wed, 01 Sep 2021 12:26:19 -0000
Date: Wed, 1 Sep 2021 07:26:19 -0500
From: Rob Herring <robh@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v3 7/7] ASoC: dt-bindings: rockchip: Convert pdm bindings
 to yaml
Message-ID: <YS9xawhnJ/4xR2vg@robh.at.kernel.org>
References: <1630468039-7186-1-git-send-email-sugar.zhang@rock-chips.com>
 <1630468118-7321-2-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630468118-7321-2-git-send-email-sugar.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org
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

On Wed, 01 Sep 2021 11:48:38 +0800, Sugar Zhang wrote:
> This patch converts pdm bindings to yaml.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> ---
> 
> Changes in v3:
> - Fix property 'path-map' suggested by Rob Herring.
> 
> Changes in v2:
> - Fix yamllint errors.
> 
>  .../devicetree/bindings/sound/rockchip,pdm.txt     |  64 -----------
>  .../devicetree/bindings/sound/rockchip,pdm.yaml    | 120 +++++++++++++++++++++
>  2 files changed, 120 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,pdm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
