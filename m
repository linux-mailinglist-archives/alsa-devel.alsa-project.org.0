Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C67019A296D
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 18:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECFD4207;
	Thu, 17 Oct 2024 18:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECFD4207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729183612;
	bh=W+rJiEo3je5A9AkB1pfY8qBEN6KV8BwxbOflXqFX7xY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nxiczUh13fSd9x5Ah/4RDo5enILvcEbPOWiuNrYgOBZZImhELt0ZNxLAvDGupjW54
	 xiJSSmvumHyrvOJYnVWslkPQzrVFQpx7FLu82jSAFaqeX4BtoFh3ZLdBVsHyIfZcFN
	 3HxHcXkNK6eOCDw7ZaOVD9NoHejq9JMC/a1U/AMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C577F805AB; Thu, 17 Oct 2024 18:46:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E57EFF8058C;
	Thu, 17 Oct 2024 18:46:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E673F80448; Thu, 17 Oct 2024 18:46:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E8551F8016B
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 18:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8551F8016B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729183571409333706-webhooks-bot@alsa-project.org>
References: <1729183571409333706-webhooks-bot@alsa-project.org>
Subject: acppdmmach: add support for ACP 7.0
Message-Id: <20241017164613.9E673F80448@alsa1.perex.cz>
Date: Thu, 17 Oct 2024 18:46:13 +0200 (CEST)
Message-ID-Hash: UXIKIASZRUI2EHGQEX2BXWB64TBIBKAL
X-Message-ID-Hash: UXIKIASZRUI2EHGQEX2BXWB64TBIBKAL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXIKIASZRUI2EHGQEX2BXWB64TBIBKAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #452 was opened from superm1:

Starting with ACP 7.0 there is a generic 'acppdmmach' driver that will be utilized.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/452
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/452.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
