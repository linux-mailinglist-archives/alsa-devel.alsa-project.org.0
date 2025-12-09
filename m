Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A772CAF6BC
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 10:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE47C60200;
	Tue,  9 Dec 2025 10:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE47C60200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765271738;
	bh=P3vj+TFhbkk4kpMRInrp1joCRPV7L2rtN19sWYDh0c0=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mPZ7Dcfo4IDkRoQIpjdrr12/QK5RjQKfRDHsRKPom7482LMYPfbWIaNv3/JS65DMW
	 Becy3vHnwfsGQ3RtF49qy2zJgqtQfkP9H+vU74zPN5m/slFbKBtmlxRXwHQWtp8piN
	 3Ab6WrMXx6PlYFPeJLkGpvoxuojyhiijfPd+GS5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA36EF805D8; Tue,  9 Dec 2025 10:15:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E8FF805D2;
	Tue,  9 Dec 2025 10:15:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66A65F8028B; Tue,  9 Dec 2025 10:13:41 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D9B0F800B8
	for <alsa-devel@alsa-project.org>; Tue,  9 Dec 2025 10:13:41 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: Enable Mute LED for HP platform
From: combativedorey@comfythings.com
To: alsa-devel@alsa-project.org
Date: Tue, 09 Dec 2025 09:13:41 -0000
Message-ID: <176527162104.22.8693984329605129361@mailman-web.alsa-project.org>
In-Reply-To: <ab5d4498f7454b25b245a3bad8fb95b3@realtek.com>
References: <ab5d4498f7454b25b245a3bad8fb95b3@realtek.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: N7RBUKQVYIL6J6YTAPKUGLUYKAJF5RXN
X-Message-ID-Hash: N7RBUKQVYIL6J6YTAPKUGLUYKAJF5RXN
X-MailFrom: combativedorey@comfythings.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7RBUKQVYIL6J6YTAPKUGLUYKAJF5RXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks for the patch, Kailang! Hope this helps those with HP ZbookX G2i. Reminds me of hunting for specific abilities, similar to finding rare Pokémon in Pokerogue. Speaking of, is there a resource list/tracker similar to a Pokerogue Dex for these hardware tweaks? Knowing compatible models would be great! https://playpokerogue.com and https://wiki.playpokerogue.com
