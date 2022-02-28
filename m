Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A993A4C7BA8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 22:16:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C28518AE;
	Mon, 28 Feb 2022 22:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C28518AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646083008;
	bh=Iqj/M5ZlusgVOonDe4AZ+w5W0Whcwm2ZNFBHcRpxdtA=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8tPENTbsnN9m0MaqBvSYAZYCm+AsuRA1+qUtujmK+JmUVAX4DjFrzxQzPEkNYKZj
	 z/KXFqKXgX629e8MKcY6cZ/mLxM3OFrzwlhG9201YQY0xGgdrL36veCNOm8zG5Pjoo
	 rQ7Fvc57qNeo6KSHw/j8t6YAhwRLSURzShmqRSzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91917F80154;
	Mon, 28 Feb 2022 22:15:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75C4CF8013C; Mon, 28 Feb 2022 22:15:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0583FF80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 22:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0583FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="k5FjNT1Y"
Received: by mail-oo1-xc34.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso20267151ooi.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IjIt5oAd9CJM5MUxlpFz/Mn3QCxHZ0rV/10NRoEs5gA=;
 b=k5FjNT1Y5NA+RXxHnRvQ0L4bZtfiVOvXd8x+XVq757ySkC4ojwcEUv2bSywlyH1Bs7
 UMP0SExJnFb1TpzHauFo1VmYg0c/UkMxSq3BfChZgmtYQv/vBiUCPdb/IIkxIRkGKz5s
 gnpRz+XBxJA0Pc09geHh4Hsu7EUVa/fEV1vMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IjIt5oAd9CJM5MUxlpFz/Mn3QCxHZ0rV/10NRoEs5gA=;
 b=NVuLPG3jXR8+poxjhwv6cY0hx3NJ47v6OKh7zMCJtIC2t8OiTSt7K8IFRWLBdfPvK7
 FvFOgGxojYvyq+pK2bokhAj5/ZrCM2W1sukM+Cz5d20Ew1nLcxBinYNMNZMcNtMWWVmL
 DPfk4c9Kn1MBIcNHr1x3pLurIxTkAkNKozsDlkCNoGES8AFHGmcJJe5qxxaP+MYXHEVS
 vjzsemSU3MdDdJFvr6AVR6MoA47hltHWKflb/tbPz9JFvC6pkdglf9F/PIbp0d3F0iQY
 k45YSAM0P2H6r6e/8gO1Byj8WsE+Ef7Ek/gOzluxpN9TIGzoG5lf1koR/phlxw1I6aOr
 gXUQ==
X-Gm-Message-State: AOAM5338DIyax83LiKM/FlfwEe1dT3/Rb6NaGe5XDPgLvrio3VtxN1DA
 j1nlejXRW4dp6nhhX/hhLwgDQ6A+AFeOfjTltDwAeg==
X-Google-Smtp-Source: ABdhPJxOdycyN6mOUporN9zWCpjgv3JJjgWoljVwONiBtWqOqkw5qbUZhVnVbFz3AekiYeyOwAbKHtg7VOElvVbl1OM=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr3883479oab.32.1646082934912; Mon, 28
 Feb 2022 13:15:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 13:15:34 -0800
MIME-Version: 1.0
In-Reply-To: <6e498021-bf08-3fd8-a3b8-2fcba054f4a0@quicinc.com>
References: <1645716828-15305-1-git-send-email-quic_srivasam@quicinc.com>
 <1645716828-15305-7-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53K3Em52tTFK4zmcsf_ZzFbX4uQQ00_uH9=pq44chwyeg@mail.gmail.com>
 <6e498021-bf08-3fd8-a3b8-2fcba054f4a0@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 28 Feb 2022 13:15:34 -0800
Message-ID: <CAE-0n508Wcb7mnqx1TQN0vndOFRcJuyfvo_4YtJri+Kh-GfSbQ@mail.gmail.com>
Subject: Re: [PATCH v16 6/9] ASoC: qcom: Add support for codec dma driver
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-25 21:58:03)
>
> On 2/25/2022 5:10 AM, Stephen Boyd wrote:
> Thanks for your time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2022-02-24 07:33:45)
> >> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> >> index 198f27c..b3af971 100644
[...]
> >> +
> >> +       buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WT);
> > What's the cast and __force for now? MEMREMAP_WT is almost never used so
> Here dma_buffer structure has virtual address(buf->area) of unsigned
> char pointer but memremap returns void pointer.
> > this looks wrong. Why can't MEMREMAP_WC be used? But if it's DMA then
> Okay. Will update the flag MEMREMAP_WT
> > why isn't dma_map_resource() being used?
>
> I am sorry bit confused here. You mean some thing like below.
>
> For Physical address mapping: buf->addr = dma_map_resource(pcm->card->dev, drvdata->va_cdc_dma_lpm_buf,
>                              buf->bytes, DMA_BIDIRECTIONAL, 0);

Yes, but I'm not sure about DMA_BIDIRECTIONAL. How does this
va_cdc_dma_lpm_buf work? Does userspace fill it up with bytes and the
DSP reads it out? More details please.

> For virtual address mapping. buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes, MEMREMAP_WC);

No. I'd expect dma_mmap_attrs() or dma_mmap_coherent() to be used to
mmap it into userspace.  The dma_map_resource() API only returns a
dma_addr_t type, which needs to be mapped via DMA APIs into a virtual
address. Passing it to memremap is incorrect, because it may be possible
to map it into an IOMMU, for which the DMA APIs know what to do in that
situation.
