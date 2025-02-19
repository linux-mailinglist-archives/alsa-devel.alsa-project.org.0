Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF1A3BE97
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2025 13:50:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1DD0604E0;
	Wed, 19 Feb 2025 13:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1DD0604E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739969452;
	bh=W1Bk7r9PRNw1Xqx5ESJShKZ0pA9HYtbGSmuh1njFJcs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cEjRbF+OF+jUmZcEQFKCO314u6QAaz2PPBrAkyWwHgdMGQoVYUxnr694uqaW+7KQv
	 cAxaXb0WYkle8dFkoTraIo9K8l9hpotlNgXuH3YQML8emchfUtfuPBE8ZMH5FFbRHr
	 L0otutgDEkUNC8ebImxBG42YBTxi82HBL/2nG3n8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC3DEF805D4; Wed, 19 Feb 2025 13:50:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E80F805EA;
	Wed, 19 Feb 2025 13:50:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43710F805C9; Wed, 19 Feb 2025 13:50:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A2B13F805C6
	for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2025 13:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2B13F805C6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1739969412222621679-webhooks-bot@alsa-project.org>
References: <1739969412222621679-webhooks-bot@alsa-project.org>
Subject: Realtek driver assignes wrong pins on Omen 16 with B&O audio
Message-Id: <20250219125014.43710F805C9@alsa1.perex.cz>
Date: Wed, 19 Feb 2025 13:50:14 +0100 (CET)
Message-ID-Hash: ZJ37X34N5WAI5I7DCQ6YEMJYZOHP7KPB
X-Message-ID-Hash: ZJ37X34N5WAI5I7DCQ6YEMJYZOHP7KPB
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJ37X34N5WAI5I7DCQ6YEMJYZOHP7KPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #511 was edited from johnfloe:

<!--

Please read our Bug reporting guidelines before opening a bug:
https://wiki.archlinux.org/title/Bug_reporting_guidelines

If you want to help catching more bugs upfront, consider joining the Arch Testing Team:
https://wiki.archlinux.org/title/Arch_Testing_Team

-->

# Description:
I have a dual boot with Arch Linux and Windows 11 on my HP Omen 16 b1001nd with Bang & Olufsen audio.
On Windows, the speakers function normally and the volume is quite loud and full at 100%.
But on Arch, the audio is very shallow and the volume is low compared to Windows.
I've tried using HDAJackRetask, but the Realtek driver overrides the pin settings.
When I blacklist the Realtek module, it switches to Generic and I can enable the pins with hda verbs.
But the then auto switching for the headphones doesn't work, so I have to figure out how to enable that..
It does seem a bit better when enabling pin 0x14 and pin 0x1e, but still not the same as in Windows.
It would be nice to have a working driver/codec so I don't have to configure all the pins myself.

Thanks in advance!

# Additional info:

* package version(s): latest kernel, linux-firmware and sof-firmware installed
* config and/or log files:
Related dmesg output:

`sudo dmesg | grep snd
[    5.052362] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
[    5.052469] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[    5.052725] snd_hda_intel 0000:01:00.1: Disabling MSI
[    5.052736] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client

[    5.388591] snd_hda_codec_realtek ehdaudio0D0: ALC245: picked fixup  for PCI SSID 103c:0000

[    5.388944] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker

[    5.388947] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)

[    5.388949] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)

[    5.388951] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0

[    5.388953] snd_hda_codec_realtek ehdaudio0D0:    inputs:

[    5.388954] snd_hda_codec_realtek ehdaudio0D0:      Mic=0x19`

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/511
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
