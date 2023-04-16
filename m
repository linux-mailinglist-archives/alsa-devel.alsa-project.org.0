Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 170226E376C
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Apr 2023 12:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B919D836;
	Sun, 16 Apr 2023 12:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B919D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681640863;
	bh=U8aFh5l0CNiDRkTuOE6YybBdxLJBsjLczkU7HTcmJqk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ga3fPSaWe8ngFrZzWFeFsL9WQ4DAdqB4zPeAeX4CDfFKW3q4ASxZhMSsFo+D54hRH
	 vfhsFP81IsoJ6vSbCmWLHHgB9abqG8DtU2TjBAOS9gh+cW67mlbl2brJPapPPLSQrg
	 7Gb4SDn3UtiKzjZBAsvdq/x3PbanWi0ocYqJx1GI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22915F8023A;
	Sun, 16 Apr 2023 12:26:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81973F80266; Sun, 16 Apr 2023 12:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 666CEF8023A
	for <alsa-devel@alsa-project.org>; Sun, 16 Apr 2023 12:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666CEF8023A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1681640804901872873-webhooks-bot@alsa-project.org>
References: <1681640804901872873-webhooks-bot@alsa-project.org>
Subject: USB-Audio: ALC4080 on Gigabyte Z690 AORUS ULTRA
Message-Id: <20230416102648.81973F80266@alsa1.perex.cz>
Date: Sun, 16 Apr 2023 12:26:48 +0200 (CEST)
Message-ID-Hash: DMOGQHAGFR6PGA2GNUZXVB2TLYJPWE7O
X-Message-ID-Hash: DMOGQHAGFR6PGA2GNUZXVB2TLYJPWE7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMOGQHAGFR6PGA2GNUZXVB2TLYJPWE7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #304 was opened from MichailiK:

This PR adds the USB ID of the ALC4080 found in the [Z690 AORUS ULTRA](https://www.gigabyte.com/Motherboard/Z690-AORUS-ULTRA-rev-1x/sp#sp), `0414:a011`.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/304
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/304.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
