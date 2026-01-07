Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBEICtBWqGlutQAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:59:12 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF052037F4
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:59:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB926027D;
	Wed,  4 Mar 2026 16:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB926027D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772639951;
	bh=/VYWiUlRgKCajGtlhdxXVfCRQ3j/6gNEhkmlSY+yqx4=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vnkAQqsMHKTTFhJm3Od3pQXwbVicdd8Z9GqvJkp/YoGKG0ohpNnVKPhVHhYcq50Am
	 zRhpUPWH+dd2eRXfgYFZs2Na4St6Cm4PMc5ZOCFQrzwiNhBIRWESRV7eRAmDAzRZ6C
	 98jcUQXKfn13T8RA8qO9oHXV6hM/VyK9PPV2uu0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD5C8F8062F; Wed,  4 Mar 2026 16:58:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44ABFF8062E;
	Wed,  4 Mar 2026 16:58:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19CD5F80448; Wed,  7 Jan 2026 15:09:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7FCFF80088
	for <alsa-devel@alsa-project.org>; Wed,  7 Jan 2026 15:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7FCFF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YK9rhyzP
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so396604566b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jan 2026 06:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767794977; x=1768399777;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/VYWiUlRgKCajGtlhdxXVfCRQ3j/6gNEhkmlSY+yqx4=;
        b=YK9rhyzPbh8SBZTBDh7567kHXmTCF3fNS6trW9bykI9jAMAeTv75C616Lt4r5bnX/h
         NaAPWXo6mGrzZ7njtJnNKFk8MJW6JYtQKyG+xX7lU+p8BKipdI9T8s62/OZp1ltinBm3
         a9uqjeytsdkiVj6+sV0sTH961xKEroExg4NcUNciyJ8uDqsw8mhtBMMiyilcjNAEMSs2
         McIDVqBI4QZ74QA3IdENwIWA/CkyHYMcWdCQlAO94tUu0EDDhlcwxZz2O5esz6bsKHCB
         iuQ1y1uLL2N9iI8pIrL3Y7u9ea74MwDkBO9bf7Mu/DHM8w484HFHPh+YC97oQHjCSRT7
         bnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794977; x=1768399777;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VYWiUlRgKCajGtlhdxXVfCRQ3j/6gNEhkmlSY+yqx4=;
        b=jbkfW8oKoCutDrFg2fPCr4vzl552aqoHGGuPl1MfOrjnSmokx1CEaKJ/uFmXH7xYhf
         QHM/g67bWzrTwb8sLfpik6UKtwpW7b4yehPAiSCSuTVS8IHwR6tH88LUx2KDTIyMJ4jU
         10WM+gAa0RVyHE3R8Jhf3e2lUAkxkJuVD1ofWsgH8jb6CMQIF1Sqt1bVZVqcIbo+LPeD
         CNtyFxoWzgDaNiRysJhRC071yHsOrgKBqtI7Bhz7SkplrVOKPQz8+K7HMMex7tMBjhtM
         KWlLRS8IpyUReZa8j28DrIesH1oSyv+gkHYlyLx6gECuFHoPpJWZdqhY54YwSSh1gsyY
         5voA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPActXLaN8a9FziwKZmZy0NUXx3Uk4jdYKc1E9nDnH/PoJAP8uKivSFmmZqDlYxJjrzzURFwG7w8Pv@alsa-project.org
X-Gm-Message-State: AOJu0YyxOYb8EL+eUUgKzUzoCoii6bfI21o8CHy4zRh2CtkjxudN3o3x
	DsMm+egsslqMdpY1OONT8dp6hEg8oGhmK8qWIDP5mIhxhNEex6e2qJzj34X7pmKVXI7ivtr1RXd
	CvzJibGJrXCjxcXAQDF6kO3Y9BxTk29WUQLTq
X-Gm-Gg: AY/fxX6e9gu7fQCGkl6GINC84EtmRJoHqKv6B2zU3LqK6zKWh1xen1+qPVe8m2y6D4z
	XC86V8s9JccXyzx/k/VttJa1Vdu0Clt2jcqozuNJpLMurh4Msep11nImQyrXjqkMPdVHwcAK9iu
	Ip/rLETQah9STiIMyNt/5GyQmS+rMmOTfWQk2oSMtLPn/FnA0hqioay4q2UGAfDGbODQwKXKRn3
	Kh+0ZNCgMN6NwP48k3N0PXUGDKevOBRBuIPohDTJgJpfHqhJkKRL/SbrthOwklosqmN7fIikQ==
X-Google-Smtp-Source: 
 AGHT+IHB1ElVLKUSfybEW8BNvkAIlPOaoJx/n7ohxMjm45b+TUZUmz97L0ViKc0aq9l8mzOd8JIwzjAVbHviBOrx/O0=
X-Received: by 2002:a17:906:6a17:b0:b76:2517:6927 with SMTP id
 a640c23a62f3a-b8444f96644mr300137466b.43.1767794977053; Wed, 07 Jan 2026
 06:09:37 -0800 (PST)
MIME-Version: 1.0
From: Simone Flavio Paris <simone.flavio.paris@gmail.com>
Date: Wed, 7 Jan 2026 15:09:10 +0100
X-Gm-Features: AQt7F2q_NMfMrHAxqv_gXcfGQz0UA6xO4k2pT_5mE3o1VekhFBiY9XBCUjS48RE
Message-ID: 
 <CAG=QoF1cr3cFzgjRicLSr7KbwygQaHju1WKE_LK_U9Qmsgv13g@mail.gmail.com>
Subject: [BUG REPORT] arm64: dts: qcom: x1e80100: Audio routing issues on
 ThinkPad T14s Gen 6
To: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: simone.flavio.paris@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TG3SH7XGCK2UWCELYR5OEM3D6K5FXABQ
X-Message-ID-Hash: TG3SH7XGCK2UWCELYR5OEM3D6K5FXABQ
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:58:18 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TG3SH7XGCK2UWCELYR5OEM3D6K5FXABQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: DAF052037F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	DATE_IN_PAST(1.00)[1345];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[simoneflavioparis@gmail.com,alsa-devel-bounces@alsa-project.org];
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
	FROM_NEQ_ENVFROM(0.00)[simoneflavioparis@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,mail.gmail.com:mid,alsa-project.org:dkim]
X-Rspamd-Action: no action

Hi everyone,

I am testing the latest experimental kernels on the Lenovo ThinkPad
T14s Gen 6 (Snapdragon X Elite).

I have encountered a specific issue with the audio subsystem: while
the DSP and ALSA stack appear fully functional (firmware loads,
streams are processed without errors), there is no analog output on
speakers or headphones.

I have performed extensive diagnostics and manual mixer path
configurations to rule out userspace/UCM issues. Below is a detailed
technical report of the current status, routing attempts, and logs.

I hope this information helps in refining the machine driver or
topology profiles for this specific device. I am available to test
patches if needed.

[Technical Report]

Target Hardware: Lenovo ThinkPad T14s Gen 6 (21N1) - Snapdragon X
Elite (X1E80100)
OS: Ubuntu 25.10 (Debian-based)
Kernel: 6.17.0-8-generic #8-Ubuntu SMP PREEMPT_DYNAMIC aarch64
Audio Topology: Qualcomm ASoC / SoundWire / WSA884x (Smart Amps) /
WCD938x (Codec)

1. Executive Summary

Despite successfully loading ADSP/CDSP firmware and creating a valid
ALSA UCM profile, audio playback results in absolute silence on both
Speakers and the 3.5mm Jack.

speaker-test executes successfully (consuming periods/buffers) without
I/O errors on hw:0,0 (MultiMedia1) and hw:0,1 (MultiMedia2),
indicating the DSP is correctly processing the PCM data. However, the
backend widgets appear to remain in a muted or power-down state
despite manual enablement.

2. Current Status

Firmware: Loaded successfully from
/lib/firmware/qcom/x1e80100/LENOVO/21N1/ (qcadsp8380.mbn).

ALSA Detection: Card X1E80100LENOVOT detected correctly.

Mixer Controls: Accessible via amixer. Note: Many controls have
verbose prefixes (e.g., WSA WSA_RX0 instead of just WSA_RX0).

Symptoms:
speaker-test -D hw:0,1 -c 2 -r 48000: Runs successfully, time periods
elapse. Result: Silence.
No dmesg xrun or I/O errors during playback after correct routing is applied.

3. Troubleshooting & Routing Attempted
I manually configured the mixer paths using amixer commands to bypass
potential UCM misconfigurations. I confirmed the routing logic against
the topology file.

A. Speaker Routing (WSA884x)
Path established: MultiMedia1/2 -> RX_MACRO -> WSA_MACRO -> WSA_RX0/1
-> SpkrLeft/Right

Specific Mixer Settings Applied:
cset "name='WSA_CODEC_DMA_RX_0 Audio Mixer MultiMedia2' 1"
cset "name='RX_MACRO RX0 MUX' 'AIF1_PB'"
cset "name='RX_MACRO RX1 MUX' 'AIF1_PB'"
cset "name='WSA WSA RX0 MUX' 'AIF1_PB'"
cset "name='WSA WSA RX1 MUX' 'AIF1_PB'"
cset "name='WSA WSA_RX0 INP0' 'RX0'"
cset "name='WSA WSA_RX1 INP0' 'RX1'"
cset "name='WSA WSA_RX0 Digital Volume' 84"
cset "name='WSA WSA_RX0 Digital Mute' 0"


Analog/Amp Enable Sequence Forced:
cset "name='SpkrLeft WSA MODE' 'Speaker'"
cset "name='SpkrLeft DAC Switch' 1"
cset "name='SpkrLeft BOOST Switch' 1"
cset "name='SpkrLeft VISENSE Switch' 1"
cset "name='SpkrLeft PBR Switch' 1"
cset "name='SpkrLeft PA Volume' 30" (Max)

B. Headphone Routing (WCD938x)
Path established: MultiMedia2 -> RX_MACRO -> RX INT MIX -> HPH

Specific Mixer Settings Applied:
cset "name='RX_CODEC_DMA_RX_0 Audio Mixer MultiMedia2' 1"
cset "name='RX_MACRO RX0 MUX' 'AIF1_PB'"
cset "name='RX INT0_1 MIX1 INP0' 'RX0'"
cset "name='RX INT0_2 MUX' 'RX0'"

Power Mode Forced (Critical step):
cset "name='RX HPH Mode' 'CLS_H_LOHIFI'"
cset "name='RX_HPH PWR Mode' 'LOHIFI'"
cset "name='HPHL Switch' 1"
cset "name='HPHL_COMP Switch' 1"

4. Conclusion

The PCM stream is successfully traversing the DSP chain, but the
backend widgets (WSA smart amps and WCD codec headphone rail) fail to
drive the analog outputs even when manually forced via mixer controls.
This suggests a missing device-specific sequence in the machine
driver, a missing GPIO trigger for the amp rails, or a specific
register configuration quirk for the T14s Gen 6 implementation.

Best regards,
Simone Flavio
