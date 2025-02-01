Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 599FCA37F64
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E436E6028E;
	Mon, 17 Feb 2025 11:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E436E6028E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739786926;
	bh=olXMtGIvvn9TPHslwVJS3u4q9v7cjx4B2v+mo2OSoVs=;
	h=Date:Subject:References:To:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=D6jE3457ruPKqNa3fJiaBi+ONM44dg24Z3Oxlvnowp1FtFNCi2L+sr60F/vH24ZqL
	 XsnoHFc+RAJA4XK2NQwgLdwIznBx6PifU+yPp+PluLs2v18OTPU5lIPmtnI4PmPHrd
	 IhohsdhE8luTX0qfakpYZ4Vmt1gHkTs5AM1Vmjho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D36DF8063D; Mon, 17 Feb 2025 11:07:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C59FF805B4;
	Mon, 17 Feb 2025 11:07:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57414F8049C; Sun,  2 Feb 2025 00:12:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97ED9F8014B
	for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2025 00:11:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97ED9F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TrtiiJ/l
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-216728b1836so53442605ad.0
        for <alsa-devel@alsa-project.org>;
 Sat, 01 Feb 2025 15:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738451514; x=1739056314;
 darn=alsa-project.org;
        h=in-reply-to:from:to:references:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9aoraTU5MC1EazB870bluwr2bm6kOCEcbME3ORLpq4=;
        b=TrtiiJ/lXtlOV3EwlqnOxO0D6JhXbjhhKMvdVu4ZNDILyaEwX4Pz8wEn0l7kW99hdg
         ikH8ThA4EORNnLDBmFjUXlkY4tudncdiXVbSl1lkW/FrSKegRJC876GeFhV+nFWG1LZC
         sYFiFy5vO0N41EMGmg3n+NlNtEYVL/Myfz/ATUTGQig3tlQWnmTZU3pvA4RVpXkzyrgj
         Z9bQcCibVv/RWmRzsOIuSviE3OLmTLPJcACYcDRL4Nibku00CLMO7lCF+4WttkBBtNc8
         WR1ar9jsAzEdgoMqf7xXsGFaNgsimNLXqqBvVEfAeGnncjtgyVLrQp+wq8rkbt4akeOG
         0bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738451514; x=1739056314;
        h=in-reply-to:from:to:references:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W9aoraTU5MC1EazB870bluwr2bm6kOCEcbME3ORLpq4=;
        b=hGAczoB+H4kagZnIZc7gVoK7GnmsbstiktRvc7eVtPWkW4/OpeMirWInPyAjtp9o8m
         bYq+3tJ/9dgPrMFVDduRLrOfHEHI5w7vtILnddcyY9XQZRMOmMTPVOz2szhOxJxIRfUW
         2v0q3uOnqwFL0uRpnsrs0HjyEgHcZafskskZmxnzScgTqz137SXJOxrqKU61DUvxJKZu
         OhO+xqxqn3A05JDBjkGddJHK43uqZ4JNUV17gvXzTSYcJEZfaC09f/CLu+yfp5rqgTeG
         XoSnCSk7RkkRucegN3aZFZQWLlxMrbRBYOp/2bGI+kSqyDEclUi9/0QDSP2nmL5Iv29e
         uuuw==
X-Gm-Message-State: AOJu0YwlqIlgM/wwd8R4A5oyk35SD5y4JK4OGRU/7GvlW96FZgEAZVzA
	anSxB3j3hLkzIFRQ8YdDjvxJIqbXaWPTGWdDlIm7g9NHX2yRZ/w1LiQjP+Pz
X-Gm-Gg: ASbGncuD9pNv6P1ikuTz5UPJ3jw+8OsTOyVBRGfQubahl8ZV0Mftznb7lUGvF/O08IQ
	eG82oyas+sfH+H1+vxA+S6EZgRIpclsznWAu9bFT8eH0uvrAFw8wYwvdSileehZUepgTRFPhQau
	gW7YOJ6hY41oaOXwZQCeAVdyzwMVknVSwasOpd37pGI3GnAv3WImwnzYj2GgIqpj54+Ar1j5HlO
	0EoYms2x2LrsL8SwmT2+CcuiBnIFv4Iv+eoNx/pcmiLJ78VcV09KNEg6LXgp3I/LFu0+P4aeFb+
	lpYAeiLwS2NjaQ==
X-Google-Smtp-Source: 
 AGHT+IHcTbViXL1GGvtwIouh+cKBdpSsTO1ljuWLAn9nwQY7JJUDRFIO91xQWR7REclQkg1q5DP35g==
X-Received: by 2002:a05:6300:197:b0:1e5:c43f:f36d with SMTP id
 adf61e73a8af0-1ed7a5f901emr29508036637.18.1738451513679;
        Sat, 01 Feb 2025 15:11:53 -0800 (PST)
Received: from [10.0.0.10] ([179.60.73.88])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-acebddbb0d4sm5236268a12.10.2025.02.01.15.11.52
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 15:11:53 -0800 (PST)
Message-ID: <b77a2cd6-7b59-4eb0-a8db-22d507d3af5f@gmail.com>
Date: Sat, 1 Feb 2025 20:11:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Possible bug with snd_seq_event_input_pending
Content-Language: es-CL
References: <cb5ca1c7-64a3-43df-b506-db07a2b5f790@gmail.com>
To: alsa-devel@alsa-project.org
From: Carlos <correocebe@gmail.com>
In-Reply-To: <cb5ca1c7-64a3-43df-b506-db07a2b5f790@gmail.com>
X-Forwarded-Message-Id: <cb5ca1c7-64a3-43df-b506-db07a2b5f790@gmail.com>
X-MailFrom: correocebe@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DIUDXZFATUMEV3JDE44J64ZCVWOP7GYP
X-Message-ID-Hash: DIUDXZFATUMEV3JDE44J64ZCVWOP7GYP
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:07:31 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIUDXZFATUMEV3JDE44J64ZCVWOP7GYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksIEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGEgYnVnIG9yIG5vdCwgYnV0IEknbGwgcmVwb3J0
IGl0IGluIGNhc2UgaXQgaXMuDQoNCklmIEkgY29uZmlndXJlIG15IGNsaWVudCBhcyBmb2xsb3dz
Og0KDQpzbmRfc2VxX3NldF9jbGllbnRfbWlkaV92ZXJzaW9uKHNlcSwgU05EX1NFUV9DTElFTlRf
TEVHQUNZX01JREkpOw0KDQpzbmRfc2VxX3NldF9jbGllbnRfdW1wX2NvbnZlcnNpb24oc2VxLCAw
KTsvL0kgZGlzYWJsZSB1bXAgY29udmVyc2lvbg0KDQpBbmQgdGhlbiBJIHNlbmQgYSBtaWRpIGV2
ZW50IGZyb20gYSBNSURJIDIuMCBkZXZpY2UsIHRoZSANCnNuZF9zZXFfZXZlbnRfaW5wdXRfcGVu
ZGluZyhzZXEsIDEpIGZ1bmN0aW9uIHdpbGwgbm90IHJlc3BvbmQgdW50aWwgaXQgDQpyZWNlaXZl
cyBhbnkgb3RoZXIgbGVnYWN5IGV2ZW50Lg0KDQpOb3cgSSBrbm93IHRoYXQgd2l0aMKgU05EX1NF
UV9DTElFTlRfTEVHQUNZX01JREkgSSBzaG91bGRuJ3QgZGlzYWJsZSB1bXAgDQpjb252ZXJzaW9u
LCBidXQgSSBleHBlY3RlZCBpdCB0byByZXR1cm4gMC4NCg0KVGhhbmsgeW91DQo=
