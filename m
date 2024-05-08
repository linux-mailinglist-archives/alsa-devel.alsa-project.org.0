Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CF8BFD41
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E511F843;
	Wed,  8 May 2024 14:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E511F843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715171787;
	bh=BknzvjtTVR+WO+n5F27t8aYaF0VQIZ1FY8ZIMnSAsMg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Wc0tD7iwk4/55ABkESjs99LzLQsGkQ5J456xRLlWToSZX+BHopKO1UrI3wsW4+38y
	 BuG6v/dUm1O7pDGrTV+LcNEE0C0nLQxQyVLwl+n01SocYZ9WkRDkh0n2q1+flk72lo
	 fgqFduitUqO5sB1THypQ2a6cQ5NK1bwyKrKDrMsg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA640F805AE; Wed,  8 May 2024 14:35:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 183D1F80563;
	Wed,  8 May 2024 14:35:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43A86F8049C; Wed,  8 May 2024 14:35:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F94F8024C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 14:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23F94F8024C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1715171747717327595-webhooks-bot@alsa-project.org>
References: <1715171747717327595-webhooks-bot@alsa-project.org>
Subject: ucm2: Qualcomm: x1e80100: add recording via DMIC01
Message-Id: <20240508123552.43A86F8049C@alsa1.perex.cz>
Date: Wed,  8 May 2024 14:35:52 +0200 (CEST)
Message-ID-Hash: OCY3CGAORMRJTP3BC7H33EDCGWFQE4HR
X-Message-ID-Hash: OCY3CGAORMRJTP3BC7H33EDCGWFQE4HR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCY3CGAORMRJTP3BC7H33EDCGWFQE4HR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #414 was opened from krzk:

Add support for Digital Microphones DMIC01 on Qualcomm X1E80100 CRD board.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/414
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/414.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
