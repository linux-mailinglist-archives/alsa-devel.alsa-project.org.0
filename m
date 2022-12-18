Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538664FECC
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Dec 2022 12:47:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D26E23F5;
	Sun, 18 Dec 2022 12:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D26E23F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671364061;
	bh=D8i65qk+lGIuKrTz96KmkruPkpzPvwRY0KhN/FrKp3Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r+khvoys6vJNCxbmcL8PkHCer1QiASbQ5+n6DFnXfbkNiB8EdaUgjHhiH8t7Yd5tz
	 sd+vetVxyB7PUCVu+00GApvL2mkNNn9rk8rI2jMqYIn4koeNAEvkWrcpT9Af8LekZY
	 IeZmgid9VSPTyTidybCh09Cj1tW1hUlg5UWgA+SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 346F1F8014C;
	Sun, 18 Dec 2022 12:46:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB3F9F8014C; Sun, 18 Dec 2022 12:46:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 217A6F8014C
 for <alsa-devel@alsa-project.org>; Sun, 18 Dec 2022 12:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 217A6F8014C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671363999595242977-webhooks-bot@alsa-project.org>
References: <1671363999595242977-webhooks-bot@alsa-project.org>
Subject: No front panel profile on Xonar D1
Message-Id: <20221218114641.BB3F9F8014C@alsa1.perex.cz>
Date: Sun, 18 Dec 2022 12:46:41 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-ucm-conf issue #252 was opened from realnc:

There is no way to switch to front panel headphone output through pipewire. I have to open a terminal, run `alsamixer` and unmute the "Front Panel" element every time I want to switch to/from front panel input and output:

![image](https://user-images.githubusercontent.com/1665903/208296363-67272f79-b3b9-4783-9f75-8527f0db8457.png)

I've been told by a pipewire dev that alsa-ucm-conf must provide a profile, otherwise it can't work. My sound card is an Asus Xonar D1.

`alsa-info.sh`: http://alsa-project.org/db/?f=beaa1236f0889f1f0ad8474c4c1825fb9488af1f

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/252
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
