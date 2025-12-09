Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF655CB0101
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:32:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B35F60216;
	Tue,  9 Dec 2025 14:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B35F60216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765287113;
	bh=V+2wzxizvaJZiatCqVYdAwekuUrM30j0ljDOHiuALKY=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RO9AGxXYRcl0CskCR2lJzXAF+ucOMPUYIzjQz/n7izWqe9x+5JaKzJZs6R7svors/
	 qPq0I+8FgFmyZq1CVgYVlJz0rGxKxCx66elF1ZzQfxC+jwhPS09GTKFi/fv8BmUe5C
	 Qk/RbSnKNAEPwRpph7kcdrxBQnaUaAr6Z4ihekcQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9CE5F80641; Tue,  9 Dec 2025 14:30:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA8D5F805D7;
	Tue,  9 Dec 2025 14:30:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC1BAF8028B; Tue,  9 Dec 2025 04:41:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F214F80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Dec 2025 04:41:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F214F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lCyng+jt
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-29555415c5fso59452485ad.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Dec 2025 19:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765251670; x=1765856470;
 darn=alsa-project.org;
        h=to:subject:from:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gp9MMQ5MA3UvaNZ57YRhMgRN4XVpN1ByLliro01UPCo=;
        b=lCyng+jt2oSK3zKvmVQhwG7bm7+jMlsBPI3c1Do631mqYy7yj9kPJlkeIwzrdol1Bc
         jq6CnH/TYfH7zUUxgMIpQnBUDg4VSODDFs8JT4WNhJBVH+LIVM2M4lzaLzqwOwzKd6Yh
         /n44ECBuKVZROkc5l/rN6Kf0XSHWyQCj2zDDVi9U0W8RDjn8MV8zUKviu3PHI31Zrdy+
         95bKAQuFkjkocan8hAwHevM7Eo+ccoNSo5Ah+ldJ3YC463+63MLCxpe9o0r3JTPXPcJV
         Ed9hpvk7UBgBuziSX2Ta+9jZnawlHGVh7l/t6xDG47fsVz47M1PVf9ZwEqQJlgPvilAp
         nJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765251670; x=1765856470;
        h=to:subject:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp9MMQ5MA3UvaNZ57YRhMgRN4XVpN1ByLliro01UPCo=;
        b=M3Dju3ub+jpCg5DoJH2brmKqp2mSp1ZeN+mg0aKrlid7kkufqm13rLubqsbpgIdq1F
         jmd3mwZZu6Mab83oK2XJCP8gyHtxX7BYwMvW2WmE85CsxPrnuvkeh8yny7H+4UhFWM7c
         nb1jz5pjWEQWfgz8fItIeCQijP/HDRzgzjXgH0bLrSgYd9w6og8oH6BUIlaCsfpq9hGE
         wPT/+YD+6xvdG0uPh0Zab5Qfq5uORTzoFhAPyE9zlzddHBcRvxsmlxbPmZKsdKN58j5W
         +NZyOsUhf07H1ErROtWQSnDY3W42wka9TXsZt4fh2GZXVawMqXUNR50wtv+L2oW3xT6A
         GiIw==
X-Gm-Message-State: AOJu0YySEI3qQIztOZZoosuNsCFl86bzJCwT1V30/Kuk3/FDvRx9CT5l
	RdJDEDg7p4YGHbfxFhsxWkxoZhV2E4CxviXJAtvj76Q1f+Hm1rAzlV7YjTQe1tIB
X-Gm-Gg: ASbGnctyiM0nwwJlBFpB8aDJaU4VmhVEq9fm+dpavg8XEiamIXiE+mR2TcBbtl0peVX
	gj+5k1OHavl3jEeDBFWZyDbXTb321FZL8pwIcyRUVcRyCQVlRZO7n2zsEF7egutsle1dcz0/Wl5
	oKg1Rp5mbjO61IJl8PKBCCGSbJn6UkG+MM341UR2atAQrKcSVYWJBhdFtdjAFHWab+hTrezhbQ0
	4rHn8N/4Bq4fHoFZ2/8fvb3tMx/AE7hvRGbhWHBvUtGruNU9rM22TajDqexxPmeRUimsQOgTpPV
	6QFAavdUOu4Zk9VBklAS0HYijXUGxvR4GFU75R+XbUBpDQ2vwa09H78JmL3X5Q1UaxINcONIaRC
	bsNIyJWLCPVMIL49ofwsCKkS93Uqo3U1cg+anKintPPe/AvdSoIxGM7KRY0vFs6ia9Ap6UsSS4j
	4Vo6OvSU0EKkncQBaEIA==
X-Google-Smtp-Source: 
 AGHT+IEFXkf6ETN7+r+kn7hEaUs25ubPVQhiTijQ4tJ6RdrnUHSRR3Nc8zQU+nbkekBaxipI82SFQA==
X-Received: by 2002:a05:7022:4426:b0:11b:65e:f35 with SMTP id
 a92af1059eb24-11e03162ea9mr6238807c88.7.1765251669190;
        Mon, 08 Dec 2025 19:41:09 -0800 (PST)
Received: from [10.14.0.2] ([156.146.54.200])
        by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11df7703bd7sm67824842c88.10.2025.12.08.19.41.08
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 19:41:08 -0800 (PST)
Message-ID: <d0b2f179-b7f8-43df-9615-5645835cb8ca@gmail.com>
Date: Mon, 8 Dec 2025 19:41:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Dustin Fenster <dustin.fenster@gmail.com>
Subject: BUG: snd_usb_audio: iFi Zen DAC 3 hangs on query, defaults to S16_LE
 (Fedora kernel 6.17.9-300.fc43.x86_64)
To: alsa-devel@alsa-project.org
X-MailFrom: dustin.fenster@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3UJN3H44POAOD7PGRHANB6Y66YSUQD7C
X-Message-ID-Hash: 3UJN3H44POAOD7PGRHANB6Y66YSUQD7C
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:30:26 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UJN3H44POAOD7PGRHANB6Y66YSUQD7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sDQoNCg0KVGhlIGlGaSBaZW4gREFDIDMsIGNvbmZpcm1lZCBhcyBhIGhpZ2gtc3BlZWQg
ZGV2aWNlLCBpcyBmYWlsaW5nIHRvIA0KcmVwb3J0IGl0cyBmdWxsIGNhcGFiaWxpdGllcyB2aWEg
fGFwbGF5IC0tZHVtcC1ody1wYXJhbXN8IChpdCBoYW5ncyksIA0KYW5kIGF1ZGlvIHBsYXliYWNr
IGRlZmF1bHRzIHRvIHRoZSB8UzE2X0xFfCBmb3JtYXQgaW4gDQp8L3Byb2MvYXNvdW5kLy4uLi9o
d19wYXJhbXN8IGV2ZW4gZm9yIDI0LWJpdCBzb3VyY2VzLg0KDQojDQoNCipSZXByb2R1Y3Rpb24g
U3RlcHM6Kg0KDQogICoNCg0KICAgIERpc2FibGUgUGlwZVdpcmUgc2VydmljZXMgKHxzeXN0ZW1j
dGwgLS11c2VyIHN0b3AgLi4ufCkuDQoNCiAgKg0KDQogICAgUnVuIHxhcGxheSAtRCBodzpYLFkg
LS1kdW1wLWh3LXBhcmFtc3wgKEhhbmdzKS4NCg0KICAqDQoNCiAgICBTdGFydCAyNC1iaXQgYXVk
aW8gaW4gU3RyYXdiZXJyeS4NCg0KICAqDQoNCiAgICBPdXRwdXQgb2YgfGNhdCAvcHJvYy9hc291
bmQvLi4uL2h3X3BhcmFtc3wgc2hvd3MgfGZvcm1hdDogUzE2X0xFfC4NCg0KIw0KDQoqS2V5IERp
YWdub3N0aWM6KiBXaGVuIGZvcmNpbmcgdGhlIGZvcm1hdCB3aXRoIHxhcGxheSAtRCBodzpYLFkg
LWYgDQpTMzJfTEUgLi4ufCwgdGhlIHBsYXliYWNrIGlzIHN1Y2Nlc3NmdWwgYW5kIHxod19wYXJh
bXN8IGNvcnJlY3RseSBzaG93cyANCnxmb3JtYXQ6IFMzMl9MRXwuDQoNCiMNCg0KKkhhcmR3YXJl
IElEOirCoElEIDIwYjE6MzAwOSBYTU9TIEx0ZCBaRU4gREFDIDMgKGlGaSBaZW4gREFDIDMpDQoN
CiMNCg0KKkxpbms6KiANCmh0dHA6Ly9hbHNhLXByb2plY3Qub3JnL2RiLz9mPTUwNDVkNjI0YTc0
MDQzNTdiODZkNmM1ZWJiYmM2MjJlMmE3YmFjZmMNCg0KDQpUaGFua3MgaW4gYWR2YW5jZSwNCg0K
DQpEdXN0aW4NCg0K
