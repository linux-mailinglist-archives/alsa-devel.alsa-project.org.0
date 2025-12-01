Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F28C990A2
	for <lists+alsa-devel@lfdr.de>; Mon, 01 Dec 2025 21:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD956021C;
	Mon,  1 Dec 2025 21:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD956021C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764621211;
	bh=tPlz2WwWGnV/fGIBJ0vHVGRjrMmAqh20UhNdsZ3VA6I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mVYcmOrI0kW9pDvaNbj6K7u02ezTMjsS63i+aNM8xHeYHxbUQNVMnCzGWYC3GDj9e
	 jM95J5PTM10m+LsKPQaDEVOgGskyg6MuhWJ7VVw/GNXh9ahZvZ8DYyiR+1rlczvHcL
	 Qfa6wv+73f9tU0JpboV/7sWbkDDAgivY6C9shseg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DCBBF805F1; Mon,  1 Dec 2025 21:32:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD03DF805E6;
	Mon,  1 Dec 2025 21:32:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3FF0F8049C; Mon,  1 Dec 2025 21:32:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EF63F800F3
	for <alsa-devel@alsa-project.org>; Mon,  1 Dec 2025 21:32:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF63F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187d3196b7542500-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/42@alsa-project.org>
References: <alsa-project/alsa-tools/pr/42@alsa-project.org>
Subject: hdspmixer: fix null pointer dereference in HDSPMixerWindow:handler_cb
Date: Mon,  1 Dec 2025 21:32:33 +0100 (CET)
Message-ID-Hash: 77NYN52YN42VEPL5RCUUNHNNSHMV7C4A
X-Message-ID-Hash: 77NYN52YN42VEPL5RCUUNHNNSHMV7C4A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77NYN52YN42VEPL5RCUUNHNNSHMV7C4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #42 was edited from cheldt:

Fixes following error:

```
Program received signal SIGSEGV, Segmentation fault.
handler_cb () at /home/snaut/dev/alsa-tools/hdspmixer/src/HDSPMixerWindow.cxx:278
278             if (fl_win->label()) {
(gdb) 
```


Related [Issue](https://github.com/alsa-project/alsa-tools/issues/43)

Request URL   : https://github.com/alsa-project/alsa-tools/pull/42
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-tools
