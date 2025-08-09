Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA4B1F9B3
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Aug 2025 12:51:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ADDD60258;
	Sun, 10 Aug 2025 12:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ADDD60258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754823077;
	bh=nEwJrB+Jnysh4nm82+emwhLZsWCLy4gA76rc8SDrWUo=;
	h=Date:To:From:Subject:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lf6QIAmKDlWTDRlVTiZv/arel0IoJixFD2Wkt/D3alVoIW964APit2uRgqhJ68U2z
	 MbX+R66Fdfp+9s1RAtuyGDf2r5vOfGj7+y0l9R+SaP9ajkwHJQ8fg4nAwCNSp4zXig
	 N/jsiXWibZXP4jwYVSAXDpB9g//O1AC/hfBsWwvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A9DCF8060A; Sun, 10 Aug 2025 12:50:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A1C8F8060B;
	Sun, 10 Aug 2025 12:50:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0F85F80185; Sat,  9 Aug 2025 18:50:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C265F80093
	for <alsa-devel@alsa-project.org>; Sat,  9 Aug 2025 18:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C265F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M5kbVXCk
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so26435325e9.3
        for <alsa-devel@alsa-project.org>;
 Sat, 09 Aug 2025 09:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754758247; x=1755363047;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBIdOBLV0bNIciS/qPImvFzix8HodeWUUh3dvwusnSs=;
        b=M5kbVXCkayVawKVxNnHjiq6mQ75Lhv46s+/Ck5IpnpyUmAlMzBg5pGn5hhANChkWtp
         YU2Kx++lQon9FFs+auZfpzcpuAQCji4KIjXN/WROCYmsJ3rK8RYBlG1uFLOw1csiD8PF
         qxEgzPugvYrrnhXiOiP4JQvqecYBtgVknzv73UiTdaM8XdwHmUMN5vm4JYWyDwb6clJM
         NVQFnc9v+vwnEKajT35nDgf12T5sBJe5rVPyutGdSLdsSC7tlioJNwmyO2gliAN8mE5f
         QcimwfJLUVby8o03K6S7mgWo530o+T/dV3nNsVkV7nEimV4ClwYu8e7D1ZdP8zmXt2BW
         285w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754758247; x=1755363047;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBIdOBLV0bNIciS/qPImvFzix8HodeWUUh3dvwusnSs=;
        b=H50pXrCXepfC0UTJeMA8wsVAfBp1ANqKhi/XvSU2b9Rwp+s0uye7BQ0RMM3Hy0qkOH
         cKmkcRerfmTpcbgP5aFAeM3spANSMGjdUPzMPXYVGoE1/jlWwe1mXJ4GqBAJGTdTZd8m
         0g9i56t/Depqpg+LlAD9Zy7Q8qjDQ14Tgu6EWW8GykYwDGJTZLeuWrxrK5jF3ktEtHPQ
         e/ka88xmaMnTDHCMrz05bY1dN4IJZKPESFGwPKMv9wZGkcICIN5DQBstsueFf8Jy4H7Y
         a1jwkLTrnslt5Xe+oOhdhDxEehW1MbieaTwqgjntqXlPtfff0kaWqg1nG2Xw+EaC4wtR
         TTYQ==
X-Gm-Message-State: AOJu0YyJLOmtd+foC+VNNYPdrLsT189i/Z/AZ8bcdm1vVg9y0UF+Cfyg
	CgBLrH8zRSH3UxWO5Owv4Vcvf/7NAuVncVjFFsdnhBr0bU3ZSlpp9TUYfwFgPKOSB8o=
X-Gm-Gg: ASbGncu8y27R0UxjA/oxr+CAhHHngNWsA0fEDlr/reMumCGqochbwZc+jQN182DEB+p
	Qf6cdmMST4/KM5WEHZATsVMYMQ0A2xvgMA9o37CytaU9Q+ZrhlOzX0hI7wDN1gy8gT54fSODjPE
	VFEj0OmdM6fkFlWpOoqBSLPnoSbfQG79dIoo4e8y/JtElLUm/YhrhcUxActgph7D58BXtucZBWM
	RPLWTJ1Vwh+iCInePthnFNmKAvgkyrrfr0LP/urU6cS6fz03F/YD2Cf1q+eX+jE/6virzS9gYAZ
	X+weqSmWi8hIyqDSWBc4F274fSw9Dyb64YtpAyKVDHaAdzkv1gF3wvqNWMvxRN3J167PRuBo4EC
	9olsHFzO+7a3i6pX9gpe5BMchkpdETKWbXSxCkrzwj4l/REA85O3fVcZp94R1onsy7fJWStbjhJ
	8=
X-Google-Smtp-Source: 
 AGHT+IGiKCP9NgXT2cjisK+jWWwDOTYA7EjreNufdZ3Yw6DRuy1LBOlbKMI+IxxCWqY9gmY/xYS+Jw==
X-Received: by 2002:a05:600c:1c8b:b0:458:bfb1:1fb6 with SMTP id
 5b1f17b1804b1-459fb811f48mr35724475e9.2.1754758246997;
        Sat, 09 Aug 2025 09:50:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ecb:3390:a869:bcd1:10f3:33a1?
 ([2a01:e0a:ecb:3390:a869:bcd1:10f3:33a1])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459ebede65asm136285775e9.8.2025.08.09.09.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 09:50:46 -0700 (PDT)
Message-ID: <a18af582-56a8-4407-9894-df5c8bd03558@gmail.com>
Date: Sat, 9 Aug 2025 18:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Hermanns Cyrille <hermannscyrille@gmail.com>
Subject: =?UTF-8?B?W0hEQV1bSFAgRWxpdGVEZXNrIDgwMCBHNV1bODA4NjphMzQ4XSDigJMg?=
 =?UTF-8?Q?HDMI_audio_missing_after_BIOS_update?=
Cc: tiwai@suse.de
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: hermannscyrille@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SHKFXDL4IKSO2E6B4JE7DBH4OFVCRCQY
X-Message-ID-Hash: SHKFXDL4IKSO2E6B4JE7DBH4OFVCRCQY
X-Mailman-Approved-At: Sun, 10 Aug 2025 10:50:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHKFXDL4IKSO2E6B4JE7DBH4OFVCRCQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello ALSA team,

On an HP EliteDesk 800 G5 Desktop Mini with BIOS R21 Ver. 02.22.00,
audio controller Intel Cannon Lake PCH cAVS [8086:a348], HDMI audio 
outputs are no longer detected after this BIOS update.

System:
- Linux Mint 22.1 Cinnamon 6.4.8
- Kernel: 6.8.0-71-generic
- Codecs: Conexant CX20632 (analog), Intel Kabylake HDMI (digital)

Issue:
After boot, HDMI outputs appear as “Not connected”.
HDMI audio works only if I use hdajackretask (Intel Kabylake HDMI → Show 
unconnected pins → set to HDMI/DisplayPort)
and select “Install boot override”.

ALSA report:
http://alsa-project.org/db/?f=a1ee220062b23ad5c13c6d38cde3f1d046ce6260

Request:
Would it be possible to add a quirk for this model so HDMI pins are 
enabled automatically at boot?

Thank you for your help.

