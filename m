Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029D88C008
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 11:58:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE4E2358;
	Tue, 26 Mar 2024 11:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE4E2358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711450686;
	bh=+lGbfSuKhjkBWF9UO8Xuu0nb7C9KENvAhm9gMdTB96s=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dCDaX9QIoO5RrZLHdMj/G8Sa53ABN3KWRas7z84YdARH6NdCl0ng0WOPhCug+bFGD
	 BH9Q0pbjSF/8xOw5xsYp/qGH5PdwnbF9GmVep4sGx31ndlxufW4+98UxDOmWxocPhd
	 MH1NUvfIqhcJxfXK+j8/foTUcb+56SDRi3ESDVqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57D84F8057E; Tue, 26 Mar 2024 11:57:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E24E6F8057F;
	Tue, 26 Mar 2024 11:57:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 205A0F8025F; Tue, 26 Mar 2024 11:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from cloudserver3206585-3206616.home.pl
 (cloudserver3206585-3206616.home.pl [46.242.241.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84E8AF80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 11:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E8AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ijbd.eu header.i=@ijbd.eu header.a=rsa-sha256
 header.s=dkim header.b=fowDZLK2
Received: from [192.168.1.26] (79.184.234.139.ipv4.supernova.orange.pl
 [79.184.234.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by cloudserver3206585-3206616.home.pl (Postfix) with ESMTPSA id 3F642105A4
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 11:57:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijbd.eu; s=dkim;
	t=1711450638; bh=+lGbfSuKhjkBWF9UO8Xuu0nb7C9KENvAhm9gMdTB96s=;
	h=Date:From:To:Subject;
	b=fowDZLK2mTI7N6cgVw5MI4hN7fjsS18byeUalHFG3amV4nrhHI7eubR+epSSJx77S
	 C/lxRZpOclYNIVdiP4IIEmMoLvJfiKZJLOCUgU5Vk9JR/HKbJyebDW+xqBIBY7qggp
	 gc2ftjIGpfte2VBmcDUzdwS9cQxaFbW9jF7rdyprICMsetFKfyfXanZ550wEwcBDBU
	 e1463WIwajLs9Zb5eria8fWTd0jcicY8PpeW4EL2G301yVIMkurQ65Y1kOKyJxaU4+
	 qj9KpbVOdPVNISNesD2WaxHUqg4a3hCThL89VWWqEe7AWdgbWUDw0u1o0+v5w/l82z
	 izEv0oJCUQ4hA==
Message-ID: <c34a6f1b-77e4-4a28-9011-4556324817ba@ijbd.eu>
Date: Tue, 26 Mar 2024 11:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jacek Blocki <jblocki@ijbd.eu>
To: alsa-devel@alsa-project.org
Subject: Scan hardware to find speakers not detected by OS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CLIENT-IP: 79.184.234.139
X-CLIENT-HOSTNAME: 79.184.234.139.ipv4.supernova.orange.pl
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: 
 gggruggvucftvghtrhhoucdtuddrgedvledruddufedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecunecujfgurhepkfffgggfhffvufgtgfesthekredttddvjeenucfhrhhomheplfgrtggvkhcuuehlohgtkhhiuceojhgslhhotghkihesihhjsggurdgvuheqnecuggftrfgrthhtvghrnhepfeejtefhfefgvddufeehteelffeftedvffffudduueeltefgieeiueeuveeiieffnecukfhppeejledrudekgedrvdefgedrudefleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejledrudekgedrvdefgedrudefledphhgvlhhopegludelvddrudeikedruddrvdeingdpmhgrihhlfhhrohhmpeflrggtvghkuceulhhotghkihcuoehjsghlohgtkhhisehijhgsugdrvghuqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhhsrgdquggvvhgvlhesrghlshgrqdhprhhojhgvtghtrdhorhhg
X-DCC--Metrics: sv109.home.net.pl 1024; Body=1 Fuz1=1 Fuz2=1
Message-ID-Hash: 4X42SAHLOBF4O2UXEOK5AARUPTLBKJ2Z
X-Message-ID-Hash: 4X42SAHLOBF4O2UXEOK5AARUPTLBKJ2Z
X-MailFrom: jblocki@ijbd.eu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4X42SAHLOBF4O2UXEOK5AARUPTLBKJ2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

In Alsa-devel Digest, Vol 205, Issue 136 there is my message on internal 
spekaker and headphones not working on Huawei D14 laptop. SImilar issue 
was reported in  Vol 205, Issue 142 (No sound "dummy output"  - 
snd_hda_intel on Pop OS 22.04 LTS on Acer chromebook). Is there any 
tool/troubleshooting guide allowing to diagnose above problem? In my 
cases (Huawei laptop) i guess OS does not detect speakers. Is there any 
way to scan hardware to find components undetected by OS?

Regards, Jacek Blocki



