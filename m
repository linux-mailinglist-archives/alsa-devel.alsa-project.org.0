Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A8B82BA54
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 05:22:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE05EDFA;
	Fri, 12 Jan 2024 05:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE05EDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705033329;
	bh=vy3nROa/ZJPOsxa7JL3V7Zm8zpBcdMqUG/LkEqUufKg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gZFt74Jt0wiNYEEm2LGNKgUsoWrCmOBwOJ70ezt0OWryN5RM3FUyAidRweVEIK8RI
	 S+1LTRkuaZYv7S3Pw9xN2TFo6TNbFIoVHAXfsQikK4AryithK3n3mJs+fFEh8wC2Mk
	 q7lmAE60ZiwC3MoceHC+td7vb6DdKY5d8sSLym30=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE468F80563; Fri, 12 Jan 2024 05:21:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EBC1F80579;
	Fri, 12 Jan 2024 05:21:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C40C6F80254; Fri, 12 Jan 2024 05:21:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D027DF80086
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 05:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D027DF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705033287465261221-webhooks-bot@alsa-project.org>
References: <1705033287465261221-webhooks-bot@alsa-project.org>
Subject: USB-Audio: fix comment in MOTU M4 config
Message-Id: <20240112042131.C40C6F80254@alsa1.perex.cz>
Date: Fri, 12 Jan 2024 05:21:31 +0100 (CET)
Message-ID-Hash: MKYQIKHQ3HZSBOSIOZYE5AZZAHCCIUZ4
X-Message-ID-Hash: MKYQIKHQ3HZSBOSIOZYE5AZZAHCCIUZ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKYQIKHQ3HZSBOSIOZYE5AZZAHCCIUZ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #379 was opened from davide125:

Mic2 is 2R, not 1R, so update the Stereo entry accordingly. This makes it consistent with the M2 and M6 (https://github.com/alsa-project/alsa-ucm-conf/pull/378) configs.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/379
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/379.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
