Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E79237D17F0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 23:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D97986C1;
	Fri, 20 Oct 2023 23:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D97986C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697836838;
	bh=GU1ETC6wMRqttrOzmZqn4snE3S27ZmklzChpzhp9wzU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i+8JR85cfy9pPOsIOz9B5/iNE4fycjFk2sZSS4eVTFmwKmq9Qkflcj5mChN4e4xRx
	 d2qzAgpq0LrU8H9r6ddoRgHR8P79VJKLbrb/OPQO3OgwqimTl/h70uW4s0fwg7umEH
	 XR2sDK9RWFeBqxNaF4OTmCaOuA3iEpSGMmG9jsSo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ADD5F80563; Fri, 20 Oct 2023 23:19:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78912F8024E;
	Fri, 20 Oct 2023 23:19:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E97C0F8027B; Fri, 20 Oct 2023 23:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30BEAF80236
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 23:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30BEAF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=QPhK8Ckh
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5ab2cb900fcso885892a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 14:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697836775; x=1698441575;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9YjEIQWy6daCcnZfKUCk0eX4Io5MUDbFHgVHcjxrWk=;
        b=QPhK8CkhPczWZAX1P8ZcGkSX837lFS7WFDyW0NflJNhFfOHyH64HkaRLNajNPzKXRY
         y+sMkF5T0t06SHsznBddApo5YkpS14eCqbf6zCxqk0w/PPkVowCHJ6vRmC9+19ZPc+S+
         IMsdxN/9kSPof85JjMcx+tK7CM1HPvf/Yai5funnEKdyWNf19TPvk4X2uD7ygoR3s3jP
         F0G6IvoqR7GZ0qFAnsnTXgoE7fdV8rPNXQYZGPAKgck8dIPTQCtDKzw4kW0g7L2i8w/R
         UmUra4Z66d9Egzx60sdiswNjintbYjHQxllpu4FiXsDIE83wRi9Izj7gvr83oRW5lIYc
         h0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697836775; x=1698441575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9YjEIQWy6daCcnZfKUCk0eX4Io5MUDbFHgVHcjxrWk=;
        b=ezU3Bdke5FJnFSZxYHcyhQEWSOH82+iEy1Kd6iRUeH93jPi/YxzC6EqxjKphvUpXSF
         G9h+epwvChPkt7AEW+7aAZwMRso5BMhRl6tJ4gh/JL3fR5L2AylL72SXaqpKeUJSvoDv
         7yWQ/KF4mdI6bXczPf1MNK44YgV6Z0QZBgjPrfFXXnpNmzT8XVSozDctc6kSY9lfrLmP
         hGLhpktJmMlO6ag4qu2bk9aAa8lwUd4z6gXje7It42M4H+DIoeaNCrTAOT8BfpZtSU0b
         UmQj52I6m+fSfpNTLB4EHW4u6gMUQUlP43nWd9YYGYK3Y+Hu+rdQkZWZQ7TSyfBk5oCz
         s75A==
X-Gm-Message-State: AOJu0YxE6a8Ez09+zPxKt5oAVWb1KZJMmT0gmr2tKnqljeWHtHnN8fTF
	9d1uhcUwzZcBwTSWKbXiVIm9yIrWagGOmMGWoGUi1A==
X-Google-Smtp-Source: 
 AGHT+IFAnBcyEirWRbOHDgQa0BipdQ3XDegYyx70W6pwGiyHgf1ILQcSADmA0O0n6k0IJ1PfErLWMZ7dzz68cVep4C8=
X-Received: by 2002:a17:90b:1e53:b0:271:7cd6:165d with SMTP id
 pi19-20020a17090b1e5300b002717cd6165dmr2893154pjb.26.1697836774929; Fri, 20
 Oct 2023 14:19:34 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20231020145953.v1.1.Iaf5702dc3f8af0fd2f81a22ba2da1a5e15b3604c@changeid>
In-Reply-To: 
 <20231020145953.v1.1.Iaf5702dc3f8af0fd2f81a22ba2da1a5e15b3604c@changeid>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 20 Oct 2023 14:19:23 -0700
Message-ID: 
 <CAOReqxhrhzWh-aO5kt-7yqcfX9CbHW-WBgBAqQ9FqeUj-h1o=A@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: SOF: sof-pci-dev: Fix community key quirk
 detection
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Curtis Malainey <cujomalainey@chromium.org>, stable@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VZAKZZGPJ26AN3BTKDPRXQXLJQ7XGDXT
X-Message-ID-Hash: VZAKZZGPJ26AN3BTKDPRXQXLJQ7XGDXT
X-MailFrom: cujomalainey@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZAKZZGPJ26AN3BTKDPRXQXLJQ7XGDXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Curtis Malainey | Chrome OS Audio Senior Software Engineer |
cujomalainey@google.com | Sound Open Firmware Lead


On Fri, Oct 20, 2023 at 2:00=E2=80=AFPM Mark Hasemeyer <markhas@chromium.or=
g> wrote:
>
> Some Chromebooks do not populate the product family DMI value resulting
> in firmware load failures.
>
> Add another quirk detection entry that looks for "Google" in the BIOS
> version. Theoretically, PRODUCT_FAMILY could be replaced with
> BIOS_VERSION, but it is left as a quirk to be conservative.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

Acked-by: Curtis Malainey <cujomalainey@chromium.org>

> ---
>
>  sound/soc/sof/sof-pci-dev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
> index 1d706490588e..64b326e3ef85 100644
> --- a/sound/soc/sof/sof-pci-dev.c
> +++ b/sound/soc/sof/sof-pci-dev.c
> @@ -145,6 +145,13 @@ static const struct dmi_system_id community_key_plat=
forms[] =3D {
>                         DMI_MATCH(DMI_PRODUCT_FAMILY, "Google"),
>                 }
>         },
> +       {
> +               .ident =3D "Google firmware",
> +               .callback =3D chromebook_use_community_key,
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BIOS_VERSION, "Google"),
> +               }
> +       },
>         {},
>  };
>
> --
> 2.42.0.655.g421f12c284-goog
>
