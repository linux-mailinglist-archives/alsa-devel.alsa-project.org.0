Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BFD858E57
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 10:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AB97E85;
	Sat, 17 Feb 2024 10:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AB97E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708162347;
	bh=pgy9PZf2TrTJH8JzAKg5bYc1IgeALENUoKus/Rm1fPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Id822K/oqIrrk6xi0JWtoeLMx/pcJEPUmqtno3wlIqcXmBqC2Myo8gS/sF0Uv/3o8
	 uhz0j6aZcafyixSYxFX1hbDF6anX5GVm4FbCvr9SgtdEnhOIu7IW3LDdAXjXXNaWLo
	 iq0solFj65F1DQVVUVCIFJzAA3PWi89WgeqI1nyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74355F8057B; Sat, 17 Feb 2024 10:31:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE7C7F8057D;
	Sat, 17 Feb 2024 10:31:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1987F800BF; Sat, 17 Feb 2024 10:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	TIME_LIMIT_EXCEEDED,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 158B4F800BF
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 10:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 158B4F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pbl9lNnH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B3D11CE2D5E;
	Sat, 17 Feb 2024 09:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AB6C43394;
	Sat, 17 Feb 2024 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708161574;
	bh=pgy9PZf2TrTJH8JzAKg5bYc1IgeALENUoKus/Rm1fPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pbl9lNnHpdpFX2TW4fgOzjg3JXeVhdRlOHllKDzuKcoIPNwZzS21k9iTYW0rRAyEH
	 ZtEaY5ar901iL89nMW8RaiZ+GgsE910tLGb2hA+Ei81ZOvS1ZKWIFKw0kKa47i8LyW
	 P4+2kovNsoWlbtBLYj7xegk8Ss8517IEc1zMQySFQhSQN4fhL0ATaebSnRgIWK91Cq
	 7pj1uqQ+Z4z9jasKp/TZ+sjT1JtAHv755gwest6WfAMs/vjK/KVqKHbAviV86g9Ioi
	 sGFUFoMTK/s5NQYjYafkJeWlbu29F/woOJBITsfDNMMwesyghARQt4IvtvYqhfql4v
	 y96XQjq96Eo+w==
Date: Sat, 17 Feb 2024 10:19:26 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
 m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v12 08/15] media: uapi: Define audio sample format
 fourcc type
Message-ID: <20240217101926.3f1d2452@coco.lan>
In-Reply-To: <1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
	<1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SH24FDFL353OEA7G4K6553RZN673PHBG
X-Message-ID-Hash: SH24FDFL353OEA7G4K6553RZN673PHBG
X-MailFrom: mchehab@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SH24FDFL353OEA7G4K6553RZN673PHBG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Thu, 18 Jan 2024 20:32:01 +0800
Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:

> The audio sample format definition is from alsa,
> the header file is include/uapi/sound/asound.h, but
> don't include this header file directly, because in
> user space, there is another copy in alsa-lib.
> There will be conflict in userspace for include
> videodev2.h & asound.h and asoundlib.h
> 
> Here still use the fourcc format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++++
>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
>  include/uapi/linux/videodev2.h                | 23 +++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> new file mode 100644
> index 000000000000..04b4a7fbd8f4
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> @@ -0,0 +1,87 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _pixfmt-audio:
> +
> +*************
> +Audio Formats
> +*************
> +
> +These formats are used for :ref:`audiomem2mem` interface only.
> +
> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: Audio Format
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * - Identifier
> +      - Code
> +      - Details
> +    * .. _V4L2-AUDIO-FMT-S8:
> +
> +      - ``V4L2_AUDIO_FMT_S8``
> +      - 'S8'
> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> +    * .. _V4L2-AUDIO-FMT-S16-LE:

Hmm... why can't we just use SNDRV_*_FORMAT_*? Those are already part of
an uAPI header. No need to add any abstraction here and/or redefine
what is there already at include/uapi/sound/asound.h.

Thanks,
Mauro
