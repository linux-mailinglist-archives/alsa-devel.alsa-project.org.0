Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76372858E7F
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 10:58:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D672682C;
	Sat, 17 Feb 2024 10:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D672682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708163890;
	bh=EDkMlZRBTzgmSoA8T3Q+NyJsDr+epBLEA+1LH31cuww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F3P6zEkugIbeYppkuj4TBpznKGwMpM82IOit9bg8Rrhuu7JnoO/I6wiKSh4+SUJi/
	 Uo53JIg2QUmcUCYFabt+CgwsbuL8jnSLmddAURVZSNX6bHj6+FYjUrYHjU1/PIB3Qv
	 Rloq6MZRtUaTn6vdBF2s3lnCrnMgoRVsB78JczGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ADADF805A0; Sat, 17 Feb 2024 10:57:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A34EAF805A1;
	Sat, 17 Feb 2024 10:57:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B90AF80238; Sat, 17 Feb 2024 10:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92BA2F800BF
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 10:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92BA2F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m1U7tP8K
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 449F560F21;
	Sat, 17 Feb 2024 09:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C75C433C7;
	Sat, 17 Feb 2024 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708163834;
	bh=EDkMlZRBTzgmSoA8T3Q+NyJsDr+epBLEA+1LH31cuww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m1U7tP8KWvVXCCCFRmYrdtQ6rW9gQAqcnsTKlX/JE5zQPPIrA6Uka888RNQSvB/y8
	 bkvX+jBt8Oc/Pbp7fuDUY3RFc/rhBMauHmv0OXfvyQy9hQ4RGvuA4E9Jvt0fmtyPJk
	 uk59nBh5l/Y3tRvLsdjlfSKZAa+8WshViuAvBAv0kuJNXqPB+nE4bM9sfRBPdUrAYU
	 gSGzA1DA/UCbYMUEa2eWn16swUg5WhRWdKdckQLGYXY2CrPa0ksexosq8/UjbnHgw1
	 OMRSAzoC/bhKO/AW8mKjDLeaX8pn3gvCiDoeT3fmfxL013mWWIWUbOhN52r8spIMkQ
	 G5jWc8dtc+dNA==
Date: Sat, 17 Feb 2024 10:57:08 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
 m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v12 10/15] media: uapi: Add audio rate controls support
Message-ID: <20240217105708.53c81b04@coco.lan>
In-Reply-To: <1705581128-4604-11-git-send-email-shengjiu.wang@nxp.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
	<1705581128-4604-11-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4RENMREXHQQTZZ47QBZNMJQRM2Y3VHUW
X-Message-ID-Hash: 4RENMREXHQQTZZ47QBZNMJQRM2Y3VHUW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RENMREXHQQTZZ47QBZNMJQRM2Y3VHUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Thu, 18 Jan 2024 20:32:03 +0800
Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:

> Add V4L2_CID_M2M_AUDIO_SOURCE_RATE and V4L2_CID_M2M_AUDIO_DEST_RATE
> new IDs for rate control.
> 
> Add V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET and
> V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET for clock drift.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../media/v4l/ext-ctrls-audio-m2m.rst         | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  6 ++++++
>  include/uapi/linux/v4l2-controls.h            |  5 +++++
>  3 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> index 82d2ecedbfee..de579ab8fb94 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> @@ -19,3 +19,23 @@ Audio M2M Control IDs
>      The Audio M2M class descriptor. Calling
>      :ref:`VIDIOC_QUERYCTRL` for this control will
>      return a description of this control class.
> +
> +.. _v4l2-audio-asrc:
> +
> +``V4L2_CID_M2M_AUDIO_SOURCE_RATE (integer menu)``
> +    Sets the audio source sample rate, unit is Hz
> +
> +``V4L2_CID_M2M_AUDIO_DEST_RATE (integer menu)``
> +    Sets the audio destination sample rate, unit is Hz
> +
> +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
> +    Sets the offset from the audio source sample rate, unit is Hz.
> +    The offset compensates for any clock drift. The actual source audio
> +    sample rate is the ideal source audio sample rate from
> +    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point offset.
> +
> +``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET (fixed point)``
> +    Sets the offset from the audio destination sample rate, unit is Hz.
> +    The offset compensates for any clock drift. The actual destination audio
> +    sample rate is the ideal source audio sample rate from
> +    ``V4L2_CID_M2M_AUDIO_DEST_RATE`` plus this fixed point offset.

Hmm... first of all, controls on V4L2 API can either be get or set.
So, starting the sentence with "Set" sounds an assumption that may
be wrong.

Also, I would explain a little bit more about the frequency offset values,
as clock drift adjustment on PCM streams is something that can be done
using different approaches.

I'm assuming that what you wanted here is to use it to check if the
video and audio clocks have some drift, and reducing or increasing
the audio sample rate dynamically to ensure that such drift will
stay constraint to a maximum allowed drift measured in mili or nano
seconds. So, userspace would be expected to be monitoring such drift
and increasing/decreasing the sample frequency as needed to maintain
such constraint.

Is that the way such uAPI is expected to work?

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 2a85ea3dc92f..91e1f5348c23 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1245,6 +1245,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  
>  	/* Audio M2M controls */
>  	case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
> +	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:	return "Audio Source Sample Rate";
> +	case V4L2_CID_M2M_AUDIO_DEST_RATE:	return "Audio Destination Sample Rate";
>  	default:
>  		return NULL;
>  	}
> @@ -1606,6 +1608,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> +	case V4L2_CID_M2M_AUDIO_DEST_RATE:
> +		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a8b4b830c757..30129ccdc282 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -3495,6 +3495,11 @@ struct v4l2_ctrl_av1_film_grain {
>  #define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x900)
>  #define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
>  
> +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 0)
> +#define V4L2_CID_M2M_AUDIO_DEST_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 1)
> +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 2)
> +#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 3)
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC



Thanks,
Mauro
