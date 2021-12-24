Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72BA47ED64
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 09:46:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D72818D1;
	Fri, 24 Dec 2021 09:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D72818D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640335605;
	bh=vYnXjszt8LekhBLh38PhhoWE2y5KgrgNbSanMgVhDu0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Exia+BbMRrizZdHbi4gm1hePstO/BInlPXNoRQ0A48id6Fx4gRcO0jDnoothopmH2
	 vjogYxCA+3pWJ54LQRiKLhWT3QynRqiccdox2Kp2OMrpPitQCPaR51xmv8Nq2pIDSr
	 r5s2n3yr6ooa93s33vUSC32pt9EpYSmD/9hPbHCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5BCDF8013F;
	Fri, 24 Dec 2021 09:45:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF009F800FF; Fri, 24 Dec 2021 09:45:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5E2C0F800F3
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 09:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E2C0F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640335526728811026-webhooks-bot@alsa-project.org>
References: <1640335526728811026-webhooks-bot@alsa-project.org>
Subject: "alsatplg -v 1 -o -"  silently corrupts output
Message-Id: <20211224084531.CF009F800FF@alsa1.perex.cz>
Date: Fri, 24 Dec 2021 09:45:31 +0100 (CET)
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

alsa-project/alsa-utils issue #131 was opened from marc-hb:

`alsatplg -v 1` works.
`alsatplg -o -` works too.

Using both produces silently a binary .tplg file prefixed with debug logs:

```
B0x003d3b/015675 - pcm 'DMIC': write 912 bytes
B0x0040cb/016587 - pcm 'HDMI1': write 912 bytes
B0x00445b/017499 - pcm 'HDMI2': write 912 bytes
B0x0047eb/018411 - pcm 'HDMI3': write 912 bytes
B0x004b7b/019323 - pcm 'DMIC16kHz': write 912 bytes
B0x004f0b/020235 - block size for type be (11:10) is 0x2ad4/10964
B0x004f0b/020235 - header index 0CoSA^E^@^@^@^@^@^@^@^H^@^@^@$^@^@
^@^@^@^@^@s^@^@^@^@^@^@^@^A^@^@^@p^@^@^@ ^@^@^@.^@^@^@ ^@^@^@^F^@^
@^@^F^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^
@^@^@^@^@^@^@^@^@^...
```

I would have expected alsatplg -v to use stderr, this would have avoided this problem. Probably too late by now.

I suggest simply failing with an error message when both options are used at the same time. Any other solution that does not silently produces corrupted output would be a huge improvement.

Context: thesofproject/sof/pull/5132

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/131
Repository URL: https://github.com/alsa-project/alsa-utils
