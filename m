Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E09936B9
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 20:52:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD08182B;
	Mon,  7 Oct 2024 20:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD08182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728327120;
	bh=WDR5L6xAdzj4AgAO/5Z0cdqaMVi6CVJXaL0OCD+nDng=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g9fylt3nd53tsVuzoU725YgOG7cbY+5b+yoCXVFQggjt6ZQ8s3fJNzE0jRJnWOD2I
	 AXekpwHBQ/HBojbNBFBo2nUwBo0hCOe7CXA76+d79T9G85ufPmfOyMwzH3WKH7j04n
	 7SsMXApivCkiq67lWPqJ39C3itk23aWN6UQhyndk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40251F805AD; Mon,  7 Oct 2024 20:51:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 438A6F805A9;
	Mon,  7 Oct 2024 20:51:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADAAAF80528; Mon,  7 Oct 2024 20:51:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 01429F8001E
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 20:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01429F8001E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1728327079066926241-webhooks-bot@alsa-project.org>
References: <1728327079066926241-webhooks-bot@alsa-project.org>
Subject: Fix build with FFmpeg 7
Message-Id: <20241007185121.ADAAAF80528@alsa1.perex.cz>
Date: Mon,  7 Oct 2024 20:51:21 +0200 (CEST)
Message-ID-Hash: 2A2RL2WQY62AGJNIH5AXQBVLHX3JCBLC
X-Message-ID-Hash: 2A2RL2WQY62AGJNIH5AXQBVLHX3JCBLC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2A2RL2WQY62AGJNIH5AXQBVLHX3JCBLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/tinycompress pull request #25 was opened from fossdd:

Patch provided by the Arch Linux team: https://gitlab.archlinux.org/archlinux/packaging/packages/tinycompress/-/blob/main/0001-Fix-build-with-FFmpeg-7.patch

Request URL   : https://github.com/alsa-project/tinycompress/pull/25
Patch URL     : https://github.com/alsa-project/tinycompress/pull/25.patch
Repository URL: https://github.com/alsa-project/tinycompress
