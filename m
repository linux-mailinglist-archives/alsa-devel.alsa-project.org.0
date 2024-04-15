Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB88A47A3
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 07:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47F314E5;
	Mon, 15 Apr 2024 07:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47F314E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713159645;
	bh=T8s2qb5Dz0Cj0MBXF1R1tFc8rxwzyj6GQI9+m2nUz4U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MsdpCMactAT3qZ54gRgsEgiPiotz3NUOw+LfZUoJzClXmPRxjq29UwqskSD6rbfqo
	 syek4qsYMALU1Bnj0I7lokx7uh+z4VdTqkPQnW5lRRS872XTyP9O1gtfTTnFVKtFDD
	 98z31kkwgQFY4T17bqeZvxczKhqLW2VvWxnylOkQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0FF0F8057E; Mon, 15 Apr 2024 07:40:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C096F805A0;
	Mon, 15 Apr 2024 07:40:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08B2DF8025A; Mon, 15 Apr 2024 07:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=KHOP_HELO_FCRDNS,MISSING_DATE,
	MISSING_MID,SPF_HELO_NONE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA0EF8013D
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 07:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA0EF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713159296071381569-webhooks-bot@alsa-project.org>
References: <1713159296071381569-webhooks-bot@alsa-project.org>
Subject: ucm2: soundwire: add rt722 SDCA device
Message-Id: <20240415053909.08B2DF8025A@alsa1.perex.cz>
Date: Mon, 15 Apr 2024 07:39:09 +0200 (CEST)
Message-ID-Hash: PM3C5RQWH4PNKDHKYBMN6V4Q2Y5VSHAP
X-Message-ID-Hash: PM3C5RQWH4PNKDHKYBMN6V4Q2Y5VSHAP
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #409 was opened from jack-cy-yu:

Add support of ucm to rt722 SDCA.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/409
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/409.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
