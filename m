Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCACB00B45
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jul 2025 20:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D7360188;
	Thu, 10 Jul 2025 20:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D7360188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752171922;
	bh=rJkn6UDvMpDnjeKfs+q8Opc7iHPgZAUeWNAEbk5hu4w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uYcYMVSVZLRJwxky6MztflGTQcF9tezNJ/1HhdwWPvPA8X2bCWUbNKO7aUlDbxT0r
	 kLoyPJnVPMzU8IVmrZCxAKXpIez5H+1W5l8eXF5V3io+VsXtn73P1jtKC4DQrZH3zP
	 2L8PDudxIoMT20DfIBWnCxPIflngBRpn9XE8aq+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B20FF80527; Thu, 10 Jul 2025 20:24:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B106F80527;
	Thu, 10 Jul 2025 20:24:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB3FF80526; Thu, 10 Jul 2025 20:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E828FF800B5
	for <alsa-devel@alsa-project.org>; Thu, 10 Jul 2025 20:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E828FF800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1850f709ff42f600-webhooks-bot@alsa-project.org>
In-Reply-To: <1850f709ff104700-webhooks-bot@alsa-project.org>
References: <1850f709ff104700-webhooks-bot@alsa-project.org>
Subject: Realtek ALC897 - no 5.1, 7.1 surround sound
Date: Thu, 10 Jul 2025 20:24:40 +0200 (CEST)
Message-ID-Hash: RR3QXNAFWX7HVGHTGFDQJQCEULJUGQK2
X-Message-ID-Hash: RR3QXNAFWX7HVGHTGFDQJQCEULJUGQK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RR3QXNAFWX7HVGHTGFDQJQCEULJUGQK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #590 was opened from tomaszdrozdz:

Hello all.  
  
In nutshell:  
- I can not set 5.1 sound on my Fedora.  
- My sound card is Realtek ALC897.  
  
First I described it here: https://discussion.fedoraproject.org/t/5-1-7-1-sound-speakers/156932/4  
Then here: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4788  
And so I got here.  

If you need more info or action to be taken from me please let me know.  

Help, assist - Please.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/590
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
