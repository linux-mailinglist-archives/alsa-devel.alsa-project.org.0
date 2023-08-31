Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5364791764
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:45:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E348210;
	Mon,  4 Sep 2023 14:44:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E348210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831500;
	bh=MGb8UE4K7J1/tZAx27Ih4ZHLsp9ZwY6jXWa1wmWSSW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uwq8GK6Slm9/M4hu6hK9x4mTSe3OoSc3xamA3lIH02qfuVEBfWv28WPJiA/UgClNR
	 giOhXXMG2QscB/tzIQar7XIU6X+pMW/QBPY5qpKDbFA0FNr5AUu1ykIxFtgVmoKfBP
	 s0NIz0rCrF4V192kpoaqTaRJ3wnOaaOPZmLVSd+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B87F80551; Mon,  4 Sep 2023 14:44:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C58A0F80431;
	Mon,  4 Sep 2023 14:44:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B2A8F80155; Thu, 31 Aug 2023 22:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A95AF80094
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 22:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A95AF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com
 header.i=@ndufresne-ca.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=yH7Riw5C
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-64a0176b1easo6639186d6.3
        for <alsa-devel@alsa-project.org>;
 Thu, 31 Aug 2023 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1693514508;
 x=1694119308; darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MGb8UE4K7J1/tZAx27Ih4ZHLsp9ZwY6jXWa1wmWSSW0=;
        b=yH7Riw5Cw0P6OdBa8Gndpx/UwiJOjBMyBzB001QbeS7oaWiE44s+3+ZUUNAyzV5243
         /wZ2xQWxke2rsKqAXriERtpYmEeMX2rS12KCF6BzDioJXZUIQF9c9JhSsF1vC8xuG9hM
         PLfhYmVBFLA9WG4KPn+rmZdLIZKhbGdllzRjHcDyRbI7qUAdxPotWWEyES7R2OBELqjS
         pz737jZwiY9CSgP7fQv+Q1QEN7Mjo/FM8nIM1HITJLaqTN0F6KoYR+tqQTMxOC9JdGOZ
         VA7fhaQ8/iyj72RBJClD1YWc783hH2rigy+BVdbhg02imkbZvhODpEJUx085MF/4fgbF
         gFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693514508; x=1694119308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGb8UE4K7J1/tZAx27Ih4ZHLsp9ZwY6jXWa1wmWSSW0=;
        b=TMr0/guWM7JhHlohYYw93m9ZWW6lsOR/nhhHNJgoo1gLUshABxmSDW8TqrK+nG8d3F
         8yranK+7NRfsXrgrEg2KrPxgUSmtQbhqOsIQqEo1kfiUqedmVvSVkN4VrUMI7v6XSjmZ
         wFC1FkU1JxII/wOzB9NVb8iyXF8OeVnaYrORneFKxL+X8m9J7W+otPZ6quhQrLOEJSWo
         zoJw1PjC7AIvLWYfFoY9VbojrPYI3NQSPzH0QDWfOdOEBTT8CHOtQHZC4GhBgQ2avFzW
         RPXHrtC584qy3cjc96j1Q7FsYt7wpA/CjSa4fUrC61HZewS4Q1CJQOOY0MHcW4NI0n2X
         EbLA==
X-Gm-Message-State: AOJu0YzDCXRJcaX0cOnWPSrL+tSM5B0K9PCIZkA43g4NsulDqyo2+Ja6
	vujG9IxC9hedogdbZ/Dz4MsD6w==
X-Google-Smtp-Source: 
 AGHT+IFU9aOd57XMHkjUfgCesvQh4jI8dOaEF345CS48c+uA4Ci+ij/CalBUYdApLt8nWIG9HHvAmA==
X-Received: by 2002:a0c:8c8e:0:b0:641:8df1:79e3 with SMTP id
 p14-20020a0c8c8e000000b006418df179e3mr358262qvb.29.1693514508451;
        Thu, 31 Aug 2023 13:41:48 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a0c8dcb000000b0064f45b8c02bsm899553qvb.49.2023.08.31.13.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 13:41:47 -0700 (PDT)
Message-ID: <fea0cb4a94ab9ba757f32ad5539d075089dc63e7.camel@ndufresne.ca>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com,  mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org,  linuxppc-dev@lists.ozlabs.org
Date: Thu, 31 Aug 2023 16:41:46 -0400
In-Reply-To: <87wmxk8jaq.wl-tiwai@suse.de>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
	 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
	 <87il9xu1ro.wl-tiwai@suse.de>
	 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
	 <87il9xoddo.wl-tiwai@suse.de>
	 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
	 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
	 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
	 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
	 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
	 <87wmxk8jaq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-MailFrom: nicolas@ndufresne.ca
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R7ZI4IEH7DD6VZLQVSCM5MLUYM4PU2X2
X-Message-ID-Hash: R7ZI4IEH7DD6VZLQVSCM5MLUYM4PU2X2
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7ZI4IEH7DD6VZLQVSCM5MLUYM4PU2X2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Le jeudi 24 ao=C3=BBt 2023 =C3=A0 19:03 +0200, Takashi Iwai a =C3=A9crit=C2=
=A0:
> > 3. How to handle the xrun issue. pause or resume. which are brought by =
ALSA.
>=20
> Doesn't V4L2 handle the overrun/underrun at all?=C2=A0 Also, no resume
> support?

just a 2 cents comment. All our video m2m are job based. When there is no j=
ob
available they stop and resume when there is more work in queues. As there =
is no
time constraints coming from the hardware, there is also no API to know tha=
t
there has been a period of time without anything being executed (under
utilization). Only overrun can be detected by application, each chunk of wo=
rk is
in its own v4l2_buffer and the application will run out of buffer in that c=
ase,
and will have to wait for free space in the queue. Understand though that t=
he
larger the queue, the large the latency. There is currently no way to submi=
t job
ahead of the data (unlike DRM subsystem).

I have slight impression that all this seems rather inefficient for high ra=
te /
small buffer. I'd suggest creating a dummy benchmark driver to verify that =
the
overhead isn't just too much for an audio use case.

Nicolas
