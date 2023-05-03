Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E67D16F5A66
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 16:50:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4B51278;
	Wed,  3 May 2023 16:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4B51278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683125416;
	bh=AzJoTtwV9tWLwPAsveXxIpq7k/1ZEe3c1JZ+XlhlUvc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qzv9ofgVyMni82jxK0i1dmxNB/6gAIz9cWE3Gl7GTYF3gpnES8nKwj12hGMCd0xQx
	 CTPPgvnejAK8dWHt3vBQWK7NvnLyczZ8DL0jkY4E4QE7tjvajjLx2yUCZgrS2QmIh5
	 nEFZoxcqSegTgd98una6LoVtX5F9U2MpBUq2CTaY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A07F804FE;
	Wed,  3 May 2023 16:48:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55E52F8051B; Wed,  3 May 2023 16:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 04685F80087
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 16:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04685F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683125316995220423-webhooks-bot@alsa-project.org>
References: <1683125316995220423-webhooks-bot@alsa-project.org>
Subject: Using mili/micro/nanoseconds in split files
Message-Id: <20230503144838.55E52F8051B@alsa1.perex.cz>
Date: Wed,  3 May 2023 16:48:38 +0200 (CEST)
Message-ID-Hash: N226BDGRWCC4CHDMHMRYFOCI2FS6FOJT
X-Message-ID-Hash: N226BDGRWCC4CHDMHMRYFOCI2FS6FOJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N226BDGRWCC4CHDMHMRYFOCI2FS6FOJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #209 was opened from kfilipan:

This is more of a feature request rather than an issue. When using `arecord` with `--max-file-time` and `--use-strftime`, one cannot get nanoseconds in the file name. This is however available in the e.g. `date` command `date +"%Y-%m-%d_%H-%M-%S.%N"` (`%N` gives nanoseconds). This would be useful for testing sound card recording time delays because having only seconds is not precise enough, e.g. it could take days or weeks for even slightly better sound cards to experience a second of delay. Thank you!

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/209
Repository URL: https://github.com/alsa-project/alsa-utils
