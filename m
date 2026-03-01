Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF3bNg8gqGlQoQAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:05:35 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976A1FF787
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 886B760203;
	Wed,  4 Mar 2026 13:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 886B760203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772625934;
	bh=rXVagXP9TrrSfizop8Fd8FBB1hrhbzafdAP3LiLNxT0=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U11wKBk7kEgutdr+5ODhd0ypqNVL5oDPFKT8qWCb1bSggBn6l0BpwCD0EdyHILm9T
	 Lri/7PiwLZhrCXp83fPzLs0xyA0mlGQqocPTraWaDcbleuI2FgOIQms+dvlPdG3sSy
	 acBc1G2rddjpLPgV2vf1sTnjluwm+Rj2Z3S6s7Ls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1229BF805EA; Wed,  4 Mar 2026 13:04:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EBDAF805EF;
	Wed,  4 Mar 2026 13:04:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B0B1F80524; Sun,  1 Mar 2026 06:58:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9CD6F8016E
	for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2026 06:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9CD6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mnODOFwT
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-79868eae536so32373987b3.0
        for <alsa-devel@alsa-project.org>;
 Sat, 28 Feb 2026 21:57:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772344662; cv=none;
        d=google.com; s=arc-20240605;
        b=Ra0jU6S+W28y23Vqmk6WXZcQv/c9EjyqUUe6Rhu/oDfCvA6j4G40IVoqPeaQZs6LbM
         pUhK5mbyiclKP2yWx5UxyjHo4vDgEz7vnXWvM4nyNFgNUfdWVW0HOFr0BLVzksq4hx4Y
         x7ZxeOoDfEO8eLWLDOUQue04xp+fJsTlOWrDDoGl5hQkXuy9zXa5paWsEuDkaBrkRNZP
         QVTz1weKc2rDAIlXmatm/t1xFASXYXUzji3K681X2d1PLZLEiXLU6iPHQrHBSC9T3s8r
         ABna1LELTA+VOyMqQ6QM+ku2BmeDhPCvVK5km+0rDKpbvIkc7Mi/Ku9IgJiao+eSbVHr
         qfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9bknQu4MEaJcGlVUVoVTuZkShrl57G8/UCEMSnDziR4=;
        fh=UYeyUMGt/zQlt+3PgtUDgFcvXY1CqnIKFqLogtY/BVI=;
        b=J2/s8RV8gXSWItsB18QL0M2KNRE+oXchLK/62AquAdXL9PzlMrbT1QHkNRqAtHfPEu
         HjkEXRfhcrTinq8TAP7H/10hIqJ8wvjLZQzjWO+Yebo0A7KfdGH4hwluPl4n438NaZBX
         mVg4DYOK6AjmStFO4uWYwwmOYkOsc7K7ogY3JhcUT+DVdBX8VIp/YNnwzvI9mlDSKVw9
         SxVE+v0xERY6TC17UMiSEOWvr778J8hDqkifQO5NAlgaa2OSTfmtQvcFfm3lExqyP8Rf
         c3/wvIw8FaP8xsu06hSo9TLhW0jGnek1RkSZyAOqpsxpn3eXNEc7j73HGSULTkphmUGP
         vW7w==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772344662; x=1772949462;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9bknQu4MEaJcGlVUVoVTuZkShrl57G8/UCEMSnDziR4=;
        b=mnODOFwTW2vO0DYa1qU1EXmoIF7y70HkcPnjkamijCWdFc6r/twiQm1CEPm5t6EfW3
         0v8TYHGuOmKcUsX/Jlbu0zaidds0zq4Rgs67qLIG1J+UVGA3CAnFGi4M9hljseOVaMkR
         SI3qxT4XCgC/4g+dHE95jk9zxPwTVu5WpdpIHHMJ6RRLj5Lkyz8WqBO8c9nNMOszIYUn
         p8HIARdqJ4qqF0HaMEtKvOwSukWffxzjvnvr/+14vtajndL7X2F8DzTIzgXLnKPOW7FX
         LgbrCPTM3DCdXZSACmLSC0G9jprOnRS9n08bv1fCJEehTufIO7dQ90r7rkBAZgOZHl8B
         oqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772344662; x=1772949462;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bknQu4MEaJcGlVUVoVTuZkShrl57G8/UCEMSnDziR4=;
        b=rw9w+QOLlnVYe+tQIr5afJYrWepqCZgNc+Xmlwm38LrqVIKkaWSPshrVItZ5WIptfm
         /z3+V5KXcq42giH2F4b+1mlot79IfzEgwPpFxhm4j/Y4VSC9uk7Abnr+WyVWgivUyfr2
         q/eTGbv5mGT6OFQt7YO0JeEjrn0+/8M0ShsuKBuyV92vgRIS4uHHXBfNetA/PG5GOYx1
         w+TXv7riWpPGuj3SdA1F0owTzuFvdnH2PfW4oWz5jiN0sCO1h6lbukQu/8W34T6c6bF/
         65Ba1E5yvhI7QH6ICByypVJZzMPovPW/Iwx8zncxNPjIZmQiT6gCLf2OsGT2nNd3WK/r
         BqZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjiUt7QfXt6Rua7IRXGtSLOA2QmYeGbnxDEhv0Vjh1XrzTftHRd2mqm/IWssTZdXmNRIbtVApwGEDe@alsa-project.org
X-Gm-Message-State: AOJu0YzLvy2tnGYTjSAdfCRfbDdFFMI2D+7Ggk9V/3XkN0abd73DYqSG
	qn5Xe5nJHXMeX1WsGBXWzTtdWBLm2SISoo89B9pMb9f1uU0a3S61JSfCjOD+YLzHnRHi/KrrIFy
	E/k9udb0vKCIJgXGEm3mZZPG95kN2zMM=
X-Gm-Gg: ATEYQzxIfvQ7YC85w9Ud4HFTsA4+y56+gRD1dHy5eiyor9cfozXdZDCSjk/IeYt+Y8j
	/3FQTJSlGSA+ogfaHuQRPm1AzXu64gr+rqX5YvExf5FdlidlLc8ZcZGX0o5SXoSkGt3fXWoo/Bu
	7IyGVGp2IW0E6/BK1La6ZU/WP7JEQEuKAL1C6SaQ3AzTHhdECNG5u+JRywZgEQhL8UkmGKoJJ7u
	wmxaSwhjsza8GwMSofaPJWqncl9zQ6W3o/WTDn5Co68BYXhoOnVxXN+cRdP07Tnmis/SqNkH3+B
	o+G24IdwC/akXvjqES2i7azC+fiH8qEn9o8Rb2wu
X-Received: by 2002:a05:690c:6086:b0:798:6ee0:2a68 with SMTP id
 00721157ae682-79885605e52mr67008407b3.64.1772344662278; Sat, 28 Feb 2026
 21:57:42 -0800 (PST)
MIME-Version: 1.0
From: Ngon <ngon36201@gmail.com>
Date: Sun, 1 Mar 2026 12:57:31 +0700
X-Gm-Features: AaiRm50NdmUOIH-hFbpZ3ld6haggOCFU-rYJSuDh5B6ra1kTsKtVsocvTbDcFnY
Message-ID: 
 <CAF2ktaUW2oaWwGazGtJQ3o1JyE2R4O2xPd-Dchr=qqi7_QRruQ@mail.gmail.com>
Subject: [REPORT] ALSA: hda/realtek: Fix silent/extremely quiet audio on HP
 Pavilion x360 (ALC295) with uninitialized SSID 103c:0000
To: tiwai@suse.de, alsa-devel@alsa-project.org
X-MailFrom: ngon36201@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JZ7BSTN7RZR5S2C3AKY53PQXGVWUF3FO
X-Message-ID-Hash: JZ7BSTN7RZR5S2C3AKY53PQXGVWUF3FO
X-Mailman-Approved-At: Wed, 04 Mar 2026 12:04:49 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZ7BSTN7RZR5S2C3AKY53PQXGVWUF3FO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 7976A1FF787
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DATE_IN_PAST(1.00)[78];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[gmail.com:s=20230601];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ngon36201@gmail.com,alsa-devel-bounces@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ngon36201@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

SGkgVGFrYXNoaSBhbmQgQUxTQSBkZXZlbG9wZXJzLA0KDQoNCiAgSSB3b3VsZCBsaWtlIHRvIHJl
cG9ydCBhIGhhcmR3YXJlIHF1aXJrIGFuZCBhIHZlcmlmaWVkIGZpeCBmb3IgdGhlIEhQDQpQYXZp
bGlvbiB4MzYwIENvbnZlcnRpYmxlIDE0LWNkMHh4eCAoQ29kZWM6DQogIFJlYWx0ZWsgQUxDMjk1
KS4NCg0KDQogIFByb2JsZW06DQogIFRoZSBCSU9TIG9uIHRoaXMgbW9kZWwgcmVwb3J0cyBhIGdl
bmVyaWMvdW5pbml0aWFsaXplZCBTdWJzeXN0ZW0gSUQ6DQoxMDNjOjAwMDAuIEJlY2F1c2Ugb2Yg
dGhpcywgdGhlIGtlcm5lbCBmYWlscyB0bw0KICBhcHBseSB0aGUgbmVjZXNzYXJ5IEhQLXNwZWNp
ZmljIHF1aXJrcy4gVGhlIGF1ZGlvIG91dHB1dCBpcyBlaXRoZXINCmNvbXBsZXRlbHkgc2lsZW50
IG9yIGV4dHJlbWVseSBxdWlldCwgZXZlbiB3aGVuIGFsbA0KICBtaXhlcnMgYXJlIGF0IDEwMCUu
IFRoaXMgaXNzdWUgaXMgcGFydGljdWxhcmx5IHNldmVyZSBvbiBtYWNoaW5lcyB3aGVyZQ0KdGhl
IG9yaWdpbmFsIHNjcmVlbiBoYXMgYmVlbiByZW1vdmVkL21vZGlmaWVkLA0KICB3aGljaCBzZWVt
cyB0byB0cmlnZ2VyIGEgInByb3RlY3Rpb24gbW9kZSIgaW4gdGhlIGhhcmR3YXJlIGFtcGxpZmll
ci4NCg0KDQogIEhhcmR3YXJlIERldGFpbHM6DQogICAtIE1vZGVsOiBIUCBQYXZpbGlvbiB4MzYw
IENvbnZlcnRpYmxlIDE0LWNkMHh4eA0KICAgLSBDb2RlYzogUmVhbHRlayBBTEMyOTUNCiAgIC0g
UmVwb3J0ZWQgU3Vic3lzdGVtIElEOiAxMDNjOjAwMDANCg0KDQogIFRoZSBGaXg6DQogIEkgZm91
bmQgdGhhdCBtYW51YWxseSBmb3JjaW5nIHRoZSBhbXBsaWZpZXIgZ2FpbiBhbmQgcHJvY2Vzc2lu
Zw0KY29lZmZpY2llbnRzIHVzaW5nIGhkYS12ZXJiIHJlc3RvcmVzIHRoZSBhdWRpbyB0bw0KICBu
b3JtYWwgdm9sdW1lIGxldmVscy4gVGhlIGZvbGxvd2luZyB2ZXJicyBhcmUgcmVxdWlyZWQ6DQoN
Cg0KICAgMS4gaGRhLXZlcmIgL2Rldi9zbmQvaHdDMEQwIDB4MjAgU0VUX0NPRUZfSU5ERVggMHgw
NyBmb2xsb3dlZCBieQ0KU0VUX1BST0NfQ09FRiAweDc3NzAgKEZvcmNlcyBBbXBsaWZpZXIgR2Fp
bikNCiAgIDIuIGhkYS12ZXJiIC9kZXYvc25kL2h3QzBEMCAweDIwIFNFVF9DT0VGX0lOREVYIDB4
MGQgZm9sbG93ZWQgYnkNClNFVF9QUk9DX0NPRUYgMHgzMDAwIChTZXRzIFByb2Nlc3NpbmcgU3Rh
dGUpDQoNCg0KICBQcm9wb3NlZCBTb2x1dGlvbjoNCiAgQ291bGQgdGhlc2UgdmVyYnMgYmUgaW50
ZWdyYXRlZCBhcyBhIGRlZmF1bHQgcXVpcmsgZm9yIEFMQzI5NSB3aGVuIHRoZQ0KU3Vic3lzdGVt
IElEIDEwM2M6MDAwMCBpcyBkZXRlY3RlZCBvbiBIUA0KICBoYXJkd2FyZT8gT3IgcGVyaGFwcyBh
ZGRlZCB0byB0aGUgQUxDMjY5X0ZJWFVQX0hQX0dQSU9fTEVEIGNoYWluPw0KDQoNCiAgSSBoYXZl
IHZlcmlmaWVkIHRoaXMgZml4IG9uIFBvcCFfT1MgMjIuMDQgKEtlcm5lbCA2LjE3KSBhbmQgaXQN
CmNvbnNpc3RlbnRseSBzb2x2ZXMgdGhlIGlzc3VlLg0KDQogIEJlc3QgcmVnYXJkcywNCmtlbXpz
aXRpbmsNCg==
