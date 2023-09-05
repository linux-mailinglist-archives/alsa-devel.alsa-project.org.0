Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2337930F5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 23:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613917F1;
	Tue,  5 Sep 2023 23:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613917F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693949711;
	bh=MkW/O1LZx6MJR2SOR2sBfb2W7zuzQ+Auc12kVshUHgg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=b6ksIgNINzkUwI/iDI2SV3NBSMDc0ZO4SepRdvkspVbrDhLJyUXNhu8Eqm8GPYfIZ
	 20FCOr3PvoSy6BADMwfDHY+FF9KvfoTo+au6GRZvT+QMkilSew6oCIwvlPw3blfpWc
	 bz/hXWE/z6qeHAQ/6HM4nF9J2WcKWal85fYPLN+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 929B3F80551; Tue,  5 Sep 2023 23:34:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F92AF8047D;
	Tue,  5 Sep 2023 23:34:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86062F80494; Tue,  5 Sep 2023 23:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F32F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 23:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F32F800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693949648604153633-webhooks-bot@alsa-project.org>
References: <1693949648604153633-webhooks-bot@alsa-project.org>
Subject: ASUS RoG Strix Z790-F: No SPDIF Sound output
Message-Id: <20230905213415.86062F80494@alsa1.perex.cz>
Date: Tue,  5 Sep 2023 23:34:15 +0200 (CEST)
Message-ID-Hash: BJJY72MKMX2SHGFYIBTJUFVZFXLFRHHT
X-Message-ID-Hash: BJJY72MKMX2SHGFYIBTJUFVZFXLFRHHT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJJY72MKMX2SHGFYIBTJUFVZFXLFRHHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #348 was opened from Nightwing0815:

Hey folks,

I think, I posted in the wrong section, so here another try to get rid of no SPDIF Sound on my ASUS Motherboard.
More information can be grabbed in the topic here at [alsa-lib](https://github.com/alsa-project/alsa-lib/issues/325)

Thanks in advance,

ToM

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/348
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
