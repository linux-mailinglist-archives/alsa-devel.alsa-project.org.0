Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 048886CEEF5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:14:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDEB9E0F;
	Wed, 29 Mar 2023 18:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDEB9E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106448;
	bh=qNVnc/90+f2lvbZbSH9LWWMaxMwruTlZ8I2hMPaGmeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dbf6pPKh/gT/pVw0TpaZw8pvnkbtCo4HhmBlYrKIKhKEytLkjzq76Actf3ApI74o5
	 EjUzhG3sv/Zxd7QZ1anKgaEHqjNSyIV1I/hijS1aQ9jBgo5++NwNZx9mNB1XEn/osx
	 2Q80jGPmBTXcPfPZCYaiClBUfneTFDh8EgAcEKxg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04334F8024E;
	Wed, 29 Mar 2023 18:12:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 147CCF80272; Mon, 27 Mar 2023 10:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F6D1F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 10:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F6D1F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XPdUVjSE
Received: by mail-ed1-x52d.google.com with SMTP id ew6so32542624edb.7
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679906301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNVnc/90+f2lvbZbSH9LWWMaxMwruTlZ8I2hMPaGmeQ=;
        b=XPdUVjSET90ZXTary0IkK8dA5qQPnBeRf1MakgnKXLw+cILHzy9A3Tr3xnaJHbj1WY
         j3txXroOLxDJZd/pdpVR1UDVTEGJfQG2fvez/att0uu4TXVQ5V4qKCi8XhiotmELwoLM
         Olrs3viPRrNusNbrZ0CZ/jxAr7o1h8jBHySHdEgJ28lzSH/Y3Ie0QJtj+gmiO1+kuhJ6
         VpjxbflmdecPa3lzFT5MXybGVsA6yJMLgMPf7dueqeGSTsEvPecTJINs0s4kxyZDNQ0/
         1PfHgSEeVNl2Kj4Il/69x2Q8T/KSObdfmdEgfx5XxNA1qxsFm9DzFUnyn4a1SCpYZgK3
         /1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNVnc/90+f2lvbZbSH9LWWMaxMwruTlZ8I2hMPaGmeQ=;
        b=yBt0pL0SYgAMRB8VAniLgRe9OqBwXwCPm44lheLQ7bxK0799wuxFk47FfoVn1KigKT
         sUcJkoisz79VgsVWvhQ7+rV+NrqITd34tCiKMsjmZURby9tup+e0Ej5w12wGpI4fh4tL
         x3jL3nxdNQgtFvaXyZnw0MaiPpZFpzvEXTqxwwaWUdUhktKJ61Hwb066ub7z2qNcZIIQ
         X5EFDSN2B8jZUuAQhtkhFkFdpbzSzZyli/0+omiOE01a4xYaGumQfsQBoOtnLo630Xo6
         TpDGCVazw6n6OQW2cud/PHkIA3LmIuDLFdrogVvMV4XQKbJbMbyDl3TY99Og600Ah275
         3YgA==
X-Gm-Message-State: AAQBX9eLP210kyeWO6HcdXRdhSM+LiWNheTbZMUiRsfFROZJwMRQ0gCf
	MsUBd1csBS9rlwStuQWCl9VU+di+jisCCOqTHWY=
X-Google-Smtp-Source: 
 AKy350ZBClH8vnHiHREIlIn2x+Jcdi1WCNrrLl9BaQROZUMwfE8Td5j9oXq3ybAAJTkGkBiO78SDrJ+HHZfxPS/2sgQ=
X-Received: by 2002:a50:cdda:0:b0:4fb:dc5e:6501 with SMTP id
 h26-20020a50cdda000000b004fbdc5e6501mr5363908edj.1.1679906301632; Mon, 27 Mar
 2023 01:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230325083643.7575-1-clamor95@gmail.com>
 <20230327083316.GR68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230327083316.GR68926@ediswmail.ad.cirrus.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Mar 2023 11:38:10 +0300
Message-ID: 
 <CAPVz0n3F7pR8_duOd3-mq6iqNEYxDJ8-6AQL4M_8T5rDwbntoA@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] Implement DMIC support in WM8903
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YG64VSG4M7NKD4N2PIA626VYXOYHUKUV
X-Message-ID-Hash: YG64VSG4M7NKD4N2PIA626VYXOYHUKUV
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:12:17 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YG64VSG4M7NKD4N2PIA626VYXOYHUKUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=BF=D0=BD, 27 =D0=B1=D0=B5=D1=80. 2023=E2=80=AF=D1=80. =D0=BE 11:33 Char=
les Keepax <ckeepax@opensource.cirrus.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Mar 25, 2023 at 10:36:42AM +0200, Svyatoslav Ryhel wrote:
> > According to comments in wm8903, driver lacks DMIC support.
>
> Which comments? I am having some difficulty finding these?
>

Lines 10-12

* TODO:
* - TDM mode configuration.
* - Digital microphone support.

> Thanks,
> Charles
