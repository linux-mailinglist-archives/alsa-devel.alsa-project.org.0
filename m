Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0AFC9909F
	for <lists+alsa-devel@lfdr.de>; Mon, 01 Dec 2025 21:33:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D55260206;
	Mon,  1 Dec 2025 21:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D55260206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764621200;
	bh=yN9Bf9qkAjBTW3pnGYfnMOrNp8qMbLUKPiPCXdiTSog=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=va4V+lolJC2eY95mA4jLOeXdB3JrA/gk6x8z/k0aLjCXlJFSyoyduKQX9EpRFD8ZV
	 qHvSWNGMQx6TyGSBnCl35MkhJAlijownFP07h4HPT+QtWFKK+sRUkQXirDsct2D2Bj
	 nnWp6U6V0yaIkpGNf7QSLsXEmQgjZv6k4yQ88DZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E972F805E1; Mon,  1 Dec 2025 21:32:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9094CF800F3;
	Mon,  1 Dec 2025 21:32:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33925F8049C; Mon,  1 Dec 2025 21:32:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 95767F8014B
	for <alsa-devel@alsa-project.org>; Mon,  1 Dec 2025 21:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95767F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187d319332420700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/42@alsa-project.org>
References: <alsa-project/alsa-tools/pr/42@alsa-project.org>
Subject: hdspmixer: fix null pointer dereference in HDSPMixerWindow:handler_cb
Date: Mon,  1 Dec 2025 21:32:22 +0100 (CET)
Message-ID-Hash: AEGCRNXH5QO7373WKP46PQTCQPKYPFTB
X-Message-ID-Hash: AEGCRNXH5QO7373WKP46PQTCQPKYPFTB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEGCRNXH5QO7373WKP46PQTCQPKYPFTB/>
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
handler_cb () at /home/kenoby/dev/alsa-tools/hdspmixer/src/HDSPMixerWindow.cxx:278
278             if (fl_win->label()) {
(gdb) 
```


Related [Issue](https://github.com/alsa-project/alsa-tools/issues/43)

Request URL   : https://github.com/alsa-project/alsa-tools/pull/42
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-tools
