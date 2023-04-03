Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126486D47EE
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 16:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 193331FE;
	Mon,  3 Apr 2023 16:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 193331FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680531881;
	bh=7mmGWfMf0heyTUO8C2BkNi/VwQT+qMN+ESQMOf5xGNo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QKa4nkRoCArAkfmXnvHw/eyVI9OPq/im54VwvkiKaDCV6V7why6+r/10LMamEEKBO
	 eC/QXx1TF2YeGyzNGocmvwvn1yk+zhI7+GgSIzbJjXSNR5H7P3Tomkni0Ga06S3OXV
	 srB9bs7E6a5k/CULNqz5UVQQq8DuMk+neIBhwP3M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BDF1F8015B;
	Mon,  3 Apr 2023 16:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B82E6F80249; Mon,  3 Apr 2023 16:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A3ECFF80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 16:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3ECFF80171
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1680531819804436922-webhooks-bot@alsa-project.org>
References: <1680531819804436922-webhooks-bot@alsa-project.org>
Subject: [AMD Zen2][lockless dmix] crackling sound
Message-Id: <20230403142345.B82E6F80249@alsa1.perex.cz>
Date: Mon,  3 Apr 2023 16:23:45 +0200 (CEST)
Message-ID-Hash: ERWGLYTU4VPPDZINUZCCEMA5U3UVHJ62
X-Message-ID-Hash: ERWGLYTU4VPPDZINUZCCEMA5U3UVHJ62
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERWGLYTU4VPPDZINUZCCEMA5U3UVHJ62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #311 was opened from sylware:

Everything in the title. Latest alsa-lib, (1.2.8) if I do enable lockless dmix, I get crackling sound on my AMD Zen2.

Once I do enable the lock, no crackling sound.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/311
Repository URL: https://github.com/alsa-project/alsa-lib
