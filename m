Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0920CD089F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Dec 2025 16:37:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46BBA601BB;
	Fri, 19 Dec 2025 16:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46BBA601BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766158651;
	bh=KLv7gWdlEDk7gVfOxIVe6odWFdd4X07UThtFD9w3UGc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GeGs7+OYIc7PNi5Hj82NQHp+FmjSEBojCzcW9r2dyhvdzVRYJrUsg0BgF+24xe1Oz
	 zuXAGFzaXZ5n61A8jiF3g7B2byAfzOd3JJ22Zq2/4AV+QDIhRI7Qc/TrAKpq8rfOol
	 sGaBC2Seg2Wvxh1g1bIvBJj1Wnt6cOkX4/SEx3iM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85BE5F805E3; Fri, 19 Dec 2025 16:36:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34455F805C7;
	Fri, 19 Dec 2025 16:36:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EDACF805C2; Fri, 19 Dec 2025 16:36:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D89C9F80423
	for <alsa-devel@alsa-project.org>; Fri, 19 Dec 2025 16:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D89C9F80423
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1882a7e5ce45d300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/659@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/659@alsa-project.org>
Subject: ucm2 USB-Audio: Antelope Audio Zen Go: add UCM2 configuration files
Date: Fri, 19 Dec 2025 16:36:51 +0100 (CET)
Message-ID-Hash: XCWQQCK26KPDZCTE7EGQKJ4MTICD36KH
X-Message-ID-Hash: XCWQQCK26KPDZCTE7EGQKJ4MTICD36KH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCWQQCK26KPDZCTE7EGQKJ4MTICD36KH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #659 was edited from ryodeushii:

Add support for Antelope Audio Zen Go SC


[alsa-info.txt](https://github.com/user-attachments/files/24074814/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/659
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/659.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
