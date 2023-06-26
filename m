Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69973DE26
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 471301526;
	Mon, 26 Jun 2023 13:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 471301526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780238;
	bh=qRpUiP98LghlNDo6VxgADTtYswIC6RqOE/R76j9tcN8=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cSU3Uo3VNl4Qylt9EDWT34/x6UVk/2Lw8XMDKzsRrtyIcxXVelNVYw2QxrLAP5VR/
	 DO7uqzk5qbXZip5zWweik7HOfOLvcVzDFnzujrA6doniSlKuAXQkPjX4pcNyMOyyZU
	 fTYTAQUOHs6D2YBrx2tiWFjbgoZlUvq5z3VeW9hY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 794A4F806A6; Mon, 26 Jun 2023 13:43:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AABC8F8069A;
	Mon, 26 Jun 2023 13:43:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04063F80246; Mon, 26 Jun 2023 05:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95AC9F800E3
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 05:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95AC9F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HNrPTg2X
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fa23c3e618so41910235e9.0
        for <alsa-devel@alsa-project.org>;
 Sun, 25 Jun 2023 20:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687750955; x=1690342955;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xG0wCYtxDtRk3tXcv0fV5Q+LGQsR2DWLy9yGUnnz9E4=;
        b=HNrPTg2Xy7K9f39kjYY7jarLNzM0P/DSF7PL1kW+OlQBu6qLzR3WAbG8k7jX3/f6//
         fpSpNjNPSKrjiKLHuumeAAbPtpr7MB1NNPpd32HC8g9y3xTwjjg1A5rXlIgNdodmp4vK
         +o/U1GgOW88VNAmVeEAfgT8nkgjgZ0P2GBOIYy0zxQMpv9D2giFmlz2Y04J4fzswVwLW
         A1BnbkjkuQnjtTnOQBNjbScoDfjppsjmtrad04qGeUTTUTUWIYbpJ+B5TmyK+r3NeCTr
         9RNyBnkhtOwy9+jJMVF2tRBQEG025rC4SeF3mjJXhm+2QlQvfvN3moCo2vpSigBlftXH
         6sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687750955; x=1690342955;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xG0wCYtxDtRk3tXcv0fV5Q+LGQsR2DWLy9yGUnnz9E4=;
        b=Ca6xDjIsp0Kv3fc/WnzZ5wnf3p99tkophSX6fAy3A1OOAAazl+lwt463KPrYntI75c
         L5MeWmcpW7xBkTTzFCcQkEkMYgqEqZIA25jb0PfHD2wHP93yGo6+U4+iSAmIq7C/u2Nn
         tf04nGm/s9yAJdDb3HvOCHAXOMCsYyxXtigLSPGWalNcwukklEbhnWbPYKcsNwcjvSL3
         f+um4Z8F5uqI6J5eTos/4gARc5fGAqF3AgiXZZetIL6M20Rc1Uzx0zHf4S/6BTk/k7w3
         P7WzMOz4ZJXNeBXL8uYAqNIKXcPv8r8ZLTj9LPEOGfY9xuKiWod4Q5ZtVEMGp6wLoUQf
         fgOA==
X-Gm-Message-State: AC+VfDxSMQ3s4hxP267FO6c/i1l3NqrZ3GjN5LTZTxt0vjdhaQFo8bQy
	BuLhwLar/8cDCxSuvm/t7jgpSHKgffD9p4Ly/ZE=
X-Google-Smtp-Source: 
 ACHHUZ69vZ4ri4mWSXycQ7US0OVDEoMigYG9XolFWAcgAaEgXP4zMSoLRWrCl61QuvxPAL9cYHgU62nvYI0gAyxnDIg=
X-Received: by 2002:a7b:cd16:0:b0:3fa:98f8:225f with SMTP id
 f22-20020a7bcd16000000b003fa98f8225fmr504983wmj.26.1687750954644; Sun, 25 Jun
 2023 20:42:34 -0700 (PDT)
MIME-Version: 1.0
From: Tuo Li <islituo@gmail.com>
Date: Mon, 26 Jun 2023 11:42:29 +0800
Message-ID: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
Subject: [BUG] ALSA: core: pcm_memory: a possible data race in
 do_alloc_pages()
To: perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, Linux Kernel <linux-kernel@vger.kernel.org>,
	baijiaju1990@outlook.com
X-MailFrom: islituo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: URKIVT7WKENDDAELB5I723HBZ4IAM7DB
X-Message-ID-Hash: URKIVT7WKENDDAELB5I723HBZ4IAM7DB
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:42:25 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URKIVT7WKENDDAELB5I723HBZ4IAM7DB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sDQoNCk91ciBzdGF0aWMgYW5hbHlzaXMgdG9vbCBmaW5kcyBhIHBvc3NpYmxlIGRhdGEg
cmFjZSBpbiBBTFNBIGluIExpbnV4IDYuNC4wLg0KDQpJbiBzb21lIGZ1bmN0aW9ucywgdGhlIGZp
ZWxkIHNuZF9jYXJkLnRvdGFsX3BjbV9hbGxvY19ieXRlcyBpcyBhY2Nlc3NlZA0Kd2l0aCBob2xk
aW5nIHRoZSBsb2NrIHNuZF9jYXJkLm1lbW9yeV9tdXRleC4gSGVyZSBpcyBhbiBleGFtcGxlOg0K
DQogIGRvX2ZyZWVfcGFnZXMoKSAtLT4gTGluZSA1Nw0KICAgIG11dGV4X2xvY2soJmNhcmQtPm1l
bW9yeV9tdXRleCk7IC0tPiBMaW5lIDYxIChMb2NrIGNhcmQtPm1lbW9yeV9tdXRleCkNCiAgICBj
YXJkLT50b3RhbF9wY21fYWxsb2NfYnl0ZXMgLT0gZG1hYi0+Ynl0ZXM7ICAtLT4gTGluZSA2Mw0K
KEFjY2VzcyAgY2FyZC0+dG90YWxfcGNtX2FsbG9jX2J5dGVzKQ0KDQpIb3dldmVyLCBpbiB0aGUg
ZnVuY3Rpb24gZG9fYWxsb2NfcGFnZXMoKToNCg0KICBpZiAobWF4X2FsbG9jX3Blcl9jYXJkICYm
DQogICAgY2FyZC0+dG90YWxfcGNtX2FsbG9jX2J5dGVzICsgc2l6ZSA+IG1heF9hbGxvY19wZXJf
Y2FyZCkgLS0+IExpbmUgNDENCg0KdGhlIHZhcmlhYmxlIGNhcmQtPnRvdGFsX3BjbV9hbGxvY19i
eXRlcyBpcyBhY2Nlc3NlZCB3aXRob3V0IGhvbGRpbmcNCnRoZSBsb2NrIGNhcmQtPm1lbW9yeV9t
dXRleCwgYW5kIHRodXMgYSBkYXRhIHJhY2UgY2FuIG9jY3VyLg0KDQpJbiBteSBvcGluaW9uLCB0
aGlzIGRhdGEgcmFjZSBtYXkgYmUgaGFybWZ1bCwgYmVjYXVzZSB0aGUgdmFsdWUgb2YNCmNhcmQt
PnRvdGFsX3BjbV9hbGxvY19ieXRlcyBtYXkgYmUgY2hhbmdlZCBieSBhbm90aGVyIHRocmVhZCBh
ZnRlcg0KdGhlIGlmIGNoZWNrLiBUaGVyZWZvcmUsIGl0cyB2YWx1ZSBtYXkgYmUgdG9vIGxhcmdl
IGFmdGVyIExpbmUgNTEgYW5kIGNhbg0KY2F1c2UgbWVtb3J5IGJ1Z3Mgc3VjaCBhcyBidWZmZXIg
b3ZlcmZsb3c6DQoNCiAgY2FyZC0+dG90YWxfcGNtX2FsbG9jX2J5dGVzICs9IGRtYWItPmJ5dGVz
OyAgLS0+IExpbmUgNTENCg0KSSBhbSBub3QgcXVpdGUgc3VyZSB3aGV0aGVyIHRoaXMgcG9zc2li
bGUgZGF0YSByYWNlIGlzIHJlYWwgYW5kIGhvdyB0bw0KZml4IGl0IGlmIGl0IGlzIHJlYWwuDQoN
CkFueSBmZWVkYmFjayB3b3VsZCBiZSBhcHByZWNpYXRlZCwgdGhhbmtzIQ0KDQpSZXBvcnRlZC1i
eTogQmFzc0NoZWNrIDxiYXNzQGJ1YWEuZWR1LmNuPg0KDQpCZXN0IHdpc2hlcywNClR1byBMaQ0K
