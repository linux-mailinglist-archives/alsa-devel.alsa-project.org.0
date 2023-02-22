Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259769F013
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5DBEB2;
	Wed, 22 Feb 2023 09:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5DBEB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054108;
	bh=tkBz8xtUcsBFti4NW0wUs7te3xGjoS+Aw/KAsmCJ7/U=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I40n7QUAsvWda/3q3DGR/ks1GKiabkTzNiRdlhVcekujLEgEpDwCbKvj4VZ6+BPnh
	 eSietyKt7x0RqBLsS460bWwnRcfXoFKmIZbd3GsYB8W2DmRxq/n7Lw1K5YCmscam0m
	 Zk0pUEzgTwtryivQWs+gJ8F+mG1gIswHqFeLk+Uo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F5FF8052D;
	Wed, 22 Feb 2023 09:20:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7DA1F80266; Wed, 22 Feb 2023 09:02:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71112F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71112F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MtyB+AwD
Received: by mail-ed1-x52a.google.com with SMTP id ck15so28112988edb.0
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 00:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkBz8xtUcsBFti4NW0wUs7te3xGjoS+Aw/KAsmCJ7/U=;
        b=MtyB+AwDLBdx3hrWfMn72VuqABmErzodmuE1i59W7Hi0sCCtatLSn2V72gLtfFWuFZ
         Ck5bK8u5m3j5hVQb2vYZuoQnMwjQjDe+wkFGGGd2g5xq9tzFN1PgFQ1LohiPQNAOCtA3
         RGe03Y9ZkxGsnvcHBbKKA2s1MuvllsWVAWOB2XmcFjR+uJ3YKs/hOJhbFj3hvY7xMhPh
         tE6IIcOVl1jpvw3mVRBXc35nVN/N3PHS8ijqgnH8JHO2TrcBY0eKddLAEaOQJxNuR109
         JNFIvJLFfr+qenqBUShCSHs58EE0rWrkVN2ZlfS+WzxwoT+AhKeAY8xWDLtxps/6pQIc
         g/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkBz8xtUcsBFti4NW0wUs7te3xGjoS+Aw/KAsmCJ7/U=;
        b=I5S/P6TsCxF6IPG/uD6+xewIOxgO+KpMqZpu7rCHZ7sfO4XIdvgYauwKv4Z7csUtUd
         BC4XsvW1yTz39Vw903UNePMwa3rKzo9od4SuNoqDF1mD8SSrXpSkmCWIrKGTJA5h7rTG
         cdZ7M7pk86syK3SZ6icjqMTET/YawOfS7Ch8mAYzk53PEeMWR7Ha5HmSGBQ9FYgEuW8O
         GRAfWz2gZBelhEt/gL1Bd4UuE3wXKnpmJNCWrjK0ov5PXcfaFuj3x489mCG2nJ4dQYIW
         OYLD9xTl812c6/cGdgRTdgUceCdg0/0033nF3sL8VpRupJtSahb6eNylYaAtYYL2MdaU
         Kgdg==
X-Gm-Message-State: AO0yUKXxKRYDiMgaAGjbGuhL6/VZzaN5wOllPmm8ZdabdxLOj98K9a5s
	BFiSArnjG6BKPwyD2qQR0Phf9KN5zNk4ZZfQ/IM=
X-Google-Smtp-Source: 
 AK7set+OD7llSTDXwShjal7nbjqlkhW7eI4nbra80LETlZs6z3mfM3l2ArA/FXd6lVClZCtzfeiiDMO4Tr8r58qn+Z4=
X-Received: by 2002:a17:906:5e5a:b0:877:747c:9745 with SMTP id
 b26-20020a1709065e5a00b00877747c9745mr7240950eju.8.1677052940625; Wed, 22 Feb
 2023 00:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-8-clamor95@gmail.com>
 <Y/VFMl5Darm7YEK1@sirena.org.uk>
In-Reply-To: <Y/VFMl5Darm7YEK1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:02:09 +0200
Message-ID: 
 <CAPVz0n072v3XVt-Ogcx1QwBfEfOG4O7e8Ge9f3rpWOqU=44Qkw@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] ARM: tegra: transformers: update bindings of
 sound graph
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M6KNLHXHWQVFA3SLNPBO6FC24S3U5QTW
X-Message-ID-Hash: M6KNLHXHWQVFA3SLNPBO6FC24S3U5QTW
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:20:08 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6KNLHXHWQVFA3SLNPBO6FC24S3U5QTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D1=81=D1=80, 22 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 00:27 Mark Brown <=
broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:08PM +0200, Svyatoslav Ryhel wrote:
> > - fix headset detection in common device tree;
>
> At least this should probably be split out as a separate change
> so it can be backported as a fix.

It should not be backported anywhere.

> > - diverge control and detect elements for mic;
> > - use GPIO mic detection on wm8903 devices;
