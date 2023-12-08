Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758980AC72
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 19:49:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F96883A;
	Fri,  8 Dec 2023 19:49:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F96883A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702061393;
	bh=2ycuctPb3zDHj86AHnxc+254d4p/+rB0kqUnFoJjhtQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ID/vZPbqkzhIDp6+UC1NCM5SdPB6y+JpkNLrmc4RNuk+n7BO6azDYzz+yzBA9izK1
	 1lwpep0lekBxmpdz4Fq1C+x8zDkRcx4oy3PdrAE3q1f+lhZP3cPJYHjQ4Fc3XQ1uS1
	 1FtuJcJPR3BkX42CoWqVaAtwWATt0WNPLGudSAag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23DFEF802BE; Fri,  8 Dec 2023 19:49:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FCB2F802E8;
	Fri,  8 Dec 2023 19:49:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E153F8024E; Fri,  8 Dec 2023 19:49:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 43554F800E4
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 19:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43554F800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1702061357632791042-webhooks-bot@alsa-project.org>
References: <1702061357632791042-webhooks-bot@alsa-project.org>
Subject: possible timing issue with alsa-restore.service
Message-Id: <20231208184927.9E153F8024E@alsa1.perex.cz>
Date: Fri,  8 Dec 2023 19:49:27 +0100 (CET)
Message-ID-Hash: UQ4OOWQZP45QHTKGKEXDI2YMUHFCXRJR
X-Message-ID-Hash: UQ4OOWQZP45QHTKGKEXDI2YMUHFCXRJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQ4OOWQZP45QHTKGKEXDI2YMUHFCXRJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #249 was opened from fajabird:

not sure how to title this issue but the following happens in my case:

System is a Dell XPS one (all in one PC) and I'm running latest manjaro gnome. I noticed that I had no sound although GNOME control center would show a audio device and it was not muted and volume was all the way up. 

So I tried alsamixer and found the device "Headphones" muted and volume at 0. Changing this did the trick and I had sound. I issued an "alsactl store" and checked that "alsa-restore.service" was not deactivated to make this persistant. Still after reboot I had no sound. 

But if I would issue "alsactl restore" manually it would fix the sound issue again. So I suspected that there is an timing issue. Via "systemctl edit --full alsa-restore.service" I added a 30 seconds delay before it would call "alsactl restore" and that fixed the issue permanently. But unfortunately I have no idea how to troubleshoot this properly to find the real root cause of this timing issue.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/249
Repository URL: https://github.com/alsa-project/alsa-utils
