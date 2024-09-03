Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94301969752
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 10:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15522A4A;
	Tue,  3 Sep 2024 10:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15522A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725352699;
	bh=20dA6LDAgCsKyt0+NbKxDXEEs3HJs5dTD9GBfmyJu6g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZlftzQlZfyOe1muG4MY9lMJF1G2VOgRSbNf/dVZE2TSxV+ctadsbIVGu51ynXvcc1
	 c164jy2D7ARqycLIKLk9+OZtpcbq9oVVci9tXsDbyltSXLSgN+MjisYOEj3EVQsOr3
	 IzhR1N5G+ireRppes7AiZRBk7tkhMajHHV13oJOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B595DF805BB; Tue,  3 Sep 2024 10:37:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D02C2F805A0;
	Tue,  3 Sep 2024 10:37:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3176FF80199; Tue,  3 Sep 2024 10:37:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 767E5F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 10:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767E5F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1725352660764760494-webhooks-bot@alsa-project.org>
References: <1725352660764760494-webhooks-bot@alsa-project.org>
Subject: ucm2: sof-soundwire: add RT1320 amplifier
Message-Id: <20240903083743.3176FF80199@alsa1.perex.cz>
Date: Tue,  3 Sep 2024 10:37:43 +0200 (CEST)
Message-ID-Hash: M6JCL7376WRE26XUVQ65B3WNI37YSA45
X-Message-ID-Hash: M6JCL7376WRE26XUVQ65B3WNI37YSA45
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6JCL7376WRE26XUVQ65B3WNI37YSA45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #439 was opened from shumingfan:

Add support for rt1320 amplifier

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/439
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/439.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
