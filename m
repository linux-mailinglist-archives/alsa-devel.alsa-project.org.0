Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A91FC63A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 08:32:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365C0166E;
	Wed, 17 Jun 2020 08:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365C0166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592375562;
	bh=XxlIf/cdAZon69ICX4+oVV9q87zRhIDiTHoIMsaESB8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdK60bLXEjd9/kHq9UbdgwOTz2dJQpRkRStl8yL3Yhgfu4B0o5XSYKcQuzH3nh6o+
	 TxX3LJJUnzqFYjALV4aolA5OqjjhlDjksGfEvluPjLeE4koyUquBKuyxvOpba6+Kkv
	 VjNbc0XeMZeED/goi6z6Sn2td8o6B16HCk6RJ7zE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50861F80162;
	Wed, 17 Jun 2020 08:31:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BE69F80171; Wed, 17 Jun 2020 08:30:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B137F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 08:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B137F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a6Sgeh2B"
Received: by mail-pg1-x541.google.com with SMTP id e9so757437pgo.9
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 23:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IuEEwJ04EBGcVHdnYAuzzOkyntyIEkeUlotMcthbmkc=;
 b=a6Sgeh2Bm1vazQsOfe1eW9TwV0e7aO28v2HKFX7lXlSDMjM2Sm6ez2eo8Td94zie2x
 sLzmCPgLe+ugdhipeAo/JCl2PPh+epJPllLKKjKUF25kWvk+SMbv00SZ1cof1R/vFUHu
 VP2UwX084+Q6tXIPO6Y3OvK22yTWg0qHERGRfQ9mLAB2bvJk3Au6ZxMn9vX0gwKGR/Aa
 PSWrCVRSdjxE2rxB3xKIVdMryqWo0LtQw/4u2FtePnA8rsZq7uwgpqi9XEYfAgfOBRFl
 foVFSSvacYmHtXCSzndCe+5i13eIvuR4dGj0xcFBhiklDGgXKB6jBbjYOM5mO6rWu3lT
 3KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IuEEwJ04EBGcVHdnYAuzzOkyntyIEkeUlotMcthbmkc=;
 b=JRZyJhuF9VNY/y9s2qGjscBMSGi2pOQGa9MNMLEYJZjnZWacly1A6Pn5EgHISDRnOa
 0wo/XdnZJxR2jMb4OmDOitGa4AfhNPkER8hbKnUvEQNj9OkdV3uIyWVQgrnJtu0m1+gx
 RbGf3AIrz/gSA74aOlwQ6dH8rjVlMPF4yFytijiyxcU6UDCEZaEEtVOooBhb7wizmGzn
 aVFzpih8IPKawdVFZ2/V4CPONu7TQh6A6GZ+tkCmkDyMyB1kN4bIu/Cb+/xBw5oST+3M
 Th6Di8tHtvhpZjSjOuO0xQL17Wz9ne9crYIUVdwBdmBz2bakhPuUSgXTQKngNyWaUT/u
 RyhA==
X-Gm-Message-State: AOAM5325gbGuk+MEqxomHt7iOsddB+1wjMQO9u7Rop9jZk4K9/sH6xzp
 TzDyrcVD5h6e035GjB6c/KE=
X-Google-Smtp-Source: ABdhPJxFKo5k6eMIrz7WX/mVTR86nWQvTVi0bPtFQJ1sYGqHcR+gLGs6ETf3H4OPj/RJCTNuyvo53w==
X-Received: by 2002:aa7:952d:: with SMTP id c13mr5315206pfp.125.1592375448136; 
 Tue, 16 Jun 2020 23:30:48 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id x3sm18976602pfi.57.2020.06.16.23.30.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 23:30:47 -0700 (PDT)
Date: Tue, 16 Jun 2020 23:30:32 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl-asoc-card: Add MQS support
Message-ID: <20200617063031.GB6411@Asurada-Nvidia>
References: <2185a3ec866bc59f82d93b73d1a732a896fd8f48.1592369271.git.shengjiu.wang@nxp.com>
 <918505decb7f757f12c38059c590984f28d2f3a4.1592369271.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <918505decb7f757f12c38059c590984f28d2f3a4.1592369271.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Wed, Jun 17, 2020 at 12:48:25PM +0800, Shengjiu Wang wrote:
> The MQS codec isn't an i2c device, so use of_find_device_by_node
> to get platform device pointer.
> 
> Because MQS only support playback, then add a new audio map.
> 
> And there maybe "model" property or no "audio-routing" property in
> devicetree, so add some enhancement for these two property.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
