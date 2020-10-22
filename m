Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57E295C1C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 11:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928F217AA;
	Thu, 22 Oct 2020 11:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928F217AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603359550;
	bh=O/qdQrkJoGNwaYjEhoAT65h1CYvJ3R0heJ6nHx50nyA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=puEBdwXpjFCLi06fIPR/QzJOBdp/ZCBlncfHAA519LtD5zqlZm2/HuCX7SxOhBifb
	 4sQLYxes+zbeIwX6liRVmXB1J8h2dqGErorZ20i9wpDXLSaf1aZISYfcbwSBwY54Wl
	 kbnkN1H9Sz+0yae14HOn/CN4CeBsZsg61GmzL2og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 047E6F804AA;
	Thu, 22 Oct 2020 11:37:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68262F804A9; Thu, 22 Oct 2020 11:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B35B2F8025A
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 11:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B35B2F8025A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603359446835998058-webhooks-bot@alsa-project.org>
References: <1603359446835998058-webhooks-bot@alsa-project.org>
Subject: Fix muted output and low ouput/input volume on a Dell Latitude 3410
Message-Id: <20201022093734.68262F804A9@alsa1.perex.cz>
Date: Thu, 22 Oct 2020 11:37:34 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #56 was opened from J-Bu:

Using following environment on a Dell Latitude 3410 results in muted master channel and low output/input volume:

 - alsa-libs 1.2.4
 - alsa-ucm-conf 1.2.4
 - alsa-topology-conf 1.2.4
 - alsa-utils 1.2.4
 - kernel 5.9.1 -> with commit 3dca35e applied on top of it 
 - sof-bin v1.6

The propused changes fixes the problem for me. I don't know why but the given values are not 1:1 mapped to levels in alsamixer, please see attached iamges for alsamixer levels before and after the change, the alsamixer levels where captured after running "alsactl init":

before:
![before](https://user-images.githubusercontent.com/15876551/96853514-bf0f5f80-145a-11eb-9c7f-751834a56491.png)

after:
![after](https://user-images.githubusercontent.com/15876551/96853530-c46caa00-145a-11eb-9057-5399382d195d.png)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/56
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/56.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
