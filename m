Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2005230B7
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 12:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F11E1798;
	Wed, 11 May 2022 12:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F11E1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652265217;
	bh=diBqFc+BoWzAr/VmLH7dKrLdPRQvzkNUrCN5zzOorr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2z+khqA1DnFZMVRnWdu8yIxftdoBmhtVl0Z8MceHQgX4kjN1bDETeIOWwKyXz/ap
	 XAPsIU08VQBsW/HGCn/4Idsfr/p2I7iZAZlrkzXMZnHGhrcNAhh3YnS4rMsKf94k8/
	 RaUtBPAJkTSCGXRtai1IlL/hQaEudSAXBuZ05Lk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B99F80212;
	Wed, 11 May 2022 12:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53741F8015B; Wed, 11 May 2022 12:32:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E94BF8011C
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 12:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E94BF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j7v8dV+o"
Received: by mail-ej1-x62b.google.com with SMTP id l18so3105926ejc.7
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 03:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=diBqFc+BoWzAr/VmLH7dKrLdPRQvzkNUrCN5zzOorr4=;
 b=j7v8dV+of4JcYw6oQpjfYDg+/AhDGlh8rWDyVb4dNZFpWwCXA/ba7PSzuOc073fq5C
 CkbxcaE8TIYaP/pepZuL48hr/m1y4+28nijoEjmbwdqh6cKWZ9DJnWqZNJdkIV7JUYyK
 K+adh0jDs6KRrHOvq2jskXIux2qU/jq084T6hmNIBFHJD1Kdjv3EQgIogmZypxSboneH
 u24R/YdKD1LA+I5Zm3gwoh4EXivmzYiVlM1C6kwKzu3sEDV7G/8qbNQlrgM+GuoAmdEE
 TrmZCR0vnIxqBgF7fdIt1N9tzj894I735RdxUya0xlE6QJTIBqjtLCBvRhw/nG5KNTUv
 2ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=diBqFc+BoWzAr/VmLH7dKrLdPRQvzkNUrCN5zzOorr4=;
 b=clWSk8X+BZcXCUTf4Kl07tN+05AQn0wdT1HcGIhru8qXBDmj6XdIlYhPiGTq+N2XgP
 Irt39yVcm5NWEia795fbNSKygBUv0+DMxXc/QHC/gigW7JxD64vHQkCqAFggBP3LIVxe
 w2spD2pKCO/CMEdzpQNcvvl3D3YVM6vd7m93KV0cTaKO32EN/6Wwq0n2rZ+vZO906wO8
 yrpNszWzIu+MTqGFQ9NZw5Z+hGgfbqrrwyjt3uB/0zhQB9TIB9qLgYhIAV2LwoSh/Enr
 UzNR/2e0NPZ88u6+QBZhkp1GAgVYExOemuuHjRze3Ve/sGxnso+HQ57tic3F9c/crApG
 HdqA==
X-Gm-Message-State: AOAM5330ZFsbF5X9z/nSPK4roaNo8rE0HEyX7Bn5rhWFX0YFl9M9r/46
 qXIMCH2p8ztaMAbxTg++Mzf8T9n/UBpV6ny7lk4=
X-Google-Smtp-Source: ABdhPJw6yj7TxbR0Hf9m7Lwxgm0Ky888mXXjlZZAf43y7eUMo7ah+68FM66Xr2uyLeand054/IqjszNELkdzUOz42E0=
X-Received: by 2002:a17:906:c14b:b0:6f8:e6bb:f8d5 with SMTP id
 dp11-20020a170906c14b00b006f8e6bbf8d5mr16921243ejc.4.1652265151596; Wed, 11
 May 2022 03:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220511065803.3957-1-linmq006@gmail.com>
In-Reply-To: <20220511065803.3957-1-linmq006@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 May 2022 07:32:19 -0300
Message-ID: <CAOMZO5AqKNg36_OBntqzpF6sYFitCMMJZP-KwFpYftJ76fdDsA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Richard Zhao <richard.zhao@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Wed, May 11, 2022 at 3:58 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_find_i2c_device_by_node() takes a reference,
> In error paths, we should call put_device() to drop
> the reference to aviod refount leak.

s/aviod refount/avoid refcount

> Fixes: 81e8e4926167 ("ASoC: fsl: add sgtl5000 clock support for imx-sgtl5000")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
