Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5F8A3B59
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Apr 2024 08:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF16C23D6;
	Sat, 13 Apr 2024 08:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF16C23D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712991142;
	bh=OWq4P+UW+vFS3MK6NiR4rHMjGrL5sjT+rNgbhmC2t3M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XXS2Tknn2GYamyxkFw538VL+OvTXkxF677Dt42HcOkCswIV92JZaJxoRVd5x956nU
	 +OHLPXkTW+nSLzdqrbxCXgXKbhtoNPBKI2gghuHQXsz3losDNaHTNdwU6rHgyXiZ3j
	 8JwFcDvZeSZriX5580/EVlfEhFfwloSZU1zs4mw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24C8AF80568; Sat, 13 Apr 2024 08:51:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 639C7F80588;
	Sat, 13 Apr 2024 08:51:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A07AF8026D; Sat, 13 Apr 2024 08:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E04A8F80130
	for <alsa-devel@alsa-project.org>; Sat, 13 Apr 2024 08:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E04A8F80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1712991051456758022-webhooks-bot@alsa-project.org>
References: <1712991051456758022-webhooks-bot@alsa-project.org>
Subject: qcom: sdm845: MM1: fixes
Message-Id: <20240413065057.3A07AF8026D@alsa1.perex.cz>
Date: Sat, 13 Apr 2024 08:50:57 +0200 (CEST)
Message-ID-Hash: ATD235O23SFAMZTSJG6VR6MEHWTNIFKH
X-Message-ID-Hash: ATD235O23SFAMZTSJG6VR6MEHWTNIFKH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATD235O23SFAMZTSJG6VR6MEHWTNIFKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #408 was opened from jenneron:

I'm testing it on a device which is not in upstream yet, but it uses this configuration

It seems that the only device in upstream using it is Lenovo Yoga C630 laptop and we got it tested as well https://oftc.irclog.whitequark.org/aarch64-laptops/2024-04-06#33084827

The changes are pretty straightforward, check commit messages of each commit

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/408
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/408.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
