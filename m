Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7926C9874
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 00:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCC6F886;
	Mon, 27 Mar 2023 00:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCC6F886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679869021;
	bh=rwzC6d2YDM9g+WldhR+VHdk5R/90QMfjclD6OhygPuU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Yb6ZITXQHTUNrMZD4Oxou5zEbMrH0avJtZWOKmcqFq+IzG/aTcRH/Ry2F/nvd9vck
	 lIV235P1K/QLK+ODuvHrc9ihmGxekL6LTi37hFxx5jZ9IHU3AW64oypolpRMnM5MOg
	 prrsRVCBg0QlIZDgirDyhWSlloFHnE770t8cnK0k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2CA9F80249;
	Mon, 27 Mar 2023 00:16:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A863F80272; Mon, 27 Mar 2023 00:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C8600F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 00:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8600F80249
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679868960143297434-webhooks-bot@alsa-project.org>
References: <1679868960143297434-webhooks-bot@alsa-project.org>
Subject: Adding UCM2 configuration for Roland/BridgeCast
Message-Id: <20230326221605.7A863F80272@alsa1.perex.cz>
Date: Mon, 27 Mar 2023 00:16:05 +0200 (CEST)
Message-ID-Hash: RN62K4CD7DLE4WCLX5H7BP4ULPOMP5J2
X-Message-ID-Hash: RN62K4CD7DLE4WCLX5H7BP4ULPOMP5J2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RN62K4CD7DLE4WCLX5H7BP4ULPOMP5J2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #297 was opened from smangels:

* got a new Roland BridgeCast unit that wasn't fully supported in UCM2
* all stereo channels are mapped
* tested in ArchLinux, kernel 6.2.2, alsa-ucm-conf 1.2.8.-1

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/297
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/297.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
