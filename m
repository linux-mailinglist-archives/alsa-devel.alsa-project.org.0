Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E866E6DEB0C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 07:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449D6EC5;
	Wed, 12 Apr 2023 07:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449D6EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681277268;
	bh=myKwzUNGAH9dOXLcRNFzlH8BCg+rD0xuvgywGHAGWVI=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jvVDn7jX/8jWw2UQ07eb0y4fZ63yr27LyqCc5sMVqYWPkRE0n2L5N+7QL42ghCk/G
	 5tMcYiswwMCgtVZyn6t6un8Er04Asp+qkDNHjw5Gu/etSI5MwWjg13zmbpcW3N/MyM
	 rhIRE2IsNcAkM7a0kus/uq8UVBMgqa08seibw+4g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79141F80448;
	Wed, 12 Apr 2023 07:26:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 829F7F8032B; Mon, 10 Apr 2023 18:03:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6951FF800E5
	for <alsa-devel@alsa-project.org>; Mon, 10 Apr 2023 18:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6951FF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UgygQsuz
Received: by mail-ej1-x630.google.com with SMTP id f26so7407504ejb.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681142618;
        h=mime-version:subject:message-id:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f5UCgJyKO3TAtUx5u3xZESAcB/oboz5WivKnRa2wQ50=;
        b=UgygQsuzKZM9RWo4DFFLjfEOSVcncePXO+dMCwTnDEs0uWnj3GSa/9vVtD0Ap8s18H
         Ly8fXQHdkIlK65DOEl4CSzjFztd6r0aokHrSFzOhwJkyogAq7tl8F2qiQaTQrvru5wzq
         ITJAZ4iwqte5xwlhVbCz4mqSHOOiG6ETJpPc0YwibdgOi6zGEzzPrQ+PT3zZmjUp9yMd
         gUtvUAwV87m9pSZJiPfuvpWEez7MoGDaVqdA3tPFJ+UYkZc93V124AXF9uRNidxTVAcY
         gfedEjHnZXYRF/+MGS2kCotgkDlwezudaz04LoL3+fPn1IpS0n/tvbuSuE6yn08/oyHm
         MaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681142618;
        h=mime-version:subject:message-id:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5UCgJyKO3TAtUx5u3xZESAcB/oboz5WivKnRa2wQ50=;
        b=OKPKmHeSWgGfc1UZPHdXNJFYYhkxKwkn8ei/e6aCBynRqsLMJLTDSd01Jx+moCwzAj
         R7+mEYF7E/4yEl7j8z623ZaWldLmLZabnf9zQ2EaJjMMG7AMu3O+yMfq8rHKn6+q/osZ
         iXJ06j93DNL9w4g7edpSx34JK0Fjo5DKWdJA+zt4NM/Iusn09Uztr2aSk+3/k6HV94Kr
         ltXIgnhERbAhPUYgGUBud+CVbmaroq6Gg9vPGP8WSgiT6PLWdEf/sjUeWjaQjB41eJgw
         BnRaD1vz24e/MoPQcTlc781FH+wIoNcdZ7aQpvmfpNAAWJf/tYASoZ11VMJzusGAASt6
         Hlpw==
X-Gm-Message-State: AAQBX9fEq6d4pDoUXNtM8JLiLPFVvP6ZAE2VxX/lePhdl/L6Vm+P97mz
	rzlPen3ftgAkicMezi7MJf4=
X-Google-Smtp-Source: 
 AKy350ZvMIkgIPBAI3xfANFpGM/sGOqmaOwDGi9aq1pS42nQ2Yb15qZ09z43QZyT0vE74wINTYPBtw==
X-Received: by 2002:a17:907:3e85:b0:947:d3f0:8328 with SMTP id
 hs5-20020a1709073e8500b00947d3f08328mr9132077ejc.1.1681142618511;
        Mon, 10 Apr 2023 09:03:38 -0700 (PDT)
Received: from cem-g15 ([79.142.69.160])
        by smtp.gmail.com with ESMTPSA id
 wv12-20020a170907080c00b0094a4e970508sm2284126ejb.57.2023.04.10.09.03.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 09:03:38 -0700 (PDT)
Date: Mon, 10 Apr 2023 18:03:36 +0200
From: Cem Kaya <cemkaya.boun@gmail.com>
To: "=?utf-8?Q?perex=40perex.cz?=" <perex@perex.cz>,
 "=?utf-8?Q?tiwai=40suse.com?=" <tiwai@suse.com>
Message-ID: <38108AA1-01F5-4C48-A03E-73E9CAC3E8CF@getmailspring.com>
Subject: [PATCH v3] Add Dell G15 5525 Ryzen Edition to quirks list for
 acp6x so that internal DMIC works.
X-Mailer: Mailspring
MIME-Version: 1.0
X-MailFrom: cemkaya.boun@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LPWTK7AEREZDKOTH6QYIBFXIGLKAPTQT
X-Message-ID-Hash: LPWTK7AEREZDKOTH6QYIBFXIGLKAPTQT
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:22:34 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: "=?utf-8?Q?mario.limonciello=40amd.com?=" <mario.limonciello@amd.com>,
 "=?utf-8?Q?alsa-devel=40alsa-project.org?=" <alsa-devel@alsa-project.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPWTK7AEREZDKOTH6QYIBFXIGLKAPTQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RnJvbSA5NzJhZDcxMmNmZGE5NDUzYTcyMGI3M2M2NDU2MDFkYjIzZDcwOGM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQ2VtIEtheWEgPGNlbWtheWEuYm91bkBnbWFpbC5jb20+DQpE
YXRlOiBTYXQsIDggQXByIDIwMjMgMTY6MjA6NDIgKzAyMDANClN1YmplY3Q6IFtQQVRDSCB2M10g
QWRkIERlbGwgRzE1IDU1MjUgUnl6ZW4gRWRpdGlvbiB0byBxdWlya3MgbGlzdCBmb3IgYWNwNngg
c28NCnRoYXQgaW50ZXJuYWwgRE1JQyB3b3Jrcy4NClNpZ25lZC1vZmYtYnk6IENlbSBLYXlhIDxj
ZW1rYXlhLmJvdW5AZ21haWwuY29tPg0KQ29tbWl0OiBBZGQgRGVsbCBHMTUgNTUyNSBSeXplbiBF
ZGl0aW9uIHRvIHF1aXJrcyBsaXN0IGZvciBhY3A2eCBzbyB0aGF0IGludGVybmFsIG1pYyB3b3Jr
cy4NCkxpbms6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3
MTU1DQotLS0NCnNvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jIHwgNyArKysrKysrDQoxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYW1k
L3ljL2FjcDZ4LW1hY2guYyBiL3NvdW5kL3NvYy9hbWQveWMvYWNwNngtbWFjaC5jDQppbmRleCBh
NDI4ZTE3ZjAzMjUuLmUwNDRkODExNDk2ZSAxMDA2NDQNCi0tLSBhL3NvdW5kL3NvYy9hbWQveWMv
YWNwNngtbWFjaC5jDQorKysgYi9zb3VuZC9zb2MvYW1kL3ljL2FjcDZ4LW1hY2guYw0KQEAgLTQ1
LDYgKzQ1LDEzIEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19jYXJkIGFjcDZ4X2NhcmQgPSB7DQp9
Ow0KDQpzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgeWNfYWNwX3F1aXJrX3RhYmxl
W10gPSB7DQorIHsNCisgLmRyaXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQsDQorIC5tYXRjaGVzID0g
ew0KKyBETUlfTUFUQ0goRE1JX0JPQVJEX1ZFTkRPUiwgIkRlbGwgSW5jLiIpLA0KKyBETUlfTUFU
Q0goRE1JX1BST0RVQ1RfTkFNRSwgIkRlbGwgRzE1IDU1MjUiKSwNCisgfQ0KKyB9LA0Kew0KLmRy
aXZlcl9kYXRhID0gJmFjcDZ4X2NhcmQsDQoubWF0Y2hlcyA9IHsNCi0tDQoyLjQwLjANCg==
