Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDAA50770C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 20:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176D218A1;
	Tue, 19 Apr 2022 20:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176D218A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650391550;
	bh=RJn4MnLF7SAde+BACwZcBOgB0kqKyAFAGiwvjM5H/h8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvkS5euN/sgbjiR0D0aE/ee5VW3fwznUbnyu4odSCsTDfVgGkEnlAitbD5ysehvYN
	 ToJJ05SJFE61iZhhzJrdx1O7pOpWJoP1fjtliC71IJ3R4685JO6W+hfrlTcPVJjjx1
	 oUHDxnehR9ZArzQt71K9YYNawbPZ7x3rqL3GEVxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 741F8F80269;
	Tue, 19 Apr 2022 20:04:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9EDCF80269; Tue, 19 Apr 2022 20:04:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDBFEF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 20:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDBFEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="hWDyUOTZ"
Received: by mail-qt1-x82d.google.com with SMTP id fu34so4147387qtb.8
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a/JL7/pjikA+XyKdI/ESojFkMMvIJUPcrl8vIy/eNz8=;
 b=hWDyUOTZs07b7hLjIDA0sMUBTpmOkYjS4SXw3s/8ZD8SNF+AhU+MKys9j2oZ/9KwIL
 UZE+VQEbY62NjBxRjIgpuI1rF+Gxw2NWpW4kWnEJPS3OgNtCZ++QD20JJHRxK5zqp3qI
 4TpqkFYammH2W+KMw2Pn6l5Y8xu18BmFh8OHhb3UDv/RdcNcINF57sFv+9cqxhVP3GVB
 TYNwugDTz8qJM5xvabRHaRbt5BurNU89JJn+1A8aFRbwj2+/0e+E+CDh47TdCeok6BUD
 xIe/bS2SGtGIYXpkwVWVYjrSPGXJtYCmwt1yzvk/MYhYPYW8jZZs+bYujBbRo0CVKVs+
 5KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a/JL7/pjikA+XyKdI/ESojFkMMvIJUPcrl8vIy/eNz8=;
 b=hefC9zA91UplY8sqqL2ISUYilY1fEW6Xky/fHZfXTrta7kkdOlttdR4LGK2bgU0efF
 M0Jh8X2BM5Hp1oBKbTfUCBoVG9nGk2KqmRh/0IaoizcZ4iZ9/HOLN9BmdSJqGgIiuNVm
 YTjJTwJD4ULN3MCpTVZAHUspxXYypHMd2U5cLI/rg/kl82kGtTDuSkEhq4ByR35m1K/b
 EUMOS2bx34Zu6v0kCBV+JGFH7qnPOEze8+fmwGr0NhsDS4TFu+DPRZx+PnLw9ciPBBGh
 SXztsL3IElLCGTbAPMIQHrPNBHqxB7rUB+IeUgojCuPbV9lG5irJUjeZI5C3UYX5WFTk
 bELg==
X-Gm-Message-State: AOAM530XbdMAGyUEFLFacS9g36nCrxCw22yhECr2lI6/ZpWOwv7GeJMI
 Cd8/17uLfqXyroDaUCUNpMcc6fYloKvq4tqHQxrRPQ==
X-Google-Smtp-Source: ABdhPJwZu/d0HJoxwLRVkwLcus8VLtTp4n+usBSoFaOPwpM/jNzw4GXWEQ6UtytsxuN82+RWG9dzDOn4poGVK6C97iw=
X-Received: by 2002:a05:622a:181:b0:2e1:e70a:ec2a with SMTP id
 s1-20020a05622a018100b002e1e70aec2amr11290673qtw.42.1650391484606; Tue, 19
 Apr 2022 11:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <Ylk5o3EC/hyX5UQ0@google.com>
 <8eeb08ec-4836-cf7d-2285-8ed74ccfc1cb@linux.intel.com>
 <8986a1c6-b546-7a66-a778-048487624c95@linux.intel.com>
 <e31ff7c4-7cdc-fdaf-b12c-fc1e51798a1b@linux.intel.com>
In-Reply-To: <e31ff7c4-7cdc-fdaf-b12c-fc1e51798a1b@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 19 Apr 2022 11:04:33 -0700
Message-ID: <CAOReqxgRXbO3s4BgmZjoXmfKyr2MRWLE7jaTEwqh1ovgs_dUMA@mail.gmail.com>
Subject: Re: [Sound-open-firmware] out-of-bounds access in
 sound/soc/sof/topology.c
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 Sound Open Firmware <sound-open-firmware@alsa-project.org>
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

On Tue, Apr 19, 2022 at 10:55 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 4/19/22 06:50, P=C3=A9ter Ujfalusi wrote:
> > Hi Sergey, Pierre,
> >
> > On 15/04/2022 19:00, Pierre-Louis Bossart wrote:
> >> Thanks Sergey for this email.
> >>
> >> On 4/15/22 04:23, Sergey Senozhatsky wrote:
> >>> Hi,
> >>>
> >>> I'm running 5.10.111 LTS, so if this has been fixed already then we d=
efinitely
> >>> want to cherry pick the fix for -stable.
> >
> > I'm afraid, that this is still valid as of today, but in real life I
> > don't think it can happen.
> >
> >>> Anonymous union in this struct is of zero size
> >>>
> >>> /* generic control data */
> >>> struct sof_ipc_ctrl_data {
> >>>         struct sof_ipc_reply rhdr;
> >>>         uint32_t comp_id;
> >>>
> >>>         /* control access and data type */
> >>>         uint32_t type;          /**< enum sof_ipc_ctrl_type */
> >>>         uint32_t cmd;           /**< enum sof_ipc_ctrl_cmd */
> >>>         uint32_t index;         /**< control index for comps > 1 cont=
rol */
> >>>
> >>>         /* control data - can either be appended or DMAed from host *=
/
> >>>         struct sof_ipc_host_buffer buffer;
> >>>         uint32_t num_elems;     /**< in array elems or bytes for data=
 type */
> >>>         uint32_t elems_remaining;       /**< elems remaining if sent =
in parts */
> >>>
> >>>         uint32_t msg_index;     /**< for large messages sent in parts=
 */
> >>>
> >>>         /* reserved for future use */
> >>>         uint32_t reserved[6];
> >>>
> >>>         /* control data - add new types if needed */
> >>>         union {
> >>>                 /* channel values can be used by volume type controls=
 */
> >>>                 struct sof_ipc_ctrl_value_chan chanv[0];
> >>>                 /* component values used by routing controls like mux=
, mixer */
> >>>                 struct sof_ipc_ctrl_value_comp compv[0];
> >>>                 /* data can be used by binary controls */
> >>>                 struct sof_abi_hdr data[0];
> >>>         };
> >>> } __packed;
> >>>
> >>> sof_ipc_ctrl_value_chan and sof_ipc_ctrl_value_comp are of the same
> >>> size - 8 bytes, while sof_abi_hdr is much larger - _at least_ 32 byte=
s
> >>> (`__u32 data[0]` in sof_abi_hdr suggest that there should be more
> >>> payload after header). But they all contribute 0 to sizeof(sof_ipc_ct=
rl_data).
> >>>
> >>> Now control data allocations looks as follows
> >>>
> >>>     scontrol->size =3D struct_size(scontrol->control_data, chanv,
> >>>                                  le32_to_cpu(mc->num_channels));
> >>>     scontrol->control_data =3D kzalloc(scontrol->size, GFP_KERNEL);
> >>>
> >>> Which is sizeof(sof_ipc_ctrl_data) + mc->num_channels * sizeof(sof_ip=
c_ctrl_value_chan)
> >>>
> >>> For some reason it uses sizeof(sof_ipc_ctrl_value_chan), which is not
> >>> the largest member of the union.
> >>>
> >>> And this is where the problem is: in order to make control->data.FOO =
loads
> >>> and stores legal we need mc->num_channels to be of at least 4. So tha=
t
> >>>
> >>>    sizeof(sof_ipc_ctrl_data) + mc->num_channels * sizeof(sof_ipc_ctrl=
_value_chan)
> >>>
> >>>                 92           +        4         *            8
> >>>
> >>> will be the same as
> >>>
> >>>    sizeof(sof_ipc_ctrl_data) + sizeof(sof_abi_hdr).
> >>>
> >>>                 92           +           32
> >>>
> >>> Otherwise scontrol->control_data->data.FOO will access nearby/foreign
> >>> slab object.
> >>>
> >>> And there is at least one such memory access. In sof_get_control_data=
().
> >>>
> >>>     wdata[i].pdata =3D wdata[i].control->control_data->data;
> >>>     *size +=3D wdata[i].pdata->size;
> >>>
> >>>
> >>> pdata->size is at offset 8, but if, say, mc->num_channels =3D=3D 1 th=
en
> >>> we allocate only 8 bytes for pdata, so pdata->size is 4 bytes outside
> >>> of allocated slab object.
> >>>
> >>> Thoughts?
> >
> > Your analyzes are spot on, unfortunately. But...
> >
> > As of today, the sof_get_control_data() is in the call path of
> > (ipc3-topology.c):
> >
> > sof_widget_update_ipc_comp_process() -> sof_process_load() ->
> > sof_get_control_data()
> >
> > sof_widget_update_ipc_comp_process() is the ipc_setup callback for
> > snd_soc_dapm_effect. If I'm not mistaken these only carries bin payload
> > and never MIXER/ENUM/SWITCH/VOLUME.
> > This means that the sof_get_control_data() is only called with
> > SND_SOC_TPLG_TYPE_BYTES and for that the allocated data area is correct=
.
> >
> > This can explain why we have not seen any issues so far. This does not
> > renders the code right, as how it is written atm is wrong.
>
>
> Sergey's results with KASAN show that there's a real-life problem though.=
 I also don't understand how that might happen.
>
> Could it be that these results are with a specific topology where our ass=
umptions are incorrect?
>

That would align with our testing as we are seeing the failing on
exactly once device with a custom topology with a bytes payload. See
sof-jsl-rt5682.m4 with -DWAVES configured for
sof-jsl-rt5682-rt1015.tplg
