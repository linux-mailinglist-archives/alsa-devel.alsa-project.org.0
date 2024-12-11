Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D5F9EC272
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 03:50:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1668C21A1;
	Wed, 11 Dec 2024 03:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1668C21A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733885417;
	bh=YpmR0lFnp7VXxFOVFtwxTav81hrFKy8tA3EFg2dKfYc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZaMkltKigqrHWEPM2RT6g+boMZFKnJTehn+/f6MPPnMaM1mgB1bbvTG2MgmWYgSIj
	 BC5rBlAfT4aZLRqUmKzVeMhsbCGteamZ16Hcv+kPLPINgONBuCSPjOeeqys7DBdfrS
	 U3ePEMREGepUbG8ESo5hwin60BbkE1ShkQLILI7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AD07F805B4; Wed, 11 Dec 2024 03:49:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 992C7F805AF;
	Wed, 11 Dec 2024 03:49:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 680D6F80482; Wed, 11 Dec 2024 03:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B938EF80087
	for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2024 03:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B938EF80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1733885379778549910-webhooks-bot@alsa-project.org>
References: <1733885379778549910-webhooks-bot@alsa-project.org>
Subject: rt722: add headset mic led control
Message-Id: <20241211024942.680D6F80482@alsa1.perex.cz>
Date: Wed, 11 Dec 2024 03:49:42 +0100 (CET)
Message-ID-Hash: VMXEXNJJNC62S2GETPNVZJAMCRIXCGSE
X-Message-ID-Hash: VMXEXNJJNC62S2GETPNVZJAMCRIXCGSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMXEXNJJNC62S2GETPNVZJAMCRIXCGSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #487 was edited from shumingfan:

rt722: add headset mic led control

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/487
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/487.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
