Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8002E2DA1
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 08:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5139D185E;
	Sat, 26 Dec 2020 08:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5139D185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608968945;
	bh=7d8I5hwCZQrMXuSGnzKhBKWfYf74HXgNhPCzh78Ubvw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ti7VOlNZjBTh1+RufmZGhJ1sVmpgvs1QOJmTbOtdVDEzG3zapP4rQq9QwhIon7J1N
	 PPf3Ids00BAdKIwf54W76//OS0EISkskpfCw+M4mHNEWkvHlz+VyYGoSFvAJLzGfaf
	 xuUtlEgJMXE3SiYShdKV+aLCJMa1H8cqjfmnMLuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E745F800C8;
	Sat, 26 Dec 2020 08:48:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED274F801D5; Fri, 25 Dec 2020 10:13:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, HTML_MIME_NO_HTML_TAG,
 MIME_HTML_ONLY, 
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::107])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E93BF80128
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 10:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E93BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru
 header.b="uC1YNTCT"
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
 by forward104j.mail.yandex.net (Yandex) with ESMTP id 352844A2A07
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 12:13:26 +0300 (MSK)
Received: from vla1-0a21544ac5fe.qloud-c.yandex.net
 (vla1-0a21544ac5fe.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:1686:0:640:a21:544a])
 by forward103q.mail.yandex.net (Yandex) with ESMTP id 2E12661E0011
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 12:13:26 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-0a21544ac5fe.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 c1pv0ANLIJ-DPDiIW0A; Fri, 25 Dec 2020 12:13:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1608887605; bh=PZHN7xCECDQlt2YM3FjPxbqyTRVDBp8ahg6QpwQaDo0=;
 h=Message-Id:Date:Subject:To:From;
 b=uC1YNTCTfYjuicBeUgknWZ0YSPHEkAcSCUZVnWBza/kH847esNr1QH8ppwGqSX9W8
 oyoeTWs2kuCH1ciy6mO1OllmFA0vaTP5vqvHnDi76Lo2T4vZucp+5CjzJI8rgubvkh
 juqt1SBBS8kl80zpoAAEknqaFGjXF28obJhxFlNw=
Authentication-Results: vla1-0a21544ac5fe.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by vla1-c7cd0219e008.qloud-c.yandex.net with HTTP;
 Fri, 25 Dec 2020 12:13:25 +0300
From: =?utf-8?B?0KHQu9Cw0LLQsCDQkdCw0L3RidC40LrQvtCy?= <solongoiv@yandex.ru>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: No sound from speakers, only headphones working
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 25 Dec 2020 16:13:25 +0700
Message-Id: <455941608887457@mail.yandex.ru>
X-Mailman-Approved-At: Sat, 26 Dec 2020 08:48:10 +0100
MIME-Version: 1.0
Content-Type: text/plain
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

   Here is the output from alsa-info.sh

   http://alsa-project.org/db/?f=ba0e450b747066e59c76642aa3c9f15a9a9f8a0b
