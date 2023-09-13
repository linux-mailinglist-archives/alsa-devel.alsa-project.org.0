Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB279F3BA
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 23:23:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C13284B;
	Wed, 13 Sep 2023 23:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C13284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694640208;
	bh=re/d/2TDQpcuIktWljvWVWruOg/7pNe486wkOQOKNmc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GXe36XZ3TA3a7VGr8qIfrs9JqPBNRI8RB9NbcvSNmsJqN4MnoiPKv9IvmizanMYWT
	 /3FqxTEFwsUmZLiHqvV6RbVdjJUTaq7ULij407l5rFpISr/Q+qatkcZzgcehRDrVQn
	 VoKEOxF344WPOMbi9sfeZ48A4nmBiLgdXZGNr3nM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3A1AF801F5; Wed, 13 Sep 2023 23:22:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F12DF8007C;
	Wed, 13 Sep 2023 23:22:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51576F80425; Wed, 13 Sep 2023 23:22:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BB7F8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 23:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76BB7F8007C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694640151994657516-webhooks-bot@alsa-project.org>
References: <1694640151994657516-webhooks-bot@alsa-project.org>
Subject: USB-Audio/Roland/BridgeCast, generic config file is missing
Message-Id: <20230913212234.51576F80425@alsa1.perex.cz>
Date: Wed, 13 Sep 2023 23:22:34 +0200 (CEST)
Message-ID-Hash: 6GLQ7S5ODGLJHL3I6MOXXGKWMRLOYP4J
X-Message-ID-Hash: 6GLQ7S5ODGLJHL3I6MOXXGKWMRLOYP4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GLQ7S5ODGLJHL3I6MOXXGKWMRLOYP4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #353 was edited from smangels:

* the intermediate config file is missing, it is referenced in ucm2/USB-Audio/USB-Audio.conf file but wasn't in place.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/353
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
