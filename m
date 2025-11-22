Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A28C8A38F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8188601F4;
	Wed, 26 Nov 2025 15:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8188601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166357;
	bh=hvEW2ZG1nTSnL9pUjWrWo1koAXlbB4Ck51qBQLzgnks=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VnHi73qPKjzIh0RqlgWOso2PfAUjxINe7Tns1sao619U/cgdlc7jLERMj1NBQpuOT
	 EDAgItVF2lmU7lBMiBVVb2vC2QABZhZizMujybr2xSMP72FLHP/Lvejd6c+mwrtPtm
	 lee9FV8mSkUodLIoaO/mWp9wSyZSBTdrlo65+NlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E78F80606; Wed, 26 Nov 2025 15:11:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 265C0F80604;
	Wed, 26 Nov 2025 15:11:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED065F80254; Sat, 22 Nov 2025 22:27:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A7D1F801F7
	for <alsa-devel@alsa-project.org>; Sat, 22 Nov 2025 22:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A7D1F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m+Jn8tRr
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-59583505988so4474396e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Nov 2025 13:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763846864; x=1764451664;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aD9EpE7+6t+CWi5EshJE+eNyIAPVxCRTV2BCkgTCScY=;
        b=m+Jn8tRrXptYCkNpf14YJgyI24DyuF4KWvD5GRx/xrrBrPbsi8Ye8yptiLMlZSQgTw
         /EWQyvSDO2qjz+T+QL1qRJFLFOUxkZOdsI60T7pAC0JWyeAUD6YBH54jXmQX7OSHEMqf
         FK7LebvBH6CFVaenNaarXiO5zTCnLYNJ8Ho+Xup0kAtWldD7gpM7Occi3EHsRmPFifiv
         ZEvhdJbgo6Ha3Lf8uuxg0jy/whYnqnIQ/IR7Av4Iki8VM/sO070xRkkbrvzLpnUiaTux
         8SWRgLa8UzQv4w7kHtLL/YvyAN/lHWcUlPnS8WJvx9AjykiTuUOWPC2jS5+a/RoLgZHt
         JQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763846864; x=1764451664;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aD9EpE7+6t+CWi5EshJE+eNyIAPVxCRTV2BCkgTCScY=;
        b=vd/E4K9mbeSpx1h4VkY9A91E5RzErq89bB0tWkMtYuSgPWz5Z6ib8g5QtgjgWrOiDO
         9bSmFYDA+CA3YeWhYp/yP6d+rt8qfp0QhJRK5hkUcE9EgJxckRJ7BoRWMBXn+gv3G20f
         6ZsDxLxhadMV31VnZWhxd1p5ep6pffk3DLvtSpxamw9VX+vFHHiMb21XcTUDn5GfoBzr
         MBRZraShA5Io2zjQQJJdhf5U54mU+sQbGVAXXRFhxlfxcrLw8B7FgC+GPxiKFeFW5sYL
         PY41A87iyWvyQu9qyjdy7Qz+erBR6mQUsrYOaUmknJ9JI+yScD/lmMUApvsvxXYnRsbl
         3csA==
X-Gm-Message-State: AOJu0YwctJwb4og5T/zh49R6k1sIArYqb3FlOYoU7uZNd9TCJ2YLyfs8
	1xWyaZ1Pl60zA6BuZEd0N7DHdwXlt0B6FPRhhKYSWrD2LaFyhsanqtEPnwH+b7od
X-Gm-Gg: ASbGncu3W9jqQLgruISXbv9FUljcxWvhz+Lo1scliBr0kdQXT5mVcnfvzaGYmA4RTpv
	NmiE2HL9j4nYIXEOQBuwm7wt4gT7q7+JGeJpKiUwx5lODJfIbYTCk/Szz3Iz0BwblHnSt1Scxqe
	ew9G3kuDWh43G1IcWDl6rrQ5qzcQ4BlSGS9r5qScI5TQLymvrkKauhoG0myi67sjRI4SrdB772J
	7Mp+qj34+ofv7v2gfhutyU4IRQNg1JBXqqagdERmRjI/j4GEO5YxoPISbH8ZLulnJZvYW7f2V7l
	uVNKT7U5oiJBzFTikEPy+FzDJ46X8PFFkqxgshL/liypoqBM6QOgX9an3/0mms4QRopa9VVWRoa
	Qwp3wyedjIKk8kso08W2nIbRg/9iS2o0SXfVQcsBzMfICmvaICDnDqo5f/vR7ax0v1TPL933mGk
	EzILMKOcccS2HB7xRrbievzClT72R85OIb95r8VlC+RVo=
X-Google-Smtp-Source: 
 AGHT+IHX353G6E1yy/X2dkRis3PEt7aj1kHnDmPnLMMpYggVR4b2e4gDY78P7h1E1CMWnI8sGk3muQ==
X-Received: by 2002:a05:6512:b93:b0:595:2085:dc3e with SMTP id
 2adb3069b0e04-5969ea22833mr3936889e87.17.1763846863592;
        Sat, 22 Nov 2025 13:27:43 -0800 (PST)
Received: from [192.168.0.109] ([176.98.12.166])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db7478esm2670481e87.6.2025.11.22.13.27.42
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 13:27:42 -0800 (PST)
Message-ID: <ab3fd381-da64-4971-9500-1f250ddfa6ac@gmail.com>
Date: Sat, 22 Nov 2025 23:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: "Sergii O. Uriupin" <urupin@gmail.com>
Subject: BUGREP No hardware speaker volume control on ALC287 (Lenovo Yoga,
 Ubuntu 25.10): master/sink volume has no effect
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: urupin@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DXSW3XKGPL7W4H4XQPG4C2PVGXL4S2BU
X-Message-ID-Hash: DXSW3XKGPL7W4H4XQPG4C2PVGXL4S2BU
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:11:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXSW3XKGPL7W4H4XQPG4C2PVGXL4S2BU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hardware:
- Laptop: Lenovo Yoga (AMD APU with ALC287)
- Audio: Family 17h/19h/1ah HD Audio Controller, codec Realtek ALC287
- OS: Ubuntu 25.10 (kernel 6.17.0-6-generic)
- Audio stack: PulseAudio 17.0 (PipeWire audio removed)

Problem:
- System master/sink volume (1–100%) does not change actual speaker 
loudness.
- Only slight change >100% (as if a high-frequency path kicks in).
- Actual audible volume changes only when per-stream volume is adjusted 
(e.g., `pactl set-sink-input-volume <id> ...`).
- In ALSA controls there is no usable “Speaker Playback Volume”, only 
switches; so PA/desktop slider has no effect on internal speakers.
- Reproducible after clean boot, with PulseAudio as the active server 
(pipewire-audio removed).

Data:
- ALSA info: <ALSA_INFO_URL>
- `amixer -c1 controls`: <paste output>
- `amixer -c1 contents`: <paste output>
- `pactl info`: <paste output>
- `pactl list sinks short`: <paste output>
- `pactl list sink-inputs short`: <paste output>

Expected:
- Master/sink volume should control speaker loudness.

Actual:
- Master/sink volume does nothing; only per-stream volume changes affect 
sound.

Notes:
- UCM profile (HDA/HiFi) points speaker to non-existent “Speaker 
Playback Volume”; mapping to Bass Speaker volume locally (user UCM 
override) still yields minimal effect. Needs correct UCM/driver mapping 
for ALC287 on this platform.


s@ubunt:~/soft/Lenovo$ sudo apt install alsa-utils

# Full ALSA dump (will upload and give a URL)
alsa-info.sh --upload

# Mixer controls
amixer -c1 controls
amixer -c1 contents

# PulseAudio state
pactl info
pactl list sinks short
pactl list sink-inputs short
[sudo: authenticate] Password:
Уже установлен пакет alsa-utils самой новой версии (1.2.14-1ubuntu1).
alsa-utils помечен как установленный вручную.
Сводка:
   Обновление: 0, Установка: 0, Удаление: 0, Пропуск обновления: 4
alsa-info.sh: команда не найдена
numid=15,iface=CARD,name='Headphone Jack'
numid=12,iface=CARD,name='Mic Jack'
numid=13,iface=CARD,name='Speaker Front Phantom Jack'
numid=14,iface=CARD,name='Speaker Surround Phantom Jack'
numid=11,iface=MIXER,name='Master Playback Switch'
numid=10,iface=MIXER,name='Master Playback Volume'
numid=5,iface=MIXER,name='Headphone Playback Switch'
numid=4,iface=MIXER,name='Headphone Playback Volume'
numid=19,iface=MIXER,name='Mic ACP LED Capture Switch'
numid=9,iface=MIXER,name='Mic Boost Volume'
numid=8,iface=MIXER,name='Capture Switch'
numid=7,iface=MIXER,name='Capture Volume'
numid=6,iface=MIXER,name='Auto-Mute Mode'
numid=3,iface=MIXER,name='Bass Speaker Playback Switch'
numid=2,iface=MIXER,name='Bass Speaker Playback Volume'
numid=1,iface=MIXER,name='Speaker Playback Switch'
numid=17,iface=PCM,name='Capture Channel Map'
numid=16,iface=PCM,name='Playback Channel Map'
numid=15,iface=CARD,name='Headphone Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=12,iface=CARD,name='Mic Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=off
numid=13,iface=CARD,name='Speaker Front Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=14,iface=CARD,name='Speaker Surround Phantom Jack'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=11,iface=MIXER,name='Master Playback Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=on
numid=10,iface=MIXER,name='Master Playback Volume'
   ; type=INTEGER,access=rw------,values=1,min=0,max=87,step=0
   : values=87
numid=5,iface=MIXER,name='Headphone Playback Switch'
   ; type=BOOLEAN,access=rw------,values=2
   : values=off,off
numid=4,iface=MIXER,name='Headphone Playback Volume'
   ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
   : values=52,52
   | dBscale-min=-65.25dB,step=0.75dB,mute=0
numid=19,iface=MIXER,name='Mic ACP LED Capture Switch'
   ; type=BOOLEAN,access=rw----W-,values=1
   : values=off
numid=9,iface=MIXER,name='Mic Boost Volume'
   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
   : values=0,0
   | dBscale-min=0.00dB,step=10.00dB,mute=0
numid=8,iface=MIXER,name='Capture Switch'
   ; type=BOOLEAN,access=rw------,values=2
   : values=on,on
numid=7,iface=MIXER,name='Capture Volume'
   ; type=INTEGER,access=rw---R--,values=2,min=0,max=63,step=0
   : values=38,38
   | dBscale-min=-17.25dB,step=0.75dB,mute=0
numid=6,iface=MIXER,name='Auto-Mute Mode'
   ; type=ENUMERATED,access=rw------,values=1,items=2
   ; Item #0 'Disabled'
   ; Item #1 'Enabled'
   : values=0
numid=3,iface=MIXER,name='Bass Speaker Playback Switch'
   ; type=BOOLEAN,access=rw------,values=2
   : values=on,on
numid=2,iface=MIXER,name='Bass Speaker Playback Volume'
   ; type=INTEGER,access=rw---R--,values=2,min=0,max=87,step=0
   : values=87,87
   | dBscale-min=-65.25dB,step=0.75dB,mute=0
numid=1,iface=MIXER,name='Speaker Playback Switch'
   ; type=BOOLEAN,access=rw------,values=2
   : values=on,on
numid=17,iface=PCM,name='Capture Channel Map'
   ; type=INTEGER,access=r--v-R--,values=2,min=0,max=36,step=0
   : values=0,0
   | container
     | chmap-fixed=FL,FR
numid=16,iface=PCM,name='Playback Channel Map'
   ; type=INTEGER,access=r--v-R--,values=4,min=0,max=36,step=0
   : values=3,4,0,0
   | container
     | chmap-fixed=FL,FR
     | chmap-fixed=FL,FR,LFE,LFE
Строка сервера: /run/user/1000/pulse/native
Версия протокола библиотеки: 35
Версия протокола сервера: 35
Выполняется локально: да
Номер клиента: 20
Размер блока памяти: 65472
Имя пользователя: s
Имя хоста: ubunt
Имя сервера: pulseaudio
Версия сервера: 17.0
Спецификация отсчётов по умолчанию: s16le 2-канальный 4410
Схема каналов по умолчанию: front-left,front-right
Аудиоприёмник по умолчанию: alsa_output.pci-0000_04_00.6.HiFi__Speaker__sink
Источник по умолчанию: alsa_input.pci-0000_04_00.6.HiFi__Mic1__source
Cookie: 8342:bbd4
0       alsa_output.pci-0000_04_00.6.HiFi__Speaker__sink 
module-alsa-card.c      s16le 2-канальный 4800 RUNNING
7       0       17      protocol-native.c       float32le 2-канальный
s@ubunt:~/soft/Lenovo$

