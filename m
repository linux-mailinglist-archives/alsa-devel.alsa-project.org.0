Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCED92AE5C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 04:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDCA584C;
	Tue,  9 Jul 2024 04:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDCA584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720493822;
	bh=rhb65FWAuqNa9TAGVEAZ3gcRNeGEGHeSYmgq8fqtYMg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FuILF0Yj+9IQon7Xugk4PtOVj8gKmGJO4f++GiUwJu3x3vsEYb9psCAJylguVwqHK
	 /OEMjBMa1w7i+XPkC5rUcHGvM3r9VgrlTeNj5bSOMLcc7oL5KyXCEXLMipOVX/e0pL
	 qHY0pkcwbwcBFKnyPX1J8lpXwZU2vqOQUVlZOW9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CAB6F80588; Tue,  9 Jul 2024 04:56:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDEEF805AF;
	Tue,  9 Jul 2024 04:56:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7FC3F801F5; Tue,  9 Jul 2024 04:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 35260F800FE
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 04:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35260F800FE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1720493570419191360-webhooks-bot@alsa-project.org>
References: <1720493570419191360-webhooks-bot@alsa-project.org>
Subject: Mic not working on "ROG Strix Z790-A Gaming WIFI II" with ALC4080
Message-Id: <20240709025256.D7FC3F801F5@alsa1.perex.cz>
Date: Tue,  9 Jul 2024 04:52:56 +0200 (CEST)
Message-ID-Hash: 6OEKXQY4RXT377LFZBIYJXSK4IVOXIDI
X-Message-ID-Hash: 6OEKXQY4RXT377LFZBIYJXSK4IVOXIDI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OEKXQY4RXT377LFZBIYJXSK4IVOXIDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #431 was opened from luluonino:

I ran into this issue https://github.com/alsa-project/alsa-ucm-conf/issues/394 while searching about exactly the same problem on "ROG Strix Z790-A Gaming WIFI II". The commit included in issue 394 fixed the speaker on my microphone plugged into the case front panel. But the mic still doesn't work. It is detected as "Microphone - USB Audio" but it doesn't pick up any sound. 

I'm running Ubuntu 24.04. Here is the alsa-info dump. Note after applying the fix in issue 394, the audio codec is still detected as generic USB audio but there is indeed sound afterwards. 
[alsa-info.txt](https://github.com/user-attachments/files/16136523/alsa-info.txt)

I've tried all potential solutions I could find online but none worked. Any help is greatly appreciated!

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/431
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
