Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8EB945EF3
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 15:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD2741DD;
	Fri,  2 Aug 2024 15:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD2741DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722607037;
	bh=92y5iupXFBPQWVCm7CpCHd4Wnmp/LLF+QtqPKFWj9FQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Nc3TK3THTX/1SXhiiEzJO21QPnNjCOYdPRqG5ugg8uPa9NqT2Uvkqw9hqjlu+9urY
	 dXSWxQeh0PoB0ZaHNBY3CMOz4Os+A03GJ9Zf7VJWCI5yLrEqzwXRMdhLLpA8HkQw1z
	 q8UCKMUQNFzcBTWSHJhpxyzGLf967a26JjOQJ2ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B996F805AD; Fri,  2 Aug 2024 15:56:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03224F8059F;
	Fri,  2 Aug 2024 15:56:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 341AFF8026A; Fri,  2 Aug 2024 15:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 206E5F800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 15:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 206E5F800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1722606993401843548-webhooks-bot@alsa-project.org>
References: <1722606993401843548-webhooks-bot@alsa-project.org>
Subject: common: pcm/split: add support up to 32 / 8 channels
Message-Id: <20240802135640.341AFF8026A@alsa1.perex.cz>
Date: Fri,  2 Aug 2024 15:56:40 +0200 (CEST)
Message-ID-Hash: FTHK2NDF44M3OHMXY6KBEDWTEOBKZ6V5
X-Message-ID-Hash: FTHK2NDF44M3OHMXY6KBEDWTEOBKZ6V5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTHK2NDF44M3OHMXY6KBEDWTEOBKZ6V5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #417 was edited from perexg:

**DO NOT MERGE - after 1.2.12!**

MOTU 828 has up to 32 hardware channels. Add support for this configuration to common/pcm/split.conf.

Also, add support for up to 8 channels for the abstact devices (like 7.1 surround).

Note that this change requires recent alsa-lib (Syntax 7).

Link: https://github.com/alsa-project/alsa-ucm-conf/pull/416

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/417
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/417.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
