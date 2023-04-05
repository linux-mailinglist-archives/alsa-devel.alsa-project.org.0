Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5B6D75B3
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:39:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3115E8A;
	Wed,  5 Apr 2023 09:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3115E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680680340;
	bh=MiIBJxo7z5pQY2eMoQLvxiCgKXO1FwfRjr2iHbH6Prc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qI/iaDk2nW9SUjqrLkQkV485Fw2L62hGuSPdOgqa3UG/9ZnzXCPzlbw8/xxmryv9s
	 kd6Lb1Udv03dbmSD025QlBnWEdQAgeeJlYTkXw9RrEXW5lW5unHIYM2GzSeExJmKAB
	 nE1YN0CkQjiq+xmvc4KHkbX+Wyux3zC46UXIlBb4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 072D0F80529;
	Wed,  5 Apr 2023 09:37:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07C62F8052D; Wed,  5 Apr 2023 09:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AB428F80423
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 09:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB428F80423
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1680680252874516726-webhooks-bot@alsa-project.org>
References: <1680680252874516726-webhooks-bot@alsa-project.org>
Subject: http://www.alsa-project.org/alsa-info.sh doesnt exist
Message-Id: <20230405073735.07C62F8052D@alsa1.perex.cz>
Date: Wed,  5 Apr 2023 09:37:35 +0200 (CEST)
Message-ID-Hash: GCMPGDOVXFRQHUHKR2LIWLQKLARUUEN5
X-Message-ID-Hash: GCMPGDOVXFRQHUHKR2LIWLQKLARUUEN5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCMPGDOVXFRQHUHKR2LIWLQKLARUUEN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #199 was edited from petke:

http://www.alsa-project.org/alsa-info.sh doesnt exist. http status code 404

Looks like alsa-info.sh tries to auto update itself, but as that url doesnt exist. It overwrites itself with empty file.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/199
Repository URL: https://github.com/alsa-project/alsa-utils
