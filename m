Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2E3A23B1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 07:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33DD1721;
	Thu, 10 Jun 2021 07:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33DD1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623301703;
	bh=lBlDHBSFyadgC6T0DTt5blLcF7SaJXtSJqX3QL5lBOA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XM2D9B3hHeVjFS+YhAmO5wodboUhoMOGkp/J4rbv9txKgCTLajvE5+2ko4Ponqvq6
	 qNbCb3HIp03CPVaIwBLZKp7hcLMgB9Dl2tc1oljGhQqqLgWUhaWjERI/OHbPSv4lBl
	 5q4BoAUe+PHid3staT9BbLIzl+lIbjKwHlOCoIls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2552AF80227;
	Thu, 10 Jun 2021 07:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8400F80218; Thu, 10 Jun 2021 07:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8650DF800FC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 07:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8650DF800FC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623301608142592907-webhooks-bot@alsa-project.org>
References: <1623301608142592907-webhooks-bot@alsa-project.org>
Subject: [Bug] Duplication in Array Element not Handled in Parsing conf
Message-Id: <20210610050652.B8400F80218@alsa1.perex.cz>
Date: Thu, 10 Jun 2021 07:06:52 +0200 (CEST)
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

alsa-project/alsa-lib issue #151 was opened from aiChaoSONG:

When parsing array element in conf files, an auto-increase number is used as config id(`snd_config_t->id`), and array element as the config value(`snd_config_t->u.string/integer/integer64/real`), duplication is not handle in `parse_array_defs/parse_array_def/parse_value` functions.

Suppose we have a conf:
```
array [
    "a"
    "b"
    "a"
]
```
the parsed result will be:
```
    parent
        |
        ---- snd_config_t {id: "0", u.string: "a"}
        |
        ---- snd_config_t {id: "1", u.string: "b"}
        |
        ---- snd_config_t {id: "2", u.string: "a"}
```
The duplication in "a" may be desired. But please consider this condition: suppose we have four conf files A, B, C and D, where A 
is the conf above, let B include A, C include A, D include B and C, so D include A twice indirectly. File A will be processed twice when parsing D, because duplication is not handled, here comes the problem, the parsed result of A in D is:
```
    parent
        |
        ---- snd_config_t {id: "0", u.string: "a"}
        |
        ---- snd_config_t {id: "1", u.string: "b"}
        |
        ---- snd_config_t {id: "2", u.string: "a"}
        |
        ---- snd_config_t {id: "3", u.string: "a"}
        |
        ---- snd_config_t {id: "4", u.string: "b"}
        |
        ---- snd_config_t {id: "5", u.string: "a"}
```
This is obviously wrong.

I think handle duplication in parse_value is not the solution, because element duplication in an array is wanted. The key problem here is that we parse the same conf more than once.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/151
Repository URL: https://github.com/alsa-project/alsa-lib
