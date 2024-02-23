Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2238867E3F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 18:23:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6558CE72;
	Mon, 26 Feb 2024 18:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6558CE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708968219;
	bh=fJQJy+9agwrK2lYXTF4aYTDMh/E/eJgm8QM6Y7gCS+s=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nTBvZWz4//VtUG4FpQFV6J2b4yUIEbwhu5RkuFHpx6FQNqmZBNMATpaV6hLA1VE8X
	 s963R6vj2kwISv1krnyHi+swviXNqf4xPpQ9AL4LQizGYLXByh6S6s4LNK7/90o3OG
	 PWvlF1hrUtkBQjQPetXJhYaA+lsK4yO9dAzy326A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DAEBF805C7; Mon, 26 Feb 2024 18:22:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FBDCF805C3;
	Mon, 26 Feb 2024 18:22:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9771F80496; Fri, 23 Feb 2024 15:42:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-200166.simplelogin.co (mail-200166.simplelogin.co
 [176.119.200.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96DDCF800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 15:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96DDCF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=willian.wang header.i=@willian.wang header.a=rsa-sha256
 header.s=dkim header.b=E68YxpyU
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1708699326;
	cv=none;
 b=0nMPzDPYW4p6JsSyKmFOT/Sop713MEwwovmV7XCuE+XgjYQ4rpaZ/gkysnNMfs/+iXVnLU7QZJ5JQrnlmHxIyFrQZmoWUVhEk1wlH+HPRVCqahOlaSv1/hsDe48Sf/la/lfL39xOAppjg5pG9N+5KHGquQK01rjwbo3et1jZ2Lpq8BRG3zlQ2+yZymjRqusKwVB9Uq3rVQrwTSNvEOzwuKxS/NHXo+6Jj/lmE9zlGtOJyLrApyMcnQEUZnmpgDkW4O3n2qYSGsgZ0Kyq6pN3pRXx+dnbg5FWo7JAzDGhws7dTVwkm449zt4BW5xAj+L4u5Fc/XHIGpdPXnMLVFHcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1708699326; c=relaxed/simple;
	bh=fJQJy+9agwrK2lYXTF4aYTDMh/E/eJgm8QM6Y7gCS+s=;
	h=Date:Subject:From:To:Cc;
 b=ZdHwqOskObZe/iB0Z3sHjMewHZ6jMCRWZpeqVWw8JH5/UYVusu7uqdQOwELlXBCpA2UnruX6h3Lw+z2lm5ig16q8A+f1iHKURUa5vyUhhjD++DN3WoSeKgimuajXGVYUkJ9aQRGfT/FnebEmb9wk/5hO3jnBrBDQ+eJUCTaC+/R0XfY0jg6UD4s4TqtkyxwWS9wHAWqP9FGkJDIvWqgdo5Jz+Yhbl3jKR3d5lkJy2sJ6MXiLowoCoAP8KmvGRQL8lz/CmfFn5xX4xesnjrpP/DoB02uVobEHQAzXWXdh0IjtJMpkLrqzDWDB4YOKw0mnkA8zKbSfBlREkYe708AxjQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willian.wang;
	s=dkim; t=1708699326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fJQJy+9agwrK2lYXTF4aYTDMh/E/eJgm8QM6Y7gCS+s=;
	b=E68YxpyUKmZZqju5KM/yWHZRZJrHvNxLPP2196UAzkW487MB2z2eeez/HGFDMAmpKhKXzq
	020APPMZ4okCPRyYE7l5EhV8gHbhDy7uLrOix1baJUwGmCOykOJaiHWrQVs5MW7+CDDcDc
	UC2U1lHvG7ZeTkGX7cTnerqYiVYv8dw=
MIME-Version: 1.0
Date: Fri, 23 Feb 2024 11:41:26 -0300
Subject: Re: PCI SSID and Codec SSID collision?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
From: Willian Wang <kernel@willian.wang>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,linux-sound@vger.kernel.org,soyer@irl.hu
Message-ID: <170869932581.7.612391552809015627.273152461@willian.wang>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 273152463
X-SimpleLogin-Want-Signing: yes
X-MailFrom: 
 sl.lmysyibsg4ztcnjsgq3dglbageyteobugazf2.dteabvakxzimu@willian.wang
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AXBDDN7JOVGZ5ERYH4PBGOG57UIAXOYE
X-Message-ID-Hash: AXBDDN7JOVGZ5ERYH4PBGOG57UIAXOYE
X-Mailman-Approved-At: Mon, 26 Feb 2024 17:22:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXBDDN7JOVGZ5ERYH4PBGOG57UIAXOYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, I'm curious about the reasons for the fixup table to be the same
for PCI and Codec SSIDs and if the PCI SSID is usually more important
for it to be checked before the Codec. Anyway, would a simple
conditional statement to match these exact PCI and Codec SSID to set
the fixup manually be enough? There seems to already exist a manual
fix for TX300 and ROG Strix G17 there (not the same kind of fix and
with a FIXME comment, though). I have this exact laptop model and
would like to try to contribute to the code if it's not too
complicated.

