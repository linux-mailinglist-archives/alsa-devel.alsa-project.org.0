Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8659AC638C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 May 2025 10:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBFC06016D;
	Wed, 28 May 2025 10:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBFC06016D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748419267;
	bh=THPrE6fUXi7GvE353Bd/Mb5v6dGJwwgTT0PDqoSobtI=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Xi/1ZJ84Um5QmX0Jnb6MxxoKpv7Gp2eXcGt80aeHygfJiwOimsno4N5JtZMD8OP85
	 Jd3q43Le5NvpfCVMrdfw2RoelI8Weywpzbt4XKyNXQDNdkHSYVFPQM2z6m65AP/Y0s
	 XUzkJZFU4/QX4Yu7R5B6S+LvvPkhCvSjcOIEeQ9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B4C0F805C1; Wed, 28 May 2025 10:00:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6B0F805BD;
	Wed, 28 May 2025 10:00:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA4F4F80212; Wed, 28 May 2025 10:00:32 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id D2243F800D2
	for <alsa-devel@alsa-project.org>; Wed, 28 May 2025 10:00:32 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] Fix swapped left and right channels for Lenovo
 ThinBook 13x
 Gen4 sound
From: xebesex817@frisbook.com
To: alsa-devel@alsa-project.org
Date: Wed, 28 May 2025 08:00:32 -0000
Message-ID: <174841923285.20.7882190113041284599@mailman-web.alsa-project.org>
In-Reply-To: <20240701205516.22662-2-envelsavinds@gmail.com>
References: <20240701205516.22662-2-envelsavinds@gmail.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: MIUYTNF2RTH5GEXJDVG7MDTWEN4EG24S
X-Message-ID-Hash: MIUYTNF2RTH5GEXJDVG7MDTWEN4EG24S
X-MailFrom: xebesex817@frisbook.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIUYTNF2RTH5GEXJDVG7MDTWEN4EG24S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's great to see the attention to detail—swapped audio channels can definitely be a subtle but annoying issue. Good to know it's been tested on the ThinkBook 13x Gen4. Appreciate the quick patch to get everything aligned properly. https://ragdollhit.io/
