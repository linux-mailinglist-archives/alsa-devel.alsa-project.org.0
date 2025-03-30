Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62233A7587C
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Mar 2025 05:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CACD1601CE;
	Sun, 30 Mar 2025 05:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CACD1601CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743305836;
	bh=zNTn1craRJyUWO2kZa4/yRbygKyaNzqdiXa968B6PSA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=j0eSztN6CEFXYCG2NRznuMDP0AKixhnlObkjX/Mp9V9gBM2pf6/X3LKTdpaQhicL6
	 OwDxf/DGMau2LVq4KI7CUgRiKv0tP8UAYCQSdYUIGt9KY/qeiVZiKMlc1WPb5mptuW
	 qdzIEfCnJSbSeJ2VPRhOtmiKbMGQoxiVfOL3Riww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57705F805C0; Sun, 30 Mar 2025 05:36:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D94BF805B5;
	Sun, 30 Mar 2025 05:36:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6F95F802DB; Sun, 30 Mar 2025 05:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F59F8001D
	for <alsa-devel@alsa-project.org>; Sun, 30 Mar 2025 05:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2F59F8001D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183177629c84a400-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/538@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/538@alsa-project.org>
Subject: USB-Audio: Add Focusrite Scarlett 18i20 Lineup
Date: Sun, 30 Mar 2025 05:36:38 +0200 (CEST)
Message-ID-Hash: YKG5EIXAFM6FM4FJZO6EVEFH5B7EWJZM
X-Message-ID-Hash: YKG5EIXAFM6FM4FJZO6EVEFH5B7EWJZM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKG5EIXAFM6FM4FJZO6EVEFH5B7EWJZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #538 was edited from ScarletRav3n:

Other solutions exist to add full mixing and routing with these devices. This PR adds basic functionality in an out-of-the-box style for 1st gen, 2nd gen, 3rd gen, and 4th gen.

I/O includes all XLR, Line, S/PDIF, ADAT, and Headphone ports.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/538
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/538.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
