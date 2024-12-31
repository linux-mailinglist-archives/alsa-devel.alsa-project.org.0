Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8579FEFB1
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Dec 2024 14:21:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117BD6060D;
	Tue, 31 Dec 2024 14:21:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117BD6060D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735651295;
	bh=ofDLju67pQFJhclO3fpnXpgTruWb5mzgtO2nR6qJ4o4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uejkYM9vghJe4aF0H/B5iu7UKMMMbOFEevh1rL006TO0SvFIeB5qhePqebZuOgC29
	 oso4alIMsqIuAmFHeAFG02W83Hza+fCXsWQ886Uowk+On+EqZPgq5nXMXHMGlBfecz
	 rpuzf8lLt086X6tw4Qd646HLohQSxHE+57X9+s3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87F8EF805B5; Tue, 31 Dec 2024 14:21:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28364F805B1;
	Tue, 31 Dec 2024 14:21:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9237FF80424; Tue, 31 Dec 2024 14:20:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA33F800FE
	for <alsa-devel@alsa-project.org>; Tue, 31 Dec 2024 14:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA33F800FE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1735651249149540901-webhooks-bot@alsa-project.org>
References: <1735651249149540901-webhooks-bot@alsa-project.org>
Subject: Add Roland QUAD-CAPTURE USB 2.0 support
Message-Id: <20241231132052.9237FF80424@alsa1.perex.cz>
Date: Tue, 31 Dec 2024 14:20:52 +0100 (CET)
Message-ID-Hash: 2BB7HX4PK2EROPOUA523WBEBGUNNZX7O
X-Message-ID-Hash: 2BB7HX4PK2EROPOUA523WBEBGUNNZX7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BB7HX4PK2EROPOUA523WBEBGUNNZX7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #494 was opened from bjornmp:

Add Roland QUAD-CAPTURE USB 2.0 support

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/494
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/494.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
