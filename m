Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 133DBC7573C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:46:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8477C60210;
	Thu, 20 Nov 2025 17:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8477C60210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657179;
	bh=trWFku7IEMyE6QXugMH17HG0kv+gRoRUQRGAQNXwZYc=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GIAhaeuDEQIdVHx2kc2BQ7Vk/5hnQ6VRzTEDhY1Sh8SN5UDlMSbtgW4aoW/AWkKFL
	 DZFzE4Ee1fqKlW1pEelXKTy56N73quYaLFhBOwvuux24omB8x1isF3Lshfi8IUwXPN
	 008w/2QyEDJcDTMcKCZTnQnJJzNZtPSgX9QYK9Q4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BCF3F80149; Thu, 20 Nov 2025 17:45:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F55F805CA;
	Thu, 20 Nov 2025 17:45:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A90D5F80533; Thu, 13 Nov 2025 17:56:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A4FEF8012A
	for <alsa-devel@alsa-project.org>; Thu, 13 Nov 2025 17:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A4FEF8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OlNBl1do
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-88043139c35so11182626d6.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Nov 2025 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763052962; x=1763657762;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EH0XQ4yggO9jsgYpE1PsUGa43+hLdJ6IA6lwMPPXe5A=;
        b=OlNBl1doVQOzGX50kgsjLi3AUPOjSD2On1K/ukk4cT5++zG4uCnpq+B4W/KLzU1kPV
         jRZUmYTqkyTsZqGcXmBR4y8KYemtaBpgTXKxugfluNtCbc9AYdRxYgcvsYliw3J9rC4X
         2ymJJkOA5lXJu9LDqDZntmf1un9ViM6qG70eX5rOPM1GUU9RvdGc2pbX9es5lG+Hs6dM
         NPQvhdfjvNEd7CpI1G6IS198sTVhJTcKzPpmhcESt3i+GqRuNo0j+jSLpNeOxSL3YtHJ
         o13xzEcTkg8nh+kq8eHyiqADBbm9xZ6ehtp1ROvAIAmOJ17+ti7QaysamMFGXKUrbldE
         5Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052962; x=1763657762;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EH0XQ4yggO9jsgYpE1PsUGa43+hLdJ6IA6lwMPPXe5A=;
        b=JmfCODoh3DHJi/cdPg+hS4vGFlfTPArOw9e/UEgK7BN5Zn9WjfCexuM4Ompi1qnS+/
         pTtPTAPJRrhLoM6yQy1AlHrFAX7mkRBHtnRikjq/SO66j36hHDxKMV1Em3xNpWqbqdaV
         XdJDpyZ8wdgLgtC+R0iIUWY/S8SYl6Qz7Vz0TEclMspZE0fsrAeNbAEWqHiLDaCNS3RR
         tRPO4/uS32iuWujnobN/jNeM5zTu8cj4UaxqOijUONqe/ZZ4E59BGaIH1YlgZoTempWd
         5DbI9Q2mTo0hSXeJZ1S6KEMDQHBzMe6oQNPCnbazL4FXCclgNskGO6HQji29+zFShA1Q
         g7fQ==
X-Gm-Message-State: AOJu0YwvAm9RBLiI5uje4nPtOBhd0ARMJLdhMfRWypTXwdwMvXQJmwv6
	ye6YyupV02DY09ZC8edZNU+x2Sur3tTea+yTq6hhtEwE3pbhpaaELebqDFnycjiMH97PWGKBxiJ
	baW6Cm+ouaYdCLCRV06DdpIfGn2ELgI6J4HY69lw=
X-Gm-Gg: ASbGnctjTxThtbkmDqWavMVERfqPdiUJKwF4IR3LmPD28XCbeW7nMS+Ew+eMju09ZFt
	T8spqEAmcfLizQfIySPk2pTgoivC6hhNuIlEz+HYRcahHWwy/OY/7AZTPCDW/u8nirLXaoSylcc
	N5IaE75E+cEbVWtjbSc9ffsegm4GHe18AH/EInx5npNaQDWTw+h14k8KTY9S8cZ8c/yByP10HIC
	nxRIs6Bom51GZfVsy4lC2WLUJ2/qgohTDI+nJVFV5lzNvXv6N6uO5BrzfdAZYY=
X-Google-Smtp-Source: 
 AGHT+IG9ORIregv5fDJyYnItIBf0pbVBO/DxiMaUycijOhWZwiXgCvSeCp7DSIdj1+X4J/9tfE5QYyAmMILSGQVdW18=
X-Received: by 2002:a05:6214:4003:b0:87c:27c2:2c0e with SMTP id
 6a1803df08f44-88271a40735mr113925526d6.59.1763052962081; Thu, 13 Nov 2025
 08:56:02 -0800 (PST)
MIME-Version: 1.0
From: Pape Samba Mbodj Sarr <papesambambodjsarr3@gmail.com>
Date: Thu, 13 Nov 2025 16:55:50 +0000
X-Gm-Features: AWmQ_bmEDq2F6yUNCMa2wbR8SqPueumVEJOfZ4Miv03f_B0IDHIcK_LOELgcIzs
Message-ID: 
 <CAEsrb=A=4Rdh_yu9Uvh+pvdS08z-=pNMtMrZa2ED=YELVaZLYA@mail.gmail.com>
Subject: [BUG] Realtek ALC236 Internal Mic not working on HP 255 G10
 (Subsystem ID 103c:8b2f)
To: alsa-devel@alsa-project.org
X-MailFrom: papesambambodjsarr3@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S5SQAQKV6UVQWP4VT5BILKAWA7KBW4G5
X-Message-ID-Hash: S5SQAQKV6UVQWP4VT5BILKAWA7KBW4G5
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:45:35 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5SQAQKV6UVQWP4VT5BILKAWA7KBW4G5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qm9uam91ciwNCg0KSidhaSB1biBwcm9ibMOobWUgYXZlYyBsZSBtaWNyb3Bob25lIGludGVybmUg
KGludMOpZ3LDqSkgcXVpIG4nZXN0IHBhcw0KZMOpdGVjdMOpIHBhciBsZSBzeXN0w6htZSAoYWZm
aWNow6kgY29tbWUgIm5vbiBicmFuY2jDqSIgLyAibm90IGF2YWlsYWJsZSIpDQpzdXIgbW9uIG9y
ZGluYXRldXIgcG9ydGFibGUgSFAuIEonYWkgw6lwdWlzw6kgdG91dGVzIGxlcyBvcHRpb25zIGRl
DQpjb25maWd1cmF0aW9uIHV0aWxpc2F0ZXVyIChtb2TDqGxlIEFMU0EsIHBhdGNocyBtYW51ZWxz
KS4NCg0KQ2VjaSBzZW1ibGUgw6p0cmUgdW4gInF1aXJrIiAoY29ycmVjdGlmKSBtYW5xdWFudCBw
b3VyIGxlIHBpbG90ZS4NCg0KKipJbmZvcm1hdGlvbnMgZHUgc3lzdMOobWUgOioqDQoqICoqT3Jk
aW5hdGV1ciA6KiogSFAgMjU1IDE1LjYgaW5jaCBHMTAgTm90ZWJvb2sgUEMNCiogKipDb2RlYyBB
dWRpbyA6KiogUmVhbHRlayBBTEMyMzYNCiogKipTdWJzeXN0ZW0gSUQgOioqIDEwM2M6OGIyZiAo
SGV3bGV0dC1QYWNrYXJkIENvbXBhbnkpDQoqICoqTm95YXUgTGludXggOioqIDYuMTQuMC0zNS1n
ZW5lcmljIChWZXJzaW9uIHRyw6hzIHLDqWNlbnRlKQ0KDQoqKlVSTCBkdSByYXBwb3J0IGFsc2Et
aW5mby5zaCAoQ29kZWMgRHVtcCkNCjoqKmh0dHA6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPTU1
ZGE0NGY2MGY1ZGViNjA3M2M5ZWRmZTJmNDljM2IxY2IwM2I1M2UNCg0KTCdlbnRyw6llIG1pY3Jv
cGhvbmUgKGFuYWxvZy1pbnB1dC1taWMpIGVzdCBtYXJxdcOpZSBjb21tZSAibm90DQphdmFpbGFi
bGUiIChub24gZGlzcG9uaWJsZSkgZGFucyBwYWN0bC4gSmUgc291cMOnb25uZSBxdWUgbGUgcGls
b3RlIG5lDQpwYXJ2aWVudCBwYXMgw6AgaW5pdGlhbGlzZXIgbGUgbWljcm9waG9uZSBudW3DqXJp
cXVlIChETUlDKSBvdSBjb25mb25kDQpsJ2VudHLDqWUgaW50ZXJuZSBhdmVjIGxlIGphY2sgZXh0
ZXJuZS4NCg0KTWVyY2kgZCdhdmFuY2UgZGUgdm90cmUgYWlkZSBwb3VyIGwnaW50w6lncmF0aW9u
IGRlIGNlIGNvcnJlY3RpZi4NCg0KQ29yZGlhbGVtZW50LA0KDQpTQVJSIE1ib2RqDQo=
