Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1758A44DC
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Apr 2024 21:30:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9343314E4;
	Sun, 14 Apr 2024 21:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9343314E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713123039;
	bh=OnnlxCYEjwqjO8RoJo30yB4EEVnxGLprCY84bMFxezI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SuLe/Glh73Lz2batMZKifWnNyKL/PXZbrayS99ys4qZEFA7tPvvbi2bkqetuE8nga
	 FGPZKOhnzU/ZM+Bi5O5e/DW8AVBDhogx1olJo4IlKpxjgorjN4FEX292VRCUJEpIiv
	 ADuihR4kiqoHZBj6RxlIag9HAfSfrJmzkJJUxNAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CF1FF805D3; Sun, 14 Apr 2024 21:29:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81054F805BF;
	Sun, 14 Apr 2024 21:29:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D97DEF8025A; Sun, 14 Apr 2024 21:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 962AFF8001F
	for <alsa-devel@alsa-project.org>; Sun, 14 Apr 2024 21:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 962AFF8001F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713122942524380207-webhooks-bot@alsa-project.org>
References: <1713122942524380207-webhooks-bot@alsa-project.org>
Subject: weird behaviour with alsactl restore under pipewire
Message-Id: <20240414192904.D97DEF8025A@alsa1.perex.cz>
Date: Sun, 14 Apr 2024 21:29:04 +0200 (CEST)
Message-ID-Hash: ONP6ORQFN3UTPO7XWWKAXTTOSLDIG7V2
X-Message-ID-Hash: ONP6ORQFN3UTPO7XWWKAXTTOSLDIG7V2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONP6ORQFN3UTPO7XWWKAXTTOSLDIG7V2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #263 was edited from lucasreis1:

So I'm at the point where I need to manually disable auto-mute after every reboot on my card. I've tried storing info using `alsactl store` and enabling `alsa-restore.service`, but I get errors when calling restore after boot (either manually or via the systemd service):

```sh
Found hardware: "HDA-Intel" "ATI R6xx HDMI" "HDA:1002aa01,00aa0100,00100700" "0x1043" "0x8809"
Hardware is initialized using a generic method
alsactl: set_control:1339: failed to obtain info for control #1 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #2 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #3 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #4 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #5 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #6 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #7 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #8 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #9 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #10 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #11 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #12 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #13 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #14 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #15 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #16 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #17 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #18 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #19 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #20 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #21 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #22 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #23 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #24 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #25 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #26 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #27 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #28 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #33 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #34 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #35 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #36 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #37 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #38 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #39 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #40 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #41 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #42 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #43 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #44 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #45 (No such file or directory)
Found hardware: "HDA-Intel" "Realtek ALC897" "HDA:10ec0897,104387fb,00100402" "0x1043" "0x87fb"
Hardware is initialized using a generic method
alsactl: set_control:1339: failed to obtain info for control #1 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #6 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #7 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #8 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #9 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #10 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #11 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #12 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #13 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #14 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #15 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #16 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #17 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #18 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #19 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #20 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #21 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #22 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #23 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #24 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #25 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #26 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #27 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #28 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #29 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #30 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #31 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #32 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #33 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #34 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #35 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #36 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #37 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #38 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #39 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #40 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #41 (No such file or directory)
alsactl: set_control:1339: failed to obtain info for control #42 (No such file or directory)
```

If I store configs again via `alsactl store` and restore them using `alsactl restore`, everything works, but the issue returns after another reboot.

Here's the output of `alsa-info.sh` if it helps:
[alsa-info.txt](https://github.com/alsa-project/alsa-utils/files/14971854/alsa-info.txt)


Note that this only happens with my speakers, I have headphonse connected which work fine and are not auto-muted after every boot.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/263
Repository URL: https://github.com/alsa-project/alsa-utils
