Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II2fA0VNqGmvsgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:18:29 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B980F202781
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:18:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28E060249;
	Wed,  4 Mar 2026 16:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28E060249
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637507;
	bh=pIlCz1Nqa9eKkMlguleDylny63WHcIf5yiB0UKJ9vLY=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pLAVJ51SvzC2fuier5YqFqeJqOpJIosQvJoaV4sgBnufA7IcMyRfDZggKdxmZB7lC
	 3bAEnxX3lmvABBDYMesb0t0Xo6YFHspVMwwkEJD+WoRUBQk57VVaJpklnLIM2gY26e
	 I8KJ0gjr/SirrZhVMSsP6Y1IKiKXUMhmsOr5cZgg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CD7AF80601; Wed,  4 Mar 2026 16:16:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E97BBF80605;
	Wed,  4 Mar 2026 16:16:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBCC6F80533; Mon, 29 Dec 2025 16:59:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_40,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7AD6F80185
	for <alsa-devel@alsa-project.org>; Mon, 29 Dec 2025 16:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AD6F80185
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eSwDyLRD
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so11761585e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Dec 2025 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767023987; x=1767628787;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LyXBx39sR1W4F8tUIaW9k9Y8rgRDIhuK1yDQGgBffiE=;
        b=eSwDyLRDm1RCYsS8nVJUS/HMr7zNERAKwyOamB1vKPi3ahphfNOGl9bGdUJ0baoW7I
         TEkD5nCnrtq2e46gnAzxZdvBb0Id72nEjpAHnv9clfjgKII2Hh2mIzylzQjmODsA21Cp
         2J9/9R27gO2pSVAW27Qf7pVcC7xFmMDf8Dn8rYucWdJfl9i0rFRIcADOCmvTuP577ZcX
         6HoxTUdwOpI/KiB/dyAqDO4Nji2HFpUhjKYfhMkMyGgttt1QAzJfjJGZ9SvvY1TrtshT
         Mt5d8ot4t5sRm/PjGWBmqTT4o5qcPyvIhWZgs0bSroyPsopjvFaoogevv/v6G7MTgtcE
         JC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023987; x=1767628787;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyXBx39sR1W4F8tUIaW9k9Y8rgRDIhuK1yDQGgBffiE=;
        b=fNLzNTATKI3bmmfsP1pkD8iv3wwQAFmfUgBKBxgwwkhq/0KsbEq/bAH/Trn9IjeQKH
         RT0QwBrneKCLclKqBO372gb60vNFiwqOt/MnGz2/3xpokgLTay9j2zOmFI7DOu5oXocz
         j1FhuskCEarJAXm8yMvUiqDz3ClsOQcUQq2ES2aNLmPIfnCJ5CHbnrhABygPkILMxUTs
         sv7HO15TFjpCe/j/s02xQVDa2UZvbWUzYGjmjn16omZRkg3rdxgaOlRfdNyAMD/SS2BC
         UHkeXzekDxbyNlUOvvxPPzK95IblnoWekRtFCXRcGxwiKoAVeYzw+QPWDSDbDH5t6YZ0
         KmEw==
X-Gm-Message-State: AOJu0YzEBlCMPJoXKhy1Eadlu0E2mu9SOyiCihqo7NaSCK4F3kdlVao7
	H79j1OzJTVeGFXZEAqyo2nHMA+GlCmkKGZ/GhBZ5jo5/fFk2gO10VazKuh7McoB0pGRSugXLGVR
	QUF4AkFADVOnzqZg3H+iGcDXARgvlmVvvkCL2
X-Gm-Gg: AY/fxX5wWV6iaFtF3VTb7vPUjH3XZb+VbJZdlBkAqo53meOx3EBkiWHjvnFQTwoi+rU
	q3ChAS2VXN7vr1I+935iFnzfoQJAC+pkfVZ/oDcv1LPT4ThFwzCsR0hAu8Wi61vDP782HxHK/yN
	6r2pfbEy817n1EKfivyNoOX6EovRKrqvwyjQx9pnZFggf/IA+xSypJqZBd9SPZR5kfD+SBDlxKS
	eEXWFxBd8g2H2g0djHKHgtrdbYbK12r9lMKNfKxw469Xo6jmMAqBEj0TnTpNaX4Q5YqUyDb
X-Google-Smtp-Source: 
 AGHT+IHxKVu3HEI4Cq4HYyvu/HkrSRzzlkvWOtP2WR/WOBKkv/4MaoTgU7qWAVUx1lcYSEyV+T88muJZRSfxqS0c8bM=
X-Received: by 2002:a05:600c:4e8e:b0:477:b0b8:4dd0 with SMTP id
 5b1f17b1804b1-47d1957b120mr371214925e9.17.1767023986698; Mon, 29 Dec 2025
 07:59:46 -0800 (PST)
MIME-Version: 1.0
From: Emanuel <emaneyjksoliveira@gmail.com>
Date: Mon, 29 Dec 2025 15:59:35 +0000
X-Gm-Features: AQt7F2rFIGa-BbLtb26_JukhjhDTpE0Q_V1a5woUIrCpCQxpWp1Ud4D6CawsB6g
Message-ID: 
 <CAO9jKJbvAtzBWxGfGim+zeUB9BiC1qCAhutGEPt8bMffG7Xq2w@mail.gmail.com>
Subject: Microfone error
To: alsa-devel@alsa-project.org
X-MailFrom: emaneyjksoliveira@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EEE6IYMDVFDT5EA6HXVUVNT62XF3SCS2
X-Message-ID-Hash: EEE6IYMDVFDT5EA6HXVUVNT62XF3SCS2
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:16:52 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEE6IYMDVFDT5EA6HXVUVNT62XF3SCS2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: B980F202781
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	DATE_IN_PAST(1.00)[1559];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
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
	FROM_NEQ_ENVFROM(0.00)[emaneyjksoliveira@gmail.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,alsa-project.org:url]
X-Rspamd-Action: no action

SGVsbG8gQUxTQSB0ZWFtLA0KDQpJIGFtIHJlcG9ydGluZyBhbiBpc3N1ZSB3aXRoIHRoZSBpbnRl
cm5hbCBtaWNyb3Bob25lIG9uIGEgbGFwdG9wIHdpdGggdGhlDQpSZWFsdGVrIEFMQzI5NCAoUmVt
YnJhbmR0KS4NCg0KRGVzY3JpcHRpb24gb2YgdGhlIGlzc3VlOg0KLSBUaGUgaW50ZXJuYWwgbWlj
cm9waG9uZSBpcyBkZXRlY3RlZCBpbiBBTFNBIGFuZCBQaXBlV2lyZSwgYnV0IGRvZXMgbm90DQpj
YXB0dXJlIGFueSBhdWRpby4NCi0gVGVzdHMgcGVyZm9ybWVkOg0KICAtIGhkYWphY2tyZXRhc2sg
b3ZlcnJpZGUgb2YgcGluIDB4MTkgLS0+IEludGVybmFsIE1pYw0KICAtIE1pYyBCb29zdCBhdCBt
YXhpbXVtDQogIC0g4oCcSW5zdGFsbCBib290IG92ZXJyaWRl4oCdIGFwcGxpZWQNCiAgLSBQaXBl
V2lyZSByZXN0YXJ0ZWQNCiAgLSBUZXN0ZWQgc25kLWhkYS1pbnRlbCBxdWlya3M6IGFsYzI5NC1y
dDcxNSwgYWxjMjk0LCBhc3VzDQogIC0gS2VybmVsIHVwZ3JhZGVkIGZyb20gNi4xNCB0byA2LjE4
LjENCi0gUmVzdWx0OiBNaWNyb3Bob25lIGFwcGVhcnMsIGJ1dCByZWNvcmRpbmcgcHJvZHVjZXMg
b25seSB3aGl0ZSBub2lzZS4NCg0KQUxTQSBhdXRvbWF0aWMgcmVwb3J0IGxpbms6DQpodHRwczov
L2Fsc2EtcHJvamVjdC5vcmcvZGIvP2Y9NDU4ZjQwY2QxYTY1NzAzOTZkMDk0ZTMwYzc3YjVlYWFi
MTlkYjM5OA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgYXR0ZW50aW9uLg0KDQpCZXN0IHJlZ2FyZHMs
DQpFbWFudWVsDQo=
