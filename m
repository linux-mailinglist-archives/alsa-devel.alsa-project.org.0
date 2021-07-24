Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C633D7134
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 10:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399A51B0C;
	Tue, 27 Jul 2021 10:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399A51B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627374649;
	bh=90u+wCNqC94Dqs72LcJ8Tsq4P2Ys2+bmuuVBACSJmuM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZtM+lyGRrTV8G8/8r7ZnrHtXpF3+djjFwGO17NLVC0PjKdaJuhsd5n0AQsHkzwuRz
	 fozkGSgcMywRgl5K4HcEzSd3OvLJ62YUk3pvlWCUmA23hqeuScTcVH5MjlVq/NxNTn
	 VQHsUshthsWKNZTCMyeTDCXL8Jcc6/eZ1JgR3dI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8247F8020D;
	Tue, 27 Jul 2021 10:29:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D7E7F80227; Sat, 24 Jul 2021 12:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtpo86.poczta.onet.pl (smtpo86.poczta.onet.pl
 [213.180.149.139])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9A23F800DA
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 12:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9A23F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=onet.eu header.i=@onet.eu
 header.b="iMbiHHx3"
Received: from pmq1v.m5r2.onet (pmq1v.m5r2.onet [10.174.32.67])
 by smtp.poczta.onet.pl (Onet) with ESMTP id 4GX20z0VyVzlj8f1
 for <alsa-devel@alsa-project.org>; Sat, 24 Jul 2021 12:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onet.eu; s=2011;
 t=1627121235; bh=90u+wCNqC94Dqs72LcJ8Tsq4P2Ys2+bmuuVBACSJmuM=;
 h=From:To:Date:Subject:From;
 b=iMbiHHx3Ll1x1pdppSbNB2BWOYShXsBoXiLhWwuLbdae9KySGO8OguDy9xU00YOqC
 /E7Svr7NnJMryqrk9yYSONDWmgItETKOeBn3tubcM/4T56TprHD2JLwTg5vIJy54NM
 czXadO5OgUfXTvN2aYGVVEiXqOwdROA3FtE9LDQs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received: from [31.0.57.188] by pmq1v.m5r2.onet via HTTP id ;
 Sat, 24 Jul 2021 12:07:15 +0200
From: rv71@onet.eu
X-Priority: 3
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Date: Sat, 24 Jul 2021 12:07:14 +0200
Message-Id: <138065115-be2ec115b2a48297ebd271870a774ed7@pmq1v.m5r2.onet>
X-Mailer: onet.poczta
Subject: MIDI Through Port Number in ALSA Sequencer
X-Onet-PMQ: <rv71@onet.eu>;31.0.57.188;PL;1
X-Mailman-Approved-At: Tue, 27 Jul 2021 10:29:08 +0200
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

Hello,=C2=A0

ALSA Sequencer always creates MIDI Through Port with the id 14:0. However, =
I can't find where it is defined that this special port will have this part=
icular id/number. I also don't see any definition in seq.h regarding this (=
 unlike the timer and announce special port, for example). Can you explain? =


Thanks =


Robert
