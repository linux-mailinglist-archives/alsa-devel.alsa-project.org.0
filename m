Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19053206878
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 01:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEDBA17DB;
	Wed, 24 Jun 2020 01:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEDBA17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592955202;
	bh=8vorLRwslmpe/EHZhDoTOmbkDf3C9hHQgZtVxy+RAqE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HBtAp09Vt9BenyjLUIWSagsvYMEXwhaMpMKJXORnxJ+mNTfftt4qakWyMtkliY02C
	 v5Hd2h0tGD/TzO2/R3cuhKvCk+GZyRcauTEm/ZGwOoRKINKcBuXAs0+tc4xXfrHCEr
	 TIqBkRvArN3Gyw1NcT2pLPoSDMuZb6t7f3FAik4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12631F8025E;
	Wed, 24 Jun 2020 01:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 126B5F80234; Wed, 24 Jun 2020 01:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EDC9F80234
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 01:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EDC9F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D3PrKqtt"
Received: by mail-pf1-x444.google.com with SMTP id f9so189233pfn.0
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 16:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v2em8WufMe/XzcJqk7YFYQSWFx3qyHpDXzQPwunL4Mg=;
 b=D3PrKqttTaVJOmY8IJl9a74nK+vT3bB73vbRbEdADkSzTBJXKcW90YspYntqCqaJhL
 flrsd1SDjQCLrku8MvQ8ffq7WXYKSRZGpOZpkpo4jBmp8mt/S8qVrp+WIcjXLAe7m0ko
 4hPR6azoWVRP2H3o0QL67neEJZtUvscXqKhJetbfR1waX4Kr21d6Tx5UyWIuFiUn+ggZ
 pTTL8voMO9NWKPC/PhYy0SE0gPC1rE8w+3Sqkep5YwkwTRzpzrIJvD7ap/isv8xDIIkP
 3kgds5X7zJ30Hkne7cgO5PxcccR7DALNDjVPC5qn7FL9r/9FD7K39kmsydeCkzj2aDJ8
 pErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v2em8WufMe/XzcJqk7YFYQSWFx3qyHpDXzQPwunL4Mg=;
 b=fITn4MCtWwkZjqDxid6AYRbrmKuJiTMT0D7Jx0hwNFs8B2cauacfNkKU+suCksj2Bp
 dSkzF6wkjcRyeEpRFxKClCJKt+XHYyVDmTBlSXxSWfaCxNvNbhsRfbQPEzWEn0bZW+/i
 6RE99cHC81XFlUDWfmKCXIPTfM9MMU67JYHeUv9H8DeXZu4dGWTUb6b09CAkwLU2qQuI
 YAkzwsa1k7kfGy3ewuNRhSUmwdaAoBALHX5btkbBC8tco/y5g2248oYq/ELeLBaSvNeB
 /ELAG1kN8m5Hi3ZWeyHvhCenqbukbbWAv+XUYb8eaGtwQPpAHDzP9k0LWugPkTWBAV8G
 QxvA==
X-Gm-Message-State: AOAM533xtogM1JoNeqiIVCJmw1zmFDXp0kFh4lAH3HZ0yqdOk/ZO26Nd
 T0OcuSLu8Mqf5PLmXE2JfSI=
X-Google-Smtp-Source: ABdhPJygTOv/K578Nfi+keQ7SWHWmMxiyqT1qgqh4PY1PWO2ZBzG5y01Ax6vFA6ckUG9CyH3gxpZZw==
X-Received: by 2002:a63:531a:: with SMTP id h26mr19943514pgb.188.1592955078526; 
 Tue, 23 Jun 2020 16:31:18 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n62sm3651622pjb.42.2020.06.23.16.31.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 16:31:18 -0700 (PDT)
Date: Tue, 23 Jun 2020 16:30:51 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: bindings: fsl-asoc-card: Add compatible string
 for wm8524
Message-ID: <20200623233050.GA28062@Asurada-Nvidia>
References: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
 <1592895167-30483-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592895167-30483-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Tue, Jun 23, 2020 at 02:52:47PM +0800, Shengjiu Wang wrote:
> In order to support wm8524 codec with fsl-asoc-card machine
> driver, add compatible string "fsl,imx-audio-wm8524".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
