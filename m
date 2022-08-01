Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DFA58726E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 22:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE79C1FE;
	Mon,  1 Aug 2022 22:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE79C1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659386678;
	bh=7eALDqok7bxeMS8Dmet6O18ubNfvQ05862LanAwRIs0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gnxht8Gxd8PUT1uq57+1pcLp+A0vZnga6UNM8giZpZwpnTORbxg6ep+5uXMih1Kwd
	 lhhhgJTsYOLn0pRdfkdjtddL5gyKRaOe9ct0M9Niyr9ojlbHSa010lprnM4KAaj6Fx
	 DS2gOP8AsMGy9OAzkoh8+5QnXNP23W3wrpv7ww2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC5EF80246;
	Mon,  1 Aug 2022 22:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26F23F8023B; Mon,  1 Aug 2022 22:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=MISSING_DATE,MISSING_MID,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B2AFCF8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 22:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2AFCF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1659386611738778114-webhooks-bot@alsa-project.org>
References: <1659386611738778114-webhooks-bot@alsa-project.org>
Subject: topology: plugins: fix off by 1 mem allocation error
Message-Id: <20220801204339.26F23F8023B@alsa1.perex.cz>
Date: Mon,  1 Aug 2022 22:43:39 +0200 (CEST)
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

alsa-project/alsa-utils pull request #162 was opened from yongzhi1:

Fix valgrind memcheck error:

==1337389== Invalid write of size 1
==1337389==    at 0x4A4AFAB: __vsnprintf_internal (vsnprintf.c:117)
==1337389==    by 0x4AECF40: __snprintf_chk (snprintf_chk.c:38)
==1337389==    by 0x484B870: snprintf (stdio2.h:67)
==1337389==    by 0x484B870: print_as_hex_bytes (nhlt-processor.c:112)
==1337389==    by 0x484B870: merge_manifest_data (nhlt-processor.c:154)
==1337389==    by 0x484B870: do_nhlt (nhlt-processor.c:420)
==1337389==    by 0x484B870: _snd_topology_nhlt_process (nhlt-processor.c:484)

The consecutive snprintf overwrites always the previous terminator until
it hits the very last call of:

snprintf(dst, ALSA_BYTE_CHARS + 1, "0x%02x,", *nhlt_buffer);

when the size n given to snprintf is 1 more than allocated.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/162
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/162.patch
Repository URL: https://github.com/alsa-project/alsa-utils
