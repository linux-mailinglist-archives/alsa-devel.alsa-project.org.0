Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5EF826270
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 01:10:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60AD8E9D;
	Sun,  7 Jan 2024 01:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60AD8E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704586219;
	bh=KCzfzHRdAKyZdVaQB9U2Fx+j7zFxnm9BDC0dj52tSl0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MSFWQZl7qhMtecOD3V/qiWJ2fP3QfTbA3zqdpGZNVW0/hn8P3UjP5pthCe4rpju6E
	 qmhOGNPe8sctLDbTZwZnrayTCkixXpJJBNESGE0Dt2kW3ioeKImE9TSeoSLC5jaWf0
	 sHlZy45RvPlNQ5rPW2OlTQc9lJVnDPd4XI/vYJf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E7E7F8014B; Sun,  7 Jan 2024 01:09:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E6AF804E7;
	Sun,  7 Jan 2024 01:09:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CD39F80246; Sun,  7 Jan 2024 01:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B15F8014B
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 01:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21B15F8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704586174701714516-webhooks-bot@alsa-project.org>
References: <1704586174701714516-webhooks-bot@alsa-project.org>
Subject: Also search for
 ucm2/conf.d/[${CardDriver}|${KernelDriver}]/${CardName}.conf
Message-Id: <20240107000941.8CD39F80246@alsa1.perex.cz>
Date: Sun,  7 Jan 2024 01:09:41 +0100 (CET)
Message-ID-Hash: 2KT4ZJXN3YONI33EJES72HPLP7IPSEVO
X-Message-ID-Hash: 2KT4ZJXN3YONI33EJES72HPLP7IPSEVO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KT4ZJXN3YONI33EJES72HPLP7IPSEVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #374 was opened from Daniel-Abrecht:

The CardLongName may be derived from various DMI properties of the system, that have little to do with the card itself. Sometimes, that may be a good thing, but sometimes, it may contain the completely generic "Unknown-UnknownProduct-", see https://gitlab.com/postmarketOS/pmaports/-/issues/1498#note_1716959721 for example. At least for devices using device tree and simple-card, the name of the card (CardName), which then comes from the device tree, which can be provided by the kernel too, may be a lot more relevant, and does actually identify the device.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/374
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/374.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
