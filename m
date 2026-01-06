Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK+4OsFWqGlutQAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:58:57 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B216A2037E6
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:58:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C1A602A7;
	Wed,  4 Mar 2026 16:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C1A602A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772639936;
	bh=NcQauNK6LndeuYQwZkbD121rvA6tEqqpQDqycT+9Qd8=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dVBEg+fR8Mvp6LSo/E9z/D/UEggRiAqE/TqAPKYmCjzsj/D+rcgn8/cU3Oz0lvN5g
	 iTPLF12HeuGbI3sT1wQ4LjZHe8OWEJD7HMhQ+VIyfM2wXvO6v9zHzOvNVUCpqY5R16
	 +G+A4cACjzvNygefdk/9W9YLdgcclA4GLRXEsPuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68564F80609; Wed,  4 Mar 2026 16:58:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EA39F8060F;
	Wed,  4 Mar 2026 16:58:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1297F802DB; Tue,  6 Jan 2026 23:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 504FDF802DB
	for <alsa-devel@alsa-project.org>; Tue,  6 Jan 2026 23:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504FDF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QZV6dqph
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64b9230f564so1980695a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jan 2026 14:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767736846; x=1768341646;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MlPBwcnxpoFoOLyBasFOSmHSjkeEh0bgtDFsW8sJLMo=;
        b=QZV6dqphKy4yWpfhh+HDZ3RT0JWstqs3rFP7bHUcE6tF/ZxAWW5cwQhU6vI6PT71F+
         FlmZ/k9ySbygO4p+D3NEeWTjYrieKqifT2Mcz6zbDBIfLWzWzbBkRmdvSlmiq29mkZoQ
         sMbXBhVVV/lY7MpRs2nTd2Y0YnnycqQv60Gy3G40jx8xquxDUcUwZ7zhZMZZNde1Lb09
         sS/C4wBcuifM05/RFB3JMShWlBroS5Y8Y8WRYEWsP5oiq7I2fT+Zd7J9JFbdhRcpNA5L
         D0B76ghS3JCJ8MSMAzZXJv2JmMH0/jZMKsVBBI8ZAPR0Og3jMnSIvhpQwK3jl+yOowZ2
         2WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767736846; x=1768341646;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlPBwcnxpoFoOLyBasFOSmHSjkeEh0bgtDFsW8sJLMo=;
        b=EmnhVM0cz2KjO80MDze+vQwONVbuLlZ56BBRsu1NN8naHjKdWkAgrLGJi8PNQIyS/W
         fo/s7Bv6Xc18Marx3mCynXmx40IIGNksVBKGPyvfgH3w8TcxYMxFe98TARU64ZppAilO
         wRu2W8R2xcoYRfit7f8Q7w3F2NbGpc1LIjL0AJtSly0CYT5vXROAIdJ21jJtKDDzlYoD
         m/9uxk6zUu1dYhxM0+H3DUT8Oq2ckq6SZt5yIP37gqwGJpFa7kPflyITT4pl42OeCg+G
         /oIIoi/R482rdXtUbJvQgjJLyLE78HaXk8tgfvbaWSnfgfE5eYSCyGPfBotdSsoE0i+S
         Gaww==
X-Gm-Message-State: AOJu0Yx2kHageWo4/gBhakEAxGwwKu4Ijmz6N8/il10T6uOSx/jZ5v3K
	b1lfHbOJLjAXGphP7kPlktsiA1E2w6uUr0y51IGoTnop1EH7niI5/c7d7TT+oXZSBp64LNKznn9
	Yu31sF/PWxW22N/qCoupmQFSMEIArE1z8qFXxl3E=
X-Gm-Gg: AY/fxX7hhRBtoYfxMQPimLdN4rL3reYLCTfaHq2qa9xaCFP99essKOPaIYzZVToa8R9
	egbDtVFbpQDRIHaFqbbV/bRD7wh5pkUkJCByGKk8AZ7+uv/JhrXXaQBVuHl2hyLn/KSxigv1YWx
	pchOetW5rHlzJfYude6fGwqkS8r50z+tZKuHXQVu/yMcD9WoE174Wjeh5MJhaAZ1D+50RrpRDSv
	Uh1FEs6Kyw4D3jVwUAQ4d6KzGFCCst0E0hQDuQu/mer4+U2Iiwumlhez2epZDUIcx583O0ZuC71
	Sgp8waFIY6aFBIJoegyIlA6SaTS5ooAE5LH/922B8On3Q8WbMPZVI9urRg==
X-Google-Smtp-Source: 
 AGHT+IHCIJcG/ouFKJbIwRTFCHn5R1GR7MNsBuolphAk3bMLSvt7+0N8lEv9qnKkmK0iUyafdDqqGifd5fXIeDb29o8=
X-Received: by 2002:a05:6402:5214:b0:649:afbf:ce4c with SMTP id
 4fb4d7f45d1cf-65097dd19d0mr458876a12.3.1767736846125; Tue, 06 Jan 2026
 14:00:46 -0800 (PST)
MIME-Version: 1.0
From: Marlababich Ga <framajanuel@gmail.com>
Date: Tue, 6 Jan 2026 23:00:34 +0100
X-Gm-Features: AQt7F2ob0eWV9wwbWRECwG_ICneysgBCA_sOhLmjY72YseDESvgdOhISMyXJLBg
Message-ID: 
 <CAJrMVZOCE=SH7Gd-7mt=-u4O6bm_FmCykTQuXeT_o1d5hpGvRQ@mail.gmail.com>
Subject: Audio issue on Lenovo Yoga 7 16APK10 (83JU) - Woofers/Bass speakers
 silent
To: alsa-devel@alsa-project.org
X-MailFrom: framajanuel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O7BC3EP6QRMMZB5H3FEYRSTZNWF3N6WH
X-Message-ID-Hash: O7BC3EP6QRMMZB5H3FEYRSTZNWF3N6WH
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:58:10 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7BC3EP6QRMMZB5H3FEYRSTZNWF3N6WH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: B216A2037E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DATE_IN_PAST(1.00)[1361];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[framajanuel@gmail.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,mail.gmail.com:mid,alsa-project.org:dkim,alsa-project.org:url]
X-Rspamd-Action: no action

SGVsbG8sIG1heWJlIGl0IHdpbGwgaW50ZXJlc3QgeW91IDoNCg0KKkRlc2NyaXB0aW9uIDogKg0K
DQpJbnRlcm5hbCBzcGVha2VycyBhcmUgdGlubnkgYXMgb25seSB0aGUgdHdlZXRlcnMgYXJlIGZ1
bmN0aW9uYWwuIERlc3BpdGUNCmFwcGx5aW5nIHRoZSBhbGMyODcteW9nYTktYmFzcy1zcGstcGlu
IHF1aXJrLCB0aGUgYmFzcyBzcGVha2VycyAod29vZmVycykNCmRyaXZlbiBieSB0aGUgVEFTMjc4
MSBzbWFydCBhbXBsaWZpZXJzIHJlbWFpbiBzaWxlbnQuDQoNCipIYXJkd2FyZSBJZGVudGlmaWVy
IChTU0lEKToqIDE3YWE6MzhiNSAodmVyaWZpZWQgdmlhIGxzcGNpKQ0KDQoqUGxhdGZvcm06KiBB
TUQgU3RyaXggUG9pbnQgKFJ5emVuIEFJIDMwMCBTZXJpZXMpDQoNCipDb21wb25lbnRzOiogUmVh
bHRlayBBTEMyODcgY29kZWMgKyBUZXhhcyBJbnN0cnVtZW50cyBUQVMyNzgxIFNtYXJ0DQpBbXBs
aWZpZXJzICAoSSBndWVzcykNCg0KKktlcm5lbCB2ZXJzaW9uOiogNi4xNy4xMi0zMDAuZmM0My54
ODZfNjQNCg0KKkRpYWdub3N0aWMgTGluazoqDQpodHRwOi8vYWxzYS1wcm9qZWN0Lm9yZy9kYi8/
Zj1jNjU2Y2U2NDM0YjVjMjgwNTk4ZWZkOGI2ZjFhMWQ0YjIyZjg3OWU0DQoqV2l0aCB0aGUgY29t
bWFuZCA8bHNwY2kgLW5uayB8IGdyZXAgLUEgMyBBdWRpbz4gOioNCg0KcGNpbGliOiBFcnJvciBy
ZWFkaW5nIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDA6MDA6MDguMy9sYWJlbDogT3BlcmF0aW9u
DQpub3QgcGVybWl0dGVkDQowNDowMC4xIEF1ZGlvIGRldmljZSBbMDQwM106IEFkdmFuY2VkIE1p
Y3JvIERldmljZXMsIEluYy4gW0FNRC9BVEldIFJhZGVvbg0KSGlnaCBEZWZpbml0aW9uIEF1ZGlv
IENvbnRyb2xsZXIgWzEwMDI6MTY0MF0NClN1YnN5c3RlbTogQWR2YW5jZWQgTWljcm8gRGV2aWNl
cywgSW5jLiBbQU1EL0FUSV0gUmFkZW9uIEhpZ2ggRGVmaW5pdGlvbg0KQXVkaW8gQ29udHJvbGxl
ciBbMTAwMjoxNjQwXQ0KS2VybmVsIGRyaXZlciBpbiB1c2U6IHNuZF9oZGFfaW50ZWwNCktlcm5l
bCBtb2R1bGVzOiBzbmRfaGRhX2ludGVsDQowNDowMC4yIEVuY3J5cHRpb24gY29udHJvbGxlciBb
MTA4MF06IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRF0NClN0cml4L0tyYWNrYW4v
U3RyaXggSGFsbyBDQ1AvQVNQIFsxMDIyOjE3ZTBdDQotLQ0KMDQ6MDAuNSBNdWx0aW1lZGlhIGNv
bnRyb2xsZXIgWzA0ODBdOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTURdDQpBdWRp
byBDb3Byb2Nlc3NvciBbMTAyMjoxNWUyXSAocmV2IDcxKQ0KU3Vic3lzdGVtOiBMZW5vdm8gRGV2
aWNlIFsxN2FhOjM4YzVdDQpLZXJuZWwgZHJpdmVyIGluIHVzZTogc25kX2FjcF9wY2kNCktlcm5l
bCBtb2R1bGVzOiBzbmRfcGNpX2FjcDN4LCBzbmRfcm5fcGNpX2FjcDN4LCBzbmRfcGNpX2FjcDV4
LA0Kc25kX3BjaV9hY3A2eCwgc25kX2FjcF9wY2ksIHNuZF9ycGxfcGNpX2FjcDZ4LCBzbmRfcGNp
X3BzLA0Kc25kX3NvZl9hbWRfcmVub2lyLCBzbmRfc29mX2FtZF9yZW1icmFuZHQsIHNuZF9zb2Zf
YW1kX3ZhbmdvZ2gsDQpzbmRfc29mX2FtZF9hY3A2Mywgc25kX3NvZl9hbWRfYWNwNzANCjA0OjAw
LjYgQXVkaW8gZGV2aWNlIFswNDAzXTogQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBbQU1E
XSBSeXplbiBIRA0KQXVkaW8gQ29udHJvbGxlciBbMTAyMjoxNWUzXQ0KU3Vic3lzdGVtOiBMZW5v
dm8gRGV2aWNlIFsxN2FhOjM4YjVdDQpLZXJuZWwgZHJpdmVyIGluIHVzZTogc25kX2hkYV9pbnRl
bA0KS2VybmVsIG1vZHVsZXM6IHNuZF9oZGFfaW50ZWwNCg==
