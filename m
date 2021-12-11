Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D639F470FCF
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Dec 2021 02:21:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD0D20BD;
	Sat, 11 Dec 2021 02:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD0D20BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639185707;
	bh=FNPBPojWSuF9XTmtuXDbqY6dpaLYJU46NeY2Uvo9n+0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHSfaBE5MvKwAoHv1XN0RTz6KcNyS7E1QHeNk8sWfn3p2uCI4CAuGdDvZdju/5Psa
	 TBB0zlweJicP5tchTt4V5VD3aGJVckrY6Oq3bifF0t26S0Iqy1nbNWwfPqdwg4RH7c
	 bCUYbRkHeo7Iglp1aUSWOIwAfFq7XwhmVRNeQKP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B004EF804ED;
	Sat, 11 Dec 2021 02:20:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C612F804EC; Sat, 11 Dec 2021 02:20:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A52DEF8028D
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 02:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A52DEF8028D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639185626577805042-webhooks-bot@alsa-project.org>
References: <1639185626577805042-webhooks-bot@alsa-project.org>
Subject: Permissions of alsatplg -o output are hardcoded to S_IRUSR | S_IWUSR
 (600)
Message-Id: <20211211012035.0C612F804EC@alsa1.perex.cz>
Date: Sat, 11 Dec 2021 02:20:34 +0100 (CET)
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

alsa-project/alsa-utils issue #126 was opened from marc-hb:

>From https://github.com/alsa-project/alsa-utils/blob/c8c348e28a258f17e3/topology/topology.c#L172

```C
static int save(const char *output_file, void *buf, size_t size)
{

               fd = open(fname, O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);

```

When using alsatplg in a build system (e.g.: https://github.com/thesofproject/sof/blob/3e1c160e5053eae/tools/topology/topology1/CMakeLists.txt#L243), all other artefacts follow the process's umask **except** alsatplg output. This causes subtle and time-consuming errors when trying to share artefacts across different processes.


git blame finds: 

commit cbabe7a3f0cc84ecd352d4cbf85148946fa6c0d5
Author: Jaroslav Kysela <perex@perex.cz>
Date:   Thu Dec 19 15:36:05 2019 +0100

    alsatplg: rewrite to use the new libatopology functions


Before cbabe7a3f0, opening the output file was delegated to library function `snd_tplg_build_file()`. Not sure what permissions were used then.

Workaround:
```shell
alsatplg -c intput.conf -o - > output.tplg
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/126
Repository URL: https://github.com/alsa-project/alsa-utils
