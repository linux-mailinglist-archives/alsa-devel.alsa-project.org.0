Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3C4F1DF1
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 23:52:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD281692;
	Mon,  4 Apr 2022 23:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD281692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649109171;
	bh=8t3rCD6NbtU6MhrJBrNN5oZIBhRxPuUVrwX+x6ushYo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IwpC2qSGE6qVjRxQYMWQ6TNX8vQwLYF7Vmc/H2br+3Cboh0eq+j/nYZnSZ88lqOdB
	 vDCLWqW9bpSPjzyf8jUaUzUn9DxbqVEWMzZzTIunH/zDXnkTQ07Upvn56BjOpx3bpj
	 hWbUcWu4H3SXnhk1n8cQUxoBEyTsGIABGEmRuTBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBCE5F801F7;
	Mon,  4 Apr 2022 23:51:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7793F80162; Mon,  4 Apr 2022 23:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 50DEEF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 23:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50DEEF8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1649109108747370005-webhooks-bot@alsa-project.org>
References: <1649109108747370005-webhooks-bot@alsa-project.org>
Subject: Presence of "default" device name crashes unity3d games
Message-Id: <20220404215151.E7793F80162@alsa1.perex.cz>
Date: Mon,  4 Apr 2022 23:51:51 +0200 (CEST)
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

alsa-project/alsa-lib issue #214 was edited from the3dfxdude:

In a recent Slackware 15.0 distro release, the alsa-lib version is now 1.2.5.1. This causes a crash in Kerbal Space Program similar to issue #27. A change was made to close issue #27 in alsa-lib 1.2.3. That change did not correct the crash however in 1.2.3 or 1.2.5.1 in my case.

This is the noted difference for "aplay -L" between 1.2.3 and 1.2.1:
```
--- dump_1_2_1	2022-03-10 12:38:16.991433004 -0700
+++ dump_1_2_3	2022-03-10 12:37:53.467443226 -0700
@@ -1,5 +1,9 @@
 null
     Discard all samples (playback) or generate zero samples (capture)
+default
+    Default Audio Device
+sysdefault
+    Default Audio Device
 default:CARD=IXP
     ATI IXP, ATI IXP AC97
     Default Audio Device
```

Removing this "default" device entry fixes the issue on this system. You may remove the default device name by editing src/conf/pcm/default.conf and adding under the hint section "omit_noargs true".

Unity must be parsing the device name, and with certain device names, if there is no ':' doing something bad, as there is a pattern here on what it trips on. I have no idea how to get them to correct this, so opening the issue here at least for the record if anyone else has an issue with this.

Also, I am not sure what triggers "default" to show. I did a survey and 3 out of 5 of my slackware 15.0 systems have it. And 2 do not. Does this have something to do with parsing the system alsa config and the available sound devices in the system? I don't define any asound.conf for any of these, so these are almost 100% stock slackware systems, there should otherwise be no difference.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/214
Repository URL: https://github.com/alsa-project/alsa-lib
