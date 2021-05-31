Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E23503958DB
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 12:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DFA984C;
	Mon, 31 May 2021 12:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DFA984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622456389;
	bh=qVy7jE1KsDpd2VVkiogKDeDjeEBgmPBojpscyMeRFP8=;
	h=Subject:References:To:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKnzzMXeItjYTuQzroxY91oMZPwRx2FylBCBpQ6284wrtAyPc27vMRz4tQfpHvA6Z
	 EX5OheGd0vtI7hwimJ29wpunyozkUpyDBDScgSV+/duKlUOazALyZr/2HoRR+sFm0e
	 CB0d+4nbqVaqWDO+jOPqFrVFie4cqiYMUbi9et1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3ED0F80161;
	Mon, 31 May 2021 12:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFF67F802E2; Mon, 31 May 2021 12:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30BCAF80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 12:18:11 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 66669A0040
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 12:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 66669A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1622456290; bh=9Dn6MpwDZEqlOHWxUB0w++crwXDVAN2V5kjUj4gQ0DA=;
 h=Subject:References:To:From:Date:In-Reply-To:From;
 b=sc6cOtIZEgXGJSgkSlTBegxfLzNPDg3BpB8WS0B6SouOFm0tIns+jjdfhQv+7IpVk
 1SID5W9NdxPXnMYyqV34ANP0JrA189eekLK+0rPcxnJZAaqy/8UfCDq/tBMeN2xQVU
 sMRiH0aJcJOW8X3QN4QbxJSnujKi7wkfRP6eNsPQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 12:18:09 +0200 (CEST)
Subject: ALSA 1.2.5 release
References: <c2860da9-d21f-52bb-e15e-fda214e6890a@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
X-Forwarded-Message-Id: <c2860da9-d21f-52bb-e15e-fda214e6890a@perex.cz>
Message-ID: <2c410cdc-bde3-1b37-d517-e2d6a27128e5@perex.cz>
Date: Mon, 31 May 2021 12:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c2860da9-d21f-52bb-e15e-fda214e6890a@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hello all,

     new ALSA userspace packages were released. You may download them from
the ALSA website http://www.alsa-project.org or directly:

     HTTP: https://www.alsa-project.org/files/pub
     FTP:  ftp://ftp.alsa-project.org/pub

Full list of changes:

     https://www.alsa-project.org/wiki/Changes_v1.2.4_v1.2.5

All files on the primary ALSA site have also GPG signature now.
The fingerprint of the public signing key is:

     F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91

				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
