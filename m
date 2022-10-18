Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40267602F92
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 17:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D12FA469E;
	Tue, 18 Oct 2022 17:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D12FA469E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666106600;
	bh=8HVB+h/nAapTteHBM0mVDY3pxzYv5MPXQEogHUdxd+s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFjKRTzj2mndGMJUtPObkZzYBP2rc2/ILno+U7i6AEuBdIT/gXNR6tKLygrkfkBAY
	 /4CYVFTp7qWZJEKlbzj36p2RUC2xa5fed3ssz8lLjbfYTa2hPg9UA/xiJhpgKpsVHN
	 SCuZkAsX8M806IOTFbMxlYeJMU1ul9Pabt4Ijn50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BBCBF804BD;
	Tue, 18 Oct 2022 17:22:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B3F3F8024C; Tue, 18 Oct 2022 17:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D608CF800AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 17:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D608CF800AB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666106541289619923-webhooks-bot@alsa-project.org>
References: <1666106541289619923-webhooks-bot@alsa-project.org>
Subject: sof-es8336.conf
Message-Id: <20221018152224.2B3F3F8024C@alsa1.perex.cz>
Date: Tue, 18 Oct 2022 17:22:24 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #231 was opened from junocomp:

The only way for the `Headphone Mixer Volume` to be enabled at startup the following commands needs to be added.

`sset Headphone 3
`
When adding this to `sof-essx8336.conf` and reload alsa I get the following error

```
sudo alsaucm reload
ALSA lib parser.c:1194:(parse_sequence) error: sequence command 'sset' is ignored
ALSA lib parser.c:1045:(parse_sequence) error: string type is expected for sequence command
ALSA lib parser.c:2289:(parse_controls_boot) Unable to parse BootSequence
ALSA lib main.c:1541:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -22
alsaucm: error failed to open sound card hw:0: Invalid argument
```

When running `amixer -c 0 sset Headphone 3` manually it works fine

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/231
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
