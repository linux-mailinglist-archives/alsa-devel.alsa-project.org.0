Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1489F611540
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 16:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A262C1A43;
	Fri, 28 Oct 2022 16:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A262C1A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666969057;
	bh=LQqF7mgoMpdPDEfiMU46JdqFEc964tvWxw1HB/RMwiE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXrncIp6U6vez6p+uGmMJt2Hf4ytOVeLN5E4CoDWgk2FtQsLbncQqc/O8bRcmJIKJ
	 ZIl9AxXbnb3gSQ3u9DzYVUu4BEAxe4y7i4Gd1G3a+AD753b4PlfZai0fmv29t+zeNI
	 LFdoIcbGdFwE+ro4t0TyO4iAQdnE1hk/mU4uksYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04118F804BD;
	Fri, 28 Oct 2022 16:56:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA45AF8025A; Fri, 28 Oct 2022 16:56:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D269EF8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 16:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D269EF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="arTa8Hp9"
Received: by mail-ej1-x631.google.com with SMTP id sc25so13475265ejc.12
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 07:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LQqF7mgoMpdPDEfiMU46JdqFEc964tvWxw1HB/RMwiE=;
 b=arTa8Hp9eU8CHAAKuZxCuCp9TFtlwbZW3v87Df9EtS2SMm22Eduv2F12bZhmi3qg20
 8HJmCjY+CdC+8I75dYuUqmXe2VE3oJRS1Ab7QBBuK7Ac/Ucs7NcYDqHBIzhvEcOuwBJc
 ZWvP3FVXgJzFksiq7wweonN1/pPCb7+/yCC5SAHOH+OzqHpY6JAMJMI6kG/uWEGSUQvS
 C7eqz3grRob4bZfW+oH6rwPz54fq0r8j8OQoAuLFzgYj7ghCn5PKe2DQUj7NA6U5P9N3
 bur7cp6c9yjVC9Erdf8lbNNpRTVZ1+xuAt9YjDuioE9AU6LsasEf/2ttDERdZTUyoiBv
 T8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQqF7mgoMpdPDEfiMU46JdqFEc964tvWxw1HB/RMwiE=;
 b=2yC9fiG+djcU12tQ83m+6/HLu6BUVCrzXL0GnKuN5Xhk7PHt6AFcf8qbmv1hvxg7AY
 ZZymCdY35dYeTZpRrdtUHBgs1RgFyDdSjyOl8gc4iVbYsC/5WN5oOzhQ2d6bjKbLg4eA
 bjJjni1T4WP+09u0rGgCJco/oMOFJuDwqPUoqdp+ppoSmvTBx0vY5MXKExuGnnEAweYg
 MbIAMc+rIC4ROF+6UCYNaaJp45+eKKJu8c2QbUdbWe0X3iYIpfDslbLapu0xBTaTsLnL
 sFFvb/f6cB4PtDFEHCUpE7n8YYRxURyCYUxXDO1kdgYQ/GeiJECo+ySVVCnvoUmXMynY
 RQqw==
X-Gm-Message-State: ACrzQf3jwOGSPrNsQIJrkAn1U9UFLBgklscn81czJ0cN2soguem3KDKB
 Qez+hgk8p5tOoy/ve2vNdpr2b2e02lImsJ512V0=
X-Google-Smtp-Source: AMsMyM5YEMqyGVRZ22xaHEfcgjC/wjYt3YHikBMrSXZTvnr//2VkFszSR6BbgM3ElAHwJxzJNTa8V2q3veDVgCO00eQ=
X-Received: by 2002:a17:906:9750:b0:798:9ccc:845d with SMTP id
 o16-20020a170906975000b007989ccc845dmr38539663ejy.760.1666968993915; Fri, 28
 Oct 2022 07:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221028141129.100702-1-maarten.zanders@mind.be>
In-Reply-To: <20221028141129.100702-1-maarten.zanders@mind.be>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 28 Oct 2022 17:56:22 +0300
Message-ID: <CAEnQRZDyEdJtcMd0et5=3+Q8+oX5b8zOf6o_2yfRNVxmDuxDXg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
To: Maarten Zanders <maarten.zanders@mind.be>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
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

On Fri, Oct 28, 2022 at 5:37 PM Maarten Zanders <maarten.zanders@mind.be> wrote:
>
> When CONFIG_PM=N, pm_runtime_put_sync() returns -ENOSYS
> which breaks the probe function of these drivers.
>
> Other users of pm_runtime_put_sync() typically don't check
> the return value. In order to keep the program flow as
> intended, check for -ENOSYS.
>
> This commit is similar to commit 0434d3f (omap-mailbox.c).
>
> This commit fixes:
> cab04ab (ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk)
> 203773e (ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk)
> 2277e7e (ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk)
>
> Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
