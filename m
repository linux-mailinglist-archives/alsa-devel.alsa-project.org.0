Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B52CC5C22
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 03:15:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE6C960224;
	Wed, 17 Dec 2025 03:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE6C960224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765937733;
	bh=LnIt4UhjHG3V2GulF4MC7A3xzopNBI/ZjbpO+2LcKPE=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lX0koByjhybilp3wejcrXgGe7V+3a8ZoGg5sBWKyX+ZJTDbIHkQcRkyVxkp3cpvgs
	 L+Ix0MRdqMoAXsFYjU2RXzOWVuy7lLZ3E3xrfXvxJEZ3RH3U98UEh1ObD3feWZM10m
	 ojerueCy+07NxXRHzn/AtBIjQNTjFRcKaMQNSCpw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88645F805D3; Wed, 17 Dec 2025 03:15:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E26F805D4;
	Wed, 17 Dec 2025 03:15:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6692F805A8; Wed, 17 Dec 2025 03:14:46 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 80182F8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Dec 2025 03:14:46 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1] ASoC: amd: acp: Audio is not resuming after s0ix
From: otiscavin3@gmail.com
To: alsa-devel@alsa-project.org
Date: Wed, 17 Dec 2025 02:14:46 -0000
Message-ID: <176593768640.22.9330224813705684643@mailman-web.alsa-project.org>
In-Reply-To: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
References: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: NYER2KD3HHT3JU4OJ6UPUHHCHGG43EME
X-Message-ID-Hash: NYER2KD3HHT3JU4OJ6UPUHHCHGG43EME
X-MailFrom: otiscavin3@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYER2KD3HHT3JU4OJ6UPUHHCHGG43EME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

That subject line refers to a Linux kernel bug-fix patch for AMD audio on modern power-saving systems. https://sprunkiretakemod.net/
