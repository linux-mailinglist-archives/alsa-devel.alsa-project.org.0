Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0275DD40
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 17:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C6CB1FE;
	Sat, 22 Jul 2023 17:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C6CB1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690040646;
	bh=1tEmdQkJ9dWaa4q9Y4MesVMfXIA6sKjkNtHdcvMqWDk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mZLZ8OkzoOOhphsw/TFQ/+F3e9soUaAnfAVXP77ho1kNHmEVJKaZwjZaH/VwUsaO9
	 sPiuX7x6oPKNNRQBxzpn2OWlDyk7JHqTqQwajhyY+zO1D+I8Rfdc97MlydK5Ih2t6w
	 SINmD9UXzBsM20QUvgAGapZaU/vUM5V3UbijMtnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C507F8053B; Sat, 22 Jul 2023 17:43:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2345AF8032D;
	Sat, 22 Jul 2023 17:43:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2677F8047D; Sat, 22 Jul 2023 17:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AB496F8007E
	for <alsa-devel@alsa-project.org>; Sat, 22 Jul 2023 17:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB496F8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1690040518427653074-webhooks-bot@alsa-project.org>
References: <1690040518427653074-webhooks-bot@alsa-project.org>
Subject: alsactl: add define to compile with glibc 2.38
Message-Id: <20230722154205.D2677F8047D@alsa1.perex.cz>
Date: Sat, 22 Jul 2023 17:42:05 +0200 (CEST)
Message-ID-Hash: O2IJJ77M5CYHDX24VJK3PFME3KEPXL3S
X-Message-ID-Hash: O2IJJ77M5CYHDX24VJK3PFME3KEPXL3S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2IJJ77M5CYHDX24VJK3PFME3KEPXL3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #225 was opened from heitbaum:

strlcat and strlcpy have been added to glibc 2.38. update the defines to use the glibc versions, and not conflict with string.h.

ref:
- https://sourceware.org/git/?p=glibc.git;a=commit;h=454a20c8756c9c1d55419153255fc7692b3d2199

Request URL   : https://github.com/alsa-project/alsa-utils/pull/225
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/225.patch
Repository URL: https://github.com/alsa-project/alsa-utils
