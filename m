Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D500CFA17C
	for <lists+alsa-devel@lfdr.de>; Tue, 06 Jan 2026 19:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8130601F2;
	Tue,  6 Jan 2026 19:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8130601F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767723819;
	bh=fCx3/W5B6Rfg8l80grpONf9L2fW8Rd8ZlazuzbUtFko=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WUerF6GNhAmjf3Tqi6j1r1Ni72Q/fckUHueO9HxoX6H6z/BxVOOkDi+dg0v4H2ePR
	 +TsFIiPWEyQ/mS2OC65txDzpGUuIwiW0oKWQnrYsBs7PLGNqdbmxnS3bCw6hCJZnCD
	 lx+1cTvG0kOcF6B4gWebjdMN6lohQuhLlW6Du/xQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC2D9F805C8; Tue,  6 Jan 2026 19:23:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CAA7F805D8;
	Tue,  6 Jan 2026 19:23:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34CBDF804F3; Tue,  6 Jan 2026 19:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 395F1F80088
	for <alsa-devel@alsa-project.org>; Tue,  6 Jan 2026 19:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 395F1F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18883768f532d700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/681@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/681@alsa-project.org>
Subject: USB-Audio: Add support for the SSL 2 MK II
Date: Tue,  6 Jan 2026 19:23:04 +0100 (CET)
Message-ID-Hash: LTB5SBR2NWUMEUOC46IZOM2PCQZYGA6D
X-Message-ID-Hash: LTB5SBR2NWUMEUOC46IZOM2PCQZYGA6D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTB5SBR2NWUMEUOC46IZOM2PCQZYGA6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #681 was opened from MTRNord:

This adds support for https://solidstatelogic.com/products/ssl-2-mkii and the https://solidstatelogic.com/products/ssl-2-plus-mkii and solves #555 

The MK II shows up the same way as the SSL2, but as a different USB Device.

I only own the SSL2 MK2, but not the SSL2+ MK2. So I can only verify it for the SSL2 MK2. However, I am fairly certain that the + version likely is also behaving identically. There are no visible spec changes between the v1 and MK2 of these devices, from all I was able to tell based on the internet. So, likely only the USB ID changed (at least for the things alsa-ucm is concerened about)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/681
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/681.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
