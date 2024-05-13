Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41708C48E0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 23:30:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3340A7F4;
	Mon, 13 May 2024 23:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3340A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715635856;
	bh=ciL/vyeHEY/z8XF/yUNHbkAPS0S7hT0qRdLtF5YnJZU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VEv8YtVq1OjljiDbVmQbQNi7uAi02vMNmWfjEK/BZknoPZDmzXqS8mbazKf6zvgCK
	 Q3QxVWTttN1sNO2QXatX0svuIEnkxlL0Jf9TnZgtX/zacmLDA5M59Or+t8w0NI8gLQ
	 1fCvOfZ+KkapZltA+I5La3/3ZAaOb5iNaGrH3XR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3960CF8025F; Mon, 13 May 2024 23:30:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A249F8058C;
	Mon, 13 May 2024 23:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A86F9F80224; Mon, 13 May 2024 23:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5C3F800E9
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 23:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB5C3F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1715635811054205656-webhooks-bot@alsa-project.org>
References: <1715635811054205656-webhooks-bot@alsa-project.org>
Subject: MOTU 828 (28x32) ucm2 configuration
Message-Id: <20240513213017.A86F9F80224@alsa1.perex.cz>
Date: Mon, 13 May 2024 23:30:17 +0200 (CEST)
Message-ID-Hash: UE6ZXODRY6T5DCX7A7C7GFEMLLHRRW2I
X-Message-ID-Hash: UE6ZXODRY6T5DCX7A7C7GFEMLLHRRW2I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UE6ZXODRY6T5DCX7A7C7GFEMLLHRRW2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #416 was opened from beatboxa:

I am trying to create a UCM for the Motu 828 (28 x 32), which was released in 2024.  (Caution: there have been several versions of the 828 over the past few decades.  I am referring to the 2024 model).  

I am not particularly technical when it comes to code and I had to google what a Pull Request is.  And I am struggling on how to do this.  I had previously created an issue here:  https://github.com/alsa-project/alsa-ucm-conf/issues/415

I have made 2 different attempts at creating a ucm configuration:  1 with and 1 without use of the split pcm macros.  I based the 'macro version' loosely on the Motu M6 ucm.  And I created the one without based on a guide I found online.  The version without macros seemed to get further; but for purposes here, I will attempt the Macro version.

Here are the files and changes I have created.  Unfortunately, when I run the command `spa-acp-tool -c 0 -vvvv info`, the results are:
`spa-acp-tool -c 0 -vvvv info

variable '${var:__Device}' is not defined in this context!
error: /USB-Audio/MOTU/D828-HiFi.conf failed to parse device
error: failed to import hw:0 use case configuration -22
variable '${var:__Device}' is not defined in this context!
error: /USB-Audio/MOTU/D828-HiFi.conf failed to parse device
error: failed to import 828 use case configuration -22
UCM not available for card 828
`

At which point the system goes into an alsa fallback / default.

What am I doing wrong?

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/416
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/416.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
