Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8B1F5D02
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 22:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBEFE1666;
	Wed, 10 Jun 2020 22:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBEFE1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591820532;
	bh=zUv+l6eCuUka+t0W+/cq8TDwEtZ/VpuvX+Ir/0vilz0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ClZE5wgwMhP3zZMMs2eKPXdBaQCBca2EgD++3mYSYsOIqXI6ySDyhz+68/faLGSTt
	 O3qezrjT346b18OF8r++Mqf/fFipe8uiJr+Q2laHt7X5oSbqP7+4Xc0yj8Z2z5lsds
	 kPTYniXZeUcxolQmpixT4SFqUVMvIXp4rKxzf988=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73472F8021E;
	Wed, 10 Jun 2020 22:20:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FACAF8021C; Wed, 10 Jun 2020 22:20:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A537F80058
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 22:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A537F80058
Received: by mail-io1-f67.google.com with SMTP id w18so3801363iom.5
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 13:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tl8LETKmS+P6kESj029xJGHxTqRp5D9lmw9Z1M3J9vU=;
 b=YPei/f70GYp33VJ+Qx+zrDlsuR97FIrmN6hnqY7a9B7V/JMHieyFjkF7kc0EOVzGai
 DRBxVvA0E7oCTglI7tiGZC62jDZxc4W/J5BbaQ9ehzbMj4dmG5oe5upHQ98hw30Hg1Jt
 ykT9yO+MU2nesyG/1cvueqqM5y6upxVk8HhooA8HpbbQ3HM5uyo/Za/5fCArdSIRnYSW
 F7VSTebtoyJSl6uQcGOpaNCFEmUVE4DpY0eXsSaKHKgr+7u7UBbm/qppEPJz75IBB/wT
 j+RO93ZGuPj5rWR7XvsgbZPMZxBMEKTiIHiYeu5v9ao2Xc2hI+xcnFYx2Nur572MSR5M
 NgbA==
X-Gm-Message-State: AOAM530mVzHcTt17/hoPrFMrOAjoWNVo+iwB9JUygO2zUVq0rvFeZacd
 49pGDxNVpPLcDCe1c3VNHA==
X-Google-Smtp-Source: ABdhPJwf363QrAeSH44mRLwoy+rufj4TKAIbsyKss64pemnd+VDJVxMcmbKNnoWonDT8GTc5XdYa1w==
X-Received: by 2002:a05:6638:35d:: with SMTP id
 x29mr4726694jap.71.1591820420247; 
 Wed, 10 Jun 2020 13:20:20 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id k126sm423901iof.50.2020.06.10.13.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 13:20:19 -0700 (PDT)
Received: (nullmailer pid 3646187 invoked by uid 1000);
 Wed, 10 Jun 2020 20:20:18 -0000
Date: Wed, 10 Jun 2020 14:20:18 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: bindings: wm8960: Add property for headphone
 detection
Message-ID: <20200610202018.GA3646134@bogus>
References: <1591180013-12416-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591180013-12416-1-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, broonie@kernel.org, tglx@linutronix.de, info@metux.net,
 allison@lohutok.net
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

On Wed, 03 Jun 2020 18:26:52 +0800, Shengjiu Wang wrote:
> Add two properties for headphone detection.
> 
> wlf,hp-cfg: A list of headphone jack detect configuration register values
> wlf,gpio-cfg: A list of GPIO configuration register values
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/wm8960.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
