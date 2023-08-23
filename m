Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5DB78540B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 11:30:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D27882C;
	Wed, 23 Aug 2023 11:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D27882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692783055;
	bh=9Ks34+15LsRm68cUw4Ha0wSkxyIKN0PzMzXG2uiB7as=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tH2l6mG9pYULsvWMZuIcj2v9aD1VsIHilcoS7+n+MnXwyBeej4bZDUEIZbxgY0Td9
	 VJQjkBSF0/5SgxXuN7uI1IeHdMKrL2rtpkNw+kcDlYFIrAdrpxnkTUaS6QkWMC1bSY
	 KWnCOYHOWA8EAeMoa7PSRlj0UDgxqslvRdPhRdRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BC95F800F5; Wed, 23 Aug 2023 11:30:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2287F800F5;
	Wed, 23 Aug 2023 11:30:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0FADF80158; Wed, 23 Aug 2023 11:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2478CF800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 11:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2478CF800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692782959115009069-webhooks-bot@alsa-project.org>
References: <1692782959115009069-webhooks-bot@alsa-project.org>
Subject: snd_seq_ev_set_ump_data() stack smashing
Message-Id: <20230823092927.D0FADF80158@alsa1.perex.cz>
Date: Wed, 23 Aug 2023 11:29:27 +0200 (CEST)
Message-ID-Hash: AENN4JCSBMSRTQHF23NBHB6Y7NZ7236B
X-Message-ID-Hash: AENN4JCSBMSRTQHF23NBHB6Y7NZ7236B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AENN4JCSBMSRTQHF23NBHB6Y7NZ7236B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #346 was opened from symdeb:

snd_seq_ev_set_ump_data(&umpev, buffer, len); 

When called with len > 4 causes stack smashing. 
A ump messages is maximum four  32bit values.
Proposal solution, return error when len > 4 ?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/346
Repository URL: https://github.com/alsa-project/alsa-lib
