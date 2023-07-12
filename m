Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4D750992
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB6693A;
	Wed, 12 Jul 2023 15:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB6693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689168455;
	bh=yTRvXenkGrqL9z6P0Xvf6hCPwgm+EP+8gjM+700OikM=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DVsT3W75D91l5c3p36RVwBaow0ARKLWCLFlkUQLY0JW4JjFoG/JmtOA9nUKgWsavM
	 jZv7Pyn6THQ6ERCaLTFlLRQoXy3Jrbld5QYRY2btKoWPBxBgKX33k3ARVscGwgfMFf
	 0Ye1hujtaT+vaYnENOzuSXrig0RKjPYHUAjecClk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C8A5F80290; Wed, 12 Jul 2023 15:26:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F463F80290;
	Wed, 12 Jul 2023 15:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E6FEF80549; Wed, 12 Jul 2023 15:26:15 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 789D0F80249
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 15:26:15 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jul 2023 13:26:15 -0000
Message-ID: 
 <168916837549.20.16800242816564295866@mailman-web.alsa-project.org>
In-Reply-To: 
 <168839241976.20.1297601488525827705@mailman-web.alsa-project.org>
References: <168839241976.20.1297601488525827705@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 5NYQNUABRBHJP7BVO7NQZNH5COHDRNCV
X-Message-ID-Hash: 5NYQNUABRBHJP7BVO7NQZNH5COHDRNCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRR44W2X2UQY3FJYRG6C6UPTEPRQIO3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A question about the implementation of notification messages (name, endpoint and function blocks)

The spec defines that these notification only get sent upon receiving a Discovery message. 

Does this mean that the ALSA driver will poll at specific intervals to send a discover message or  can the device send a notification even without a discovery message from the ALSA driver ? I could imagine a function block info / name, or endpoint info/ name or endpoint info change (i.e when the device changes the number of function block)
