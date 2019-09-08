Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF439ACC23
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 12:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF16166A;
	Sun,  8 Sep 2019 12:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF16166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567939322;
	bh=wXeilcCr5yELc3ZVEAmZzafBUNG2QJCPGA962G4p1Qw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RVj7OpKdYQ1zgAAH52urtG6dtAdA/cDxJiXderGzbWFRG/yvEHnfwytbQhxRqtLwl
	 qcttt8yrLfIcJjAgC3Ro8zsk9PiqJcCLoSgz0IzxhcOGxIU/ntn6TwNMG9E4z0Y6N+
	 KHOOf97lGdiN+o337/GlJpDpU55j389XDMOpA8to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 718AFF80368;
	Sun,  8 Sep 2019 12:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9925F804AB; Sun,  8 Sep 2019 12:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MISSING_DATE, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5584F80157
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 12:39:24 +0200 (CEST)
Received: from server.perex-int.cz (unknown [172.16.0.20])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BB024A003F;
 Sun,  8 Sep 2019 12:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BB024A003F
Received: from alsa-devel.perex.cz (unknown [192.168.102.181])
 by server.perex-int.cz (Perex's E-mail Delivery System) with ESMTP id
 2224814005C; Sun,  8 Sep 2019 12:39:20 +0200 (CEST)
MIME-Version: 1.0
From: Jaroslav Kysela <jkysela@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <15679391594432724-alsa-devel@perex.cz>
Date: Sun,  8 Sep 2019 12:39:28 +0200 (CEST)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] Licence change for your alsa-lib UCM commits (Takashi
	Iwai: 9 total)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As discussed, we would like to move the UCM configuration files from the
alsa-lib repository to new alsa-ucm-conf repository with the licence change
from LGPL-2.1 to BSD-3-Clause.

I would like to check, if you agree with this licence change. Please, answer
to this e-mail and write your agreement / disagreement (keep CC to
the alsa-devel mailing list for the archiving purposes).

Thank you for your time and co-operation.

Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html

List of your commit(s):

  c6ac8ddde965067c5be4f860d60ad106550f44c4
    conf/ucm: Set up for installation
  9d649add08beb93728ba2943a2c05f8f160f8296
    conf/ucm: Add Makefile.am for broadwell-rt286 ucm config
  91896be6bc326b5b9c1b5ef52b9dbac243fefa27
    conf/ucm: Rearrange Makefile.am
  b7e56af82a600262b7f641c5920a914b3303fd56
    conf/ucm: Add dual HD-audio codecs config for Lenovo
  d1e08d2db3517e8430ffa570f23b53987ba78cc3
    conf/ucm: Add Gigabyte mobo UCM profile with dual HD-audio codecs
  8ebb40c96970c913719a75deb2fe82ba2e257386
    conf/ucm: Add a UCM profile for Dell WD15 Dock USB-audio
  6eced6b4b6dca9f62ea3d13a40c5991231df3c5c
    conf/ucm/Dell-WD15-Dock: Fix incorrect device names
  d48adc2a206d044678be09953d57971c0e1907c7
    conf: Move UCM profile snippets into components subdirectory
  c9fcf9836907b1ccda0c1f72b698ee5c5dd5199c
    ucm: Set default include path

---
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
