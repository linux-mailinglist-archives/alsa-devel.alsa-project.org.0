Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E87D7341D2
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 17:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9CF82B;
	Sat, 17 Jun 2023 17:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9CF82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687014534;
	bh=rAgUijQQLEq/Bf2KXTyST0z9AAXi2OujpsZTLnoWqSc=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o4Doff8rAHgEAvZsvjOUy0qti6UzkTT9Sgddvcz1I7xtCXXmgK4VX3wnG5YnRDFDu
	 6xxUFjW5vwcfIUJzqCBbtCltDkeAhMLjWkUDSyTNoS/ph9ckq7f3Wq0FrJ97IkmKEN
	 bGqLxmju7xjINVb84Hfscntycmcbeo4Avu9h3k54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99921F80149; Sat, 17 Jun 2023 17:08:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05095F80132;
	Sat, 17 Jun 2023 17:08:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8613BF80149; Sat, 17 Jun 2023 17:07:56 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E2EF800BA
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 17:07:56 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sat, 17 Jun 2023 15:07:56 -0000
Message-ID: <168701447604.22.7960672689503331502@mailman-web.alsa-project.org>
In-Reply-To: 
 <168692503857.22.5904642104496232941@mailman-web.alsa-project.org>
References: <168692503857.22.5904642104496232941@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: NOMA3RUBAO76YZXNYI6X6GMA6PXVC5RT
X-Message-ID-Hash: NOMA3RUBAO76YZXNYI6X6GMA6PXVC5RT
X-MailFrom: happy.debugging@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NOMA3RUBAO76YZXNYI6X6GMA6PXVC5RT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

An Attempt to replay the changes to 6.2 :
starting with linux-next (On branch next-20230614) as master
According to tag 6.4-rc2 the  commit for it is  f81fe2a4874338a1bfc599cae903a6101217b0a5
# reset the  master to 6.4-rc2:
$git reset --hard  581fe2a4874338a1bfc599cae903a6101217b0a5
$git checkout v6.2
Previous HEAD position was f1fcbaa18b28 Linux 6.4-rc2
HEAD is now at c9c3395d5e3d Linux 6.2
$git rebase master
Successfully rebased and updated detached HEAD.
$git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
$git merge master
Already up to date.
Running menuconfig, there are no option for MIDI 2.0 / UMP,  though the Makefile shows 6.4-rc6 and the ump files are in the source tree.
