Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5CB8B2CB7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 00:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39DE622A6;
	Fri, 26 Apr 2024 00:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39DE622A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714082992;
	bh=3NTM4eV5Jmpl3x0qi/kUiszg5JUJ1dZFXuwja3jj7Zk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WkHwl5BsLZNsK03Mv359E6YxqlYUUQpbM6HxQhzueHyC9Dp+/D5g1soQhktonF+vr
	 Qg2q4ECZNEb4Likh32S2VSancdb7Ml7pzxqpdh4N02fzALkWLRUQKbjNYo26n7C04U
	 YBXRKtFBAyVVeTSIGNMAxKn0eAtc9ht4drwfg4m0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F0A3F805A8; Fri, 26 Apr 2024 00:09:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF777F804B0;
	Fri, 26 Apr 2024 00:09:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53AB3F80423; Fri, 26 Apr 2024 00:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=KHOP_HELO_FCRDNS,MISSING_DATE,
	MISSING_MID,SPF_HELO_NONE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AC086F8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 00:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC086F8003A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1714082952736358643-webhooks-bot@alsa-project.org>
References: <1714082952736358643-webhooks-bot@alsa-project.org>
Subject: [Remove Mbox3 UCM] Request to revert pull 237
Message-Id: <20240425220916.53AB3F80423@alsa1.perex.cz>
Date: Fri, 26 Apr 2024 00:09:16 +0200 (CEST)
Message-ID-Hash: ZRRU5KKBDCMTD3HVJNBYPFNGLTSMWB4G
X-Message-ID-Hash: ZRRU5KKBDCMTD3HVJNBYPFNGLTSMWB4G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRRU5KKBDCMTD3HVJNBYPFNGLTSMWB4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #412 was opened from ManuLinares:

https://github.com/alsa-project/alsa-ucm-conf/pull/237

The SplitPCM adds not only latency, https://github.com/alsa-project/alsa-ucm-conf/issues/238 but other general issues when streaming, etc.

So I propose removing the UCM profile.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/412
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
