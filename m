Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBF076B70D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 16:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8DDE827;
	Tue,  1 Aug 2023 16:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8DDE827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690899422;
	bh=J7b+YrbsRicuC+TMJc5DzeNzxmkVbyW8D3Ko3IAnr3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W7pg4WQWn4bt01oOzSBkeQVQvDsIggEB6xfG3ZZnTA+NMPBeSsovIBjCjq3/52K7X
	 Dy8v8EKCcL2JUyTFJkO0RvFLnIejGcu3Vj96YhAZn2dmKI6jD2imz+zYwIjkV/oPAx
	 IsIqosZcEpRp7iWL1x8BfzxCX4G3bl9OAHrsAUzU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C05B7F80557; Tue,  1 Aug 2023 16:15:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D874F80548;
	Tue,  1 Aug 2023 16:15:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57E4F80549; Tue,  1 Aug 2023 16:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AEAFF8016D
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 16:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AEAFF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=q9RCquid
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so14413177a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 01 Aug 2023 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690899324; x=1691504124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5wcObMxzRxgJ/VGkUZYGz4Wsi7oqPu6vEBYDrbZUZY=;
        b=q9RCquidQw67B2U7NV0lUR3RLSgvUdXx4mxan8WfH2/O9eZwsXL0bb1PGVAvYsxwnp
         06M0pK1KK8u8zta9fnO88ZYgHMAO7KGAxVIrcdaHAEVSyWv0qiywWjMKoBH6w3jOCIEr
         WK2NVGFvFF5rQGSPakaNAHtu60j0MPF4TbUvVPOwTPZ4cQMeYni54zHK6GKbWETrEuAm
         i+FGO/azI+j2M6O6eyNx2KH8lZblsHQWg7zAyqy8Q/Df7OR9+9+IDohM3w2ml6RMZsyD
         liKDKUJgQQoTkbo/+tDmoAhDISUOswqX96AemW3CV8vny1Le1XQT2CdNRhzzYtaawU06
         AmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690899324; x=1691504124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5wcObMxzRxgJ/VGkUZYGz4Wsi7oqPu6vEBYDrbZUZY=;
        b=LYDkwDqTPeMnBKLclUjQozmvHOIf/vG3bqH605PGaxA3K1Zl5ekQ8VYSDeJRLfeDzr
         BMb+EVPqRbWhKtfkQYhYINXNx0ibmM/OXWKFCdKRcMd4DW2uu+hPio3dkFoIw5BKcNez
         ljuVGINN+xgreRGj9IFb08tYOQUnkdY5vBD+wec6Y2zhTltahc6d9L098IsGQtgv/sZR
         gPEJ1+jLMjX82vpayw8MvP70Qu2omh6RaxOjA1zIzWzu2Gt2zRdoFROzeoLS8P5nANL+
         o1KcAe1oAI+XScKnQzRBO3/OBzygC5+eluSOVSWBeDXVELY83d2DkJ31dBC00nH932PP
         nEoA==
X-Gm-Message-State: ABy/qLYn9Xs/e6rbbF/WPZLBGwQ8YKrU3UWzX8Fusq/If4wf436YmOCV
	/gWK3sRQO6pb9gTcIagQS9/11M+ZDMcvIRWlc80=
X-Google-Smtp-Source: 
 APBJJlEiW7hEWKS0AOx5RN387hGF4qaTWWByX/+/lv6OzQgkUgUaVOdvPTiZdaS48r4jh/JdMc5HjLdpR7IqvxcQCu8=
X-Received: by 2002:a05:6402:517a:b0:522:582c:f427 with SMTP id
 d26-20020a056402517a00b00522582cf427mr3659632ede.14.1690899324010; Tue, 01
 Aug 2023 07:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <1690265540-25999-6-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1690265540-25999-6-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 1 Aug 2023 17:15:12 +0300
Message-ID: 
 <CAEnQRZBAde4t5V2HCvCQfVwVYaQPhzJ-t3hzePjueyTONEim=w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/7] media: imx: fsl_asrc: Add memory to memory
 driver
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7HVQQ2BIBTHYKQ6PSNFS3APTYUOIIHLD
X-Message-ID-Hash: 7HVQQ2BIBTHYKQ6PSNFS3APTYUOIIHLD
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HVQQ2BIBTHYKQ6PSNFS3APTYUOIIHLD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 25, 2023 at 10:31=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> Implement the ASRC memory to memory function using
> the v4l2 framework, user can use this function with
> v4l2 ioctl interface.
>
> User send the output and capture buffer to driver and
> driver store the converted data to the capture buffer.
>
> This feature can be shared by ASRC and EASRC drivers
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/media/platform/nxp/Kconfig        |  12 +
>  drivers/media/platform/nxp/Makefile       |   1 +
>  drivers/media/platform/nxp/fsl_asrc_m2m.c | 962 ++++++++++++++++++++++
>  include/sound/fsl_asrc_common.h           |   9 +
>  4 files changed, 984 insertions(+)
>  create mode 100644 drivers/media/platform/nxp/fsl_asrc_m2m.c
>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index a0ca6b297fb8..359f11fe2a80 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -56,3 +56,15 @@ config VIDEO_MX2_EMMAPRP
>
>  source "drivers/media/platform/nxp/dw100/Kconfig"
>  source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
> +
> +config VIDEO_FSL_ASRC_M2M
> +       tristate "MXP i.MX ASRC M2M support"

s/MXP/NXP


> +       depends on V4L_MEM2MEM_DRIVERS
> +       depends on MEDIA_SUPPORT
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_MEM2MEM_DEV
> +       help
> +           Say Y if you want to add ASRC M2M support for NXP CPUs.
> +           It is a completement for ASRC M2P and ASRC P2M features.

Complement for?
