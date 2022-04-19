Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204C5507AB3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 22:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A3D18F1;
	Tue, 19 Apr 2022 22:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A3D18F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650398991;
	bh=hizN9YHSOxDKeuvnQmX2H/BfHirBjFToHdzGV5YL3AA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXlBLYztJwaR2SP936+c0FAniBNuW1gMQAyPzbjx2+7fnlJsVQodvYa034oz1Mo/a
	 6OPZgTDpVZ/0bvkiycUZpilMQmxGBETfS+laby2a0O8NmbvC0ttKrpLsEM9zPAegvQ
	 YWPUI4GxiE/vgWkpdEAYfH+9tRCm3dh0Kp+PgqA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1000BF80269;
	Tue, 19 Apr 2022 22:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 330DBF8025D; Tue, 19 Apr 2022 22:08:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B132BF800C1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 22:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B132BF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1650398927295574903-webhooks-bot@alsa-project.org>
References: <1650398927295574903-webhooks-bot@alsa-project.org>
Subject: cplay.c:153: bad expression ?
Message-Id: <20220419200851.330DBF8025D@alsa1.perex.cz>
Date: Tue, 19 Apr 2022 22:08:51 +0200 (CEST)
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

alsa-project/tinycompress issue #13 was opened from dcb314:

I just tried to compile tinycompress with the new C compiler clang-14.
It said:

cplay.c:153:34: warning: & has lower precedence than !=; != will be evaluated first [-Wparentheses]

Source code is

   if ((buf[0] != 0xff) || (buf[1] & 0xf0 != 0xf0))

Suggest new code:

   if ((buf[0] != 0xff) || ((buf[1] & 0xf0) != 0xf0))

Issue URL     : https://github.com/alsa-project/tinycompress/issues/13
Repository URL: https://github.com/alsa-project/tinycompress
