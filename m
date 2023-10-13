Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C597C8D2C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 20:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7821B826;
	Fri, 13 Oct 2023 20:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7821B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697222379;
	bh=0d0TVr6eu9rs2cM5ho64sPG4whYqV0peA+dRStgX/vk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UiBPbh19/Qye/SVWqIb4oYIP1ArJ5pKxQ0olKHb5ZuO4gqfqhZ0CfA9ZK5Ij92xuq
	 vG+hEIG0QHpxQ3tjsGk5TFCC2VTw48nqTsBeEhmSIdFish0srsWwotfTj7rEP+LlmB
	 TnFyiY6yALldyPURKwCfYy/VyK5joh3krTb2FTV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD8F9F80310; Fri, 13 Oct 2023 20:38:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93669F8027B;
	Fri, 13 Oct 2023 20:38:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62A0EF802BE; Fri, 13 Oct 2023 20:37:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DD593F8015B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 20:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD593F8015B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1697222220332857847-webhooks-bot@alsa-project.org>
References: <1697222220332857847-webhooks-bot@alsa-project.org>
Subject: configure.ac: fix UMP support detection
Message-Id: <20231013183707.62A0EF802BE@alsa1.perex.cz>
Date: Fri, 13 Oct 2023 20:37:07 +0200 (CEST)
Message-ID-Hash: PTAZFEHZK67LRFNUTCAB32RSJEVVKDD7
X-Message-ID-Hash: PTAZFEHZK67LRFNUTCAB32RSJEVVKDD7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTAZFEHZK67LRFNUTCAB32RSJEVVKDD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #240 was opened from bkuhls:

https://github.com/alsa-project/alsa-utils/commit/b399fb85a919636b7da34e8bcf17f484dd9046f7 added usage of alsa/ump_msg.h without checking whether alsa-lib was compiled with rawmidi support:
https://github.com/alsa-project/alsa-lib/blob/master/include/Makefile.am#L37

Fixes a build error when alsa-lib was compiled with --disable-rawmidi

aplaymidi.c:34:10: fatal error: alsa/ump_msg.h: No such file or directory
   34 | #include <alsa/ump_msg.h>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/240
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/240.patch
Repository URL: https://github.com/alsa-project/alsa-utils
