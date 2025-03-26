Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D752A7199A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Mar 2025 15:59:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB4BE601DA;
	Wed, 26 Mar 2025 15:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB4BE601DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743001170;
	bh=MDdivMUd0Za5Aqc3f+N4C/EwcE4WwZMdtM23b58FgQw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g4eL7sRYhIj3k/CuP14qNo1XZxPwojttQhmxM0Flm+ETQH/8xG6L+DB9wR8U2neyx
	 EG8ShH6/Ds1kY7nVDk83CZIqKzKWPP9ipneobO/L0dNL4AosroaZbxTswpR1nO4rU0
	 nVM/D6DEFgDti3hQnmB9l/qS3awoR5COCh/Go/fI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE35FF805B2; Wed, 26 Mar 2025 15:58:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B16FFF805BD;
	Wed, 26 Mar 2025 15:58:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93386F80171; Wed, 26 Mar 2025 15:58:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD37F80095
	for <alsa-devel@alsa-project.org>; Wed, 26 Mar 2025 15:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD37F80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1830624b15a9e700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/535@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/535@alsa-project.org>
Subject: USB-Audio: ALC4080 - add rear microphone support for 0414:a014
Date: Wed, 26 Mar 2025 15:58:52 +0100 (CET)
Message-ID-Hash: FRTAI3XNEJOHQLUWS7SLBYD337T5IBUX
X-Message-ID-Hash: FRTAI3XNEJOHQLUWS7SLBYD337T5IBUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRTAI3XNEJOHQLUWS7SLBYD337T5IBUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #535 was opened from perexg:

0414:a014 Gigabyte B850I Aorus Pro (rev 1.0)

Link: https://github.com/alsa-project/alsa-ucm-conf/issues/528

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/535
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/535.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
