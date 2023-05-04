Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E86A6F78C7
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 00:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25EE229D8;
	Fri,  5 May 2023 00:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25EE229D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683238036;
	bh=LTkVzDHxGbe4HuzW5GEi5CE7Vt2DjVRWeNL5rPwOYxg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pMFe9ZiTtBMmpP67iBf3+BQMcyjJSGEXstDpvrpI4DZQuk4BWbEeYvtaZ5CJG/wxy
	 L93RMF+WwtolXU41JfuxlYKXsxkPwpSvz/p5AxZdOfLiOZDmSrnt+QMXm3JFBFQSdY
	 EDUHgstRE4iHMhqAZufC6gD2VunVhmFwtY4s+fx0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7627FF80529;
	Fri,  5 May 2023 00:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EEE8F8052D; Fri,  5 May 2023 00:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C509F804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 00:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C509F804B1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683237975559014320-webhooks-bot@alsa-project.org>
References: <1683237975559014320-webhooks-bot@alsa-project.org>
Subject: ucm2: USB-Audio: Add support for ALC4080 Gigabyte Z590 AORUS ULTRA
Message-Id: <20230504220621.6EEE8F8052D@alsa1.perex.cz>
Date: Fri,  5 May 2023 00:06:21 +0200 (CEST)
Message-ID-Hash: YVUEKVPXCRL7HXZ5VD3DQCOU3WBCQ3JQ
X-Message-ID-Hash: YVUEKVPXCRL7HXZ5VD3DQCOU3WBCQ3JQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVUEKVPXCRL7HXZ5VD3DQCOU3WBCQ3JQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #310 was opened from BearsPunch:

When I installed Manjaro I had issue that my audio card was not recognized. USB ID is 0414:a00d and as I see you already have it under if.realtek-alc1220-vb condition, but I have ALC4080. So I manually changed USB-Audio.conf under If.realtek-alc4080 condition from (0414:a0(0e|1[0124])) to (0414:a0(0[de]|1[0124])) and now it works perfectly.

But Ubuntu (think from 22.04) doesn't have this issue. Does Canonical update alsa-ucm-conf by themselves without pull request to main branch?

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/310
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/310.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
