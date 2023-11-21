Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48567F29BD
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 11:04:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C7A4A4B;
	Tue, 21 Nov 2023 11:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C7A4A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700561088;
	bh=spIA5yREa1oYuagGL0+mEteoK9UhkRwnCaEWbQvSh/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iqTEWefTNvf+SGqDi6rprUA3ONPD3qANiCvzCLFh62phEXraah6JkPKAnfL3LD0i3
	 /RDTmYPGEynoPBLE6mOLup6jbf4p3Xw1+fLg1jqkmsn21hP6wDLwQLVQFZgFoezu92
	 K+c42co33eOWhTSBR3SQ094u0UpgAFco0NfRJvGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C387F80578; Tue, 21 Nov 2023 11:04:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8799BF80578;
	Tue, 21 Nov 2023 11:04:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1AAFF802E8; Tue, 21 Nov 2023 11:04:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9F8AF80246
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 11:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F8AF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g+OBQLpu
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6b1d1099a84so5087748b3a.1
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Nov 2023 02:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700561017; x=1701165817;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IdtMPB4/7uJbY1z0IHZnX7eXnXCeIomsPVSXPesfLU=;
        b=g+OBQLpuwLLzstQ/HMFWMqYdQK4gNw3LDOXXghBSnfwY3gE7ZowCArAEihAnDocTNF
         LdGyYFvF2hxcelk1XW6VvZ7sZTuUq30eTJS8R0mDYFRsWl5opI5i70ejAgcgaHTK6+ZU
         oMe1DK6zj8AAAUXweEbITns7wd9RRyyq+cUYHWctKiGB5CO8SMcYstMafiT2AqlQMebb
         2Lzflqeo5BCy4Tzota8+dIyAIvLWUDmpCiD+CuCsxglspDbM//Zzn7dnktkHQ8RpCydy
         kgKU95YuAKaeV1RNHUM/EcVGNzX2pTEcOE5Xf5gcCoDnfb3c/QD3izrz/aBMN7R79aGq
         HOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700561017; x=1701165817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IdtMPB4/7uJbY1z0IHZnX7eXnXCeIomsPVSXPesfLU=;
        b=ESO9oU956z1DuULHmweUsEhzEl5YQcbvX9lca1NIbmUMtRx38W+dtDoAldNZKDAqhv
         Ovx+VYuXBNnXmY1+RmO2BWdVULc2HoXvivz39CrSE+2pycLPrmQ39Qtk9DoABV+J9uVz
         zTcar7wglMriIH8qshthnQN9vNPRGYKoKtx6y8HiIN9RhCLgd2czfLxkEfUxb5K+BgJw
         cwnUDCe2SEyxdlgokVLM3FP5YIlM8ZvDKVvRt1Zh+XfNx1wBfYpT70ydMtytzEyRDclp
         FbZkxCTxgY7F7mrE+9kWGsF/nZDDCEhg7T47vI2oHwaTZ9clWGy5erefNWJVplSHwG5i
         GmXw==
X-Gm-Message-State: AOJu0YzSAqW7fMzqPfBUmoP2Qw7aNIEC7nCdJI47rMqkVADRtvAFgNL+
	mmjNAms9BEEec4ZDbjc4ejvs/xVOuFXna6cYH1c=
X-Google-Smtp-Source: 
 AGHT+IEhDjVYipyrVPlpzBI+rpeAtcq8ah4DfgpqQ7DHBDrltVevTS1J2kec+wzzM8Uup1RKyipn3G5y0qZHiDlY3Xc=
X-Received: by 2002:a05:6a20:914a:b0:18a:df45:fad4 with SMTP id
 x10-20020a056a20914a00b0018adf45fad4mr1762392pzc.37.1700561016867; Tue, 21
 Nov 2023 02:03:36 -0800 (PST)
MIME-Version: 1.0
References: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
 <71ce6d8b-90c2-4ef6-9883-129861dcab02@xs4all.nl>
In-Reply-To: <71ce6d8b-90c2-4ef6-9883-129861dcab02@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Nov 2023 18:03:25 +0800
Message-ID: 
 <CAA+D8ANvK5O2TXnjM_YqsHE8ycen9jrw_HXL+eJWtwJ_OZXeJA@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] Add audio support in v4l2 framework
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
Message-ID-Hash: GR7NZZURK66W4FY4N6G62NQCZCQK6KF7
X-Message-ID-Hash: GR7NZZURK66W4FY4N6G62NQCZCQK6KF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GR7NZZURK66W4FY4N6G62NQCZCQK6KF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Nov 21, 2023 at 5:22=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 21/11/2023 08:37, Shengjiu Wang wrote:
> > Audio signal processing also has the requirement for memory to
> > memory similar as Video.
> >
> > This asrc memory to memory (memory ->asrc->memory) case is a non
> > real time use case.
> >
> > User fills the input buffer to the asrc module, after conversion, then =
asrc
> > sends back the output buffer to user. So it is not a traditional ALSA p=
layback
> > and capture case.
> >
> > It is a specific use case,  there is no reference in current kernel.
> > v4l2 memory to memory is the closed implementation,  v4l2 current
> > support video, image, radio, tuner, touch devices, so it is not
> > complicated to add support for this specific audio case.
> >
> > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > use case in ALSA.  Now the "memory->asrc->memory" needs
> > to reuse the code in asrc driver, so the first 3 patches is for refinin=
g
> > the code to make it can be shared by the "memory->asrc->memory"
> > driver.
> >
> > The main change is in the v4l2 side, A /dev/vl4-audioX will be created,
> > user applications only use the ioctl of v4l2 framework.
> >
> > Other change is to add memory to memory support for two kinds of i.MX A=
SRC
> > module.
> >
> > changes in v10
> > - remove FIXED_POINT type
> > - change code base on media: v4l2-ctrls: add support for fraction_bits
> > - fix issue reported by kernel test robot
> > - remove module_alias
>
> Note that I still need a patch for vivid adding a fixed point test contro=
l.
>
> I think I want two controls: one INTEGER Q16 and one INTEGER64 Q63 (a nic=
e
> corner case).
>

Not sure if we can do like this:

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h
b/drivers/media/test-drivers/vivid/vivid-core.h
index cfb8e66083f6..def8cf6c30c1 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -222,6 +222,8 @@ struct vivid_dev {
        struct v4l2_ctrl                *boolean;
        struct v4l2_ctrl                *int32;
        struct v4l2_ctrl                *int64;
+       struct v4l2_ctrl                *int32Q16;
+       struct v4l2_ctrl                *int64Q63;
        struct v4l2_ctrl                *menu;
        struct v4l2_ctrl                *string;
        struct v4l2_ctrl                *bitmask;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c
b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f2b20e25a7a4..c912b6776775 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -182,6 +182,28 @@ static const struct v4l2_ctrl_config vivid_ctrl_int64 =
=3D {
        .step =3D 1,
 };

+static const struct v4l2_ctrl_config vivid_ctrl_int32Q16 =3D {
+       .ops =3D &vivid_user_gen_ctrl_ops,
+       .id =3D VIVID_CID_INTEGER,
+       .name =3D "Integer 32 Bits Q16",
+       .type =3D V4L2_CTRL_TYPE_INTEGER,
+       .min =3D 0xffffffff80000000ULL,
+       .max =3D 0x7fffffff,
+       .step =3D 1,
+       .fraction_bits =3D 16,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_int64Q63 =3D {
+       .ops =3D &vivid_user_gen_ctrl_ops,
+       .id =3D VIVID_CID_INTEGER64,
+       .name =3D "Integer 64 Bits Q63",
+       .type =3D V4L2_CTRL_TYPE_INTEGER64,
+       .min =3D 0x8000000000000000ULL,
+       .max =3D 0x7fffffffffffffffLL,
+       .step =3D 1,
+       .fraction_bits =3D 63,
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u32_array =3D {
        .ops =3D &vivid_user_gen_ctrl_ops,
        .id =3D VIVID_CID_U32_ARRAY,
@@ -1670,6 +1692,8 @@ int vivid_create_controls(struct vivid_dev *dev,
bool show_ccs_cap,
        dev->button =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_button, NULL);
        dev->int32 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int32, NULL);
        dev->int64 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int64, NULL);
+       dev->int32Q16 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int32Q16, NULL);
+       dev->int64Q63 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int64Q63, NULL);
        dev->boolean =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_boolean, NULL);
        dev->menu =3D v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_menu, =
NULL);
        dev->string =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_string, NULL);
(END)


> Regards,
>
>         Hans
>
> >
> > changes in v9:
> > - add MEDIA_ENT_F_PROC_AUDIO_RESAMPLER.
> > - add MEDIA_INTF_T_V4L_AUDIO
> > - add media controller support
> > - refine the vim2m-audio to support 8k<->16k conversion.
> >
> > changes in v8:
> > - refine V4L2_CAP_AUDIO_M2M to be 0x00000008
> > - update doc for FIXED_POINT
> > - address comments for imx-asrc
> >
> > changes in v7:
> > - add acked-by from Mark
> > - separate commit for fixed point, m2m audio class, audio rate controls
> > - use INTEGER_MENU for rate,  FIXED_POINT for rate offset
> > - remove used fmts
> > - address other comments for Hans
> >
> > changes in v6:
> > - use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
> >   m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_par=
t_two.
> > - change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
> > - fix warning by kernel test rebot
> > - remove some unused format V4L2_AUDIO_FMT_XX
> > - Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
> > - rename audm2m to viaudm2m.
> >
> > changes in v5:
> > - remove V4L2_AUDIO_FMT_LPCM
> > - define audio pixel format like V4L2_AUDIO_FMT_S8...
> > - remove rate and format in struct v4l2_audio_format.
> > - Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
> > - updata document accordingly.
> >
> > changes in v4:
> > - update document style
> > - separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate commi=
t
> >
> > changes in v3:
> > - Modify documents for adding audio m2m support
> > - Add audio virtual m2m driver
> > - Defined V4L2_AUDIO_FMT_LPCM format type for audio.
> > - Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
> > - with modification in v4l-utils, pass v4l2-compliance test.
> >
> > changes in v2:
> > - decouple the implementation in v4l2 and ALSA
> > - implement the memory to memory driver as a platfrom driver
> >   and move it to driver/media
> > - move fsl_asrc_common.h to include/sound folder
> >
> > Shengjiu Wang (14):
> >   ASoC: fsl_asrc: define functions for memory to memory usage
> >   ASoC: fsl_easrc: define functions for memory to memory usage
> >   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
> >   ASoC: fsl_asrc: register m2m platform device
> >   ASoC: fsl_easrc: register m2m platform device
> >   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
> >   media: v4l2: Add audio capture and output support
> >   media: uapi: Define audio sample format fourcc type
> >   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
> >   media: uapi: Add audio rate controls support
> >   media: uapi: Declare interface types for Audio
> >   media: uapi: Add an entity type for audio resampler
> >   media: imx-asrc: Add memory to memory driver
> >   media: vim2m-audio: add virtual driver for audio memory to memory
> >
> >  .../media/mediactl/media-types.rst            |   11 +
> >  .../userspace-api/media/v4l/buffer.rst        |    6 +
> >  .../userspace-api/media/v4l/common.rst        |    1 +
> >  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
> >  .../userspace-api/media/v4l/devices.rst       |    1 +
> >  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
> >  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |    4 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
> >  .../media/v4l/vidioc-querycap.rst             |    3 +
> >  .../media/videodev2.h.rst.exceptions          |    3 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
> >  drivers/media/platform/nxp/Kconfig            |   13 +
> >  drivers/media/platform/nxp/Makefile           |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c         | 1264 +++++++++++++++++
> >  drivers/media/test-drivers/Kconfig            |   11 +
> >  drivers/media/test-drivers/Makefile           |    1 +
> >  drivers/media/test-drivers/vim2m-audio.c      |  799 +++++++++++
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    9 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   10 +
> >  drivers/media/v4l2-core/v4l2-dev.c            |   21 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
> >  drivers/media/v4l2-core/v4l2-mem2mem.c        |   13 +-
> >  include/media/v4l2-dev.h                      |    2 +
> >  include/media/v4l2-ioctl.h                    |   34 +
> >  .../fsl =3D> include/sound}/fsl_asrc_common.h   |   60 +
> >  include/uapi/linux/media.h                    |    2 +
> >  include/uapi/linux/v4l2-controls.h            |    9 +
> >  include/uapi/linux/videodev2.h                |   41 +
> >  sound/soc/fsl/fsl_asrc.c                      |  144 ++
> >  sound/soc/fsl/fsl_asrc.h                      |    4 +-
> >  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
> >  sound/soc/fsl/fsl_easrc.c                     |  233 +++
> >  sound/soc/fsl/fsl_easrc.h                     |    6 +-
> >  36 files changed, 2977 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem=
2mem.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-aud=
io-m2m.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.=
rst
> >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> >  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
> >  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
> >
>
