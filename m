Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHbCMvSTrmmmGQIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:33:40 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251823635A
	for <lists+alsa-devel@lfdr.de>; Mon, 09 Mar 2026 10:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC5BA60249;
	Mon,  9 Mar 2026 10:33:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC5BA60249
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1773048818;
	bh=AbVO0ZITAfwpmxZCOJ3nMOl2GJNz0hLmoZ1ZAZo0z3E=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OHf7rAvU3OqLFHle0/f7cjtcG7/6DfKZTVjCwHCpzpSiGhOADFI4YjQhyXSfylP3P
	 vZfM4c3/BRslEPQ8fFhBqwCvHdslkbxD+J4IF4pqobekYI2gEXUY7d5j7eQ8/zE9gl
	 +oD7bHJ8cAMJsBHErAM2SS2vyVc2Cevwc4vx8U6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2EB2F80571; Mon,  9 Mar 2026 10:32:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE24F80675;
	Mon,  9 Mar 2026 10:32:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F7AAF804F3; Sat,  7 Mar 2026 01:36:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,HTML_MESSAGE,
	NML_ADSP_CUSTOM_MED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4016BF80087
	for <alsa-devel@alsa-project.org>; Sat,  7 Mar 2026 01:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4016BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EuozrPQY
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-415c8a4d2e6so1882898fac.0
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Mar 2026 16:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772843757; cv=none;
        d=google.com; s=arc-20240605;
        b=NrdoLmYSxchwcS3sB2eGxcupzgMUAbUJeDS7/qQxAkXUrWSFdQ24eZyHw09JLegHJY
         5JG79Ox9v+VT7KjtFBTLaE9uoNKkluc+/k2UqzX/GrxYe0cO+dYhTiC8Y6Qr5Otevcly
         vzEqdq8i7MbMRYwueMUord13AZOfPpPAH1RhjOgxY82RXmBiwYC/WJNLVqhVyiAXLxh1
         bPHotD9jSXhXq7f5s4i5IVh1X09IKPAYG+DJq5HYEebTB7f8TQyWnaTaaTaKhDTxbovY
         uzWmMT9AF6FWHPSlD3dOt+ou/KKWMacOccXi2UPOdiZvzOFUZqFrrRpfI9pzKPmTYwZN
         acrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Z+yBJ0qq0O8+FAI0l4d+FedAkm2odwPCNS1cH3FLci8=;
        fh=Wh53t5T7A6ynUYrBgCFa1yJCgnP5nKygwtt89q1T+04=;
        b=FiNpe0GytQNE0/4HEva/+4Dmf63vX7doaSCR9V+RWdepJZeNbaIWB3TzNg4sgPlDh0
         cFGQ6H6KlOKH34McwUE8WtrBBlaq8Ax3fRdl5Vz81qxyADtHqGRYeC6wkinXL2x466id
         1FIh5mrVDrDIzmvkbdFS7SGZsFvgkRaYCKzp1OwNoPnc3jzR6DlqVY8GRJXxPr8/PLyn
         uIOKuKU5QH9XBB3GPDm9t4KNTJlzCS3LR95Pmti6297nokoPtmLv0RpdcJhbBkssVWpr
         fYvqKlwwQ3/m2dBREntFojJtSJ0maz84+l/2soACQseG+VscU2OWUAeUcE4VpPX+DdWu
         PU3A==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772843757; x=1773448557;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z+yBJ0qq0O8+FAI0l4d+FedAkm2odwPCNS1cH3FLci8=;
        b=EuozrPQYk8rfZLNApT0Vpo0QAHVylnAbFk6PBpwFbG3bJCEadbbiuxeAMQ8gMzFGyS
         psUeiGWwD6ESsT/eQ7h5iiPC/G+qLZfRZzhtviD9s7v+Us7/m27lakOeSPwHVtfEwFnq
         B9R5W6MKvA2pJMSuvsXswU043nHB+8GGkjB1Ivjvd8lSHNLUvr9YErPH2eRZNf3QsQWl
         hVnDBs3I1mZjwROW9gJwYXkw9PFJHYUCBfGzD/pT8fHoIbYZ/ceLtAPX2CTNOP1PPz8H
         F/ik+jKQR5mA7BNSABMwcWaOHDyotKycqOyRDXWi7qmsNlW5WYt/koQlfxodrmvx0SAx
         8xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772843757; x=1773448557;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+yBJ0qq0O8+FAI0l4d+FedAkm2odwPCNS1cH3FLci8=;
        b=JMy3B1MS3eCLF7EP1VsSwb5RKCcrC5Sm5buKxcB3BrYOegNdutE4HXrENcr5v9WQn/
         uQGjO4M57Ihu3CPxUnkuM1i1EFybOjJgYxM3sVC4KgytZkReQp+YyXJTMNEiacskpcEU
         fhz0uzQhVK5H7utGv/QR849N54K3ybGyyqQM70I1ctyDz47VAkBp28N6fLM1QRSBSc17
         6ON7Z4LbywT/nWlta4p59SjijalTWWGX7BuW9+Xop6gwDME/Qe71raw+kyXmTShUrbNB
         MR8nvoEyWfRXDAumoCpSMrctIpMlJdj3FvQq8j9MxnbyhnwQeyqoYao81KVKosF8to4J
         SkWg==
X-Gm-Message-State: AOJu0YwUbef2f8yUrI2+/iKo0/ZUJHTh6fBjGI4rwgylI5MNBYbQkXe+
	9uBS6zWzjYQbt7zk4Xgeka/4wyVNEItExrSCJAYadt7oklcOo4zfFoGKPYkSGjE/UEGJAXdYNkj
	78Ce3m/jb4BQTqv/FFMQ0AUnHFzQNlaY=
X-Gm-Gg: ATEYQzwMwCO+Z4e+CBV25xvANHC7JusGwUmSZqJNfZpqnhFmWHWULTiHwzfSyCTFo28
	OCdmisMDx9Nake7zoSdK6/Lqt5nOTiVhxpznafAn0oi8y9d9hUWc7x4zO9BgzAB1EzTzh3scGlI
	nz9FVwdifpSwvzL5lhVM+J8ILvmoVOQLCWf0R1W2rrhgVNEDbytdOJneNubf1zmOjNTYLcd/WXL
	8klD8xQD+ByYTvqzt8h6rYyN0LV+iaHowZhMS5658K/K3HYJqPiszDW/OYvtJDL5lHKZtmELwvU
	hzOpU1FulWlO08djkvgKkIld
X-Received: by 2002:a05:6870:d10b:b0:409:90b3:fec2 with SMTP id
 586e51a60fabf-416e444adaemr2262409fac.50.1772843756881; Fri, 06 Mar 2026
 16:35:56 -0800 (PST)
MIME-Version: 1.0
From: Pedro Montoya <correodepedromontoya@gmail.com>
Date: Sat, 7 Mar 2026 01:35:45 +0100
X-Gm-Features: AaiRm52PI3pNg0yOpej0wyAVNwSbpFJanH_mBC2eJM5sOdhX6Lrh5wgXOnDQhRg
Message-ID: 
 <CAPJWDeSXdduhkyTJPyghK5sHjPo9xUqdbNc6R9eqpdxXo63gMg@mail.gmail.com>
Subject: ALC897 extremely low headphone volume on Medion E16401 (subsystem
 0x1e39b034)
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="0000000000005f1d39064c645af6"
X-MailFrom: correodepedromontoya@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation
Message-ID-Hash: TSC2IPT3LET4BRYA3YCKYTCOZH2CLFSL
X-Message-ID-Hash: TSC2IPT3LET4BRYA3YCKYTCOZH2CLFSL
X-Mailman-Approved-At: Mon, 09 Mar 2026 09:32:25 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSC2IPT3LET4BRYA3YCKYTCOZH2CLFSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 7251823635A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DATE_IN_PAST(1.00)[56];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,gmail.com:-];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[correodepedromontoya@gmail.com,alsa-devel-bounces@alsa-project.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[gmail.com:s=20230601];
	HAS_ATTACHMENT(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[correodepedromontoya@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

--0000000000005f1d39064c645af6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*Kernel Bug Report*

Realtek ALC897 =E2=80=94 Extremely Low Headphone Volume on Medion E16401
*Summary*

Headphone output on the Realtek ALC897 codec is almost inaudible on the
Medion E16401 laptop under Linux (tested on Fedora 41 with PipeWire 1.4.10,
kernel 6.x). The same hardware works correctly with full volume under
Windows using the OEM Realtek driver. Speakers work fine. The issue
persists across multiple distributions (Fedora, Ubuntu, Arch, etc.) and
multiple kernel versions.
*Hardware Information*

*Machine: *Medion E16401

*Audio codec: *Realtek ALC897

*Vendor ID: *0x10ec0897

*Subsystem ID: *0x1e39b034

*Revision ID: *0x100402

*Intel platform: *Tiger Lake (HDA Intel PCH)

*Jack location: *Lateral 3.5mm headphone jack

*OS tested: *Fedora 41, kernel 6.x, PipeWire 1.4.10



*Steps to Reproduce*

1. Boot any Linux distribution on a Medion E16401.

2. Connect wired headphones to the lateral 3.5mm jack.

3. Set all ALSA/PipeWire volumes to maximum.

4. Play any audio =E2=80=94 volume is almost inaudible.
*Expected Behavior*

Headphone volume should be at full amplitude, as it is under Windows with
the OEM Realtek driver.
*Actual Behavior*

Headphone output is almost inaudible even with all software volumes at
maximum. Speaker output works correctly. The EAPD on node 0x1b is already
active (0x2). All ALSA mixer controls are at maximum and unmuted.
*Codec Dump (relevant nodes)*

Full codec dump excerpt =E2=80=94 key nodes involved in headphone path:



Node 0x03 [Audio Output] =E2=80=94 Headphone DAC

Amp-Out caps: ofs=3D0x57, nsteps=3D0x57, stepsize=3D0x02, mute=3D0

Amp-Out vals: [0x00 0x00] <- reads as 0 even at max volume



Node 0x0d [Audio Mixer]

Connection: 0x03 0x0b

Amp-In vals: [0x00 0x00] [0x80 0x80]



Node 0x1b [Pin Complex] =E2=80=94 HP Out at Ext Front (Jack, Green, 1/8")

Pincap: IN OUT HP EAPD Detect Trigger

EAPD 0x2: EAPD (active)

Pin Default 0x02214020: [Jack] HP Out at Ext Front

Pin-ctls: 0xc0: OUT HP

Amp-Out vals: [0x80 0x80] <- muted at pin level

Connection: 0x0c 0x0d* 0x0e 0x0f 0x26



*Investigation Performed* *Software-side (exhausted)*

All of the following were tried without improvement:

- All ALSA mixer controls set to maximum, fully unmuted via alsamixer and
amixer

- PipeWire sink volume set to 1.0 and above via wpctl

- softvol ALSA plugin (causes distortion, volume level still effectively
inaudible)

- Various snd-hda-intel model=3D options: headset-mode, headset-mic, auto,
generic

- Auto-Mute mode disabled

- EasyEffects with upward compressor + limiter

- PipeWire sample rate increased to 192000 Hz
*hda-verb investigation*

The following hda-verb commands were tested without improvement:

hda-verb /dev/snd/hwC0D0 0x1b SET_PIN_WIDGET_CONTROL 0xc0

hda-verb /dev/snd/hwC0D0 0x1b SET_EAPD_BTLENABLE 0x02

hda-verb /dev/snd/hwC0D0 0x1b SET_AMP_GAIN_MUTE 0xb000

hda-verb /dev/snd/hwC0D0 0x0d SET_AMP_GAIN_MUTE 0xb000



Node 0x21 in this codec is a Vendor Defined Widget (not a real pin), so
SET_PIN_WIDGET_CONTROL on 0x21 has no effect.
*Windows driver analysis*

The OEM Windows driver package for this exact subsystem ID (0x1e39b034) was
obtained from the Medion support page for the E16401 (file:
06_Realtek_Audio_E16401_E16402.zip, driver version
9208.1_UAD_WHQL_2021_0727_1E39B034).

Binary analysis of RTKVHD64.sys revealed the following initialization verbs
associated with subsystem 0x1e39b034:



nid=3D0x1b verb=3D0x0a00 val=3D0xc0 (SET_PIN_WIDGET_CONTROL)

nid=3D0x20 verb=3D0xc91b val=3D0x0a (vendor-specific coeff write)

nid=3D0x1b verb=3D0xcf80 val=3D0x01 (vendor-specific coeff write)

nid=3D0x1b verb=3D0xcf80 val=3D0x31 (vendor-specific coeff write)

nid=3D0x17 verb=3D0x2630 val=3D0x00 (GPIO/config)

nid=3D0x19 verb=3D0xe53e val=3D0x0f (Realtek private register)

nid=3D0x19 verb=3D0xe53e val=3D0x1f (Realtek private register)



Applying the vendor coeff writes (nid 0x20 and 0x1b) caused the jack
detection polarity to invert (headphones detected as disconnected when
connected and vice versa), which confirms these registers affect the analog
signal path and jack sense logic, but the exact correct values for Linux
initialization are unclear without access to Realtek's private register
documentation.
*Hypothesis*

The ALC897 on this specific board (subsystem 0x1e39b034) requires one or
more vendor-specific coefficient writes to node 0x20 (Vendor Defined
Widget, 142 coefficients) to correctly activate the internal headphone
amplifier path. The Windows driver applies these at initialization. Linux
does not apply any such quirk for this subsystem ID, resulting in the amp
remaining in a low-gain or inactive state.

A kernel fixup similar to existing ALC897 quirks in patch_realtek.c is
likely needed for this subsystem ID.
*Kernel Source Reference*

Relevant file:

sound/pci/hda/patch_realtek.c

Suggested fix location: ALC897 quirk table, new entry for subsystem ID
0x1e39b034 with appropriate alc_fixup callback to write the correct
initialization coefficients to node 0x20.
*Additional Information*

*Kernel version: *6.x (reproduced across multiple kernel versions)

*Distribution: *Fedora 41 (also reproduced on Ubuntu, Arch Linux)

*Audio server: *PipeWire 1.4.10 with WirePlumber

*Module: *snd_hda_intel, snd_hda_codec_realtek

*Full codec dump: *Available on request =E2=80=94 /proc/asound/card0/codec#=
0

*OEM driver package: *Available from Medion support page for model E16401

--0000000000005f1d39064c645af6
Content-Type: text/plain; charset="US-ASCII"; name="codec_dump.txt"
Content-Disposition: attachment; filename="codec_dump.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mmflc8c21>
X-Attachment-Id: f_mmflc8c21

Q29kZWM6IFJlYWx0ZWsgQUxDODk3CkFkZHJlc3M6IDAKQUZHIEZ1bmN0aW9uIElkOiAweDEgKHVu
c29sIDEpClZlbmRvciBJZDogMHgxMGVjMDg5NwpTdWJzeXN0ZW0gSWQ6IDB4MWUzOWIwMzQKUmV2
aXNpb24gSWQ6IDB4MTAwNDAyCk5vIE1vZGVtIEZ1bmN0aW9uIEdyb3VwIGZvdW5kCkRlZmF1bHQg
UENNOgogICAgcmF0ZXMgWzB4NWYwXTogMzIwMDAgNDQxMDAgNDgwMDAgODgyMDAgOTYwMDAgMTky
MDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCkRlZmF1
bHQgQW1wLUluIGNhcHM6IE4vQQpEZWZhdWx0IEFtcC1PdXQgY2FwczogTi9BClN0YXRlIG9mIEFG
RyBub2RlIDB4MDE6CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgQ0xLU1RPUCBFUFNTCiAg
UG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApHUElPOiBpbz01LCBvPTAsIGk9MCwgdW5zb2xp
Y2l0ZWQ9MSwgd2FrZT0wCiAgSU9bMF06IGVuYWJsZT0wLCBkaXI9MCwgd2FrZT0wLCBzdGlja3k9
MCwgZGF0YT0wLCB1bnNvbD0wCiAgSU9bMV06IGVuYWJsZT0wLCBkaXI9MCwgd2FrZT0wLCBzdGlj
a3k9MCwgZGF0YT0wLCB1bnNvbD0wCiAgSU9bMl06IGVuYWJsZT0wLCBkaXI9MCwgd2FrZT0wLCBz
dGlja3k9MCwgZGF0YT0wLCB1bnNvbD0wCiAgSU9bM106IGVuYWJsZT0wLCBkaXI9MCwgd2FrZT0w
LCBzdGlja3k9MCwgZGF0YT0wLCB1bnNvbD0wCiAgSU9bNF06IGVuYWJsZT0wLCBkaXI9MCwgd2Fr
ZT0wLCBzdGlja3k9MCwgZGF0YT0wLCB1bnNvbD0wCk5vZGUgMHgwMiBbQXVkaW8gT3V0cHV0XSB3
Y2FwcyAweDQxZDogU3RlcmVvIEFtcC1PdXQKICBDb250cm9sOiBuYW1lPSJTcGVha2VyIFBsYXli
YWNrIFZvbHVtZSIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGly
PU91dCwgaWR4PTAsIG9mcz0wCiAgQW1wLU91dCBjYXBzOiBvZnM9MHg1NywgbnN0ZXBzPTB4NTcs
IHN0ZXBzaXplPTB4MDIsIG11dGU9MAogIEFtcC1PdXQgdmFsczogIFsweDAwIDB4MDBdCiAgQ29u
dmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQx
MDAgNDgwMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0
cyBbMHgxXTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBz
ZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDAzIFtBdWRpbyBPdXRwdXRdIHdjYXBzIDB4NDFk
OiBTdGVyZW8gQW1wLU91dAogIENvbnRyb2w6IG5hbWU9IkhlYWRwaG9uZSBQbGF5YmFjayBWb2x1
bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1PdXQsIGlk
eD0wLCBvZnM9MAogIERldmljZTogbmFtZT0iQUxDODk3IEFuYWxvZyIsIHR5cGU9IkF1ZGlvIiwg
ZGV2aWNlPTAKICBBbXAtT3V0IGNhcHM6IG9mcz0weDU3LCBuc3RlcHM9MHg1Nywgc3RlcHNpemU9
MHgwMiwgbXV0ZT0wCiAgQW1wLU91dCB2YWxzOiAgWzB4MDAgMHgwMF0KICBDb252ZXJ0ZXI6IHN0
cmVhbT0wLCBjaGFubmVsPTAKICBQQ006CiAgICByYXRlcyBbMHg1NjBdOiA0NDEwMCA0ODAwMCA5
NjAwMCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQ
Q00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAs
IGFjdHVhbD1EMApOb2RlIDB4MDQgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg0MWQ6IFN0ZXJlbyBB
bXAtT3V0CiAgQW1wLU91dCBjYXBzOiBvZnM9MHg1NywgbnN0ZXBzPTB4NTcsIHN0ZXBzaXplPTB4
MDIsIG11dGU9MAogIEFtcC1PdXQgdmFsczogIFsweDU3IDB4NTddCiAgQ29udmVydGVyOiBzdHJl
YW09MCwgY2hhbm5lbD0wCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAgOTYw
MDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENN
CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBh
Y3R1YWw9RDAKTm9kZSAweDA1IFtBdWRpbyBPdXRwdXRdIHdjYXBzIDB4NDFkOiBTdGVyZW8gQW1w
LU91dAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4NTcsIG5zdGVwcz0weDU3LCBzdGVwc2l6ZT0weDAy
LCBtdXRlPTAKICBBbXAtT3V0IHZhbHM6ICBbMHg1NyAweDU3XQogIENvbnZlcnRlcjogc3RyZWFt
PTAsIGNoYW5uZWw9MAogIFBDTToKICAgIHJhdGVzIFsweDU2MF06IDQ0MTAwIDQ4MDAwIDk2MDAw
IDE5MjAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAgIGZvcm1hdHMgWzB4MV06IFBDTQog
IFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0
dWFsPUQwCk5vZGUgMHgwNiBbQXVkaW8gT3V0cHV0XSB3Y2FwcyAweDYxMTogU3RlcmVvIERpZ2l0
YWwKICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAKICBEaWdpdGFsOgogIERpZ2l0YWwg
Y2F0ZWdvcnk6IDB4MAogIElFQyBDb2RpbmcgVHlwZTogMHgwCiAgUENNOgogICAgcmF0ZXMgWzB4
NWYwXTogMzIwMDAgNDQxMDAgNDgwMDAgODgyMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVd
OiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEg
RDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDA3IFtBdWRp
byBJbnB1dF0gd2NhcHMgMHgxMDA1MWI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczogb2Zz
PTB4MTcsIG5zdGVwcz0weDNmLCBzdGVwc2l6ZT0weDAyLCBtdXRlPTEKICBBbXAtSW4gdmFsczog
IFsweDk3IDB4OTddCiAgQ29udmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgU0RJLVNlbGVj
dDogMAogIFBDTToKICAgIHJhdGVzIFsweDU2MF06IDQ0MTAwIDQ4MDAwIDk2MDAwIDE5MjAwMAog
ICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAgIGZvcm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0
YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAg
Q29ubmVjdGlvbjogMQogICAgIDB4MTIKTm9kZSAweDA4IFtBdWRpbyBJbnB1dF0gd2NhcHMgMHgx
MDA1MWI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczogb2ZzPTB4MTcsIG5zdGVwcz0weDNm
LCBzdGVwc2l6ZT0weDAyLCBtdXRlPTEKICBBbXAtSW4gdmFsczogIFsweDk3IDB4OTddCiAgQ29u
dmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgU0RJLVNlbGVjdDogMAogIFBDTToKICAgIHJh
dGVzIFsweDU2MF06IDQ0MTAwIDQ4MDAwIDk2MDAwIDE5MjAwMAogICAgYml0cyBbMHhlXTogMTYg
MjAgMjQKICAgIGZvcm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQz
IEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAg
IDB4MjMKTm9kZSAweDA5IFtBdWRpbyBJbnB1dF0gd2NhcHMgMHgxMDA1MWI6IFN0ZXJlbyBBbXAt
SW4KICBDb250cm9sOiBuYW1lPSJDYXB0dXJlIFZvbHVtZSIsIGluZGV4PTAsIGRldmljZT0wCiAg
ICBDb250cm9sQW1wOiBjaHM9MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBDb250cm9sOiBuYW1l
PSJDYXB0dXJlIFN3aXRjaCIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9
MywgZGlyPUluLCBpZHg9MCwgb2ZzPTAKICBEZXZpY2U6IG5hbWU9IkFMQzg5NyBBbmFsb2ciLCB0
eXBlPSJBdWRpbyIsIGRldmljZT0wCiAgQW1wLUluIGNhcHM6IG9mcz0weDE3LCBuc3RlcHM9MHgz
Ziwgc3RlcHNpemU9MHgwMiwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHgzZiAweDNmXQogIENv
bnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIFNESS1TZWxlY3Q6IDAKICBQQ006CiAgICBy
YXRlcyBbMHg1NjBdOiA0NDEwMCA0ODAwMCA5NjAwMCAxOTIwMDAKICAgIGJpdHMgWzB4ZV06IDE2
IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBE
MyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAg
ICAweDIyCk5vZGUgMHgwYSBbQXVkaW8gSW5wdXRdIHdjYXBzIDB4MTAwNzExOiBTdGVyZW8gRGln
aXRhbAogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIFNESS1TZWxlY3Q6IDAKICBE
aWdpdGFsOgogIERpZ2l0YWwgY2F0ZWdvcnk6IDB4MAogIElFQyBDb2RpbmcgVHlwZTogMHgwCiAg
UENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRz
IFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCiAgUG93ZXIgc3RhdGVzOiAg
RDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0
aW9uOiAxCiAgICAgMHgxZgpOb2RlIDB4MGIgW0F1ZGlvIE1peGVyXSB3Y2FwcyAweDIwMDEwYjog
U3RlcmVvIEFtcC1JbgogIENvbnRyb2w6IG5hbWU9IkhlYWRwaG9uZSBNaWMgUGxheWJhY2sgVm9s
dW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlk
eD0zLCBvZnM9MAogIENvbnRyb2w6IG5hbWU9IkhlYWRwaG9uZSBNaWMgUGxheWJhY2sgU3dpdGNo
IiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlkeD0z
LCBvZnM9MAogIEFtcC1JbiBjYXBzOiBvZnM9MHgxNywgbnN0ZXBzPTB4MWYsIHN0ZXBzaXplPTB4
MDUsIG11dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAg
MHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4
ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0KICBDb25uZWN0aW9uOiAxMAogICAgIDB4
MTggMHgxOSAweDFhIDB4MWIgMHgxYyAweDFkIDB4MTQgMHgxNSAweDE2IDB4MTcKTm9kZSAweDBj
IFtBdWRpbyBNaXhlcl0gd2NhcHMgMHgyMDAxMGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fw
czogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtSW4g
dmFsczogIFsweDAwIDB4MDBdIFsweDgwIDB4ODBdCiAgQ29ubmVjdGlvbjogMgogICAgIDB4MDIg
MHgwYgpOb2RlIDB4MGQgW0F1ZGlvIE1peGVyXSB3Y2FwcyAweDIwMDEwYjogU3RlcmVvIEFtcC1J
bgogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11
dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0gWzB4ODAgMHg4MF0KICBDb25uZWN0aW9u
OiAyCiAgICAgMHgwMyAweDBiCk5vZGUgMHgwZSBbQXVkaW8gTWl4ZXJdIHdjYXBzIDB4MjAwMTBi
OiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3Rl
cHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXSBbMHg4MCAweDgw
XQogIENvbm5lY3Rpb246IDIKICAgICAweDA0IDB4MGIKTm9kZSAweDBmIFtBdWRpbyBNaXhlcl0g
d2NhcHMgMHgyMDAxMGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5z
dGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtSW4gdmFsczogIFsweDAwIDB4
MDBdIFsweDgwIDB4ODBdCiAgQ29ubmVjdGlvbjogMgogICAgIDB4MDUgMHgwYgpOb2RlIDB4MTAg
W0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg2MTE6IFN0ZXJlbyBEaWdpdGFsCiAgQ29udmVydGVyOiBz
dHJlYW09MCwgY2hhbm5lbD0wCiAgRGlnaXRhbDoKICBEaWdpdGFsIGNhdGVnb3J5OiAweDAKICBJ
RUMgQ29kaW5nIFR5cGU6IDB4MAogIFBDTToKICAgIHJhdGVzIFsweDVmMF06IDMyMDAwIDQ0MTAw
IDQ4MDAwIDg4MjAwIDk2MDAwIDE5MjAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAgIGZv
cm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dl
cjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgxMSBbUGluIENvbXBsZXhdIHdjYXBzIDB4
NDAwNzgxOiBTdGVyZW8gRGlnaXRhbAogIFBpbmNhcCAweDAwMDAwMDEwOiBPVVQKICBQaW4gRGVm
YXVsdCAweDQwMDAwMDAwOiBbTi9BXSBMaW5lIE91dCBhdCBFeHQgTi9BCiAgICBDb25uID0gVW5r
bm93biwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MCwgU2VxdWVuY2Ug
PSAweDAKICBQaW4tY3RsczogMHg0MDogT1VUCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxl
ZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQw
LCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgxMApOb2RlIDB4MTIgW1BpbiBDb21w
bGV4XSB3Y2FwcyAweDQwMDQwMTogU3RlcmVvCiAgUGluY2FwIDB4MDAwMDAwMjA6IElOCiAgUGlu
IERlZmF1bHQgMHg5MGE2MDEzMDogW0ZpeGVkXSBNaWMgYXQgSW50IE4vQQogICAgQ29ubiA9IERp
Z2l0YWwsIENvbG9yID0gVW5rbm93bgogICAgRGVmQXNzb2NpYXRpb24gPSAweDMsIFNlcXVlbmNl
ID0gMHgwCiAgICBNaXNjID0gTk9fUFJFU0VOQ0UKICBQaW4tY3RsczogMHgyMDogSU4KICBQb3dl
ciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1E
MApOb2RlIDB4MTMgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAwMDA6IE1vbm8K
Tm9kZSAweDE0IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAg
Q29udHJvbDogbmFtZT0iU3BlYWtlciBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9
MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQg
Y2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAt
T3V0IHZhbHM6ICBbMHg4MCAweDgwXQogIFBpbmNhcCAweDAwMDEwMDNlOiBJTiBPVVQgSFAgRUFQ
RCBEZXRlY3QgVHJpZ2dlcgogIEVBUEQgMHgyOiBFQVBECiAgUGluIERlZmF1bHQgMHg5MDE3MDEx
MDogW0ZpeGVkXSBTcGVha2VyIGF0IEludCBOL0EKICAgIENvbm4gPSBBbmFsb2csIENvbG9yID0g
VW5rbm93bgogICAgRGVmQXNzb2NpYXRpb24gPSAweDEsIFNlcXVlbmNlID0gMHgwCiAgICBNaXNj
ID0gTk9fUFJFU0VOQ0UKICBQaW4tY3RsczogMHg0MDogT1VUCiAgVW5zb2xpY2l0ZWQ6IHRhZz0w
MCwgZW5hYmxlZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBz
ZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgwYwpOb2RlIDB4MTUg
W1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDU4ZDogU3RlcmVvIEFtcC1PdXQKICBBbXAtT3V0IGNh
cHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLU91
dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgwMDAwMDAzNjogSU4gT1VUIERldGVjdCBU
cmlnZ2VyCiAgUGluIERlZmF1bHQgMHg0MTExMTFmMDogW04vQV0gU3BlYWtlciBhdCBFeHQgUmVh
cgogICAgQ29ubiA9IDEvOCwgQ29sb3IgPSBCbGFjawogICAgRGVmQXNzb2NpYXRpb24gPSAweGYs
IFNlcXVlbmNlID0gMHgwCiAgICBNaXNjID0gTk9fUFJFU0VOQ0UKICBQaW4tY3RsczogMHgyMDog
SU4KICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBE
MSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246
IDEKICAgICAweDBkCk5vZGUgMHgxNiBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNThkOiBTdGVy
ZW8gQW1wLU91dAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6
ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHg4MCAweDgwXQogIFBpbmNhcCAweDAw
MDAwMDM2OiBJTiBPVVQgRGV0ZWN0IFRyaWdnZXIKICBQaW4gRGVmYXVsdCAweDQxMTExMWYwOiBb
Ti9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAgICBDb25uID0gMS84LCBDb2xvciA9IEJsYWNrCiAg
ICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAweDAKICAgIE1pc2MgPSBOT19QUkVT
RU5DRQogIFBpbi1jdGxzOiAweDIwOiBJTgogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9
MAogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwg
YWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogMQogICAgIDB4MGUKTm9kZSAweDE3IFtQaW4gQ29tcGxl
eF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAgQW1wLU91dCBjYXBzOiBvZnM9MHgw
MCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1PdXQgdmFsczogIFsw
eDgwIDB4ODBdCiAgUGluY2FwIDB4MDAwMDAwMzY6IElOIE9VVCBEZXRlY3QgVHJpZ2dlcgogIFBp
biBEZWZhdWx0IDB4NDExMTExZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4g
PSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9
IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4MjA6IElOCiAgVW5zb2xp
Y2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBT
UwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgw
ZgpOb2RlIDB4MTggW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDU4ZjogU3RlcmVvIEFtcC1JbiBB
bXAtT3V0CiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMywgc3RlcHNpemU9MHgy
NywgbXV0ZT0wCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXQogIEFtcC1PdXQgY2Fwczogb2Zz
PTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6
ICBbMHg4MCAweDgwXQogIFBpbmNhcCAweDAwMDAzNzM2OiBJTiBPVVQgRGV0ZWN0IFRyaWdnZXIK
ICAgIFZyZWYgY2FwczogSElaIDUwIEdSRCA4MCAxMDAKICBQaW4gRGVmYXVsdCAweDQxMTExMWYw
OiBbTi9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAgICBDb25uID0gMS84LCBDb2xvciA9IEJsYWNr
CiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAweDAKICAgIE1pc2MgPSBOT19Q
UkVTRU5DRQogIFBpbi1jdGxzOiAweDIwOiBJTiBWUkVGX0hJWgogIFVuc29saWNpdGVkOiB0YWc9
MDAsIGVuYWJsZWQ9MAogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjog
c2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlvbjogNQogICAgIDB4MGMqIDB4MGQgMHgw
ZSAweDBmIDB4MjYKTm9kZSAweDE5IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGY6IFN0ZXJl
byBBbXAtSW4gQW1wLU91dAogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDMsIHN0
ZXBzaXplPTB4MjcsIG11dGU9MAogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0KICBBbXAtT3V0
IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1w
LU91dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgwMDAwMzczZTogSU4gT1VUIEhQIERl
dGVjdCBUcmlnZ2VyCiAgICBWcmVmIGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAgUGluIERlZmF1
bHQgMHg0MTExMTFmMDogW04vQV0gU3BlYWtlciBhdCBFeHQgUmVhcgogICAgQ29ubiA9IDEvOCwg
Q29sb3IgPSBCbGFjawogICAgRGVmQXNzb2NpYXRpb24gPSAweGYsIFNlcXVlbmNlID0gMHgwCiAg
ICBNaXNjID0gTk9fUFJFU0VOQ0UKICBQaW4tY3RsczogMHgyMDogSU4gVlJFRl9ISVoKICBVbnNv
bGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBF
UFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDUKICAgICAw
eDBjKiAweDBkIDB4MGUgMHgwZiAweDI2Ck5vZGUgMHgxYSBbUGluIENvbXBsZXhdIHdjYXBzIDB4
NDAwNThmOiBTdGVyZW8gQW1wLUluIEFtcC1PdXQKICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5z
dGVwcz0weDAzLCBzdGVwc2l6ZT0weDI3LCBtdXRlPTAKICBBbXAtSW4gdmFsczogIFsweDAwIDB4
MDBdCiAgQW1wLU91dCBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAs
IG11dGU9MQogIEFtcC1PdXQgdmFsczogIFsweDgwIDB4ODBdCiAgUGluY2FwIDB4MDAwMDM3MzY6
IElOIE9VVCBEZXRlY3QgVHJpZ2dlcgogICAgVnJlZiBjYXBzOiBISVogNTAgR1JEIDgwIDEwMAog
IFBpbiBEZWZhdWx0IDB4NDExMTExZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENv
bm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5j
ZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4MjA6IElOIFZSRUZf
SElaCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAg
RDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9u
OiA1CiAgICAgMHgwYyogMHgwZCAweDBlIDB4MGYgMHgyNgpOb2RlIDB4MWIgW1BpbiBDb21wbGV4
XSB3Y2FwcyAweDQwMDU4ZjogU3RlcmVvIEFtcC1JbiBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0i
SGVhZHBob25lIFBsYXliYWNrIFN3aXRjaCIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9s
QW1wOiBjaHM9MywgZGlyPU91dCwgaWR4PTAsIG9mcz0wCiAgQ29udHJvbDogbmFtZT0iSGVhZHBo
b25lIE1pYyBCb29zdCBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDog
Y2hzPTMsIGRpcj1JbiwgaWR4PTAsIG9mcz0wCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3Rl
cHM9MHgwMywgc3RlcHNpemU9MHgyNywgbXV0ZT0wCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAw
XQogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBt
dXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHg4MCAweDgwXQogIFBpbmNhcCAweDAwMDEzNzNlOiBJ
TiBPVVQgSFAgRUFQRCBEZXRlY3QgVHJpZ2dlcgogICAgVnJlZiBjYXBzOiBISVogNTAgR1JEIDgw
IDEwMAogIEVBUEQgMHgyOiBFQVBECiAgUGluIERlZmF1bHQgMHgwMjIxNDAyMDogW0phY2tdIEhQ
IE91dCBhdCBFeHQgRnJvbnQKICAgIENvbm4gPSAxLzgsIENvbG9yID0gR3JlZW4KICAgIERlZkFz
c29jaWF0aW9uID0gMHgyLCBTZXF1ZW5jZSA9IDB4MAogIFBpbi1jdGxzOiAweGMwOiBPVVQgSFAg
VlJFRl9ISVoKICBVbnNvbGljaXRlZDogdGFnPTAxLCBlbmFibGVkPTEKICBQb3dlciBzdGF0ZXM6
ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5l
Y3Rpb246IDUKICAgICAweDBjIDB4MGQqIDB4MGUgMHgwZiAweDI2Ck5vZGUgMHgxYyBbUGluIENv
bXBsZXhdIHdjYXBzIDB4NDAwNDgxOiBTdGVyZW8KICBQaW5jYXAgMHgwMDAwMDAyMDogSU4KICBQ
aW4gRGVmYXVsdCAweDQxMTExMWYwOiBbTi9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAgICBDb25u
ID0gMS84LCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2Ug
PSAweDAKICAgIE1pc2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDIwOiBJTgogIFVuc29s
aWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQ
U1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwLCBTZXR0aW5nLXJlc2V0Ck5vZGUgMHgx
ZCBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNDAwOiBNb25vCiAgUGluY2FwIDB4MDAwMDAwMjA6
IElOCiAgUGluIERlZmF1bHQgMHg0MDI3ODk2ZDogW04vQV0gSFAgT3V0IGF0IEV4dCBOL0EKICAg
IENvbm4gPSBBbmFsb2csIENvbG9yID0gUHVycGxlCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4Niwg
U2VxdWVuY2UgPSAweGQKICAgIE1pc2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDIwOiBJ
TgogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwg
YWN0dWFsPUQwCk5vZGUgMHgxZSBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNzgxOiBTdGVyZW8g
RGlnaXRhbAogIFBpbmNhcCAweDAwMDAwMDEwOiBPVVQKICBQaW4gRGVmYXVsdCAweDQxMTExMWYw
OiBbTi9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAgICBDb25uID0gMS84LCBDb2xvciA9IEJsYWNr
CiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAweDAKICAgIE1pc2MgPSBOT19Q
UkVTRU5DRQogIFBpbi1jdGxzOiAweDQwOiBPVVQKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFi
bGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9
RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAgICAweDA2Ck5vZGUgMHgxZiBbUGluIENv
bXBsZXhdIHdjYXBzIDB4NDAwNjgxOiBTdGVyZW8gRGlnaXRhbAogIFBpbmNhcCAweDAwMDAwMDIw
OiBJTgogIFBpbiBEZWZhdWx0IDB4NDExMTExZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIK
ICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBT
ZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4MjA6IElO
CiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEg
RDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDIwIFtWZW5k
b3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDQwOiBNb25vCiAgUHJvY2Vzc2luZyBjYXBz
OiBiZW5pZ249MCwgbmNvZWZmPTE0MgpOb2RlIDB4MjEgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0g
d2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDIyIFtBdWRpbyBNaXhlcl0gd2NhcHMgMHgyMDAx
MGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBz
dGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtSW4gdmFsczogIFsweDgwIDB4ODBdIFsweDgwIDB4
ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgw
IDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdIFsw
eDAwIDB4MDBdCiAgQ29ubmVjdGlvbjogMTIKICAgICAweDE4IDB4MTkgMHgxYSAweDFiIDB4MWMg
MHgxZCAweDE0IDB4MTUgMHgxNiAweDE3IDB4MGIgMHgxMgpOb2RlIDB4MjMgW0F1ZGlvIE1peGVy
XSB3Y2FwcyAweDIwMDEwYjogU3RlcmVvIEFtcC1JbgogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwg
bnN0ZXBzPTB4MDAsIHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1JbiB2YWxzOiAgWzB4ODAg
MHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4
ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0gWzB4ODAgMHg4MF0g
WzB4ODAgMHg4MF0KICBDb25uZWN0aW9uOiAxMQogICAgIDB4MTggMHgxOSAweDFhIDB4MWIgMHgx
YyAweDFkIDB4MTQgMHgxNSAweDE2IDB4MTcgMHgwYgpOb2RlIDB4MjQgW1ZlbmRvciBEZWZpbmVk
IFdpZGdldF0gd2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDI1IFtBdWRpbyBPdXRwdXRdIHdj
YXBzIDB4NDFkOiBTdGVyZW8gQW1wLU91dAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4NTcsIG5zdGVw
cz0weDU3LCBzdGVwc2l6ZT0weDAyLCBtdXRlPTAKICBBbXAtT3V0IHZhbHM6ICBbMHg1NyAweDU3
XQogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIFBDTToKICAgIHJhdGVzIFsweDU2
MF06IDQ0MTAwIDQ4MDAwIDk2MDAwIDE5MjAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQKICAg
IGZvcm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MKICBQ
b3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgyNiBbQXVkaW8gTWl4ZXJdIHdjYXBz
IDB4MjAwMTBiOiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9
MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXSBb
MHg4MCAweDgwXQogIENvbm5lY3Rpb246IDIKICAgICAweDI1IDB4MGIK
--0000000000005f1d39064c645af6--
