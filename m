Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A290CCFBD50
	for <lists+alsa-devel@lfdr.de>; Wed, 07 Jan 2026 04:24:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29356601F4;
	Wed,  7 Jan 2026 04:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29356601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767756286;
	bh=NVtSXh6Kc3PkfroqhAAz2+ZSwjy+1jsWsKQ7mem11rI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ky02W2ogREJ5lVYg9wLXIz6czGTN27nTsJnR+c2rtUrYBX33BmrLKT0UenAMSYCMy
	 c0Rb206werU9pSl5NZKepd/RLnZX7utRcdW/HD41y3SmhzBOzV7D1V8E5ElL326fcl
	 OBwoF3owjru+bv7qMt8nPLVzJsWE8o2eFndFF1D4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDBA7F805D8; Wed,  7 Jan 2026 04:24:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A63A7F805C9;
	Wed,  7 Jan 2026 04:24:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C58E1F80448; Wed,  7 Jan 2026 04:23:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F681F80088
	for <alsa-devel@alsa-project.org>; Wed,  7 Jan 2026 04:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F681F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <188854e1d7e40c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/682@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/682@alsa-project.org>
Subject: ucm2: da7213: Add ADC switch in HeadphoneMic2 sequences
Date: Wed,  7 Jan 2026 04:23:08 +0100 (CET)
Message-ID-Hash: PTYHPZNB43DAASS3MWXDKXFH4RXLEKOY
X-Message-ID-Hash: PTYHPZNB43DAASS3MWXDKXFH4RXLEKOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTYHPZNB43DAASS3MWXDKXFH4RXLEKOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #682 was opened from QTI-Quill:

Enable and disable the ADC switch in HeadphoneMic2EnableSeq.conf and HeadphoneMic2DisableSeq.conf to ensure headset microphone audio works properly on Talos EVK with DA7213 codec.

Without this change, the headset mic path remains muted and capture does not function.

Fixes: 5ccdd19 ("Qualcomm: qcs615: Add TALOS EVK HiFi config")

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/682
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/682.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
