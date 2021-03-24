Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B0347C70
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 16:22:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10AAB169D;
	Wed, 24 Mar 2021 16:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10AAB169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616599355;
	bh=WcD97B1jIiD5nM+vOEFssZuHapApJ/tBV6vl+RS8czg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jo96eaocix+dlHYJe6R0WxA7sk0jH51Knjkg92NSunlE/z44JINPvlH3D510n//dt
	 tTDKNEquOgKodpu1L7BZYvr72x62sy+mCzUJtFBnYcCloWiZQbIPHdgkIS0Zh2rJd/
	 sgvORNFVqw8+NwmXNxv0fMo8FS76woj6zkIlu76Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 995EDF80240;
	Wed, 24 Mar 2021 16:21:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E368AF801EC; Wed, 24 Mar 2021 16:21:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B60BDF801D5
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 16:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B60BDF801D5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1616599275152348995-webhooks-bot@alsa-project.org>
References: <1616599275152348995-webhooks-bot@alsa-project.org>
Subject: man: alsaloop man page error
Message-Id: <20210324152122.E368AF801EC@alsa1.perex.cz>
Date: Wed, 24 Mar 2021 16:21:22 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils issue #82 was edited from nootc:

There is a small typo in the alsaloop man page:
https://github.com/alsa-project/alsa-utils/blob/c9e9a79c6cfef3212bdb5f9be4f6ea1d2a5e8670/alsaloop/alsaloop.1#L76-L86
"-c" is used for both "channels" and "rate". Thankfully, the source thinks otherwise and "-r" is used for "rate".

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/82
Repository URL: https://github.com/alsa-project/alsa-utils
