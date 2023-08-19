Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1006781830
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Aug 2023 10:04:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59710832;
	Sat, 19 Aug 2023 10:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59710832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692432252;
	bh=OmnkWR7o6oZrMVQicQPD9P8IG21Krx4b57pnzGeKZVI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KCvwfeo/IjEPE5nOTCqH+1Jk2YciFgypye5tJ/4GNncL448/jMioitd3SzPhVp5aL
	 j+GlKJPYaMxP0UEdHxBetfW06grnDXo90RyTouNSy8mQWExiez/bs6lUqkaLW1o06F
	 v2sPqdptnFG9YC6ngaKthooRMKRar4eMJLOhxECI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 165C8F801EB; Sat, 19 Aug 2023 10:03:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A040F8016D;
	Sat, 19 Aug 2023 10:03:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED8B8F801EB; Sat, 19 Aug 2023 10:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD22F80027
	for <alsa-devel@alsa-project.org>; Sat, 19 Aug 2023 10:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD22F80027
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692432152365661383-webhooks-bot@alsa-project.org>
References: <1692432152365661383-webhooks-bot@alsa-project.org>
Subject: ucm2 profile for Universal Audio Volt 2
Message-Id: <20230819080241.ED8B8F801EB@alsa1.perex.cz>
Date: Sat, 19 Aug 2023 10:02:41 +0200 (CEST)
Message-ID-Hash: 6TVJ3EEBBFEZVZOSFTO2WVZ2UCCGWL44
X-Message-ID-Hash: 6TVJ3EEBBFEZVZOSFTO2WVZ2UCCGWL44
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TVJ3EEBBFEZVZOSFTO2WVZ2UCCGWL44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #340 was opened from z411:

This adds a profile for the (relatively recent) Universal Audio Vol 2 USB aduio interface. It has a Stereo output and 2 mono inputs that are (like most budget interfaces) combined into a stereo input. This profile effectively splits these inputs into two Line inputs. These inputs can be used for XLR microphones, Line level inputs or Hi-Z inputs.

The only weird thing is that in my machine the Mono Input 2 appears first in order but pretty sure I defined the prorities in the configuration file just fine. Everything works well on my machine.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/12385352/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/340
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/340.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
