Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFFE15FF51
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 17:58:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788591673;
	Sat, 15 Feb 2020 17:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788591673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581785928;
	bh=YHtN5H5If3QnzPOLGldfvcf74MRnstIqpAblO1YfXVo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A58HmAOFvX5h3zL73y33vWSEdE6X8zLUD53JReg0DGSKIB9/5L4Z5lDlkh+AMmbd9
	 pP6VQcGUcxkkQl2PlgXYCGxITejOwlkz85tbnj6KhV6TYZKhOhHnVkRwpgyVQYxtOf
	 N3b7yPhqx9KippEGUZYYMhwMvmzmirui+5ZiTcVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE81F80146;
	Sat, 15 Feb 2020 17:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90FB5F80147; Sat, 15 Feb 2020 17:57:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from berkelium.ap2c.org (unknown
 [IPv6:2a01:e35:1386:d790:250:fcff:fe42:7bed])
 by alsa1.perex.cz (Postfix) with ESMTP id 99F7AF80138
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 17:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F7AF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ap2c.com header.i=@ap2c.com
 header.b="L0li/Dby"
Received: from berkelium.ap2c.org (localhost [127.0.0.1])
 by berkelium.ap2c.org (Postfix) with ESMTP id 3F9EDF4F
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 17:57:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ap2c.com; s=ap2cCom;
 t=1581785820; bh=v1HpK74iBm3+w8E4a/AX6JYDI9/DBclMDbnvv2FVP9M=;
 h=From:To:Subject:Date;
 b=L0li/DbyRaP7AJbDkCVD8mi5aEuC11SACpeuH9eest5rnmfpABXx6wUJHNj/ZuwSD
 xfR7rHb+aTXGJ7kOLh1hxccYy4EfvZmIN9VcX6z0Zsp2sAOh3LIRdl8fOEK0409rQo
 WfOkBDZVHTncLT9edpmwf8RjDOZrH46Hzu09NKK0=
X-Virus-Scanned: amavisd-new at ap2c.org
Received: from berkelium.ap2c.org ([127.0.0.1])
 by berkelium.ap2c.org (berkelium.ap2c.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id e1PCQ2MW1Qdw for <alsa-devel@alsa-project.org>;
 Sat, 15 Feb 2020 17:56:59 +0100 (CET)
Received: from antimony.ap2c.org (unknown
 [IPv6:2a01:e34:ec20:ab90:63ad:3e9d:5e02:f5e0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by berkelium.ap2c.org (Postfix) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 17:56:59 +0100 (CET)
From: =?ISO-8859-1?Q?Aur=E9lien?= Croc <aurelien@ap2c.com>
To: alsa-devel <alsa-devel@alsa-project.org>
Date: Sat, 15 Feb 2020 17:56:58 +0100
Message-ID: <1610933.XPBrhYXKCp@antimony.ap2c.org>
Organization: =?UTF-8?B?QVDCskM=?=
MIME-Version: 1.0
Subject: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy book
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear ALSA community, =


I just bought a Samsung Galaxy book 12" laptop and I installed the latest =

Fedora version (31) on it. Unfortunately when I try to listen something the=
re =

is absolutely no sound from speaker nor headsets. I checked that volumes of =

the different channels were max. I also checked for muting system but I did=
n't =

found anything.
Of course it works perfectly under Windows.
I saw on internet that many ALC298 users had troubles with it. I tried =

different options to the intel hda driver (especially the model one) but it =

changes nothing.

Here is the alsa-info.sh output: http://alsa-project.org/db/?
f=3D871881e295972b9ecf252b25e90d659e38d939b8
I would appreciate some help in order to find a solution.
Tell me if you need more information.
Thanks in advance.


Aur=E9lien


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
