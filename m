Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE658779BE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 03:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC23DFA;
	Mon, 11 Mar 2024 03:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC23DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710122896;
	bh=iCaTAj4MVPqhMV4LcDZ/QFZqZiFhy41yOCZ8A2RSgxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DlSMt+GkeKb3YC5B+Y/MF7VnugT6H+MwLqDjE1yBcAlMJuYYxee4WTL6sQm+oHkUt
	 mPyOcJR4aDbpnRq8fBx/fbgabq0oSoyS9IAVpyZnbbSDFAj1/4jyr1cwXIjrQBSyw7
	 EdH9nqldVXwoVd972q4+oyqvzHS69rDdAZY2e7/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A05FF805A9; Mon, 11 Mar 2024 03:07:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2741F80588;
	Mon, 11 Mar 2024 03:07:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC993F8028D; Mon, 11 Mar 2024 03:07:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB020F80088
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 03:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB020F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=USGWLR38
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-364f791a428so20006365ab.3
        for <alsa-devel@alsa-project.org>;
 Sun, 10 Mar 2024 19:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710122842; x=1710727642;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEz2Pe4E4OEDHLyalXPDDQI2Ud+GHImTN6uJ1DNtdwA=;
        b=USGWLR38woWW4B1jrKGiDzxMUC2s61hV1XVSYvfQcpi993P0LL2SKg7ke28/nqu4oK
         +KJyjIN2RSHmtk9QDFiNlaDdVBA+NqoXJUqdtpTFJ2SCHxJN/8Iznqg5Qv+/ezDZ3tO6
         rxaxN+dkiUnVdSz7G4q3SWbjp32dncr0yFvvEtRVbxkyFFL6sA1kZo/jpxTOqHCLZ4lQ
         ZmaAGT35wpjRvaMBaRMGqKxdO/ZYDJnEbLQyZ6rwnuxomt8e0/VgikOn7ohwIGvdc52r
         9aTHfVmrEFZngHg7BZsJmOKicC6iOHLpAN55q6fVzWGSJcJZNE0JJKGOn5QpJ3CG4rX+
         S1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710122842; x=1710727642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEz2Pe4E4OEDHLyalXPDDQI2Ud+GHImTN6uJ1DNtdwA=;
        b=aBxU119szZk1GqtVhZX/mnd921QJ2MgawzLiMkm1iBCjL02CnjvR9wEeeZFsO1hJZc
         InuMvFiWTxRAtJb+CvPZ4usLz8lFpeQbMqS+Fd4dQHo3tDlFkfiG1B17udqdI5KjE5PP
         5B8apsf6nWvWl0HS0kEFVQCg3OyqOskXt5cVIzW7h5GL1nbiGVnnbljF7oyEAItbWTes
         DGW5jt0+nIpgmGVEXylbFsiMkW7/AmAJP785+XYWyoBgeHed1sIXzsPGp9zuybbzL7Je
         XJfS7TS/QJaglq9MD0w08bTiE91/cfdgoPuQcAF8odQk4YBz4jqQ9zJymgqg70FrQU0c
         VwJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVchJfhxFldxu6DpccOVXKx0rY3iZE7CrHT6D45Z8thR8TD27UMQnvVikS/aAKBxR+/GziCr0LU23O2tJzzfCZ2JsQcwgz83eHyW1g=
X-Gm-Message-State: AOJu0YzUBE2uUMFjRbesH1WeviPurvg9vqI5w/pfDFsk+lLspWE5qsx2
	7reQKTtXOapn69LZb5NlvE8QK4siL4Mqu/zxrq2WinN3MZoETTjI/QUhQn3Qor5BttGhxTIABXY
	THfciu15DON831Cvf/nG11/qIEhM=
X-Google-Smtp-Source: 
 AGHT+IF/lnqcjWzW+G8WdqGNI/KIXgka6mAlaezEMzVMInE6YrZ1sB/1P5ojtj4PJnvVguFLVYMBSVjr/5Jp23D7owk=
X-Received: by 2002:a92:d790:0:b0:366:43bd:f0f5 with SMTP id
 d16-20020a92d790000000b0036643bdf0f5mr4061732iln.17.1710122842300; Sun, 10
 Mar 2024 19:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
 <df05261f-2f0e-490f-883b-72ad8a02d11b@xs4all.nl>
 <CAA+D8AMJOCfp6WdqYqy7KSj=mX9o_D5U-aF6Wn=3cOnhWg7VDg@mail.gmail.com>
 <56368a0d-6ada-4ab6-8389-b4bd20d6efc4@xs4all.nl>
 <CAA+D8AOXKJP1r-+j0QiH82x3MQ+Y1y2c1h04n=jmJncPogn7Vg@mail.gmail.com>
 <c3dbbc57-2df4-4c88-98e3-0500910404c4@xs4all.nl>
In-Reply-To: <c3dbbc57-2df4-4c88-98e3-0500910404c4@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 11 Mar 2024 10:07:10 +0800
Message-ID: 
 <CAA+D8AM4c6uo7pPJWHNCx1N1ZeiJO9qThy+dcSo1Mk9mRX9E8Q@mail.gmail.com>
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format fourcc
 type
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4GNE7EGAMBT4PIFHRBVLY2OYVOFC25IY
X-Message-ID-Hash: 4GNE7EGAMBT4PIFHRBVLY2OYVOFC25IY
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GNE7EGAMBT4PIFHRBVLY2OYVOFC25IY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 8, 2024 at 10:04=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 08/03/2024 2:52 pm, Shengjiu Wang wrote:
> > On Fri, Mar 8, 2024 at 8:06=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl=
> wrote:
> >>
> >> On 08/03/2024 12:52 pm, Shengjiu Wang wrote:
> >>> On Fri, Mar 8, 2024 at 3:34=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.=
nl> wrote:
> >>>>
> >>>> Hi Shengjiu,
> >>>>
> >>>> After thinking it over I think this patch can be improved:
> >>>>
> >>>> On 26/02/2024 9:28 am, Shengjiu Wang wrote:
> >>>>> The audio sample format definition is from alsa,
> >>>>> the header file is include/uapi/sound/asound.h, but
> >>>>> don't include this header file directly, because in
> >>>>> user space, there is another copy in alsa-lib.
> >>>>> There will be conflict in userspace for include
> >>>>> videodev2.h & asound.h and asoundlib.h
> >>>>>
> >>>>> Here still use the fourcc format.
> >>>>>
> >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>> ---
> >>>>>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++=
++++
> >>>>>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >>>>>  include/uapi/linux/videodev2.h                | 23 +++++
> >>>>>  4 files changed, 124 insertions(+)
> >>>>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-au=
dio.rst
> >>>>>
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst=
 b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>>> new file mode 100644
> >>>>> index 000000000000..04b4a7fbd8f4
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>>> @@ -0,0 +1,87 @@
> >>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>>> +
> >>>>> +.. _pixfmt-audio:
> >>>>> +
> >>>>> +*************
> >>>>> +Audio Formats
> >>>>> +*************
> >>>>> +
> >>>>> +These formats are used for :ref:`audiomem2mem` interface only.
> >>>>
> >>>> Here you should also document that all these fourccs start with 'AU'=
 and are
> >>>> reserved for mappings of the snd_pcm_format_t type.
> >>>>
> >>>> Also document the v4l2_fourcc_to_audfmt define and the v4l2_audfmt_t=
o_fourcc
> >>>> define (see also below).
> >>>
> >>> How about below description?
> >>> '
> >>> All these fourccs starting with 'AU' are reserved for mappings
> >>
> >> All these fourccs -> All FourCCs
> >>
> >>> of the snd_pcm_format_t type.
> >>>
> >>> The v4l2_audfmt_to_fourcc() is defined to convert snd_pcm_format_t
> >>
> >> convert -> convert the
> >>
> >>> type to fourcc. The first character is 'A', the second character
> >>
> >> fourcc -> a FourCC
> >>
> >>> is 'U', the third character is ten's digit of snd_pcm_format_t,
> >>> the fourth character is unit's digit of snd_pcm_format_t.
> >>
> >> "is 'U', and the remaining two characters is the snd_pcm_format_t
> >> value in ASCII. Example: SNDRV_PCM_FORMAT_S16_LE (with value 2)
> >> maps to 'AU02' and SNDRV_PCM_FORMAT_S24_3LE (with value 32) maps
> >> to 'AU32'."
> >>
> >>>
> >>> The v4l2_fourcc_to_audfmt() is defined to convert these fourccs to
> >>
> >> fourccs -> FourCCs
> >>
> >>> snd_pcm_format_t type.
> >>
> >> BTW, given the way snd_pcm_format_t is defined I am fairly certain
> >> some casts are needed for the v4l2_audfmt_to_fourcc define.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>> '
> >>> Best regards
> >>> Shengjiu Wang
> >>>>
> >>>>> +
> >>>>> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> >>>>> +
> >>>>> +.. cssclass:: longtable
> >>>>> +
> >>>>> +.. flat-table:: Audio Format
> >>>>> +    :header-rows:  1
> >>>>> +    :stub-columns: 0
> >>>>> +    :widths:       3 1 4
> >>>>> +
> >>>>> +    * - Identifier
> >>>>> +      - Code
> >>>>> +      - Details
> >>>>> +    * .. _V4L2-AUDIO-FMT-S8:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S8``
> >>>>> +      - 'S8'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S16-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S16_LE``
> >>>>> +      - 'S16_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U16-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U16_LE``
> >>>>> +      - 'U16_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S24-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S24_LE``
> >>>>> +      - 'S24_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U24-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U24_LE``
> >>>>> +      - 'U24_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S32-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S32_LE``
> >>>>> +      - 'S32_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U32-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U32_LE``
> >>>>> +      - 'U32_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
> >>>>> +      - 'FLOAT_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
> >>>>> +      - 'IEC958_SUBFRAME_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S24-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S24_3LE``
> >>>>> +      - 'S24_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U24-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U24_3LE``
> >>>>> +      - 'U24_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S20-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S20_3LE``
> >>>>> +      - 'S20_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U20-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U20_3LE``
> >>>>> +      - 'U20_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Doc=
umentation/userspace-api/media/v4l/pixfmt.rst
> >>>>> index 11dab4a90630..2eb6fdd3b43d 100644
> >>>>> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> >>>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> >>>>> @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> >>>>>      colorspaces
> >>>>>      colorspaces-defs
> >>>>>      colorspaces-details
> >>>>> +    pixfmt-audio
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> >>>>> index 961abcdf7290..be229c69e991 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> @@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmt=
desc *fmt)
> >>>>>       case V4L2_PIX_FMT_Y210:         descr =3D "10-bit YUYV Packed=
"; break;
> >>>>>       case V4L2_PIX_FMT_Y212:         descr =3D "12-bit YUYV Packed=
"; break;
> >>>>>       case V4L2_PIX_FMT_Y216:         descr =3D "16-bit YUYV Packed=
"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S8:         descr =3D "8-bit Signed"; bre=
ak;
> >>>>> +     case V4L2_AUDIO_FMT_S16_LE:     descr =3D "16-bit Signed LE";=
 break;
> >>>>> +     case V4L2_AUDIO_FMT_U16_LE:             descr =3D "16-bit Uns=
igned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S24_LE:             descr =3D "24(32)-bit=
 Signed LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U24_LE:             descr =3D "24(32)-bit=
 Unsigned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S32_LE:             descr =3D "32-bit Sig=
ned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U32_LE:             descr =3D "32-bit Uns=
igned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_FLOAT_LE:           descr =3D "32-bit Flo=
at LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: descr =3D "32-bit IEC=
958 LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S24_3LE:            descr =3D "24(24)-bit=
 Signed LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U24_3LE:            descr =3D "24(24)-bit=
 Unsigned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S20_3LE:            descr =3D "20(24)-bit=
 Signed LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U20_3LE:            descr =3D "20(24)-bit=
 Unsigned LE"; break;
> >>>>>
> >>>>>       default:
> >>>>>               /* Compressed formats */
> >>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> >>>>> index 2c03d2dfadbe..673a6235a029 100644
> >>>>> --- a/include/uapi/linux/videodev2.h
> >>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>> @@ -843,6 +843,29 @@ struct v4l2_pix_format {
> >>>>>  #define V4L2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc('R', 'K', '1', 'P=
') /* Rockchip ISP1 3A Parameters */
> >>>>>  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K',=
 '1', 'S') /* Rockchip ISP1 3A Statistics */
> >>>>>
> >>>>> +/*
> >>>>> + * Audio-data formats
> >>>>> + * All these audio formats use a fourcc starting with 'AU'
> >>>>> + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
> >>>>
> >>>> Also document here that fourccs starting with 'AU' are reserved for
> >>>> the snd_pcm_format_t to fourcc mappings.
> >>>>
> >>>> That to avoid that someone adds a 'AUXX' fourcc later.
> >>>>
> >>>>> + */
> >>>>> +#define V4L2_AUDIO_FMT_S8                    v4l2_fourcc('A', 'U',=
 '0', '0')
> >>>>> +#define V4L2_AUDIO_FMT_S16_LE                        v4l2_fourcc('=
A', 'U', '0', '2')
> >>>>> +#define V4L2_AUDIO_FMT_U16_LE                        v4l2_fourcc('=
A', 'U', '0', '4')
> >>>>> +#define V4L2_AUDIO_FMT_S24_LE                        v4l2_fourcc('=
A', 'U', '0', '6')
> >>>>> +#define V4L2_AUDIO_FMT_U24_LE                        v4l2_fourcc('=
A', 'U', '0', '8')
> >>>>> +#define V4L2_AUDIO_FMT_S32_LE                        v4l2_fourcc('=
A', 'U', '1', '0')
> >>>>> +#define V4L2_AUDIO_FMT_U32_LE                        v4l2_fourcc('=
A', 'U', '1', '2')
> >>>>> +#define V4L2_AUDIO_FMT_FLOAT_LE                      v4l2_fourcc('=
A', 'U', '1', '4')
> >>>>> +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE    v4l2_fourcc('A', 'U',=
 '1', '8')
> >>>>> +#define V4L2_AUDIO_FMT_S24_3LE                       v4l2_fourcc('=
A', 'U', '3', '2')
> >>>>> +#define V4L2_AUDIO_FMT_U24_3LE                       v4l2_fourcc('=
A', 'U', '3', '4')
> >>>>> +#define V4L2_AUDIO_FMT_S20_3LE                       v4l2_fourcc('=
A', 'U', '3', '6')
> >>>>> +#define V4L2_AUDIO_FMT_U20_3LE                       v4l2_fourcc('=
A', 'U', '3', '8')
> >>>>> +
> >>>>> +#define v4l2_fourcc_to_audfmt(fourcc)        \
> >>>>> +     (__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') =
* 10  \
> >>>>> +                                + ((((fourcc) >> 24) & 0xff) - '0'=
))
> >>>>> +
> >>>>
> >>>> As I suggested in an earlier reply, add this:
> >>>>
> >>>> #define v4l2_audfmt_to_fourcc(audfmt) \
> >>>>         v4l2_fourcc('A', 'U', '0' + (audfmt) / 10, '0' + (audfmt) % =
10)
> >>>>
> >>>> Even though it is not used in the drivers, since this is a public he=
ader used
> >>>> by drivers and applications, it makes sense to provide the reverse m=
apping as well.
> >>>>
> >>>> Please test it in actual code to make sure there are no compilation =
warnings.
> >
> > I test this definition, the compiler doesn't report warning.
>
> typedef int __bitwise snd_pcm_format_t;
>
> And __bitwise is apparently a sparse static analyzer attribute, so I susp=
ect that the
> v4l2_audfmt_to_fourcc definition will cause a sparse warning. So you need=
 to check
> with sparse.
>

Thanks,  with sparse there is warning, I will fix it.

best regards
Shengjiu Wang

> Regards,
>
>         Hans
>
> >
> > best regards
> > Shengjiu Wang
> >
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>>
> >>>>>  /* priv field value to indicates that subsequent fields are valid.=
 */
> >>>>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
> >>>>>
> >>>>
> >>
>
