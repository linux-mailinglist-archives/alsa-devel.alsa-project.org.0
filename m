Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6DA480E4A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 01:41:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0E3C16B3;
	Wed, 29 Dec 2021 01:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0E3C16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640738494;
	bh=xBHPX1g/VhNACM/B7G6xs8xh7D4vxdxhhC+E23EcbFo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfVZhsxYy+agHQmi1U8KvlwfB5QbRElApWD32+fq3mYmdl8Mh9bRdRqSpAyD9XGhq
	 lWCVrZFhOETffGHNEF0bEVB6kzNHSt7GzZ9svBQOK5Foo+3LVsHdp/nM8hk3Vy0fKK
	 6J/AGF4v50BPpaqB8RxoxPOezZB3VgCF7H04NwxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30650F80249;
	Wed, 29 Dec 2021 01:40:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE951F80246; Wed, 29 Dec 2021 01:40:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9FA9EF800E9
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 01:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA9EF800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640738420767071962-webhooks-bot@alsa-project.org>
References: <1640738420767071962-webhooks-bot@alsa-project.org>
Subject: [patch] /usr/share/alsa/speaker-test/sample_map.csv is not accurate, 
 not affecting operation of speaker-test
Message-Id: <20211229004027.EE951F80246@alsa1.perex.cz>
Date: Wed, 29 Dec 2021 01:40:27 +0100 (CET)
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

alsa-project/alsa-utils issue #133 was edited from ZjYwMj:

With alsa-utils 1.2.6:
```
--- a/usr/share/alsa/speaker-test/sample_map.csv	2021-12-06 18:44:25.000000000 +0000
+++ b/usr/share/alsa/speaker-test/sample_map.csv	2021-12-28 19:48:02.390305957 +0000
@@ -1,2 +1,2 @@
-0, "Front Left", "/usr/share/alsa/samples/Front_Left.wav"
-1, "Front Right", "/usr/share/alsa/samples/Front_Right.wav"
+0, "Front Left", "/usr/share/sounds/alsa/Front_Left.wav"
+1, "Front Right", "/usr/share/sounds/alsa/Front_Right.wav"
```
The directory ``/usr/share/alsa/samples/`` does not exist. It sounds as if ``speaker-test -t wav`` plays the files mentioned in the diff. This inaccuracy does not affect the operation of ``speaker-test``. Perhaps the paths to the wav files are hard coded within ``speaker-test``. Still, I find it a minor bug.
Why is ``/usr/share/alsa/speaker-test/sample_map.csv`` distributed anyway? Is it for informational purposes? Was it used in the past, and no longer serves its purpose? Is it planed to be used in the future?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/133
Repository URL: https://github.com/alsa-project/alsa-utils
