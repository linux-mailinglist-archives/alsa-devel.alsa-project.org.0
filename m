Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B45B36DF4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Aug 2025 17:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A7BD60267;
	Tue, 26 Aug 2025 17:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A7BD60267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756222709;
	bh=OEA06nTeAUGwpAIDsE1dzLbzSs+2hxTR5wfFGk+yki4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hl0kxsYDHykfBztUhBjOOOi2ldq6sla4NRlTJFbzfAIEJxo7t2Ck6PcSqCBT81XN7
	 EByYNJv4qeOAIsV9QY8fOruiQVQMK5URk8U8iViPblI59U9GDA75RQbzb69OnIdI01
	 ZGo8W+nVM9ZgAm6wteQ6DFYah3laRc61wQzFLo2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDC41F805C0; Tue, 26 Aug 2025 17:37:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6291F805C2;
	Tue, 26 Aug 2025 17:37:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1112F80508; Tue, 26 Aug 2025 17:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1676F8010B
	for <alsa-devel@alsa-project.org>; Tue, 26 Aug 2025 17:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1676F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=ojHfhLw+
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-70a9f5dfa62so55267906d6.3
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Aug 2025 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756222657; x=1756827457;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVabfoeTRalARdFdnvAT75q/NwmfuXUfzr/tmDDydBM=;
        b=ojHfhLw+Br62dx2a0rMIBJmgMIbKbyXvopi0Jd4PAnIunkrgCmOMSo8plwtkn0ACQI
         kj1w1aoOzQMxSWQyyPDU2XXWRIhckLxuyaE+VZXYjiZk4kzRDJ6G3rOa++JGK6gl45q6
         tqChcdX5Req59apfm20+aZtTI9gkFAIf0T3R1Y3hXylN2Fl9siIAQiZ9nfYoupvxQU91
         mFmY9wjd3WRrPlY5ZHD+couGNHZpyJa9HHbbyGgCIB9E7cJR6/KkvvFYdRhV4kMbEQ9B
         LUZznihTdjWEloxeSEFotp17RR4bCeEtcpesAdK9ickMxZztD1n+dsTCN/1HbF540LfN
         6vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222657; x=1756827457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVabfoeTRalARdFdnvAT75q/NwmfuXUfzr/tmDDydBM=;
        b=dPM3mNQwTqCauDb000Zw/chV8hRh+91FV2z4eXoJ28IPDu6pUQvzqokNVRLkgnUHc0
         1/BRB6rQyOyd1a7H5b7KID3/wo3gNL4Qc1r5QL7OszKjtve6mffvw5zD0r7qaxAOrjL/
         b5c58nH8v/MQr8UZ7dS6XuNFJD3IY4BpqlsWo8L+2WoYedBATzPzGg2owK8bpOMGX1bb
         3NutrAcshKfL3RRt72rXB5nDrFOHA23Ez9QJXfA7nofFTrBYm2mSUZz2BdbVarbO7XTX
         gdeSWESxwV2u3CXcnxdqu/YzupTwB91/DvrlRKqOrPYl6dQdSG4VQwAz1Lz4zw2cswjG
         /pIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3wggSomMWsTUmAqYtVEmq5Jw/LvOZ31E1XJZHV0swTBA9Z2Mr1hzexobwbBJVnGnUn+4xhfYSlMu6@alsa-project.org
X-Gm-Message-State: AOJu0YwoKfrLGLBWFX9yUVmvJTfeyV8MbWE9pv4150WmUAjTrVP4x7V+
	bfA8wgBc0VFCTICeApYaUo9VzuSOFFZJFVvUlkrp7Yf8UeZ789xWv8A6D68cqUKFWzBOYDYgkvs
	AyCpMKpQ6u1/qY21q/fGlkqyLc2xwOHclmdQgNjY/8g==
X-Gm-Gg: ASbGncuNS3dKAH31XltRarMLoyKM7qgMqWQpdI3QVXwFeAXhJwYmXAmFTxM5kJ143BO
	XWLXjWlns7IIIXHNDlpQnRd4Bf06fG4Kdxdtglq0JM/YiHi+8BCff5GAImJHjVhiaoyduEI6iaa
	Pddv6z6fURNl7QYgK7Eyas6lRJ/8HcpDQDQEd5VSDXv5an0iM5HHYW0AfXr856tdmbRjcNokS6e
	igKrOw=
X-Google-Smtp-Source: 
 AGHT+IGn4/HsaQzBgXtTuWAP/lpgRhFuhANcsb2aUMcUAyUN7Db8Yk7JceHH1d57Q+3kX/MnS38N0ue+12CYe+gWZKk=
X-Received: by 2002:a05:6214:c65:b0:707:4539:5183 with SMTP id
 6a1803df08f44-70d970980e6mr168020966d6.5.1756222656452; Tue, 26 Aug 2025
 08:37:36 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20250826093725.2432153-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: 
 <20250826093725.2432153-1-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 26 Aug 2025 23:37:23 +0800
X-Gm-Features: Ac12FXw_ibROh4a5HKwjNDJ18I2fbCE2E5fZrhUQZkVnB9izMMIgm1fAL4Zqo_4
Message-ID: 
 <CALprXBaHBivkJfEUaMq0zV3nycidSJheGOVXaOhwFTi0iiQhqw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: WCL: Add the sdw_process_wakeen op
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RUZRDUTZ42UNXIJBFF52QLPCZJX64URX
X-Message-ID-Hash: RUZRDUTZ42UNXIJBFF52QLPCZJX64URX
X-MailFrom: ajye_huang@compal.corp-partner.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUZRDUTZ42UNXIJBFF52QLPCZJX64URX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Based on the suggestion from version 1,
I forget to add the tag Acked-by: Peter Ujfalusi
<peter.ujfalusi@linux.intel.com>  in the v2.
I will send the v3 later, thanks


On Tue, Aug 26, 2025 at 5:37=E2=80=AFPM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> Add the missing op in the device description to avoid issues with jack
> detection.
> Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for WCL")
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
> v2: Add Fixes: 6b04629ae97a ("ASoC: SOF: Intel: add initial support for W=
CL")
>
>  sound/soc/sof/intel/ptl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
> index 1bc1f54c470d..4633cd01e7dd 100644
> --- a/sound/soc/sof/intel/ptl.c
> +++ b/sound/soc/sof/intel/ptl.c
> @@ -143,6 +143,7 @@ const struct sof_intel_dsp_desc wcl_chip_info =3D {
>         .read_sdw_lcount =3D  hda_sdw_check_lcount_ext,
>         .check_sdw_irq =3D lnl_dsp_check_sdw_irq,
>         .check_sdw_wakeen_irq =3D lnl_sdw_check_wakeen_irq,
> +       .sdw_process_wakeen =3D hda_sdw_process_wakeen_common,
>         .check_ipc_irq =3D mtl_dsp_check_ipc_irq,
>         .cl_init =3D mtl_dsp_cl_init,
>         .power_down_dsp =3D mtl_power_down_dsp,
> --
> 2.25.1
>
