Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCInBhXthGkj6gMAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 20:18:45 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A799DF6C63
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Feb 2026 20:18:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9144601DB;
	Thu,  5 Feb 2026 20:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9144601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770319123;
	bh=SdeJsJ64qEtImlo/LajP4EZcZkCFjmZ22EeeERkTQOg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RROmssGqQ4iSDS0dEcbcaBer9fnjJhGFxXfnB72qy6CK8GyspanHtm5oJoddEGFzo
	 0viLFhbwFZuAs+jc81rzavlUK1Jbrtb5A6BmfTIlWhog2yXb6NO8ZOkpSFy7G5fQI1
	 a8a6Ke8sdI7IyMxtzSirayDURZDcX+NTPo3uM+sg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A451DF805ED; Thu,  5 Feb 2026 20:18:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62447F805E4;
	Thu,  5 Feb 2026 20:18:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 183A5F8051E; Thu,  5 Feb 2026 20:17:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,T_SPF_PERMERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 54A93F8010B
	for <alsa-devel@alsa-project.org>; Thu,  5 Feb 2026 20:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A93F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18916fc357b46f00-webhooks-bot@alsa-project.org>
In-Reply-To: <18916fc35551b900-webhooks-bot@alsa-project.org>
References: <18916fc35551b900-webhooks-bot@alsa-project.org>
Subject: MOTU M6 reports [ALSA UCM error] but seems to be working fine.
Date: Thu,  5 Feb 2026 20:17:21 +0100 (CET)
Message-ID-Hash: HRKNQA5HTTAYMEAUEFZFOD3IWCGFGQRS
X-Message-ID-Hash: HRKNQA5HTTAYMEAUEFZFOD3IWCGFGQRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRKNQA5HTTAYMEAUEFZFOD3IWCGFGQRS/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	TO_DOM_EQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[github@alsa-project.org,alsa-devel-bounces@alsa-project.org];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: A799DF6C63
X-Rspamd-Action: no action

alsa-project/alsa-ucm-conf issue #700 was opened from damex:

hi,
  i did fresh fedora 43 install and noticed that my MOTU m6 reports ALSA UCM error on all inputs and outputs but those inputs and outputs work just fine.

<img width="659" height="381" alt="Image" src="https://github.com/user-attachments/assets/cdce7782-7581-4c05-b501-2e22d5920446" />

<img width="819" height="206" alt="Image" src="https://github.com/user-attachments/assets/2290dd4b-f0af-4f75-a58b-6b5a056ee933" />

  in some software it is difficult to choose correct input due to presence of this error in device name.
  i did find https://github.com/alsa-project/alsa-ucm-conf/issues/552 this report to be similar to mine. attaching full alsa info output here (it was requested in that report)

  
[alsa-info.txt](https://github.com/user-attachments/files/25109878/alsa-info.txt)

please let me know if i you need any more information from me.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/700
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
