Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 236069C7F5E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2024 01:29:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D90B190B;
	Thu, 14 Nov 2024 01:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D90B190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731544167;
	bh=w+RliFWDy4pz9SGjEdF4frsKbs8MHyjroHrB/goIMkI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fLjanLNvLGltj4bNAKN+Cg2q7P06RwWU7YHdVF/ZvqAhHhXe01+T4nLkVmPvj8tYT
	 NWGb2VHk4xx2nellIiYC4AP4PSjMReBsg3+IqGpSGa7shM/dCAzKugvSfWIt8DnOyS
	 Lb34LVkeT9jcvXkelXJupTW+r1k8zLeYElIN9GFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ACC1F805C0; Thu, 14 Nov 2024 01:28:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEB80F805A1;
	Thu, 14 Nov 2024 01:28:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06FECF8058C; Thu, 14 Nov 2024 01:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B06F802DB
	for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2024 01:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53B06F802DB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731544125486296654-webhooks-bot@alsa-project.org>
References: <1731544125486296654-webhooks-bot@alsa-project.org>
Subject: udevd[142]: GOTO 'alsa_restore_std' has no matching label in:
 '/usr/lib/udev/rules.d/90-alsa-restore.rules'
Message-Id: <20241114002848.06FECF8058C@alsa1.perex.cz>
Date: Thu, 14 Nov 2024 01:28:48 +0100 (CET)
Message-ID-Hash: VSMIOZLWL6ZY6D5LVY4LLI7XTG7KEJAO
X-Message-ID-Hash: VSMIOZLWL6ZY6D5LVY4LLI7XTG7KEJAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSMIOZLWL6ZY6D5LVY4LLI7XTG7KEJAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #280 was opened from sxzzsf:

There is no 'alsa_restore_std' label in the udev rule  file, is it misspelled alsa_restore_go?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/280
Repository URL: https://github.com/alsa-project/alsa-utils
