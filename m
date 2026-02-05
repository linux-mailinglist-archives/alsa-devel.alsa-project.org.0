Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJt/Af4IhGnhxAMAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 04:05:34 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB8FEE324
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 04:05:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C475601FA;
	Thu,  5 Feb 2026 04:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C475601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770260732;
	bh=XEU4HkBDJPzD/yAYwt6DUmSndMn/EmVnf+nMiz4FGno=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QV//D05gmbNeznA4VXRrMTWnjHlgesSAzAIDXeoP8bVudfVjW7lJU6zq9r0RASXZD
	 CKZkOMz6vzyfo1ZqjR57pSY7qFr+Zdf8lRqMAMWPaTaVXccYQmgz5EOYgIN1CrtyhB
	 TQoSE4BuHOpKAcczXeuoiH2qXCf8RTOLEnpEDBsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E72F1F805ED; Thu,  5 Feb 2026 04:04:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 823CBF805E7;
	Thu,  5 Feb 2026 04:04:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54BB4F804FB; Thu,  5 Feb 2026 04:04:46 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 47B03F8010B
	for <alsa-devel@alsa-project.org>; Thu,  5 Feb 2026 04:04:46 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc3
From: raw.parakeet.ivtr@protectsmail.net
To: alsa-devel@alsa-project.org
Date: Thu, 05 Feb 2026 03:04:46 -0000
Message-ID: <177026068629.20.8639230894155820519@mailman-web.alsa-project.org>
In-Reply-To: <20251231124837.C972C1AC5681@finisterre.sirena.org.uk>
References: <20251231124837.C972C1AC5681@finisterre.sirena.org.uk>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: IY2567WDUJ3ZH67QNTFHLQXTAKJGPKUS
X-Message-ID-Hash: IY2567WDUJ3ZH67QNTFHLQXTAKJGPKUS
X-MailFrom: raw.parakeet.ivtr@protectsmail.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IY2567WDUJ3ZH67QNTFHLQXTAKJGPKUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[protectsmail.net : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[alsa-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,slopegamefree.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[raw.parakeet.ivtr@protectsmail.net,alsa-devel-bounces@alsa-project.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+]
X-Rspamd-Queue-Id: 8AB8FEE324
X-Rspamd-Action: no action

This commit addresses minor driver fixes and naming adjustments within the ASoC subsystem. It seems like navigating these changes requires precision, much like playing Slope Game. A small misstep and you're off course! Keep your focus sharp as you fetch the updates up to https://slopegamefree.com/
