Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC6958347
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 11:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1446F20C;
	Tue, 20 Aug 2024 11:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1446F20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724147684;
	bh=3Eiz+YIoVQm492KnFcpoE4AIN9L/rb8OrJYOWrNHXLo=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IqzNNtx5cQ3srGfoJyPMFuu7KRV5mVW7eVk0BxC6mXr6qKxsANms19aqFAVSUBhQQ
	 7DbJbyRSkIO/ETIHKSP2Ng737vNJFL5+0N6jy5CyrkFqhC2CGiRp+mzTsPk+GcHnpA
	 SQg7GmkRTuWYB8XWA+56syl4s3qWDhmDIETt0Lfk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA59F805A1; Tue, 20 Aug 2024 11:54:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A85BF80588;
	Tue, 20 Aug 2024 11:54:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68D77F80494; Tue, 20 Aug 2024 11:54:06 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 35328F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 11:54:06 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [DISCUSSION] Why doesn't ALSA autogenerate/autoconfigure the mono
 profile
 by default?
From: xeroxslayer@proton.me
To: alsa-devel@alsa-project.org
Date: Tue, 20 Aug 2024 09:54:06 -0000
Message-ID: 
 <172414764621.10290.2584925424518127275@mailman-web.alsa-project.org>
In-Reply-To: 
 <-hY2k_-HP_RpNxt1vOEArHKgjIw69LG4IcnstasrAk_1knJNIpf7OhREgR7QSJky95DP4pn8-fo7Ne1YDbqQKbqNh0m_b-p2Id1cd5Kq3TU=@proton.me>
References: 
 <-hY2k_-HP_RpNxt1vOEArHKgjIw69LG4IcnstasrAk_1knJNIpf7OhREgR7QSJky95DP4pn8-fo7Ne1YDbqQKbqNh0m_b-p2Id1cd5Kq3TU=@proton.me>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: TZNHPZQ4EZ53DKSHY3IEES2A4COA6TPQ
X-Message-ID-Hash: TZNHPZQ4EZ53DKSHY3IEES2A4COA6TPQ
X-MailFrom: xeroxslayer@proton.me
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQ4LV7O52S22GM2SABZQONJRIMM5TOEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I'm sorry for the triple mail thread, took them a while to show up, I though they got lost in cyberspace. I have no idea how to delete the rest, maybe admins can sort this out.

Once again, I am very very sorry.

We can continue in this thread.
