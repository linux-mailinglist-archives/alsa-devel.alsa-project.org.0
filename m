Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8AF9AE572
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 15:00:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2658ADEC;
	Thu, 24 Oct 2024 14:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2658ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729774800;
	bh=TGXTFML8cT2UsHivRQCY74+CT6ttaBC5q3eAMup3zKc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eZdD2FCfLT5tB81Hq+rpTYSkCdL41+jzJGIjmd3MorwYVzoU5YhAO+x3VpQVxiq6Z
	 Sgl09GAgqsoiWLKjkEfrzulFDP5Mz8cWfxrNVSdm7FTPAFuSpmf92bB9pJq8ii3dOO
	 s+TRk4P5YooqyPqaCaLYE8mRAb//ws06sT5i4JZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD7F2F80154; Thu, 24 Oct 2024 14:59:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B74C6F805B2;
	Thu, 24 Oct 2024 14:59:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EF80F8016C; Thu, 24 Oct 2024 14:59:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E87AAF80104
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 14:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E87AAF80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729774757340689659-webhooks-bot@alsa-project.org>
References: <1729774757340689659-webhooks-bot@alsa-project.org>
Subject: Update ucm conf for MediaTek Genio platforms
Message-Id: <20241024125919.8EF80F8016C@alsa1.perex.cz>
Date: Thu, 24 Oct 2024 14:59:19 +0200 (CEST)
Message-ID-Hash: FJDHUAWXVPR6ILP4FALNJJSKCZXFN2YK
X-Message-ID-Hash: FJDHUAWXVPR6ILP4FALNJJSKCZXFN2YK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJDHUAWXVPR6ILP4FALNJJSKCZXFN2YK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #456 was opened from zoran055:

1. Add dynamic configuration to detect HDMI/DP devices for mt8370-evk, mt8390-evk and mt8395-evk.
2. Add headset jack detection support for mt8370-evk, mt8390-evk and mt8395-evk.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/456
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/456.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
