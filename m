Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864F28CAD24
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 13:10:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADBA9822;
	Tue, 21 May 2024 13:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADBA9822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716289820;
	bh=+LpeQs58VU3RTTipbC/o81UG0lrG8k+r5qmtJX5rLaw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=H0zol1G3DoSZCXMFwv2LAc55GekeUVAu5mTWQD0wgzc0GUMSUDOXOmPjqV6yIOxdH
	 BwTscD+a9pH2A8SoQ+TqHQfn6Oj5KcWbFKgN0F2ztpSN3zZZmD59ws79WHKCg9SvVJ
	 av2W2QZuMtnsPXJmqKF7z+JG/IyWSbw5XCOqIuqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B05ABF805AD; Tue, 21 May 2024 13:09:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24014F800BA;
	Tue, 21 May 2024 13:09:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E370F8020D; Tue, 21 May 2024 13:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DD5F80051
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 13:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96DD5F80051
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1716289763674208403-webhooks-bot@alsa-project.org>
References: <1716289763674208403-webhooks-bot@alsa-project.org>
Subject: Add UCM files for avs driver
Message-Id: <20240521110943.6E370F8020D@alsa1.perex.cz>
Date: Tue, 21 May 2024 13:09:43 +0200 (CEST)
Message-ID-Hash: WM5ALFO2F5GV3IAA4QYEVSCRUNDQU2EM
X-Message-ID-Hash: WM5ALFO2F5GV3IAA4QYEVSCRUNDQU2EM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WM5ALFO2F5GV3IAA4QYEVSCRUNDQU2EM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #418 was opened from amadeuszslawinski-intel:

Present in this pull request are UCM files for some of the devices available on market that we were able to test.
They are meant to be used with avs driver and relevant topology files.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/418
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/418.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
