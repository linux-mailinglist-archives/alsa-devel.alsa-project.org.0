Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E2822F80
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 15:29:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B15F6E8F;
	Wed,  3 Jan 2024 15:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B15F6E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704292172;
	bh=6vucpILbx7EhqyezXdIekd5XLSkGJYaClKXK4KuJ4AE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GNsDjKvACO/99RIVRWIaMmbifjZjE276YpcLRBAtN3n9fA5hj6vcVn9qtpnIhziDw
	 aMKbyOTQPBXIcCgxR1MW80pV9C8PSAby+Ejjy58fymQOAv+6nWvQSj+SEfseKYqDqQ
	 R0Xr4IDYh23Q/xCn1tKRJ5h7sSBSPJ/S1B9e1u6w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F2D5F8057F; Wed,  3 Jan 2024 15:29:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47DE6F80557;
	Wed,  3 Jan 2024 15:29:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C69B3F80537; Wed,  3 Jan 2024 15:28:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D6BF800B6
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 15:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D6BF800B6
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5ed10316e22so59938717b3.3
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 06:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704292122; x=1704896922;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHYu2pDkryDIEDPBFWKuNtRfRzAJe9hccO0FNI501FA=;
        b=FIfe8ck0o7iVuR2DFf/SO7tb9zVFPHEzD/WIM306tR9rN0ix76wPXmpcDQHq9bvW2G
         aGfAQB9T6YuCMH3HPM+S87deJFqndrv48rC7Q8WyFp8nYgqviJ9dT4XBqIaYD80NHV0a
         f44kqfwuHBqwSOECN6FAJLdB6kwuX/ib44CTQQDjrvVpGHP957Irtk9WU856PvTojWJc
         +BrfGSQ1jy2ewQ27h8bIUAZ1MMZStHmUXrM+r7a4HZcG7xkRDwf6/mdtiB9XUbPvvk8x
         hPKAJ5bvi+KXqfg0oaGonX1zmk9a9e106eUAHG2JWcdl2cV9th4iTwvN2L1IbFyETMPr
         d6iA==
X-Gm-Message-State: AOJu0YzrnkqxPY3A0pRf9Q/48Jdtq14/3sCftS9r/r2xe5X0ldBq64n/
	G/wEUu3gzgT9KsyYFg5NeNtna7A4ILNPorE3
X-Google-Smtp-Source: 
 AGHT+IEsbFt1yAnM1/pkT2p0N/Twlpv71nXBxGlBat5fh9JiXw3KFuyLVWWlDnivUWqHos1S3ABDvg==
X-Received: by 2002:a81:ac20:0:b0:5ee:66b0:5960 with SMTP id
 k32-20020a81ac20000000b005ee66b05960mr6885683ywh.10.1704292121893;
        Wed, 03 Jan 2024 06:28:41 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id
 p185-20020a0dffc2000000b005ccb2d17ba7sm12838071ywf.101.2024.01.03.06.28.41
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 06:28:41 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dbd7248ac28so6513271276.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 06:28:41 -0800 (PST)
X-Received: by 2002:a25:b316:0:b0:dbc:b4a2:befb with SMTP id
 l22-20020a25b316000000b00dbcb4a2befbmr7946046ybj.1.1704292121013; Wed, 03 Jan
 2024 06:28:41 -0800 (PST)
MIME-Version: 1.0
References: <NnE33wh--3-9@tutanota.com>
In-Reply-To: <NnE33wh--3-9@tutanota.com>
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 3 Jan 2024 11:28:31 -0300
X-Gmail-Original-Message-ID: 
 <CAJX_Q+0NL1_dkLD2oePhW+EjvGiPLQ7S-1jarz4dANm12iHNMg@mail.gmail.com>
Message-ID: 
 <CAJX_Q+0NL1_dkLD2oePhW+EjvGiPLQ7S-1jarz4dANm12iHNMg@mail.gmail.com>
Subject: Re: Fwd: No sound drivers on HP Envy x360 ey0xxx
To: voreck-lukas@tutanota.com
Cc: Bagasdotme <bagasdotme@gmail.com>,
 Alsa Devel <alsa-devel@alsa-project.org>,
	Andy Chi <andy.chi@canonical.com>, David Rhodes <david.rhodes@cirrus.com>,
	Faenkhauser <faenkhauser@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
	Kailang <kailang@realtek.com>, L Guzenko <l.guzenko@web.de>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>,
	Luke <luke@ljones.dev>, Overloader <overloader@tutanota.com>,
	Patches <patches@opensource.cirrus.com>, Perex <perex@perex.cz>,
	Rf <rf@opensource.cirrus.com>, Ruinairas1992 <ruinairas1992@gmail.com>,
	Sbinding <sbinding@opensource.cirrus.com>,
 Shenghao Ding <shenghao-ding@ti.com>,
	Tiwai <tiwai@suse.com>, Tsengalb99 <tsengalb99@gmail.com>,
	Vitalyr <vitalyr@opensource.cirrus.com>, Yangyuchi66 <yangyuchi66@gmail.com>
Message-ID-Hash: N572RLMPAMA5OZNTKM563UCZWJRNM4DD
X-Message-ID-Hash: N572RLMPAMA5OZNTKM563UCZWJRNM4DD
X-MailFrom: tanurelinux@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: tanure@linux.com
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N572RLMPAMA5OZNTKM563UCZWJRNM4DD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAzIEphbiAyMDI0LCAwODoyMyAsIDx2b3JlY2stbHVrYXNAdHV0YW5vdGEuY29tPiB3
cm90ZToNCg0KPiBJIGhvcGUgSSdtIHJlc3BvbmRpbmcgY29ycmVjdGx5DQo+DQo+IE9uIGJ1Z3pp
bGxhIEkgd2FzIGFza2VkIHRvIGF0dGFjaCBkbWVzZyBhbmQgbHNwY2kgb3V0cHV0LiBJJ20gc2Vu
ZGluZyBib3RoDQo+IGFzIGF0dGFjaG1lbnRzIChjYXVzZSBvZiB0aGVpciBsZW5ndGgpIGFuZCBo
b3BlIGl0IHdvcmtzLCBpdCdzIG15IGZpcnN0DQo+IHRpbWUgd29ya2luZyB3aXRoIHRoZXNlIG1h
aWxpbmcgbGlzdHMuDQo+DQoNCkhpLA0KDQpUaGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcgdG8gc3Rh
cnQgaXMgdGhlIERTRFQgZHVtcCBmcm9tIHlvdXIgQmlvcy4NClRoYXQgc2hvdWxkIGRlc2NyaWJl
IHRoZSBrZXkgcG9pbnRzIGFib3V0IHRoZSBoYXJkd2FyZSBjb25maWd1cmF0aW9uLg0KDQpUaGFu
a3MNCkx1Y2FzIFRhbnVyZQ0KDQo+DQo=
