Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C949C8BBF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2024 14:26:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204DF2358;
	Thu, 14 Nov 2024 14:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204DF2358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731590813;
	bh=yDUMb3zJd2GoSKZiKR2ZZYf/FnOvwvxxbord9p4Eleg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=m6KAzezxGP44N2Wfj7bRxtfB7rjKbZ0aKBLGHDy00b1WVgiTB8jTujSnVkVsGNYa+
	 TWrEMis+2VSaxjY3N528Qg8JeBrPaWAtfwpiZnfAoSj6fYvqbaiffj9nLloaCorb1Z
	 0y/TBVRNTfUaGOewfa9mMkCPwbjUygsmLxlKkR6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68223F805AF; Thu, 14 Nov 2024 14:26:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E180F805BA;
	Thu, 14 Nov 2024 14:26:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50FF4F8058C; Thu, 14 Nov 2024 14:26:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AA286F800D2
	for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2024 14:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA286F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731590776024626255-webhooks-bot@alsa-project.org>
References: <1731590776024626255-webhooks-bot@alsa-project.org>
Subject: src/Versions.in.in: Update *_tempo_base name
Message-Id: <20241114132618.50FF4F8058C@alsa1.perex.cz>
Date: Thu, 14 Nov 2024 14:26:18 +0100 (CET)
Message-ID-Hash: LKV2S3SKROCKZ7EBN6XRZLN2KYVRQACJ
X-Message-ID-Hash: LKV2S3SKROCKZ7EBN6XRZLN2KYVRQACJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKV2S3SKROCKZ7EBN6XRZLN2KYVRQACJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #421 was edited from nvinson:

Change @SYMBOL_PREFIX@snd_has_tempo_base to
@SYMBOL_PREFIX@snd_has_queue_tempo_base.

Starting with version 1.2.13, alsa-lib fails to link with ld.lld-19 due to "version script assignment of 'ALSA_1.2.13' to symbol 'snd_seq_has_tempo_base' failed: symbol not defined".

Per commit 769d1db1b0a213a39c7e59c0d1d724e7f45b1ac3 the correct name for the symbol is @SYMBOL_PREFIX@snd_has_queue_tempo_base; therefore, update src/Vesions.in.in to match.

Fixes bug #420
Fixes Gentoo bug 943399 (https://bugs.gentoo.org/943399)

Request URL   : https://github.com/alsa-project/alsa-lib/pull/421
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/421.patch
Repository URL: https://github.com/alsa-project/alsa-lib
