Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DB6DEB0E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 07:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FFC4ED6;
	Wed, 12 Apr 2023 07:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FFC4ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681277270;
	bh=2Q1QfDLidWOx0vwCBo7twhIaSputg6KvvaS75C4cpKU=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FX4vP6PA3XMy3tfsurVnhgVvjYMM4Q/Flr8NPZKO2c37BfNUImjSIAoD2g6LI26YT
	 HnIhZSTeepeh8UF79rvV1dzBKVPPBOkq8L6bav+n5+Ui9qtHRwUdIh/9YOAr9n+hmQ
	 eba3MaxTu6SHwVBLFhIRxQaGXsotOSS8BOKDb1z8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C442F804F2;
	Wed, 12 Apr 2023 07:26:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8268F8032B; Mon, 10 Apr 2023 20:21:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E18FF80100
	for <alsa-devel@alsa-project.org>; Mon, 10 Apr 2023 20:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E18FF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H4sWVlzd
Received: by mail-wm1-x32e.google.com with SMTP id gw13so3236261wmb.3
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681150867;
        h=mime-version:subject:message-id:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kQfXfFvXsi72YzoleRJnsOA1fZ7sAfMWpub553NMAfk=;
        b=H4sWVlzd9x9oPf/s2EeTuRbzoQb73u5Q2c2cP5Kt8ADoNLqExDmTU/yGzXoyk44teV
         RWGb2eqTM8yDHnjLJlVn7KLi6rf4/WocjXCvxeSuI9ypRSK+DGLdBkavfMkCg1m5jtUD
         LEgbn5mVkoJWNzU9fm4FnUkxhGJGS2HdFkUA+PAesqlrljrg2CYFerdpB5ljCVDjoteO
         UtB9VB1RHbx/QKFfxf7ACDmGwbWmQKC4M7chTS+IUg0vpYE+7Lk9aprCG4shpeik6rlM
         TOWMSKhaxf0haofu6ekfPJjB75cUdvJz2goNqHW51Pm/R1+gUy2Zzy46pu386mS/XdNS
         77HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681150867;
        h=mime-version:subject:message-id:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQfXfFvXsi72YzoleRJnsOA1fZ7sAfMWpub553NMAfk=;
        b=B9X9bBU1R4qg5Lw6Q9NOCLMKWtUBjg5M78eVSf3YyZYtDapmOvn0KT8RRhyTv11OCq
         gCZUkKA+f2uHmIEUQR+8I0OLcQCevpjuoyE3RqZu+7R8oVK9KI49Wq+jLRefm0jShWMw
         HCw8EbgeO9gNXpp/NhiUBahGvLd5s7JmOR44h4tu0HRWnXKPYiAcgX+AWlsNhk2UgSMh
         heU71QeZnXPyIPqFiAj3dR7+1eTiAOBvPD6E93Xzls7l6qNzP2nDXwGdmsgVI3W3k+w/
         rR+EgmW3zOBEwYawER2IibkHACRvkcnPjTmpz/KXtxfWnwRye3gswIYMC7Ba6aKjXuq2
         LJdw==
X-Gm-Message-State: AAQBX9eWGihUfDxBwCbycTxtWwiPSkakt1KQZROpepVL3jZf0H7DJ4yA
	PbpCNmvA8HzYHuxoWg+65KU=
X-Google-Smtp-Source: 
 AKy350ZMIAFpxLpd9ReNoEeTp1OC6PzsYucoAL0PT5xgSbql/ZW5azf6XuwTuFZiZ+6u/lpQzi54FQ==
X-Received: by 2002:a1c:7303:0:b0:3ed:276d:81a4 with SMTP id
 d3-20020a1c7303000000b003ed276d81a4mr219044wmb.32.1681150867227;
        Mon, 10 Apr 2023 11:21:07 -0700 (PDT)
Received: from cem-g15 ([213.152.187.230])
        by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b003ed29189777sm18613841wmb.47.2023.04.10.11.21.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 11:21:06 -0700 (PDT)
Date: Mon, 10 Apr 2023 20:21:05 +0200
From: Cem Kaya <cemkaya.boun@gmail.com>
To: Cem Kaya <cemkaya.boun@gmail.com>, "=?utf-8?Q?tiwai=40suse.com?="
 <tiwai@suse.com>, "=?utf-8?Q?perex=40perex.cz?=" <perex@perex.cz>
Message-ID: <31D1DA75-51AE-4868-B959-F0BB53DBA658@getmailspring.com>
Subject: Subject: [PATCH v4] ASoC: amd: Add Dell G15 5525 to quirks
X-Mailer: Mailspring
MIME-Version: 1.0
X-MailFrom: cemkaya.boun@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CZ4OCIYLU5C7RUCDTI6FNYV74ZROHUIT
X-Message-ID-Hash: CZ4OCIYLU5C7RUCDTI6FNYV74ZROHUIT
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:22:34 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: "=?utf-8?Q?mario.limonciello=40amd.com?=" <mario.limonciello@amd.com>,
 "=?utf-8?Q?alsa-devel=40alsa-project.org?=" <alsa-devel@alsa-project.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?lgirdwood=40gmail.com?=" <lgirdwood@gmail.com>,
 "=?utf-8?Q?broonie=40kernel.org?=" <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZ4OCIYLU5C7RUCDTI6FNYV74ZROHUIT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RnJvbSAyMGZhMmE0ZmJiNThlYjc3NWMwZDQ4NjVjM2NmY2VjZDZhOTRlZjE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQ2VtIEtheWEgPGNlbWtheWEuYm91bkBnbWFpbC5jb20+DQpE
YXRlOiBNb24sIDEwIEFwciAyMDIzIDE5OjQzOjU2ICswMjAwDQpTdWJqZWN0OiBbUEFUQ0ggdjRd
IEFTb0M6IGFtZDogQWRkIERlbGwgRzE1IDU1MjUgdG8gcXVpcmtzIGxpc3QNCg0KQWRkIERlbGwg
RzE1IDU1MjUgUnl6ZW4gRWRpdGlvbiB0byBxdWlya3MgbGlzdCBmb3IgYWNwNnggc28gdGhhdA0K
aW50ZXJuYWwgbWljIHdvcmtzLg0KDQpMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcv
c2hvd19idWcuY2dpP2lkPTIxNzE1NQ0KQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KU2ln
bmVkLW9mZi1ieTogQ2VtIEtheWEgPGNlbWtheWEuYm91bkBnbWFpbC5jb20+DQotLS0NCnNvdW5k
L3NvYy9hbWQveWMvYWNwNngtbWFjaC5jIHwgNyArKysrKysrDQoxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2gu
YyBiL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jDQppbmRleCBhNDI4ZTE3ZjAzMjUuLmUw
NDRkODExNDk2ZSAxMDA2NDQNCi0tLSBhL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jDQor
KysgYi9zb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYw0KQEAgLTQ1LDYgKzQ1LDEzIEBAIHN0
YXRpYyBzdHJ1Y3Qgc25kX3NvY19jYXJkIGFjcDZ4X2NhcmQgPSB7DQp9Ow0KDQpzdGF0aWMgY29u
c3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgeWNfYWNwX3F1aXJrX3RhYmxlW10gPSB7DQorIHsNCisg
LmRyaXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQsDQorIC5tYXRjaGVzID0gew0KKyBETUlfTUFUQ0go
RE1JX0JPQVJEX1ZFTkRPUiwgIkRlbGwgSW5jLiIpLA0KKyBETUlfTUFUQ0goRE1JX1BST0RVQ1Rf
TkFNRSwgIkRlbGwgRzE1IDU1MjUiKSwNCisgfQ0KKyB9LA0Kew0KLmRyaXZlcl9kYXRhID0gJmFj
cDZ4X2NhcmQsDQoubWF0Y2hlcyA9IHsNCi0tDQoyLjQwLjANCg0K
