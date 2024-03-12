Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424B879FA8
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Mar 2024 00:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A7C314DC;
	Wed, 13 Mar 2024 00:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A7C314DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710285947;
	bh=r4hOo5wSfYcC/lHM13MEJBbaryWROp+tQbMBFocpkvY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IkWaYUhfEpaPLJtQGRMIe2BV4FbxJTw368Gc/ybPA2YRBTmvbz0W1JwDRoJcBdvcT
	 czZFylAarIAU3U0IDFxk09okP29IhSdJcHXPbLYlsTnHlZ6b88K4TszsTkKTPSIZk7
	 +E+J/4ERWLIfOsGgyG+Kmpz5pRv9OgUWdG/qRH1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2EE7F805AC; Wed, 13 Mar 2024 00:25:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C656F805A0;
	Wed, 13 Mar 2024 00:25:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ACFDF8028D; Wed, 13 Mar 2024 00:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 59F3DF80093
	for <alsa-devel@alsa-project.org>; Wed, 13 Mar 2024 00:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F3DF80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710285904802446127-webhooks-bot@alsa-project.org>
References: <1710285904802446127-webhooks-bot@alsa-project.org>
Subject: alsa-utils-1.2.11 does validate against signature
Message-Id: <20240312232510.1ACFDF8028D@alsa1.perex.cz>
Date: Wed, 13 Mar 2024 00:25:10 +0100 (CET)
Message-ID-Hash: 3RW44X5PPXTKNI6VHSGEXRR3TWMHMFUC
X-Message-ID-Hash: 3RW44X5PPXTKNI6VHSGEXRR3TWMHMFUC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RW44X5PPXTKNI6VHSGEXRR3TWMHMFUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #258 was opened from egtvedt:

Hello, downloading alsa-utils-1.2.11.tar.bz2 from https://www.alsa-project.org/wiki/Download gives me a file with sha512sum 5ce76807b53357584bfb4ace5acfdac4db9168ffaf5cdd1e499738eec046c36112bf84a99970f66368063a9baf73bad93af2d439630572f3eba5c9321071172d

However, validating this archive against the GPG signing key with fingerprint F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91 does not result in success. Signature file also downloaded from https://www.alsa-project.org/wiki/Download

Doing the above steps for alsa-lib-1.2.11.tar.bz2 archive is successful.

I looked at the diff between alsa-utils-1.2.11.tar.bz2 and git tag, and couldn't spot anything suspicious.

Could a maintainer please verify alsa-utils is properly signed, if not, refresh the signature file to match released binary?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/258
Repository URL: https://github.com/alsa-project/alsa-utils
