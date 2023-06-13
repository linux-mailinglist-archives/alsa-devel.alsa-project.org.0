Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B272E404
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:25:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B5EDED;
	Tue, 13 Jun 2023 15:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B5EDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686662745;
	bh=7VOB2lHpQ567eQNUBIAReBI90UM+bg4zeEt+nD9DRkk=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hykT+Cpbr5t3/rQKDsL9lFntx/sbMLCPzv5lTIWlY8T3KugAr0rIDdUw5B6MujOUJ
	 cLkUTtk9MjgeLLolTUFrMXR7fOnTjSmL7yOlj+5e1nTJNfitgUK2hh0vxN9FFyNWal
	 nUip1AazXN9opS3OuUFAqtx/fO+a+vkAH6pdNVaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6878EF80551; Tue, 13 Jun 2023 15:24:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05027F80544;
	Tue, 13 Jun 2023 15:24:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B997FF80548; Tue, 13 Jun 2023 15:24:11 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id A4DF4F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 15:24:11 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Happy Debugging" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 13 Jun 2023 13:24:11 -0000
Message-ID: 
 <168666265167.22.10672052293918857652@mailman-web.alsa-project.org>
In-Reply-To: <87o7ljplqa.wl-tiwai@suse.de>
References: <87o7ljplqa.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: OVM2FLDEIQN362OWDQHUZ4KAK5AK7TSL
X-Message-ID-Hash: OVM2FLDEIQN362OWDQHUZ4KAK5AK7TSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CB37NRHCKXECAKMTCKKASMUJ53OGRZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many thanks, it seems that you already receive the new specs :-) 

BTW I just joined this list, any my email address is shown in posts instead of the username as for other member
is there a contact for this list (webmaster) to discuss this ? I could not find any contact for the admin.

Item 5. assume this is 7.1.6.2 Stream Configuration Request /  7.1.6.4 Stream Configuration Notification.  
Can it be done via the ALSA API ?
