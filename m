Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADEC23208
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Oct 2025 04:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA8156020E;
	Fri, 31 Oct 2025 04:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA8156020E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761880308;
	bh=ImpSPzD1nUuzhJJz4aUlkz2TC+CFGoFcPB0rUiuR+zk=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hPjZz3AYSERTfgifgsaGdXswRqbKp63m6BNHWMUXRcEbbawC+MaK28tMPlS38bRds
	 PA4GHAYpQg4yd5NMHsaJ0rSejqjILlQMRQcH2b0emaC6pVvfLebOP+Tc+gfIReULuC
	 joZ/IbAN8614N6nfZQtq3I3EkAlZU64MpYy66Vq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9354EF805C1; Fri, 31 Oct 2025 04:11:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 487F4F805C5;
	Fri, 31 Oct 2025 04:11:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A99ADF8021D; Fri, 31 Oct 2025 04:11:06 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 95814F8003C
	for <alsa-devel@alsa-project.org>; Fri, 31 Oct 2025 04:11:06 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?Re=3A_Raptor_Lake_external_jack_needs_manual_ALSA_unmute_and_speak?=
 =?utf-8?q?ers_don=E2=80=99t_auto-mute?=
From: eleeselees68@gmail.com
To: alsa-devel@alsa-project.org
Date: Fri, 31 Oct 2025 03:11:06 -0000
Message-ID: <176188026657.20.4961384896608372201@mailman-web.alsa-project.org>
In-Reply-To: <1872eb7cf6a44900-webhooks-bot@alsa-project.org>
References: <1872eb7cf6a44900-webhooks-bot@alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: M5MRJAWC3VDSQPAPUB7FOTK2T5ELPULZ
X-Message-ID-Hash: M5MRJAWC3VDSQPAPUB7FOTK2T5ELPULZ
X-MailFrom: eleeselees68@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5MRJAWC3VDSQPAPUB7FOTK2T5ELPULZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This issue shows how fragile the interaction can be between the ALSA UCM layer, PipeWire/WirePlumber, and SOF firmware when hardware behavior diverges slightly from assumptions baked into existing configs. Even with modern audio stacks, if the UCM definitions don’t correctly represent headphone and speaker paths, desktop audio handling (auto-mute, port switching, jack detection) breaks down for end users.
https://geometrydashlite22.github.io
