Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA23880130
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 16:53:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3DB1192E;
	Tue, 19 Mar 2024 16:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3DB1192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710863581;
	bh=4ujBKEoJCqZI/GMMVrqC23scbdFthTjkdz8KOKN5d18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u+3NKkZnm+vLsCylYFWIu5e20sAdHF9+SJdtPpxJaCTuIFgbtnwAPHf9BdW5gxPb2
	 VoB9zqRIgRxBvGmhKm/tVbBg3QutW/T6rKhhyOsSWOG78QerHjJ/PuZMNprtCC887E
	 kMr7B4wQ5+s9i7twFcbkkNGE3klLBE/Xf/Mnkb8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE359F805D4; Tue, 19 Mar 2024 16:52:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C37DF805BF;
	Tue, 19 Mar 2024 16:52:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B581F805B0; Tue, 19 Mar 2024 16:52:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EFA2F8058C
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 16:52:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFA2F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=sI7vP0SE
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-29fa10274e5so1668100a91.3
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Mar 2024 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710863529; x=1711468329;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ujBKEoJCqZI/GMMVrqC23scbdFthTjkdz8KOKN5d18=;
        b=sI7vP0SEmCY9H6Ssjsxd6+FrlVm4jCP8o7fYHZ6oMAf9ITSH0TrDNo/w9N2+bTeBBV
         cq1eY4I5v3R7Bq5OrUD7FEohmb6uabHbh8zXKTHwaGc3wNHmH00jk1I2fif8xBXWnn1r
         DfzktOlIF+3mxRIyPUH7uWRcERasMtB7zgAjP4mWQFla8aov4Qcdm/DmTJF9cq0FzM29
         bb4m/TVlQA7fgtbHmzQNkMA7gCD4WcVW4ZDlSHAf2Seuo9NwN1c+96n339ZMGpX/1wdB
         mloFeS2eKQjuXgjpPVT8qH7f7jgbRnwItnxhjmjkBMnJDmTxYqpgbJmxYU8V9lcCO01m
         wOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863529; x=1711468329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ujBKEoJCqZI/GMMVrqC23scbdFthTjkdz8KOKN5d18=;
        b=Mey+Fk4xc7h2XGjHizOA0uz0ICliSvBGzoA/VbzCEs6KY23GPVH2K3y2wQMwzCvPa2
         I7Fi8LoBSIZbBokTTt12plv329t5TiIfc1zEv0tfR1TxSjwqzXMOkyPk5bpYqkiaPM1K
         Ffbv7Getws02+HzfoRG/fZD4GsBL2IwK7krwaY2nStQobURDFz3xGf5TjV84r7sU8Xyu
         TH035h7bVAWrYI3CT6ZptXiKahscom6wVi8NRxhiUUzG8Ei4xPkVYzgS44kzcfB0+Jj9
         IFozzAZX5hItw7x65TNXCNMcPeiO3B/DFfSeFUOaSym6vIihT6nnaD7+lo6HQ814QTjE
         b2HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwWECFVWeSdly+gJLeCexjoeZpA4qdomZ5XwTc8qklCXtD2tYQrZY8VeZTjK7ujMCid2RC1SI6gzu6D9qhdn0WHPRBIIdlAcRFYtI=
X-Gm-Message-State: AOJu0YxBJGoJPBPDSUvMfrItDTXzw4dUAaY6xxE9o7uBZTT8zI9eF3wB
	Ea850bI3bLdVP4xYntEqQiWHj7iVd18LPiwNmtIrZfVVRELZ5k5GfczYZEgeFZ1RINpiCXiOIqJ
	SK93TGJdWTnoWsYERpb2w/BlahHJ2ulke73ZM
X-Google-Smtp-Source: 
 AGHT+IFcNZShCTtDfi+LazQWuubbc5gSlO2iYxrVEsHy0Og1QyGBUdti5n0DlDMSQxerWeR/T5uRFkw1IcTDXzb8Sd8=
X-Received: by 2002:a17:90b:e91:b0:29b:b248:18a6 with SMTP id
 fv17-20020a17090b0e9100b0029bb24818a6mr13951940pjb.31.1710863529134; Tue, 19
 Mar 2024 08:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240318183004.3976923-1-cujomalainey@chromium.org>
 <88bee4a5-f374-4b96-93c7-0402a95725b3@sirena.org.uk>
In-Reply-To: <88bee4a5-f374-4b96-93c7-0402a95725b3@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 19 Mar 2024 08:51:58 -0700
Message-ID: 
 <CAOReqxg+F2C+1yuLJ=Jk_thi0r8FciPu2h7pDXkuF-RGZPEMaA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Remove libraries from topology lookups
To: Mark Brown <broonie@kernel.org>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org,
	Wojciech Macek <wmacek@google.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rander Wang <rander.wang@intel.com>, Trevor Wu <trevor.wu@mediatek.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VS7I2PC35CITPJLC5H5VJUHBFCTT362S
X-Message-ID-Hash: VS7I2PC35CITPJLC5H5VJUHBFCTT362S
X-MailFrom: cujomalainey@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VS7I2PC35CITPJLC5H5VJUHBFCTT362S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 19, 2024 at 4:39=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Mar 18, 2024 at 11:29:54AM -0700, cujomalainey@chromium.org wrote=
:
>
> > If a OS wants to use 3P (that they have licensed) then they should use
> > the appropriate topology override mechanisms.
>
> A user who's bisected a problem to this commit might welcome some
> pointer to what the appropriate topology override mechanism is.

Ack, will add in V2
