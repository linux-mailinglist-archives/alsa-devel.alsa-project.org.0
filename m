Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 087C59FDEDB
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Dec 2024 13:57:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D7BD60541;
	Sun, 29 Dec 2024 13:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D7BD60541
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735477046;
	bh=npYCSgoW1gdPfM1hQzMQf927GylO/JnvZo254tz2+hc=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cPD62Bn4azIEoWUXnUN8APZcL6QANoDs7BSPZuuBOUdlJFnozCLz2+MDqVejld0Jm
	 Y7D/yQ10Vzh0ophx8S912huNaPpN3B5I+l9PpsA4wEA0qhnC5v9WD0ppbkkej0dFag
	 lp2NTNb9jQFJup7ovLeuEXaQAh9re7ulB/CZFBE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AE03F8060B; Sun, 29 Dec 2024 13:56:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ECC6F80610;
	Sun, 29 Dec 2024 13:56:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEB65F8020D; Thu, 19 Dec 2024 00:24:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2224F80038
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 00:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2224F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NsPjBuVD
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2156e078563so1826135ad.2
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Dec 2024 15:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734564254; x=1735169054;
 darn=alsa-project.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PXuID4VTZ7lHRdSCkbJZw/i2A8zGzQNucm+W+83Q7zs=;
        b=NsPjBuVDKV968zoGjaqAQRG9iHvREEN1tgUOtQZD6I74CFlZUijR1ZvPct6oW6tX1j
         q8Rug2mFl3casstUkup3PyUL7YdOSbTKAJklC/zEFn+d4BkeXPYKjxvxXfFWgSlMJTJA
         +UIKVQpZXloVm7Asqsj4KAvKXiSsOXrmtRPatZhO6pVVhonS20rBM2r5QAbqu3XNSdTa
         SVEv+Y+HiYzxA4OVa1Nb7ZV+bC60eUvMJuteUU21ZPcZ6rBO6XLIyGQFPMrUBgKfdtI+
         co0q5rZLwjRTZGR82jDtRV5KWrP3V4n0ClPldKNsZY4KI4+h/Q2XyoYBkRET03JfED8Q
         +eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734564254; x=1735169054;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXuID4VTZ7lHRdSCkbJZw/i2A8zGzQNucm+W+83Q7zs=;
        b=rfbc+fdhdEXniwWbs1G2FgR2PvZgI9rjO2Fkzd9GLbas7L1bo/bMfcgDMq0lGEbITS
         jWv/lwuHYLg2O+IgH/LfBvWu5BkwQCWhkP13xFih1xgxk2Tz6CVfrsqihUG+VAFbHWPR
         SjYNcFAAkXFJk9j31m6OxJ3UUq3ebr5WtcHSBL62sJ9/cIG/pc+1oXlncyqc3ko5wyBQ
         5L9FOotO3U0OxnIBrJdCRbUPlKnmWCpNFYFzHgKrVJx8N3i3Q/N/msgrXFIKqVrrWrGB
         8x4kTs7gpRk/BaljKtqfy1Op3IftpG87f6d7XvGwT7mLwnyvlx0vJBfo6sAVtpky2MRl
         vGIQ==
X-Gm-Message-State: AOJu0YyqVrJ7An4k6KuO8VL5znnDnl65wRgBdVLYKiSLdYZlpc5uCcOV
	6THzpLX2uGXYu9gQMzHRi/fTYRC4cBhBkP3Lq9/2YAPUpQRFxP3wiJsPmDem
X-Gm-Gg: ASbGnctTj/TXLjTpzdyG2o5wuRM6DmGkyG2jnNn8v87ZncOyYvisE4Cc/dF0FjRb614
	uTzuaqlwS0ihtRajBOktLY58q4FoFIKSNSH0AwvNoFH0Yn9sbJJGRqEJlSduY0M4IZXXAex1Z+V
	3k38MdnK20HQB4kjUzq/WxN7VS++G9CeXgaYYVPr7wJMDmMcoow1pkQ0xrn3qGKXldQYMiHnrO9
	+DFSdzgonq3I3x/NyfdEeQX87E+KSgxiWE/chScpnwHwDjWpZ7zLpg6OQ==
X-Google-Smtp-Source: 
 AGHT+IFg50MnvBOTX9o7KVFpBQmrO88Uxh/Wf7/L943S1sXY9tPERzV8kPumNeck3nYxrmJmMm6O3g==
X-Received: by 2002:a17:902:e750:b0:211:fcad:d6ea with SMTP id
 d9443c01a7336-218d726fb1fmr50315235ad.45.1734564253720;
        Wed, 18 Dec 2024 15:24:13 -0800 (PST)
Received: from [10.0.0.10] ([181.74.164.198])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc96ea8fsm778625ad.89.2024.12.18.15.24.12
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 15:24:13 -0800 (PST)
Message-ID: <cb5ca1c7-64a3-43df-b506-db07a2b5f790@gmail.com>
Date: Wed, 18 Dec 2024 20:24:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: es-CL
To: alsa-devel@alsa-project.org
From: Correo Alternativo <correocebe@gmail.com>
Subject: Ask snd_seq_set_client_midi_version
X-MailFrom: correocebe@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MYI663ESPPCJZXQ45YDZ5DHNDR64PJJO
X-Message-ID-Hash: MYI663ESPPCJZXQ45YDZ5DHNDR64PJJO
X-Mailman-Approved-At: Sun, 29 Dec 2024 12:56:09 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYI663ESPPCJZXQ45YDZ5DHNDR64PJJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksIEknbSB0cnlpbmcgb3V0IE1JREkgMi4wIGFuZCBmb3VuZCBhIHByb2JsZW0sIHdoZW4gdXNp
bmcgDQpzbmRfc2VxX3NldF9jbGllbnRfbWlkaV92ZXJzaW9uDQoNCldpdGjCoFNORF9TRVFfQ0xJ
RU5UX0xFR0FDWV9NSURJIEkgZ2V0IHRoZSBmb2xsb3dpbmcgc2VxdWVuY2Ugb2YgZXZlbnRzIA0K
d2hlbiBjb25uZWN0aW5nIGEgbWlkaSBkZXZpY2UgKHVzaW5nIHRoZSBtZXRob2Qgc25kX3NlcV9l
dmVudF9pbnB1dCBvciANCnNuZF9zZXFfdW1wX2V2ZW50X2lucHV0KSAodGltaWRpdHkgY29tbWFu
ZDp0aW1pZGl0eSAtLWludGVyZmFjZT1BIA0KLS1idWZmZXItZnJhZ21lbnRzPTIsOCAtLW91dHB1
dC1tb2RlPXMxbCAtLXNhbXBsaW5nLWZyZXE9NDQxMDApOg0KDQpTTkRfU0VRX0VWRU5UX0NMSUVO
VF9TVEFSVA0KU05EX1NFUV9FVkVOVF9QT1JUX1NUQVJUDQpTTkRfU0VRX0VWRU5UX1BPUlRfU1RB
UlQNClNORF9TRVFfRVZFTlRfUE9SVF9TVEFSVA0KU05EX1NFUV9FVkVOVF9QT1JUX1NUQVJUDQoN
CkJ1dCB3aXRoIFNORF9TRVFfQ0xJRU5UX1VNUF9NSURJXzFfMCBhbmQgU05EX1NFUV9DTElFTlRf
VU1QX01JRElfMl8wIEkgDQpkb24ndCBnZXQgdGhlIFNORF9TRVFfRVZFTlRfUE9SVF9TVEFSVCBl
dmVudHMsIEkgb25seSBnZXQgdGhlIGZvbGxvd2luZzoNCg0KU05EX1NFUV9FVkVOVF9DTElFTlRf
U1RBUlQNClNORF9TRVFfRVZFTlRfU1lTVEVNDQpTTkRfU0VRX0VWRU5UX1NZU1RFTQ0KU05EX1NF
UV9FVkVOVF9TWVNURU0NCg0KSSBkb24ndCBrbm93IGlmIEknbSBhc2tpbmcgdGhpcyBpbiB0aGUg
cmlnaHQgcGxhY2UsIHdoYXQgbWlzdGFrZSBhbSBJIA0KbWFraW5nPyBKdXN0IGJ5IG1vZGlmeWlu
ZyB0aGF0IGl0IHN0b3BzIHdvcmtpbmcuDQoNCg0K
