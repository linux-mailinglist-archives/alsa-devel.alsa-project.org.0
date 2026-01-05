Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC80KvNWqGlutQAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:59:47 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD09203840
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:59:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E326027B;
	Wed,  4 Mar 2026 16:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E326027B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772639986;
	bh=JxDqKkh/sY+XnscSiasfxuWcqG/DeH+4GQqQk/qprIo=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CquWGci4FQ1zsyE2dSgeHB1qXc1BjgxzoOPWne9s6IaVyqCGPSvM9Z03o241HQ7Cc
	 WWvCU2hK15HEk612diZ4Tdt/BnWY4zrQSTF24iykV80xXiu+bDiDqES5Uz0hV8CS/C
	 IGH56XYOd06POVGLTk92C86StaacUxaXAcIpugWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C1F9F80691; Wed,  4 Mar 2026 16:58:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A5BF80684;
	Wed,  4 Mar 2026 16:58:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EF5EF802DB; Mon,  5 Jan 2026 14:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F004F80154
	for <alsa-devel@alsa-project.org>; Mon,  5 Jan 2026 14:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F004F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fglGKRVe
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so2370244166b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Jan 2026 05:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767618208; x=1768223008;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ezvk7inxruX+c6DMdHvS5cVcNzhoiBBY+ELJo9M0dA=;
        b=fglGKRVeadz8q/jJzvMrDJoj/ooXyZlfKZIaaLjwPxtdG14kR6PcV6BeRUc7xBG5Wi
         vQKziQAkGi6rwXF+F8D8jRClwKbA8D4pNrWZfGDlDPCPHJ+g6DXe9lyujz+20HSqVxu/
         8mK1OHOGEOIE3HDWCmRtsU5s4vQDI+bPxVkrBKC3Vdi0NQkfInOQ2ZXk6vN4mYdhUFkX
         ChKcIJLPecRaMD6l17b0gyCtFCxGunTUoVIxT/zMnrN1Ehq8Vj4ml3HqOzbyVUHikWMH
         q/BRPlm/9k/jR02qg2+0bG931EhzKgmMbcwwnSteTpalafrTJnY8z5Hhd12UiYQplaV4
         McOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618208; x=1768223008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ezvk7inxruX+c6DMdHvS5cVcNzhoiBBY+ELJo9M0dA=;
        b=u7ciGv18BRZI/YyZNA2o2pa6R7yJPiMx7R5qjYO832qWEuZR8VEaZh7EAR9ocCRt+O
         UIfPFfeU90YOCjCoVSjfIpjJJMPR6rlTYIbyVZhaOe4v8fT1PXlIQ8g/owkkuMdcxFnr
         SdPwb9DSAf5TNB7oo6TsWvHJUU8V+3Kgj709XvO+3/hlIXUd6i4QEeHgkffoTKJgiS5V
         xz9eb/tdl6J2x1TIIXjwpUclJEl1sxMC/oRzvcBlYKW6OqYQAbejejDTyC3kHxIJJEUT
         jWK9/Tq4iLC2SPuc9RwNc0DUOAFrptwX8s1eeitN8Y6A5RSDbeqFHnWqAlkuHX5pFf+8
         PLOw==
X-Gm-Message-State: AOJu0YwD9CnCPg1tos0H0wmlT4rWDKzGRH4ifENIUgTn06GKDvip9YJ7
	K+Nbbm7Yrjhf1El8vLmP1tzTVfRk52ya9IsPMVx5EwRbWu8Wd8utetGJAn5grJ6xO3NQfrjuwol
	N+EARhfBFQT3RIXYkJVafzfLRZCzy6EZ90d9vnJ0=
X-Gm-Gg: AY/fxX44xfrhHNEKbGgBu/vA6U6ZLBBAfzFvJGm4p9fTJJa5atMzK2NZjEJReqKLZ6H
	9ePFlhoROsEGckw5PImNZNizqqYssOcsfnYx0u/i9+6pnmp0UqGMOkKB4ZAWcJPc7KeW6hGKkE3
	IUEPtS218sZ8YrotW0H1zHmVu9Fp2Cj3+LzRdg+clA8hUu26IrvOl9ItDSMRaSP+v0weKppI+ss
	zY3denKXdlOdqARjmmrcezfq80pkDHiES64ztgZ/XgTk1rFeRGHBjw/qo4twLUp2Y2YrgMA0WV6
	o5TH5xJNDjhP3bIf6yqNJQyMrRrU
X-Google-Smtp-Source: 
 AGHT+IGGg37yGASIkKMx5r8vprtc6QE+tCZG6Czocz/mSWSHWMqXoPxzvc3IcRfB63BeMojSLazmBI7kA29WReTw77A=
X-Received: by 2002:a17:907:d07:b0:b83:73ee:993b with SMTP id
 a640c23a62f3a-b8373eea4f2mr2657269766b.57.1767618208228; Mon, 05 Jan 2026
 05:03:28 -0800 (PST)
MIME-Version: 1.0
From: "Steveo's Corner" <brettwstevens69@gmail.com>
Date: Tue, 6 Jan 2026 00:03:17 +1100
X-Gm-Features: AQt7F2rhXbhH1ets094_oGltHeatt02_yvEBqMCvcKR-DYhFdea-EYgNW-Yplto
Message-ID: 
 <CAFW3f4BC5ez4-=r3ZzjorBHszqQeARtSUBXgjqD5OVEbRDEa_Q@mail.gmail.com>
Subject: [BUG] Lenovo Yoga Pro 7 14ASP9 (83HN): ACP stays in HDA mode,
 SoundWire amps not enumerated
To: sof@lists.linux.dev
Cc: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: brettwstevens69@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7DVSVTV5FYI6TOBRO7CKHJAYACFXTE7T
X-Message-ID-Hash: 7DVSVTV5FYI6TOBRO7CKHJAYACFXTE7T
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:58:28 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DVSVTV5FYI6TOBRO7CKHJAYACFXTE7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 5CD09203840
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	DATE_IN_PAST(1.00)[1394];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sof@lists.linux.dev,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[brettwstevens69@gmail.com,alsa-devel-bounces@alsa-project.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brettwstevens69@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,mail.gmail.com:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

Title

Lenovo Yoga Pro 7 14ASP9 (83HN): internal speaker amplifiers not
detected, SOF/SoundWire not enabled, audio falls back to snd_hda_intel

________________________________

Affected subsystem

ALSA / ASoC / SOF (AMD ACP, SoundWire)

________________________________

Hardware

Vendor: Lenovo

Model: Yoga Pro 7 14ASP9

Product Name (DMI): 83HN

Baseboard: LNVNB161216

CPU: AMD Ryzen AI (Strix / Strix Halo generation)

Audio codec: Realtek ALC3306 (external smart speaker amplifiers over SoundW=
ire)

________________________________

Software

Distribution: Ubuntu/Kubuntu (tested)

Kernel tested:

6.17.0-8-generic

(same behaviour expected on 6.18.x)

PipeWire/WirePlumber userspace (default)

________________________________

Problem description

On the Lenovo Yoga Pro 7 14ASP9 (DMI product name 83HN), the internal
speaker amplifiers are not detected by Linux.

The system consistently falls back to legacy HDA (snd_hda_intel),
SoundWire is never instantiated, and the external smart speaker
amplifiers are never enumerated. As a result, internal speakers are
incomplete or non-functional (bass speakers missing).

Windows works correctly, indicating a missing Linux enablement rather
than firmware or hardware failure.

________________________________

Expected behaviour

AMD ACP should bind to SOF

SoundWire bus should be created

External speaker amplifiers should enumerate

Internal speakers should function normally

________________________________

Actual behaviour

ACP remains in non-SOF mode

Audio devices are bound to snd_hda_intel

No SoundWire devices appear

dmesg | grep -i soundwire produces no output

Forcing SOF via module options does not work

________________________________

Evidence

DMI information

System Information
        Manufacturer: LENOVO
        Product Name: 83HN
        Version: Yoga Pro 7 14ASP9
        SKU Number: LENOVO_MT_83HN_BU_idea_FM_Yoga Pro 7 14ASP9

Base Board Information
        Manufacturer: LENOVO
        Product Name: LNVNB161216
        Version: SDK0T76574 WIN

________________________________

lspci -nnk (audio devices)

62:00.1 Audio device [0403]: AMD Radeon High Definition Audio [1002:1640]
        Kernel driver in use: snd_hda_intel

62:00.5 Multimedia controller [0480]: AMD Audio Coprocessor [1022:15e2]
        Kernel driver in use: snd_acp_pci

62:00.6 Audio device [0403]: AMD Family 17h/19h HD Audio Controller [1022:1=
5e3]
        Kernel driver in use: snd_hda_intel

SOF modules are present but not bound.

________________________________

SoundWire check

dmesg | grep -i soundwire
# (no output)

________________________________

Attempted workaround (did not help)

Tried forcing SOF and disabling DMIC via modprobe:

options snd_hda_intel dmic_detect=3D0
options snd_acp_pci enable_sof=3D1

Result: no change; system still binds to snd_hda_intel.

This suggests SOF enablement is gated by a missing DMI machine-driver
quirk, not by module parameters.

________________________________

Analysis / hypothesis

This appears to be a missing or incomplete DMI quirk for Lenovo Yoga
Pro 7 14ASP9 (83HN) in the AMD ASoC machine driver:

ACP =E2=86=92 SOF transition is not enabled for this DMI

SoundWire topology for Realtek ALC3306 + external smart amps is never selec=
ted

A small DMI-based quirk selecting the correct SOF topology should
resolve the issue.

________________________________

Request

Please advise whether:

A DMI quirk for LENOVO / 83HN exists but does not enable the speaker
amplifier topology, or

This system requires a new quirk entry to enable SOF + SoundWire

I am happy to test patches if needed.

Respectfully
Brett Stevens
