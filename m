Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B2A3B52BF
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Jun 2021 12:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F70B169F;
	Sun, 27 Jun 2021 12:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F70B169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624788321;
	bh=NVGV4b4N6u7EVY3DqF35PEFsJ/Bk1E0SZnus/KJMOBw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XGI0dt+tKw3N3D0EiDw97qJcvZ8SNOqd1OD1Ywt/QsnLLdNM9l9UeLUF3ZPQ64yjl
	 FBs2pwrUKzhWQisZ9sT7zLyWcLecKleU7yvBibKA57Ektv2AJV/hp6D4mwk7JetX6b
	 FC8PS0tG78OCCyEcaOIhJuESoLShTKgWwNcqXRD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80564F800BE;
	Sun, 27 Jun 2021 12:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A44B5F80259; Sun, 27 Jun 2021 12:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 41B4FF80137
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 12:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41B4FF80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624788226441960096-webhooks-bot@alsa-project.org>
References: <1624788226441960096-webhooks-bot@alsa-project.org>
Subject: Starting with 1.2.5 alsactl tries to initialize UCM even if it is not
 supported
Message-Id: <20210627100350.A44B5F80259@alsa1.perex.cz>
Date: Sun, 27 Jun 2021 12:03:50 +0200 (CEST)
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

alsa-project/alsa-utils issue #101 was opened from nmeum:

Hello,

Starting with alsa-utils 1.2.5 I observed the following warning on my machine when running `alsactl restore 0`, which I didn't receive prevously with alsa-utils 1.2.4:

```
$ alsactl -E 'HOME=/var/run/alsasound' -I -f /var/lib/alsa/asound.state restore 0
alsa-lib parser.c:2372:(load_toplevel_config) Unable to find the top-level configuration file '/usr/share/alsa/ucm2/ucm.conf'.
alsa-lib main.c:1405:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -2
```

The error message tells me that alsa-utils 1.2.5 now tries to initialize UCM by default which doesn't work since I don't have [alsa-ucm-conf](https://github.com/alsa-project/alsa-ucm-conf) installed. After installing alsa-ucm-conf, the error message looks as follows:

```
$ alsactl -E 'HOME=/var/run/alsasound' -I -f /var/lib/alsa/asound.state restore 0
alsa-lib parser.c:242:(error_node) UCM is not supported for this HDA model (HDA Intel PCH at 0xf2530000 irq 35)
alsa-lib main.c:1405:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -6
```

>From reading the alsactl man page, it seems to me that UCM should only be initialized by default if it is available. Since alsactl 1.2.4 did not attempt to initialize UCM on my machine, this seems to be a regression introduced in alsactl 1.2.5. If I disable UCM explicitly using `alsactl -U`, everything works as expected. Similarly, downgrading to alsactl 1.2.4 again also resolves the issue.

I am not familiar at all with alsa internals but if desired, I can check with `git-bisect(1)` which commit between `v1.2.4..v1.2.5` introduced this regression.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/101
Repository URL: https://github.com/alsa-project/alsa-utils
