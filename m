Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B166274C50
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 00:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9682D1724;
	Wed, 23 Sep 2020 00:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9682D1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600814518;
	bh=gbEAxkn5EFYLfhnvdXugFIbd/2dFmwM9EFdIMoT7IyI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCouU/cEMRsfSlQs0QKQa5A0urXPeKCvRnFZG5XlSJ6ZFnXwY2HzHc1VJ9CIbqAgz
	 sMUnf9vjLVfcyhmcCt61mjOEaZ4YGnHc08YmmFwU2TcqDPIxGYRD/WuvTnDZMo6X9O
	 ON3Wxju60eBgyzZqMos+9Ybfr7+U+kiyLtVb04uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3AEEF800ED;
	Wed, 23 Sep 2020 00:40:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE1DAF80232; Wed, 23 Sep 2020 00:40:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 946E2F800ED
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 00:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946E2F800ED
Received: by mail-il1-f195.google.com with SMTP id h2so18918171ilo.12
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 15:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ts/H5lGkxCVpSIUsT+nwlHs+QYSEjYzumhKnYN5QEbQ=;
 b=LoSbyVoS3iA1zJhqokpzlQHYeKHTL6GNM/DOumxYCyU+nZU7b/fhDBXz8nf+1pB818
 QI2wrTsJ72liLEYHHUsRyM3zjzY2QhMv4w7izSpzECfRwka2PIY+rDTqWLZoXlPzKAEO
 MxWRX0WY8gcz9qX/UIcLu77vfprvOctwwMRx+ElkJ/506Wd5lLuZlQazjKTHTE8G7h5L
 7skArkkjeenCS4jejvOOpsOq4odBWSostHJBqYNDgQZzUb4DMyvrXVjv709aEdEb6ZGV
 dyf+DQ3ve/Qr5vsvHXGkAY7mpxcTCJ9BjXIdmUgyazw6NzaVkPD0SlaTCKqCGJwcZ4ca
 BLUA==
X-Gm-Message-State: AOAM532AbatifFmgicdDnxjzZFlE/JZOct70zcwqHabbuCgv3ebIjo4A
 M627DamCf3yFiRxGFT+Mcg==
X-Google-Smtp-Source: ABdhPJzHf0W5nJgwpFfumBS1r8ILyOBzztbl7WxBBhsWTRLofS+g1hJjBquRMnQNVN/s/620iReBwg==
X-Received: by 2002:a92:5ac9:: with SMTP id b70mr6098813ilg.110.1600814401820; 
 Tue, 22 Sep 2020 15:40:01 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s17sm9889563ilb.24.2020.09.22.15.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 15:40:01 -0700 (PDT)
Received: (nullmailer pid 3391920 invoked by uid 1000);
 Tue, 22 Sep 2020 22:40:00 -0000
Date: Tue, 22 Sep 2020 16:40:00 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: add mclk provider support to
 stm32 i2s
Message-ID: <20200922224000.GA3391859@bogus>
References: <20200911091952.14696-1-olivier.moysan@st.com>
 <20200911091952.14696-2-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911091952.14696-2-olivier.moysan@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, alexandre.torgue@st.com, lgirdwood@gmail.com,
 tiwai@suse.com, arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 11 Sep 2020 11:19:51 +0200, Olivier Moysan wrote:
> Add master clock provider support to STM32 I2S.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
