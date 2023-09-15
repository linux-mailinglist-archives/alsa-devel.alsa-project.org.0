Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 448627A20D8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 16:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53AF4852;
	Fri, 15 Sep 2023 16:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53AF4852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694788030;
	bh=SI33/K4RrjlnLjnhABeY3eg0yjTVWQ+U6ixDVw2fe5U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cIqG62jZw7071ozPNd6r4mGzKr5A8fO4Prkqjp0fOSlWbUqtrKOk/WKFgeVkpkg28
	 llQqrpYKEONYWx50utxPXh1XQAcnpGthIko6uPI9rEAutWX/vToaMBmn5b4z77SxvL
	 /AVd3zwOVR/ns5rWTfCb3+reQ+1aeGPaSxCAkTN8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C260BF80537; Fri, 15 Sep 2023 16:26:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 258DEF80246;
	Fri, 15 Sep 2023 16:26:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E228F80425; Fri, 15 Sep 2023 16:26:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A1C1F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 16:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A1C1F80141
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694787970584296465-webhooks-bot@alsa-project.org>
References: <1694787970584296465-webhooks-bot@alsa-project.org>
Subject: ucm2: Add intial Amlogic GXL support - v2
Message-Id: <20230915142615.3E228F80425@alsa1.perex.cz>
Date: Fri, 15 Sep 2023 16:26:15 +0200 (CEST)
Message-ID-Hash: CPUATZJX4ZMT6RSEAPOZCVWPN3HTNT2Z
X-Message-ID-Hash: CPUATZJX4ZMT6RSEAPOZCVWPN3HTNT2Z
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPUATZJX4ZMT6RSEAPOZCVWPN3HTNT2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #355 was opened from jeromebrunet:

This PR adds initial support for the Amlogic P241 (S905x ref design) and the Libretech-CC based on the same chip.
This is a v2 of PR #137 

* s/Meson/Amlogic
* PCM  has been move to the device section (Dropping empty verb section)
* Priority are different between the 2 devices (HDMI is more commonly used so it has higher prio)

Tested both outputs (port) with pulseaudio.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/355
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/355.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
