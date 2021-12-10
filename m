Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A299246F9E5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 05:32:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E17F20AF;
	Fri, 10 Dec 2021 05:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E17F20AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639110763;
	bh=nB7QYm9urQJKbc9uYXsk1KL3glp5y5ldxkED3Mj5ja8=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T2AmHSF2pxv7WtIDzcAva6zVI/BFPIpXVMoq86oMfV+LuxVvxBvw0CxHKEisbAuOL
	 03EtqGSmmHRyUZrtlw0R/pOR9nWiBgE0LY0fl1CjqGxIpMm3MSFu6HrYz+4EiilKGX
	 YWLN5+7M70PSWOWdWMfPBtqAtQdIpnDJm13s+TaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7319AF800AB;
	Fri, 10 Dec 2021 05:31:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14ECBF804E5; Fri, 10 Dec 2021 05:31:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CDEFF800AB
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 05:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CDEFF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RT2Ptoch"
Received: by mail-lj1-x22b.google.com with SMTP id k2so12041939lji.4
 for <alsa-devel@alsa-project.org>; Thu, 09 Dec 2021 20:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=abewUfgpZVuWoPcL0FsZFQghePVgHt2ZXLTFm571Ssg=;
 b=RT2PtochQyRdSQkhPVJld1yRvlNwLgUsE4wnI6sb9eMrxaGOYsLq5oveH61C1+4P1T
 wVeEtBXxaDkOEQ+KqNwC3K4VthDXSpc9yQjYMjTGY3JEClItr59X79XLNHiXboOMHJ09
 N16OpILrnvCsz4kUz5bpaxhMhvQNTk20HG4sFgx6kwH86MaSfUg5E234Ts4jAshLfSZA
 PExVj44OqwLEVgNd9lCFoQbRxgim2l8CRhjI4BqBJL5DHwnXwDGUufbnmEkRuHYNGf/y
 IkWR87lZkcuKqfdyYflOFtBKDNYPGzkpR6BmFVN97gcPlE5EtmR95yEVX96P5dKadCgo
 +Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=abewUfgpZVuWoPcL0FsZFQghePVgHt2ZXLTFm571Ssg=;
 b=sufhUDmdSw2NCVHIHWx1NX0MfZ1UyNSb29gwyeeCnN2y57+zrAV1QxYc6EvsjhRNaA
 HKgdcdFv7zhwn8vRpNJ6712obort0nCjzGJQNHBRwAxPydO+iZMT5yN22n0r/4RUs8aN
 oESTVZHbaHC+8vu0+GqhPeM7LtbA0GJkJxGpCeVi1fTuiy9rkvkOMZfWn2jShGRXBT91
 XGnjO2+nHD6wSXw6QTN6NWJNKuCINIqKs7XPaoHRcp0LGrAZNM5QYNPGoMBJGvH1s90K
 IgcWX4pxw+Gou8ecx628iW02frdloDs5+D8w7puHEBDY+xfRXR3ROq6Lh93pzDjT+XVP
 X14Q==
X-Gm-Message-State: AOAM531PZKbhlNvouyiAC1DgTXgTC9GjFOAYhuR2PdLxzNf/EidvxQAG
 M8IdX8PKJOZqffqcPpiXo3o69qYAr0/m67SDD1sTf6Ek
X-Google-Smtp-Source: ABdhPJytTovCrgLJ2ffCVnSA6v/lijwXLp7uS243a5LRkxQGcq9k2LYP/2T1m0j4X0XOKeI/jjtPNd3OUkIfEUf1wOc=
X-Received: by 2002:a05:651c:210:: with SMTP id
 y16mr10732474ljn.97.1639110684638; 
 Thu, 09 Dec 2021 20:31:24 -0800 (PST)
MIME-Version: 1.0
From: Kolten Pearson <koltenpearson@gmail.com>
Date: Thu, 9 Dec 2021 21:31:12 -0700
Message-ID: <CAC0M1CVW=3vizh8MYxPRVtBqNtOiChYfReYJ2SrY7TkKP0Dg7A@mail.gmail.com>
Subject: rawmidi driver dropping some sysex commands
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I have been working on reverse engineering the sysex commands to
control an Arturia MiniLab mkII controller, and have run into an issue
where the rawmidi driver is dropping some of the commands.
Here is a snippet of my code that illustrates the problem
---
snd_rawmidi_t* midi_input;
snd_rawmidi_t* midi_output;

void midi_init() {
    int ret = snd_rawmidi_open(&midi_input, &midi_output, "hw:3,0,0",
SND_RAWMIDI_NONBLOCK);
    assert (ret == 0 && "could not open midi device");

    uint8_t pad_list[] = {
        MA_PAD_1, MPC_NO_COLOR,
        MA_PAD_2, MPC_RED,
        MA_PAD_3, MPC_GREEN,
        MA_PAD_4, MPC_YELLOW,
        MA_PAD_5, MPC_BLUE,
        MA_PAD_6, MPC_CYAN,
        MA_PAD_7, MPC_MAGENTA,
        MA_PAD_8, MPC_WHITE,

        MA_PAD_9, MPC_NO_COLOR,
        MA_PAD_10, MPC_RED,
        MA_PAD_11, MPC_GREEN,
        MA_PAD_12, MPC_YELLOW,
        MA_PAD_13, MPC_BLUE,
        MA_PAD_14, MPC_CYAN,
        MA_PAD_15, MPC_MAGENTA,
        MA_PAD_16, MPC_WHITE,
    };

    for (int i = 0; i < 16; i++) {
        midi_set(MC_ON_OFF, pad_list[2*i], 0x08); //sets the pad to be
a control instead of a note
        midi_set(MC_MIN_RANGE, pad_list[2*i], 0);
        midi_set(MC_MAX_RANGE, pad_list[2*i], 1);
        midi_set(MC_MODE_SET, pad_list[2*i], 1); //set it to gate, 0 is toggle
        midi_set(MC_PAD_COLOR, pad_list[2*i], pad_list[2*i+1]);
    }

    midi_set(MC_GLOBAL_SET, MA_PAD_BACKLIGHTS, 0x0f); //updates the
pad backlights

    uint8_t knob_list[] = {
        MA_KNOB_1,
        MA_KNOB_2,
        MA_KNOB_3,
        MA_KNOB_4,
        MA_KNOB_5,
        MA_KNOB_6,
        MA_KNOB_7,
        MA_KNOB_8,
        MA_KNOB_9,
        MA_KNOB_10,
        MA_KNOB_11,
        MA_KNOB_12,
        MA_KNOB_13,
        MA_KNOB_14,
        MA_KNOB_15,
        MA_KNOB_16
    };

    for (int i = 0; i < 16; i++) {
        midi_set(MC_MODE_SET, knob_list[i], 0x02); //sets it to
relative mode where 0-3 is right turn, 7f-7d is left turn
        midi_set(MC_CC_SET, knob_list[i], i);
    }

}

void midi_set(enum midi_set_command command, enum midi_set_address
address, uint8_t data) {

    uint8_t raw_command[] = {0xf0, 0x00, 0x20, 0x6b, 0x7f, 0x42, 0x02,
0x00, command, address, data, 0xf7};

    int count = snd_rawmidi_write(midi_output, raw_command,
sizeof(raw_command));
    assert(count == sizeof(raw_command) && "bad write");
    //SDL_Delay(1);
    int ret = snd_rawmidi_drain(midi_output);
    assert(ret == 0 && "could not drain");
}
---
When this code is run, the minilab will only respond to a
nondeterministic number of calls to the midi_set function and ignore
the rest.
However if the SDL_Delay(1) line is uncommented, it will work
correctly every time (This function call causes the process to sleep
for at least 1 millisecond).

I feel like the call to snd_rawmidi_drain should make the SDL_Delay
call unnecessary, but that is not the case. Is there something I am
not understanding about how the api works?
Thanks for any help!
