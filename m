Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20D78F8FB
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 09:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39513827;
	Fri,  1 Sep 2023 09:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39513827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693552555;
	bh=UPV+9X7rM4mqYTjI46If1acA7gEvaFmlg/gPAjG4Pp4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WcAFRNLdHFNpM3J++IRVrMuhBe8nEbBCNkn11T+PqTVXYgzkpAYHEyi1+O8Zmo/z9
	 eMQSVVtltUawYB03TK2UaSYKUbAGT7yVrsvlPUGgOZUz6vUvoIZOT7Zi6NOc0D7h+F
	 LcftBGx8wsy5yGTdMukGlT7KyKk/8M4sdR60dZdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 886C7F80236; Fri,  1 Sep 2023 09:15:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A07F80155;
	Fri,  1 Sep 2023 09:15:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEA72F80158; Fri,  1 Sep 2023 09:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB75F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 09:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FB75F800D1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693552496049589396-webhooks-bot@alsa-project.org>
References: <1693552496049589396-webhooks-bot@alsa-project.org>
Subject: Sound recorded by the internal microphone is very low
Message-Id: <20230901071459.EEA72F80158@alsa1.perex.cz>
Date: Fri,  1 Sep 2023 09:14:59 +0200 (CEST)
Message-ID-Hash: NZEXLNYUAU77EZNBJ3PQ2Z4I2TCMP6EM
X-Message-ID-Hash: NZEXLNYUAU77EZNBJ3PQ2Z4I2TCMP6EM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZEXLNYUAU77EZNBJ3PQ2Z4I2TCMP6EM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #345 was opened from pseudocc:

Even if it is set to the maximum value, headphone microphone is good.

http://alsa-project.org/db/?f=0fdb2be1be960a5efe41fdcc5aab9436f4c91d1f

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/345
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
