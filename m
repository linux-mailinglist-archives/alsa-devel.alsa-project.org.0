Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E140076FC20
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 10:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7135E827;
	Fri,  4 Aug 2023 10:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7135E827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691138437;
	bh=8Jl3Bm+a77KmlPjoz8yYEkZG75jwseDruzx9ck7co+o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=q9VmMECG4uBHzxdLBu1cQ0/gSFJfEaXK6fvD4ASXC0kC2qNsDG/Ms4ixI/VxArxp1
	 5qnqrXji4H2UVUKlj4lscX3OvHvppIL89k/xBd8HY44LuWBPAwRYZOZifsSfaufw3f
	 IX2X6NdT5SARnyx4pTp+TgphuJsGbBNehUVbgh4s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D0B8F80549; Fri,  4 Aug 2023 10:39:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A045BF8025A;
	Fri,  4 Aug 2023 10:39:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33870F8025A; Fri,  4 Aug 2023 10:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 64CF7F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 10:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64CF7F8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1691138375337891102-webhooks-bot@alsa-project.org>
References: <1691138375337891102-webhooks-bot@alsa-project.org>
Subject: [RFC] pcm: Add MSBITS_20 and MSBITS_24 subformat options
Message-Id: <20230804083942.33870F8025A@alsa1.perex.cz>
Date: Fri,  4 Aug 2023 10:39:42 +0200 (CEST)
Message-ID-Hash: PAV5DTFSTO2K4LBFYEBELDDFJX2RKDM6
X-Message-ID-Hash: PAV5DTFSTO2K4LBFYEBELDDFJX2RKDM6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAV5DTFSTO2K4LBFYEBELDDFJX2RKDM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #342 was opened from crojewsk-intel:

Improve granularity of format selection for S32/U32 formats by adding masks representing 20 and 24 most significant bits. As a preparation step introduce `snd_pcm_subformat_value()` for easy name-to-subformat conversions.

While at it, fix few warnings that pop up in subformat-related code during compilation.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/342
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/342.patch
Repository URL: https://github.com/alsa-project/alsa-lib
