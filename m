Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C285341D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2964EB65;
	Tue, 13 Feb 2024 16:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2964EB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836675;
	bh=XAVcfTiR1jLZGwmCybq0eYVFTIP1oDCKw420J9nCZeo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m3XS5sPsxmp39o7qzdpF0uVHXc+vkjy/sa8LNVtKxnZaFmwagdtpHeCegnIOH+gVW
	 ABkA027GTLdjTt2H/pHpofc3Og4YT3S7GrD/5M31rIXIeOtH59wQV48IcxVhhGhZLU
	 pbp2pq0flc5utWcoEFNTQOInZqo9kyrMXSGljsp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2D3CF8061A; Tue, 13 Feb 2024 16:02:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E156F8060F;
	Tue, 13 Feb 2024 16:02:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E27AAF8016E; Tue, 13 Feb 2024 14:16:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9C2AF80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 14:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C2AF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ehla3mqr
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6077a99bbf1so9266307b3.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 05:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707830214; x=1708435014;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lIF3iLEtS0uBOKa17YCJfI0UHG7b9py6qyZzCXALrYo=;
        b=ehla3mqr451Z+l3P5XLyKss1zGMMrBMaWzMrgtJAPaUNDYfnCQEZWd5t7hrsgwizqc
         VzUHGCqXRf0V5VGwu6VljssEivIiYqu3BSf697rf8JiND83APaFH0rp972trUCIklO0T
         Tx3+MEJ3CSmplTmhYyfemYS1ypOla47epQKJOLgy4UffaG0NpFCe2bKDJ8t4TXfGcYLP
         RD01ONs/e2mo3sRhkY5Q2zgAafHSQeqFk+QcxfF3UdPUd7rglb+1ZAA79147bMTp5rM+
         Y00wZ5YO77Nn381oUZ0QsjzSvC1AyOXX+cQPxFHDrKf/FDwPaAMHagQm33i9iLIgM/JK
         q/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707830214; x=1708435014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIF3iLEtS0uBOKa17YCJfI0UHG7b9py6qyZzCXALrYo=;
        b=oO0na8Zl1/m5QfMc/5+/GpIuUE2eThNYWW5nKRXJt6xYc6cBRBZWp987gNQkyLtM2Q
         239ik2EDEJjFDH9wmezNq4JbtAWyQlHqUTEd743zcEA4GTqPIlgd3zkWr6wf8MfALXF7
         zV1xeReJeMouG8H/6kp4ABiOmdfIuD4kq+LHaaUHG09B6SLyQ/WC7LhtzIAhsUOW4oTK
         3TTRx9xhQs8AJiGr6FFT1lk4GZNtOwtUC+zXUc48YTjITvv/XPvxCoUozTPfEymqdwd+
         l/SMkxmR6cJLfWkyB/q924EGWile/dnDYFWnfysM3tC8BKZymYNGQ1xbMPMeQYyFfuO1
         YCIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJNFeb7aSGggSr1LbKJCf60sShDsk5nH1Exu+zuhRyN1ucf+OReUQevg+hx1qOSa630uWugCJD2HoGRwr/VZtJ9lyyUkK/1uXlV40=
X-Gm-Message-State: AOJu0YxE2CelWH5Gr37WrZ5BXqk6AbK9D+Cnm7kQ5vI8xwMs+cwq12Vu
	ukjIVyra+KdpiYlkuOqVn95Jn+HNoVlnJ3gCqCMhjrl8yKaYAZyNRGo328RoziKifYLs6W9vXMZ
	y8OpURr0CEyACzuy4oH1sJ+aRGR8=
X-Google-Smtp-Source: 
 AGHT+IEdznARlYvPbqd50i5FdzNR72cSGhg5c/H2mwvgG6qj7q0lVytoQAjlxD+R7R2ghyIFXnJk7KnCwZuDQX0hiOk=
X-Received: by 2002:a81:4f4c:0:b0:604:3cd0:602d with SMTP id
 d73-20020a814f4c000000b006043cd0602dmr1811157ywb.23.1707830214477; Tue, 13
 Feb 2024 05:16:54 -0800 (PST)
MIME-Version: 1.0
References: <000101da5e63$6a2565e0$3e7031a0$@opensource.cirrus.com>
 <20240213115614.10420-1-ramzes005@gmail.com> <87jzn8y1u7.wl-tiwai@suse.de>
In-Reply-To: <87jzn8y1u7.wl-tiwai@suse.de>
From: ramzes <ramzes005@gmail.com>
Date: Tue, 13 Feb 2024 14:16:43 +0100
Message-ID: 
 <CAPtLpdGH6aptJq_Co5=1NL+Sb55vtax8KrUbyMQj2ThvS2YtHg@mail.gmail.com>
Subject: Re: [PATCH v3] Add Lenovo Legion 7i gen7 sound quirk
To: Takashi Iwai <tiwai@suse.de>
Cc: sbinding@opensource.cirrus.com, alsa-devel@alsa-project.org,
	andy.chi@canonical.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
	kailang@realtek.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, luke@ljones.dev, patches@opensource.cirrus.com,
	perex@perex.cz, rf@opensource.cirrus.com, ruinairas1992@gmail.com,
	shenghao-ding@ti.com, tiwai@suse.com, vitalyr@opensource.cirrus.com
X-MailFrom: ramzes005@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4BPRBQ5R6YIWEA7S6CYN3ZEVNYFWHLR5
X-Message-ID-Hash: 4BPRBQ5R6YIWEA7S6CYN3ZEVNYFWHLR5
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:02:23 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BPRBQ5R6YIWEA7S6CYN3ZEVNYFWHLR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

WWVzLCBJJ3ZlIGNvbXBpbGVkIGtlcm5lbCB3aXRoIGxhdGVzdCBwYXRjaCB2ZXJzaW9uLA0Kd2l0
aCBTdGVwaGFuJ3MgY29uZmlndXJhdGlvbiwgYW5kIHNvdW5kIHdvcmtzIHdlbGwgb24gbXkgbGFw
dG9wLg0KDQpUb21hc3oNCg0Kd3QuLCAxMyBsdXQgMjAyNCBvIDEzOjQwIFRha2FzaGkgSXdhaSA8
dGl3YWlAc3VzZS5kZT4gbmFwaXNhxYIoYSk6DQoNCj4gT24gVHVlLCAxMyBGZWIgMjAyNCAxMjo1
NjoxNCArMDEwMCwNCj4gVG9tYXN6IEt1ZGVsYSB3cm90ZToNCj4gPg0KPiA+IEZyb206ICJUb21h
c3ogS3VkZWxhIiA8cmFtemVzMDA1QGdtYWlsLmNvbT4NCj4gPg0KPiA+IEFkZCBzb3VuZCBzdXBw
b3J0IGZvciB0aGUgTGVnaW9uIDdpIGdlbjcgbGFwdG9wICgxNklBWDcpLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogVG9tYXN6IEt1ZGVsYSA8cmFtemVzMDA1QGdtYWlsLmNvbT4NCj4NCj4gWW91
IHRlc3RlZCB3aXRoIHRoaXMgbmV3IHBhdGNoIGFuZCBjb25maXJtZWQgaXQncyBzdGlsbCB3b3Jr
aW5nLA0KPiByaWdodD8gIEp1c3QgdG8gYmUgc3VyZS4NCj4NCj4NCj4gVGFrYXNoaQ0KPg0K
