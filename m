Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B09C41C7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2024 16:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F17F3105F;
	Mon, 11 Nov 2024 16:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F17F3105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731338741;
	bh=tr/T3zLOwru2cRm9XGufEhj6+9vQZzZk6o8w6cRinKQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vKwyZ+XzZAWnhTsbX11UsBgNoq4p9xJ/Rl5d4rTcVh/zpgtk8zN/r6j/ngvBTnoGN
	 67udOhdNrTGXRMCMz94SRq9sXDehGxlqK/8FstydQ71Am//Ts6BWZbA62AvcSGHx7f
	 NbGw2YRHD2JtDklvCdkdGhYgDhTy6yftOVNL6yEY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD386F800C9; Mon, 11 Nov 2024 16:25:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 170F3F805B1;
	Mon, 11 Nov 2024 16:25:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B6A7F80199; Mon, 11 Nov 2024 16:25:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8CAF800C9
	for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2024 16:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD8CAF800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731338701746009111-webhooks-bot@alsa-project.org>
References: <1731338701746009111-webhooks-bot@alsa-project.org>
Subject: ThinkPad P14s Gen 5 AMD micmute LED is not working sometimes.
Message-Id: <20241111152504.6B6A7F80199@alsa1.perex.cz>
Date: Mon, 11 Nov 2024 16:25:04 +0100 (CET)
Message-ID-Hash: 64EFXL6GOTZ66O6LZOTE3BXOHZWDKAT3
X-Message-ID-Hash: 64EFXL6GOTZ66O6LZOTE3BXOHZWDKAT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64EFXL6GOTZ66O6LZOTE3BXOHZWDKAT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #278 was opened from pma1:

The mic and sound output works fine.
The mute LED works fine.
But when press Fn+F4, the mic-mute led is not working sometimes after bootup.
The failrate is like 1/10.

Tested with latest alsa-ucm from git, it's reproduced.
/sys/class/sound/ctl-led/mic/card1# cat list
7
# amixer -c 1 controls
numid=12,iface=CARD,name='Headphone Jack'
numid=11,iface=CARD,name='Mic Jack'
numid=13,iface=CARD,name='Speaker Phantom Jack'
numid=10,iface=MIXER,name='Master Playback Switch'
numid=9,iface=MIXER,name='Master Playback Volume'
numid=2,iface=MIXER,name='Headphone Playback Switch'
numid=1,iface=MIXER,name='Headphone Playback Volume'
numid=16,iface=MIXER,name='PCM Playback Volume'
numid=17,iface=MIXER,name='Mic ACP LED Capture Switch'
numid=8,iface=MIXER,name='Mic Boost Volume'
numid=7,iface=MIXER,name='Capture Switch'
numid=6,iface=MIXER,name='Capture Volume'
numid=5,iface=MIXER,name='Auto-Mute Mode'
numid=4,iface=MIXER,name='Speaker Playback Switch'
numid=3,iface=MIXER,name='Speaker Playback Volume'
numid=15,iface=PCM,name='Capture Channel Map'
numid=14,iface=PCM,name='Playback Channel Map'

# echo 'Capture Switch' > detach
# echo 'Mic ACP LED Capture Switch' > attach
/sys/class/sound/ctl-led/mic/card1# cat list
17

Then the micmute LED will work.
[alsa-info-amd-micmutled.txt](https://github.com/user-attachments/files/16279936/alsa-info-amd-micmutled.txt)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/278
Repository URL: https://github.com/alsa-project/alsa-utils
