Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAXIHlZNqGmvsgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:18:46 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B726202798
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:18:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F7F6024B;
	Wed,  4 Mar 2026 16:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F7F6024B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637525;
	bh=R7NkiaYhhemwAFDyFzUuMLXK5FxTUBQMfekXch2AG1E=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AokL6afcb3dFUWqfiPuGieZGPdasNe6/Mi/NoexBlGBVAOE5fR8D6SlANO0wix8KO
	 YGyuFR58IZn0C45hccR8tsF44CpN2DtYxdH0h6MHMOkHVMiwtiEI34G8gnGcqEFo9g
	 +WAZWcrZLj6yb5LCYA1yQQ3tivGAN6uQSKDswwjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CEE7F80615; Wed,  4 Mar 2026 16:17:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA8DF80610;
	Wed,  4 Mar 2026 16:17:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7686AF80301; Sat, 24 Jan 2026 12:26:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	FROM_STARTS_WITH_NUMS,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,T_SPF_PERMERROR,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D4A4F8007E
	for <alsa-devel@alsa-project.org>; Sat, 24 Jan 2026 12:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D4A4F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DtVbZqxs
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-c2a9a9b43b1so1863266a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jan 2026 03:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769253972; cv=none;
        d=google.com; s=arc-20240605;
        b=iFhpzuhBwyt0c0BNe4SE+iXhHlPSs1Fdw3WauRYmH06SRSq8/2C9syj80m8EMe3eRj
         1twuRYonIy5hvkGaIHBylAhEpPovKFuvRP4WRlrLUZOLduB3S9OvsXLFYlV02Vv2L5wo
         gbPdiYG/aA/7ynrrDZiONksE79SJeapvBXE40YOzPQJVwgzQaHiRKydoNzr7PvYvKhd1
         H3V5TZFil9ta1toA6Vm+GSyghlA2vfj43BiGALrN3hS+1kUhoPmd1cigL36fvSJnBVg6
         MiahdifETVCUAY+xXSCkJxvfBmoB8b0LD+D/aT0g4QTSG350Y++IZlXH8UO2M1GLl//C
         jRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/YZ532cym7A3567ho3vpInVIXJmGxEMZVdmD3AUJlfI=;
        fh=s1h8N4U4ASgl2diPi2yKjEmsLSTuwbZjYBDYrAXLUvw=;
        b=gQIINEGLuP7SZaXdl1bK1rQEwjJ0xo4lf+eMPLO83hJ4J/NsL5Tn99Eox3rjTesUOi
         3Z3WB/CTsi8iPF+kdvExv4v7Z0YJQ5HRvr4beTIMT3c7LudjiN4tFRAtDwcBW5KmzmFb
         G7Dfom4vHh+g5muiaWfvVecvRPFe07rGbQUAXXY/N3eo1rdvYTK4YHoWtqP49JBjQaPr
         lIJLa9cw6d3/+tUon6cwH6MBdAyNDdehi//XkOclnff7oe/8lR+Aj05DQ5+TTT77HeMF
         TjlsjHFwjyWmSOU8pTRTQn8chjnAeeIkJ0MQkFCjs5ZJsUiX4rkx0j9zMJ3Ykw0AGXgs
         tQCg==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769253972; x=1769858772;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/YZ532cym7A3567ho3vpInVIXJmGxEMZVdmD3AUJlfI=;
        b=DtVbZqxsPeY5rvl5dovtB8SdR6ofAygTyOwfNLfr1gS9nBo+oyn6Ndiz8qDTM4i1L0
         J00uOm0NpjlRxoUennIu/biSXqwYXgrQMigyRrTAWyU2pbk82Q7QpKMJ9vrCz++Ox2Yw
         1Lh001WS9ua0xY8ydyij5GAd4ibeqCgzXBMMuzW6NpxM1bswCAMgVCSdgfBQQTw1BEKP
         RS+NVnUHhAEipQI0zJNpkp1sw0w+5xHYHjLBDORH+OygOEli0tjmS7FvGje/YgyBMBjf
         555B0UEyAi93d629rAYgJWf4SAIivo8npepRCVgjlLbhM4Znl+AXTWfsiYhb11QK1Waf
         URfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769253972; x=1769858772;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YZ532cym7A3567ho3vpInVIXJmGxEMZVdmD3AUJlfI=;
        b=JBCoRpQDKJXTTZPpqW0aG9YhfzHY4Fmgjn63rT8uoz5v89zVX5oC0RbruEXROMvxgd
         gGLZ99XGa2JDD3j9D6eQkXGe87N4hfnSrS9l6cI9cFhoT5ACUmhOCANugkbGjlKaJqx5
         cZ9cll0RLJP6m1HUnjrIpB+KPVGqpliO01QP3JUdfDN/VoAmacjHE3uBipSkxhMdRJlt
         ELguOjsjJan9F94bsOoDqQvyCrCqrm5cC2ICa08HhhaY07BMo90OVExwbMQ+mhcvuW/e
         Z8Suv9FGMixeCeevRgsZ68nYFVQWUPpUauXICHREc1ozUsipNAPWjv9WB9VgFVBko/Iq
         JdbA==
X-Gm-Message-State: AOJu0YzDcP6uZ7lJIPQVv8SHayJFEgXLFYj37Gb8P4mCEVmMd008Q0B4
	bwt7YDtXJiHqQsIIktzJmDXS17ZXA2HYER3MCFDIEpa6VkbSUi8bgMd4EUhP9khOHJ/Ke0VVvPu
	QaHX6lssgyIrNULcJ2QTOyjyYJ3FmBWGyP9/XRPE=
X-Gm-Gg: AZuq6aIsWbCBLfM9ISAAfBgFUXjo5dZYFCd6RiJDAySdIB14dRuocYkzQzUoCsBRdot
	njAx0O6GANrT1/xXwDQHTXqwGvOHoQGyCagOc/XpU7c/geaEMnuZg2cwrEPQSodmrc8RMnZ8prm
	mTfu9p/hdOv28Z23JBQe1yksvo7zDiLNPMgMMgdfu2Uucxmn0cfk1H12GdzRyCmZ52WvM/fw2KL
	kdH5ppFJrLtHz8/ccVLdYsl+h/yMYA9eqP0G/E1p6APpBzYXoNb7jqz1ZARhBSfnLR8CKyNPDaJ
	kOfO53iNBuGcoodgByFF64bBpKq4HXuAQrojIgug
X-Received: by 2002:a05:7300:5726:b0:2b7:2616:2dce with SMTP id
 5a478bee46e88-2b7397a3658mr1322966eec.0.1769184859212; Fri, 23 Jan 2026
 08:14:19 -0800 (PST)
MIME-Version: 1.0
From: 58 6 <586pol@gmail.com>
Date: Fri, 23 Jan 2026 16:14:07 +0000
X-Gm-Features: AZwV_QgFXwECZpkcjSdaGUmsaUfvzsxlm5A5D_fuitOeAE8qf17ax3V6aroRiWI
Message-ID: 
 <CADNMP2AEVjewqgjG_Gbu+uBbXXWwgNmrO_w+81OoRKmE_B3B_A@mail.gmail.com>
Subject: Persistent bug
To: alsa-devel@alsa-project.org
X-MailFrom: 586pol@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VNFXLFUMOPDDFGL5RPO5CEEFH65P5O7E
X-Message-ID-Hash: VNFXLFUMOPDDFGL5RPO5CEEFH65P5O7E
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:17:51 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNFXLFUMOPDDFGL5RPO5CEEFH65P5O7E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 1B726202798
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	DATE_IN_PAST(1.00)[959];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[586pol@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,alsa-info.sh:url]
X-Rspamd-Action: no action

SGVsbG8gQUxTQSBkZXZlbG9wZXJzLA0KDQpJIHdvdWxkIGxpa2UgdG8gcmVwb3J0IGFuIGlzc3Vl
IHdpdGggaW50ZXJuYWwgc3BlYWtlcnMgbm90IHdvcmtpbmcgb24gYSBNU0kNClRoaW4gQTE1IGxh
cHRvcCB1c2luZyBGZWRvcmEgV29ya3N0YXRpb24uIEFmdGVyIGV4dGVuc2l2ZSBkZWJ1Z2dpbmcs
IHRoaXMNCmFwcGVhcnMgdG8gYmUgcmVsYXRlZCB0byBhIG1pc3Npbmcgb3IgaW5jb3JyZWN0IHF1
aXJrIGZvciB0aGUgUmVhbHRlaw0KQUxDMjU2IGNvZGVjIG9uIHRoaXMgbWFjaGluZS4NCkhhcmR3
YXJlDQoNCiAgIC0NCg0KICAgTGFwdG9wOiBNU0kgVGhpbiBBMTUNCiAgIC0NCg0KICAgQXVkaW8g
Y29kZWM6IFJlYWx0ZWsgQUxDMjU2DQogICAtDQoNCiAgIFN1YnN5c3RlbSBJRDogMHgxNDYyMTQz
Nw0KICAgLQ0KDQogICBPdGhlciBhdWRpbyBkZXZpY2VzOg0KICAgLQ0KDQogICAgICBOVklESUEg
SERBIChIRE1JL0RQKQ0KICAgICAgLQ0KDQogICAgICBBVEkgUjZ4eCBIRE1JDQoNClNvZnR3YXJl
DQoNCiAgIC0NCg0KICAgRGlzdHJpYnV0aW9uOiBGZWRvcmEgV29ya3N0YXRpb24NCiAgIC0NCg0K
ICAgS2VybmVsOiBGZWRvcmEgc3RvY2sga2VybmVsDQogICAtDQoNCiAgIEF1ZGlvIHN0YWNrOiBB
TFNBICsgUGlwZVdpcmUNCiAgIC0NCg0KICAgRGVza3RvcDogR05PTUUNCg0KSW5jaWRlbnQgZGVz
Y3JpcHRpb24NCg0KVGhlIGludGVybmFsIHNwZWFrZXJzIHN0b3BwZWQgd29ya2luZyBhZnRlciB0
aGUgZm9sbG93aW5nIGV2ZW50Og0KDQogICAtDQoNCiAgIEkgd2FzIHJ1bm5pbmcgKkFya25pZ2h0
czogRW5kZmllbGQqIHZpYSBIZXJvaWMgR2FtZXMgTGF1bmNoZXINCiAgIC0NCg0KICAgQXQgdGhl
IHNhbWUgdGltZSwgSSBsYXVuY2hlZCAqQ291bnRlci1TdHJpa2UgMiogZnJvbSBTdGVhbQ0KICAg
LQ0KDQogICBUaGUgc3lzdGVtIGZyb3plIGNvbXBsZXRlbHkNCiAgIC0NCg0KICAgSSBwZXJmb3Jt
ZWQgYSBoYXJkIHBvd2VyLW9mZg0KDQpBZnRlciByZWJvb3RpbmcsIHRoZSBpbnRlcm5hbCBzcGVh
a2VycyBuZXZlciB3b3JrZWQgYWdhaW4uDQpDdXJyZW50IGJlaGF2aW9yDQoNCiAgIC0NCg0KICAg
SGVhZHBob25lcyBvdXRwdXQgd29ya3MgY29ycmVjdGx5DQogICAtDQoNCiAgIEhETUkgLyBEUCBh
dWRpbyB3b3JrcyBjb3JyZWN0bHkNCiAgIC0NCg0KICAgRXh0ZXJuYWwgc3BlYWtlcnMgY29ubmVj
dGVkIHRvIHRoZSBoZWFkcGhvbmUgamFjayB3b3JrLCBidXQgb25seSBpbg0KICAgKm1vbm8qDQog
ICAtDQoNCiAgIEludGVybmFsIHNwZWFrZXJzIGFyZSBsaXN0ZWQgaW4gR05PTUUgYW5kIHBhdnVj
b250cm9sIGFzICJJbnRlcm5hbA0KICAgU3BlYWtlciIsIGJ1dDoNCiAgIC0NCg0KICAgICAgQ29u
bmVjdGl2aXR5IGZpZWxkIGlzIGVtcHR5DQogICAgICAtDQoNCiAgICAgIEphY2sgZGV0ZWN0aW9u
IGlzIG5vdCBwcmVzZW50DQogICAgICAtDQoNCiAgICAgIFZvbHVtZSBzbGlkZXIgaXMgcHJlc2Vu
dCBidXQgYXVkaW8gaXMgYWx3YXlzIHNpbGVudA0KDQpEZWJ1Z2dpbmcgcGVyZm9ybWVkDQoNCiAg
IC0NCg0KICAgQ29uZmlybWVkIEFMU0EsIFBpcGVXaXJlLCBhbmQgR05PTUUgYXVkaW8gc3RhY2sg
YXJlIHdvcmtpbmcgY29ycmVjdGx5DQogICAtDQoNCiAgIFRlc3RlZCBtdWx0aXBsZSBzbmRfaGRh
X2ludGVsIG1vZGVsPSBwYXJhbWV0ZXJzIChubyBlZmZlY3QpDQogICAtDQoNCiAgIEluc3BlY3Rl
ZCAvcHJvYy9hc291bmQvY2FyZCovY29kZWMjKjoNCiAgIC0NCg0KICAgICAgTm9kZSAweDE0IGlz
IGRlY2xhcmVkIGFzICpJbnRlcm5hbCBTcGVha2VyKiwgd2l0aCBFQVBEIHByZXNlbnQNCiAgICAg
IC0NCg0KICAgICAgTm9kZSAweDIxIChIZWFkcGhvbmVzKSB3b3JrcyBjb3JyZWN0bHkNCiAgICAg
IC0NCg0KICAgVHJpZWQgaGRhLXZlcmIgY29tbWFuZHM6DQogICAtDQoNCiAgICAgIFNFVF9FQVBE
X0JUTEVOQUJMRQ0KICAgICAgLQ0KDQogICAgICBTRVRfQU1QX0dBSU5fTVVURQ0KICAgICAgLQ0K
DQogICAgICBTRVRfQ09FRl9JTkRFWCAvIFNFVF9QUk9DX0NPRUYNCiAgICAgIC0NCg0KICAgICAg
QWxsIGNvbW1hbmRzIHJldHVybiB2YWx1ZT0wLCBidXQgdGhlIGludGVybmFsIHNwZWFrZXIgbmV2
ZXIgYWN0aXZhdGVzDQogICAgICAtDQoNCiAgIE5vZGUgMHgxNCBkb2VzIG5vdCByZXNwb25kIHRv
IGFtcGxpZmllciBvciByb3V0aW5nIGNvbW1hbmRzDQogICAtDQoNCiAgIEhETUkvRFAgZGlnaXRh
bCBwaW5zIGZ1bmN0aW9uIG5vcm1hbGx5DQoNCk9ic2VydmF0aW9ucw0KDQogICAtDQoNCiAgIFRo
ZSBoYXJkd2FyZSBkZWNsYXJlcyB0aGUgaW50ZXJuYWwgc3BlYWtlciBwaW4sIGJ1dCB0aGVyZSBh
cHBlYXJzIHRvIGJlDQogICBubyBmdW5jdGlvbmFsIHJvdXRpbmcNCiAgIC0NCg0KICAgTm8gZXhp
c3RpbmcgbW9kZWw9IG9wdGlvbiBhY3RpdmF0ZXMgdGhlIHNwZWFrZXINCiAgIC0NCg0KICAgQmVo
YXZpb3IgbWF0Y2hlcyBvdGhlciByZXBvcnRzIG9mIE1TSSBUaGluIGxhcHRvcHMgd2l0aCBBTEMy
NTYNCiAgIC0NCg0KICAgVGhpcyBzdWdnZXN0cyBhIG1pc3Npbmcgb3IgaW5jb3JyZWN0IEFMU0Eg
cXVpcmsgZm9yIHRoaXMgc3Vic3lzdGVtIElEDQoNCkV4cGVjdGVkIGJlaGF2aW9yDQoNCkludGVy
bmFsIHNwZWFrZXJzIHNob3VsZCBmdW5jdGlvbiBhcyBhIHN0YW5kYXJkIG91dHB1dCBkZXZpY2Us
IGFzIHRoZXkgZG8NCnVuZGVyIG90aGVyIG9wZXJhdGluZyBzeXN0ZW1zLg0KQ29uY2x1c2lvbg0K
DQpUaGlzIGRvZXMgbm90IGFwcGVhciB0byBiZSBhIHVzZXItc3BhY2Ugb3IgY29uZmlndXJhdGlv
biBpc3N1ZS4gVGhlIHByb2JsZW0NCmlzIGxpa2VseToNCg0KICAgLQ0KDQogICBJbmNvcnJlY3Qg
b3IgaW5jb21wbGV0ZSBBQ1BJL0RTRFQgaW5mb3JtYXRpb24gZnJvbSBNU0ksIGFuZC9vcg0KICAg
LQ0KDQogICBNaXNzaW5nIEFMU0EgcXVpcmsgZm9yIFJlYWx0ZWsgQUxDMjU2IG9uIHN1YnN5c3Rl
bSBJRCAweDE0NjIxNDM3DQoNCklmIG5lZWRlZCwgSSBjYW4gcHJvdmlkZSBmdWxsIGNvZGVjIGR1
bXBzLCBhbHNhLWluZm8uc2ggb3V0cHV0LCBvciB0ZXN0DQpwYXRjaGVzLg0KDQpUaGFuayB5b3Ug
Zm9yIHlvdXIgdGltZSBhbmQgZm9yIG1haW50YWluaW5nIEFMU0EuDQoNCkJlc3QgcmVnYXJkcywN
Ck8uICBMZW9uYXJkbyBQbGFuZXMNCg==
