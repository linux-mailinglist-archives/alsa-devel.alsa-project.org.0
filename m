Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGYHM8t+jWl93QAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Feb 2026 08:18:35 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910A12AE8D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Feb 2026 08:18:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095E160207;
	Thu, 12 Feb 2026 08:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095E160207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770880713;
	bh=dXdmibLGSJVvCR4vfqzsetvVq6UDsqJ1kwWNO/QOlMs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=N++hnN3pjyz/2l7BtD15GcMIjs3Jwz8yhyFdJevwcvDKxTDaSVNZNsBTnVClAr5Yn
	 zG1Lj1+6duW9GDo8R2f0ewk76NgDOXYgdDICHvJW5a1uSBulOjTaPRswdGgIb2o3M4
	 s+8TcdspvygECm1OOXmWn5LlzsUpVI9JulIkFOKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F82F805AC; Thu, 12 Feb 2026 08:18:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44F2AF805E0;
	Thu, 12 Feb 2026 08:18:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33E15F8055A; Thu, 12 Feb 2026 08:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id DE813F800BD
	for <alsa-devel@alsa-project.org>; Thu, 12 Feb 2026 08:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE813F800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18936e9771ef7b00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/704@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/704@alsa-project.org>
Subject: Qualcomm: qcs615: Remove JackControl from TALOS EVK HiFi config
Date: Thu, 12 Feb 2026 08:17:58 +0100 (CET)
Message-ID-Hash: SECDZGFD3I3SS3ATMRASGD6MGMZ5YEVB
X-Message-ID-Hash: SECDZGFD3I3SS3ATMRASGD6MGMZ5YEVB
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SECDZGFD3I3SS3ATMRASGD6MGMZ5YEVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alsa-project.org,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:mid,alsa-project.org:dkim,alsa0.perex.cz:helo,alsa0.perex.cz:rdns]
X-Rspamd-Queue-Id: 6910A12AE8D
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf pull request #704 was opened from QTI-Quill:

The EVK board does not support headset or jack detection. Keeping JackControl entries prevents PipeWire (wpctl) from exposing sinks and sources correctly.

Remove JackControl from Headphones and Headset devices so PipeWire can enumerate playback and capture nodes normally.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/704
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/704.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
