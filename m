Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF54C23942
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Oct 2025 08:39:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D6360213;
	Fri, 31 Oct 2025 08:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D6360213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761896369;
	bh=lCFEytRlvz0yYiWEKbdSO0KrPg/Q46+M77h8sJQK/3A=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WgoHevSmoxqeMgsHlYp4NZgY+5K3QApabPSBaD+FBKehrVEBm2I51d6PD9AWRpXgQ
	 zzyg0HyLbByQokAXHhN32hQV48DO86Nn65JpyY01JFk3e2HP3SsLktEOftqReYD0jf
	 3uE7kJF9Sgby9XSFNUTPj8/9VR6JtlG6lOXRanww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB3DBF805BD; Fri, 31 Oct 2025 08:38:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EFADF805B5;
	Fri, 31 Oct 2025 08:38:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46137F8021D; Fri, 31 Oct 2025 08:38:50 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 3593FF80038
	for <alsa-devel@alsa-project.org>; Fri, 31 Oct 2025 08:38:50 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: 
 =?utf-8?q?Re=3A_Raptor_Lake_external_jack_needs_manual_ALSA_unmute_and_speak?=
 =?utf-8?q?ers_don=E2=80=99t_auto-mute?=
From: bexob46807@potatod.com
To: alsa-devel@alsa-project.org
Date: Fri, 31 Oct 2025 07:38:50 -0000
Message-ID: 
 <176189633019.20.10753840871425280203@mailman-web.alsa-project.org>
In-Reply-To: 
 <176188026657.20.4961384896608372201@mailman-web.alsa-project.org>
References: <176188026657.20.4961384896608372201@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: KSGKMJ3K7KTN3EKQ3MYAMDGVFCPDDCI4
X-Message-ID-Hash: KSGKMJ3K7KTN3EKQ3MYAMDGVFCPDDCI4
X-MailFrom: bexob46807@potatod.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FQSKECAXXT4DKFYXP2PHZBSZBONRV26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since the SOF driver sits on top of the HDA kernel interface, there may be a strange missing or incorrect HDA kernel for your particular motherboard/codec combination. The `snd_hda_intel` driver often needs specific parameters to properly initialize complex codecs, especially those with composite jacks.
https://sprunki-game.io/
