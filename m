Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12BB5952E7
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 08:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C2C1620;
	Tue, 16 Aug 2022 08:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C2C1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660632420;
	bh=1d7IVjjySk1qzuT30yUJoLHoNmBSXstwNPnen1ySt+0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jb/01uSFVshlUvPujVBv6DVr6koCty35JG1wyGStmVTiH/F9AvN2TxbgP05q4qXrU
	 zOKsKWXibe/htIjAoTYjKMk5U98qzeDYuwqIvaFqhuCkducMTX4pGA4FcT7axL8fSc
	 3kQUqdzc65lU4I503f5B8bwpZv1dUyASoq1YfQHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 746B3F80095;
	Tue, 16 Aug 2022 08:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 636CDF8032D; Tue, 16 Aug 2022 07:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,HTML_OBFUSCATE_10_20,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2AB2F80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 07:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2AB2F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=tutanota.com header.i=@tutanota.com
 header.b="opuEGb1/"
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w4.tutanota.de (Postfix) with ESMTP id 6A880106019B
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 05:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660629218; 
 s=s1; d=tutanota.com;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=kkbW6KkGfpwEi1NgxLb8vt1bjZSo/rOFmNokx6/mgl8=;
 b=opuEGb1/77jk71H2+t+JkikIWyBvrXqkOmd1rvKoldiZrYdeGIgYTN0PIRq5dS7E
 SfzIpXK0JO+cAner4x2K5wsOUjSUhtRMBtTlNzuFv9YXuTg4Wo4pZwvJTmN7YJRW94E
 /DrYolNk4InHRzLLyw+TLJ+Lshsha1j5tDLqrgPzTUnBsUYa601L7p2nMq9L0I7e6GJ
 /OU1f5kN2563lYRWx/pM2PC1Ohrxi/QIqa+4gBtl/QlKR4cmkPQ/5sLwkoqU1YCzI/9
 1OsaeBkSsxuJdrxwaIlRLK2drzQTsVo5keedH9RT0w7qtzSiHr9SLDD2Sr9puCa0R9C
 gmyjASw8tw==
Date: Tue, 16 Aug 2022 07:53:38 +0200 (CEST)
From: Pascal Gross <baipush@tutanota.com>
To: Alsa Devel <alsa-devel@alsa-project.org>
Message-ID: <N9_CjBz--3-2@tutanota.com>
Subject: 6.0-RC1 new module for lenovo yoga
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Aug 2022 08:45:59 +0200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hello everybody

I've seen that there's a module in the new Kernel-RC for bass speaker probl=
ems with new Lenovo (written by Philipp Jungkamp):=20

SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7",=C2=A0 ALC287_FIXUP_YOG=
A9_14IAP7_BASS_SPK_PIN)=20

Could you please add the exact same line for a similar model with the same =
Problem?=20

SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA7_14I=
AL7_BASS_SPK_PIN)=20

I'm neither a developer nor a coder so I don't know how to contribute to th=
e Kernel, I just played around with Philipps patch, changed the lines accor=
ding to my model and it works now.=20

I would really appreciate your help and of course, if you have any question=
s feel free to contact me.

Thanks in advance,

Pascal
