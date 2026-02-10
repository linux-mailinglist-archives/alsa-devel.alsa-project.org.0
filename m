Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHIZIjyIimk1LgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 02:22:04 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 259DC115F58
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Feb 2026 02:22:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B145A601C8;
	Tue, 10 Feb 2026 02:21:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B145A601C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770686520;
	bh=DedcpN+Ps2jRqgDdYQay8idNQF6oPZYMH4L1fx55HGU=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mRs4m/a2gL/QxYXIZl8JRTwbvZQErl0mzEweVSCMhBzJz7PO+ihEZWyOaa5uMI0Nk
	 Mu1spHkmbXesAk2zx/CleQ7vtPM+d98OcUEea7abElVgxSyUhiLnY3+xv5cPBLVQYY
	 yiF53hlgzRKuSBSPR2iofH38ik6XdFsMycf/1Fws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D199F805ED; Tue, 10 Feb 2026 02:21:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55113F805E3;
	Tue, 10 Feb 2026 02:21:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0602AF801F7; Tue, 10 Feb 2026 02:21:07 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A6CF80087
	for <alsa-devel@alsa-project.org>; Tue, 10 Feb 2026 02:21:06 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: ucm2: sof-soundwire: fix a case MultiCodec1 string is in
 HeadsetCodec1
 string
From: haultalented@gmail.com
To: alsa-devel@alsa-project.org
Date: Tue, 10 Feb 2026 01:21:06 -0000
Message-ID: 
 <177068646694.22.14383787252090263678@mailman-web.alsa-project.org>
In-Reply-To: <187df4091567b900-webhooks-bot@alsa-project.org>
References: <187df4091567b900-webhooks-bot@alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 46F32AP2FHG5UV5Y5CISAATLG3TWH3C3
X-Message-ID-Hash: 46F32AP2FHG5UV5Y5CISAATLG3TWH3C3
X-MailFrom: haultalented@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUQFNYMWIRQEHG6AMDK3XRFSFPKICKTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:helo,alsa0.perex.cz:rdns,fnaffree.io:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[haultalented@gmail.com,alsa-devel-bounces@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+]
X-Rspamd-Queue-Id: 259DC115F58
X-Rspamd-Action: no action

Wow, this thread about the MultiCodec1 string in HeadsetCodec1 is really enlightening! I appreciate how detailed everyone is in discussing the implications of these fixes. I'm curious—how do you think this change might affect user experience with different headset models? Also, has there been any feedback from users since implementing these tweaks? It’s fascinating to see how these technical adjustments can lead to better sound quality! Thanks for sharing such valuable insights! https://fnaffree.io
