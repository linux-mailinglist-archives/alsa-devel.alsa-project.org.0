Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDB45D627
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 09:27:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4781828;
	Thu, 25 Nov 2021 09:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4781828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637828853;
	bh=u4vZvOVOvJSCMC746/RK7I5lvy59gOAI6OaKWr4pPEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axbdPED1Q9a8lFFtLrA0aMvUkjWc1DPTyoO1/MTXCbJqFAeGC8N8VHvvaOSHc6Rz1
	 1YyfSidwC5GaXIEef/0gI70wnz0ShncWveNjrkG6+GQ16XeRk9DwLFjfyml8neaffs
	 t53qGSAuCJELc9UbFkXTqLYzv5HWTsjCyMClj/TI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB15F804AB;
	Thu, 25 Nov 2021 09:26:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74468F8049E; Thu, 25 Nov 2021 09:26:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 361A4F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 09:26:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 361A4F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L/Ujp2hP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF42661156
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637828761;
 bh=u4vZvOVOvJSCMC746/RK7I5lvy59gOAI6OaKWr4pPEo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L/Ujp2hP+em0TbwEAku9UNOgRD/lNgkq9vvjdRJjzztbZCA1hO8OrsQZCeVMfvVHo
 S9yg1Yx9L8hqIkUjIxElc2yEByCbjhR5noTMWj+tg1+rdmPQ4IfMX3kol7PhR24kfY
 50PzEI2T3kCRID+JXCmdkBR3KxAUQUf+Cr40t5/hLPblqb2SyOiDuchuttHBda/DZ9
 O2+I4ewQefbEQ4p7JO3SmEY9q/kEGm2hAtCMJ7GdIImfTI/HlLwJHF//ceMhEAF+wC
 wPZkDjK+dEKsg8ujT+bUcg4vgYW+KhIq7APXLvvIpaNyfzHHvd2l1zGyGdTqjmhWfV
 VGbmTmIlYfeyg==
Received: by mail-wm1-f44.google.com with SMTP id i12so4799605wmq.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 00:26:01 -0800 (PST)
X-Gm-Message-State: AOAM530Nt84SPBW+MHAweKhiAvTXjNrFnnc2A9mhiP0WHAXDSSuAFBAW
 Jmlo5B6Dx1KpOkQBRU7zIm75PGYkVeESQgCYq9E=
X-Google-Smtp-Source: ABdhPJy6foEBtvTrMw2IiNDwnqT6LrlvOZ5dh+nV+5ANTzOv/KSjYNBzI3JdqYrvuqNPFDqYXIA6Rrm24+G/p6n3bl0=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr4817606wmi.173.1637828760332; 
 Thu, 25 Nov 2021 00:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-8-arnd@kernel.org>
 <202111251538.x6sJNCka-lkp@intel.com>
In-Reply-To: <202111251538.x6sJNCka-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Nov 2021 09:25:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, llvm@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
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

On Thu, Nov 25, 2021 at 8:57 AM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/dma/qcom/qcom_adm.c:712:18: warning: no previous prototype for function 'adm_dma_xlate' [-Wmissing-prototypes]
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>                     ^
>    drivers/dma/qcom/qcom_adm.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>    ^
>    static
>    1 warning generated.

I noticed this mistake slipped into v2 as well, the function needs to
be marked 'static'.

Vinod, let me know how you want me to address this. Should I just fold
the fix (see below)
and the final Acks into the patch and send an updated pull request, or
do a complete v3
submission?

      Arnd

8<---
diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index bb338b303af6..65697bee4db0 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -709,8 +709,8 @@ static void adm_channel_init(struct adm_device
*adev, struct adm_chan *achan,
  *
  * Returns pointer to appropriate dma channel on success or NULL on error.
  */
-struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
-                              struct of_dma *ofdma)
+static struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
+                                     struct of_dma *ofdma)
 {
        struct dma_device *dev = ofdma->of_dma_data;
        struct dma_chan *chan, *candidate = NULL;
