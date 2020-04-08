Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220761A207A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 13:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0621165D;
	Wed,  8 Apr 2020 13:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0621165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586347167;
	bh=LoloRUjmacsdJffsK/lHkMlJfFkseAeef5jE68tatSI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/1/QGSyVyndPWrs3YYB/D09OJ4a82/ry9EJTcgDfi4fgVXY86KjmYXerhJHbKwOE
	 2oFtlaDR+47LZDzlx7VOAMIS/NWc8Ii2CH8Zy1qKIVegG87mK36iRCgW0oWs/Z8e2R
	 5S9akpxrrMjq7kXgMRElMh6W9l/sGK2Pi9FhTcLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE419F80150;
	Wed,  8 Apr 2020 13:57:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3A98F80143; Wed,  8 Apr 2020 13:57:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2EBA0F80105
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 13:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EBA0F80105
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1586347057450603962-webhooks-bot@alsa-project.org>
References: <1586347057450603962-webhooks-bot@alsa-project.org>
Subject: Error compiling alsatplg
Message-Id: <20200408115742.B3A98F80143@alsa1.perex.cz>
Date: Wed,  8 Apr 2020 13:57:42 +0200 (CEST)
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

alsa-project/alsa-utils issue #37 was opened from dbaluta:

With latest alsa-lib and alsa-utils sources I cannot compile alsatplg utility.

Steps followed:

# Compile alsa-lib 
1. ./gitcompile --prefix=$HOME/work/sof_dir/alsa-lib-bins/
2. make install #custom instalation to be later used by alsa-utils.

# Compile alsa-utils
1. /gitcompile --with-alsa-inc-prefix=$HOME/work/sof_dir/alsa-lib-bins/include/  --with-alsa-prefix=$HOME/work/sof_dir/alsa-lib-bins/lib
2. I get the following errors:

```
-ldl -lpthread
topology.o: In function `load_topology':
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:135: undefined reference to `snd_tplg_create'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:141: undefined reference to `snd_tplg_load'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:145: undefined reference to `snd_tplg_free'
topology.o: In function `version':
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:63: undefined reference to `snd_tplg_version'
topology.o: In function `dump':
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:218: undefined reference to `snd_tplg_save'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:219: undefined reference to `snd_tplg_free'
topology.o: In function `compile':
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:245: undefined reference to `snd_tplg_build_bin'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:246: undefined reference to `snd_tplg_free'
topology.o: In function `decode':
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:268: undefined reference to `snd_tplg_create'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:273: undefined reference to `snd_tplg_decode'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:281: undefined reference to `snd_tplg_save'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:282: undefined reference to `snd_tplg_free'
/home/nxf25322/work/sof_dir/alsa-utils/topology/topology.c:276: undefined reference to `snd_tplg_free'
collect2: error: ld returned 1 exit status
Makefile:433: recipe for target 'alsatplg' failed

```
Similar with https://github.com/alsa-project/alsa-utils/issues/33

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/37
Repository URL: https://github.com/alsa-project/alsa-utils
