Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 302668A44DB
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Apr 2024 21:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66FE4F52;
	Sun, 14 Apr 2024 21:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66FE4F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713123017;
	bh=d3ouW42zFxz0ULl4IdLTz1BOvZr9/hAe1UhmxGGBFOY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=C2R/uAsafp65ll1N3gCJK0ua+74rmyn/vj4Bc5rf9TraO4iKuZr5tOTw48Mc83wf6
	 ovl9PD095jQtT4JtgWhJsj3gGkT0ZEtBc74Hrege4ivapkQEhVf+lAgf4M+ifOeN7r
	 Abp1fnraNtzO8MpufkYeh9AbVyBRdGmkg2wDJYMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B97ABF805AE; Sun, 14 Apr 2024 21:29:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FEFFF80580;
	Sun, 14 Apr 2024 21:29:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9AFF8025A; Sun, 14 Apr 2024 21:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BB856F8001F
	for <alsa-devel@alsa-project.org>; Sun, 14 Apr 2024 21:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB856F8001F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713122885528753042-webhooks-bot@alsa-project.org>
References: <1713122885528753042-webhooks-bot@alsa-project.org>
Subject: weird behaviour with alsactl restore under pipewire
Message-Id: <20240414192820.7B9AFF8025A@alsa1.perex.cz>
Date: Sun, 14 Apr 2024 21:28:20 +0200 (CEST)
Message-ID-Hash: B4XV4OBKYBM5TJ7OYD4JAXSDVGS7DJAT
X-Message-ID-Hash: B4XV4OBKYBM5TJ7OYD4JAXSDVGS7DJAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4XV4OBKYBM5TJ7OYD4JAXSDVGS7DJAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #263 was opened from lucasreis1:

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

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/263
Repository URL: https://github.com/alsa-project/alsa-utils
