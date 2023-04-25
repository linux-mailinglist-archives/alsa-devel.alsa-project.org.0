Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC636F2ED4
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:44:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD9C1788;
	Mon,  1 May 2023 08:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD9C1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923462;
	bh=wA5rHTcoQ4YGUaWDmauFK159nzFh7W5iPbtL6lOdols=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uG+/9icc+EDG8c9tQhiceivnMQrx2osM/l/H7UBp6QviNJMA6N2BHAiM554YvrI7a
	 ZmWCpPEpQ2/PlVPZrB7GrpQeSbm5Sw6R+fwKYI7OWCI6vf+bZzinVj9X8WsdJy6GvP
	 syCdzdRIHrVOZLBOP8rAcATiN7Y5+3HMdpF7qhDI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABED4F8058C;
	Mon,  1 May 2023 08:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1336FF80236; Tue, 25 Apr 2023 22:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BF77F800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 22:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF77F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=lF5Sautd
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8794044283
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682456263;
	bh=vgRVIXe+P2Wjfmla/rXAZJKk1sI+D1ImKYegwRHDTks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lF5Sautdzi4aTmZZEhABZ735HAgqL37lbgXolZA8GPq0kjci769oTPQjT5IOK8kqJ
	 rwBqA9hN8WpsRyD/X20FwvrLjG6kZdWG/fRKMy1/uQwfP9qK+pz/xq4Fx0zPJKt4hG
	 0KA/5Yj1hsFdYEFmRrfBEFe5MeWzYQSjnx3CyyvK/EQ2c5FGauQEFVHTRM2mhjfd53
	 M6BNujQ8VUOKBkLudPk2sOJZJT1yw2Q79NgYDbsxAgLuS/G91BVSDGcMF3JtBMD0kg
	 dUVll7Oe0hOfQj2sHmOfax0xBwSEFPXUn6/wVcusQh3SDqkiVG98hkcGPv4eEgDClv
	 B4DpxU3PocUrQ==
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ef3ca5b5afso81719781cf.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 13:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682456260; x=1685048260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgRVIXe+P2Wjfmla/rXAZJKk1sI+D1ImKYegwRHDTks=;
        b=IQSjXdwJ6JF6kLkHkgXnt9ZVCc0ZsRFTZfP4TGvfsujO5X5ls1Sm/YOKVSs/UgaVr1
         TvUVNyScdpGbiMSTLHf1Q0ybs1DVy1KDS4fECsrQtZcx1gZ1LfLiJBWbQKxqaXhJ/Eno
         n2cIJkKy1kaAQke0n9TuB8lzL6bMOSpC60Ic3E+odKckszhdaJ3rm5IgpEB0tobTCCP1
         MOcLYgSjvweKdsY0NUdyfVRvGQy5ob1O2lGSW0MR5BYtjjvMMpzvIOgYA2nRsVG0KjwV
         wMMtVLaTxW8iVpGQU5fDxTD9rlQhTV8FOmVI5DfG3DXJc3Ejdwblch6sd9qoksid4GP1
         tsJw==
X-Gm-Message-State: AAQBX9eSml9blW0sQdVJ1jqF6IaMmw+dYyRr6lhpA5OZTGpVQOYpC+N/
	0BSOgjr41LK2PgXv4pTVJejy4Mh2a8TJCa9YgP8KVOBk1d7K2XmXf4cWU836sGc5m7p8YrINoId
	ik/ALQ9sxsvw2OOBVTkpesEWVUSfgqFzJmlBZAqO+D3SuM1rioCsAs2Dt
X-Received: by 2002:ac8:5d8d:0:b0:3ef:46b0:80e8 with SMTP id
 d13-20020ac85d8d000000b003ef46b080e8mr30845712qtx.19.1682456260492;
        Tue, 25 Apr 2023 13:57:40 -0700 (PDT)
X-Google-Smtp-Source: 
 AKy350YgJcj8NBwRby79492evbEUfuqxK9Zf4fKQdwy3HHL1ByJh+2fexc3h8J5/zzoJIvi71pUHyKLn9qmewz+xjS8=
X-Received: by 2002:ac8:5d8d:0:b0:3ef:46b0:80e8 with SMTP id
 d13-20020ac85d8d000000b003ef46b080e8mr30845680qtx.19.1682456260117; Tue, 25
 Apr 2023 13:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-5-walker.chen@starfivetech.com>
 <20230421-dropper-upstage-200ae7e47092@spud>
 <607f3604-056c-6f3a-b154-0f298b870811@starfivetech.com>
 <20230424-roundness-everybody-659599d44963@spud>
In-Reply-To: <20230424-roundness-everybody-659599d44963@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 25 Apr 2023 22:57:23 +0200
Message-ID: 
 <CAJM55Z9a9N8Zm2cuh8gzZNcYBENO5WE6GmRXOsaYbOcv0srz-Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: emil.renner.berthing@canonical.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7LAZ6AZ5QK57SRY433QVDCXHHROSDFBN
X-Message-ID-Hash: 7LAZ6AZ5QK57SRY433QVDCXHHROSDFBN
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:59 +0000
CC: Walker Chen <walker.chen@starfivetech.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LAZ6AZ5QK57SRY433QVDCXHHROSDFBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Apr 2023 at 18:27, Conor Dooley <conor@kernel.org> wrote:
> On Mon, Apr 24, 2023 at 11:21:11AM +0800, Walker Chen wrote:
> >
> >
> > On 2023/4/22 0:50, Conor Dooley wrote:
> > > Hey Walker,
> > >
> > > On Thu, Apr 20, 2023 at 10:41:18AM +0800, Walker Chen wrote:
> > >> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> > >
> > > Is this one of these waveshare things + a visionfive 2?
> > > https://www.waveshare.com/wm8960-audio-hat.htm
> >
> > Hey Conor,
> > I'm glad to receive your comments.
> >
> > Now we are using this board + VisionFive2 :
> > https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/
> >
> > >
> > > I'm a bit lost as to why this needs a whole new board, should it not
> > > just be an overlay that you can apply to the existing dts?
> > >
> > > Taking this to an extreme, should I expect to see a new devicetree for
> > > everything RPi hat that you decide to use with a VisionFive 2?
> >
> > For your response, I did some thinking. Because wm8960 codec is not integrated
> >  on the VisionFive2 board, perhaps using overlay is a better way.
>
> Aye. I think so too. From my PoV, if this particular seeed audio board
> is something you're bundling with VisionFive 2 boards on your storefront
> etc, then I'm fine with taking it as an in-tree overlay.
> If it is just a "random" RPi hat (that happens to be exactly what you
> need for testing the audio drivers), then I don't know where to draw a
> line for what is & what is not acceptable for inclusion.
>
> In both cases, it's Emil's call.

I'm not aware of any shop bundling the VF2 with an audio board. I
agree: please don't add device trees for combinations of VF2s and
hats. That should be an overlay.

/Emil

> > > Also, it'd be nice to provide a Link: to where someone can find more
> > > info on this combination of items. Google for "wm8960 visionfive 2"
> > > gives me nothing, nor does "starfive audio card" etc.
>
