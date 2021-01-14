Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367D2F6C67
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 21:44:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A9016A5;
	Thu, 14 Jan 2021 21:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A9016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610657061;
	bh=7OCbq96ayZcESnMq+RbZ4AkFuup97bRwlnSsTtXUKVU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLi+NFvq8OV59sJgueOFNUefPBAbl9ExVmR4kv95dODaZZ1EZk3EX+FD6f/EPpO7w
	 dSj7ankTFQtAFlHmE60iTYndk5OsaXi2llgUuMeWprrxcPuwDlA4CIkyPBmHQM7iIQ
	 8OXIrzkBy8r4Fon8QvFrHtGdk4Mq3zvylE8BwfiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CADEF8026F;
	Thu, 14 Jan 2021 21:42:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF597F8025E; Thu, 14 Jan 2021 21:42:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D195F80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 21:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D195F80134
Received: by mail-oi1-f175.google.com with SMTP id p5so7326399oif.7
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 12:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fdRu74OnC+f5sxstI58nsLAgS35+ajrWr8uapDQUeQo=;
 b=MEKKcnpres+Whr59ZfBE7yl5VWmfhPJQvQ1OAftfQICFfcy3IpZgFxyUU6N0KW2Ssv
 5E7a9HJp2yhBXY6Y1lBL87VbtiY36812HCGJIue+g7JBu/i7tOk7w20FXoIyQ9gC5VYO
 VxNIFVsHOz3oJtJtmE1gpB/VuPL3AL9bM17xy19qauxmWbp/fHls5gCy1TVjTu9+6b9I
 k740O2KPoPbocQkLXf07egt5kMwPgcXhlOmyika2pCmTO0NClCRJXh77+TDppbvS7d9p
 3z6FCea7NS76QKzlq0U1kh0tq855KT3zizcFVf2tUIloWnKmFAUZikb+5ORujuX98lRc
 j/Kw==
X-Gm-Message-State: AOAM531KIKnogBWbdZi3xt4L85CZa0euuWmrtjJdzq6Iy9PaUY1TX+nb
 KasV2bbITrHS3mwA6wnboA==
X-Google-Smtp-Source: ABdhPJxygCgbe5no4eG7yLVOFoRsmhp1+U7nsqHVuCYn4Pmb9N2U0xAahCyApRA/GGPL5QzQa+dAtA==
X-Received: by 2002:aca:5248:: with SMTP id g69mr3661260oib.22.1610656952479; 
 Thu, 14 Jan 2021 12:42:32 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n13sm1277408otk.58.2021.01.14.12.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:42:31 -0800 (PST)
Received: (nullmailer pid 3568633 invoked by uid 1000);
 Thu, 14 Jan 2021 20:42:29 -0000
Date: Thu, 14 Jan 2021 14:42:29 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: intel, keembay-i2s: Add info
 for device to use DMA
Message-ID: <20210114204229.GA3551275@robh.at.kernel.org>
References: <20210108031248.20520-4-michael.wei.hong.sit@intel.com>
 <20210108031248.20520-5-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108031248.20520-5-michael.wei.hong.sit@intel.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, jee.heng.sia@intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On Fri, Jan 08, 2021 at 11:12:47AM +0800, Michael Sit Wei Hong wrote:
> Add descriptions for entries needed for audio device to use DMA
> channels for audio playback and capture.

Please use get_maintainers.pl so patches go to the right lists.

This binding has errors in linux-next:

./Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml:  while parsing a block mapping
  in "<unicode string>", line 55, column 9
did not find expected key
  in "<unicode string>", line 55, column 27

> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  .../bindings/sound/intel,keembay-i2s.yaml          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
> index d346e61ab708..e0658f122cbb 100644
> --- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
> @@ -45,6 +45,18 @@ properties:
>        - const: osc
>        - const: apb_clk
>  
> +  dmas:
> +    items:
> +      - description: DMA controller phandle and DMA channel
> +                     for TX and RX

This defines 'dmas' has 1 entry.

> +
> +  dma-names:
> +    items:
> +      - description: "tx" for the transmit channel

The quotes are what cause the above problem.

> +                     "rx" for the receive channel
> +      - const: tx
> +      - const: rx

And here dma-names has 3 entries. Drop 'description' because it just 
says what the schema defines.

Please send incremental fixes as Mark already applied.

Rob
