Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD660723902
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 09:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4DD74C;
	Tue,  6 Jun 2023 09:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4DD74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686036564;
	bh=5SJ9XICdYCIVlS9rc+V44iOIVvdzq/4VZe/5nM/AjWc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dN2Any8Ii8fSyamaoblTONp2dP1xRBFQwAjdXJrtKe/40c/v+U+hEuZcbW/Dr4zhc
	 lpZxjWeEq/bUBn8y+oYlcrCytIdUghfVzepnqe+E2FHCa0Vcb63zEwGxa3r7gDM9am
	 e7Y4GPc8eMDAYpzjDoir1tyjYkBIrLfS9Cqavjv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEEDDF80549; Tue,  6 Jun 2023 09:28:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F2FF8016C;
	Tue,  6 Jun 2023 09:28:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36AF4F80199; Tue,  6 Jun 2023 09:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 759ECF800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 09:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 759ECF800C8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1686036498546247721-webhooks-bot@alsa-project.org>
References: <1686036498546247721-webhooks-bot@alsa-project.org>
Subject: Add Asus ROG STRIX X670E-F Gaming Wifi to USB-Audio.conf
Message-Id: <20230606072828.36AF4F80199@alsa1.perex.cz>
Date: Tue,  6 Jun 2023 09:28:28 +0200 (CEST)
Message-ID-Hash: FST6MLA4LGQAEE6LRQ4RDB42GRQCFHNI
X-Message-ID-Hash: FST6MLA4LGQAEE6LRQ4RDB42GRQCFHNI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FST6MLA4LGQAEE6LRQ4RDB42GRQCFHNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #320 was opened from ksenchy:

Since the id was already present in the list, I have only added a comment denoting this board also uses that id

My alsa-info as a proof can be found here: http://alsa-project.org/db/?f=1ad83f467dc312e2ac7743859c647695dbccb6ce

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/320
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/320.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
