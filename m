Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11861589756
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 07:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912E482C;
	Thu,  4 Aug 2022 07:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912E482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659591016;
	bh=/FtOQvl/U7qlx6WqCmJidgq4RJKfk4+kYJpgWGbJl7c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ECE29F0fAlSG39S1cfWNe+RWLcEHvTZDWuWwvjjGjQA7V/+Y8H3IzQBJeFW9a6+MA
	 bmY7VX/Qp5h8qExJg9OYTMkyAh+/hUCGQnwwAjlM6rjH6vlE1mO5wVXohnxyY5k77u
	 LdD+blM6Arq1SiYaIqMFHuIaaBAZ+be5CDoEfqsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD64F8012F;
	Thu,  4 Aug 2022 07:29:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845ADF8016A; Thu,  4 Aug 2022 07:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E31ECF8012F
 for <alsa-devel@alsa-project.org>; Thu,  4 Aug 2022 07:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E31ECF8012F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1659590947464731932-webhooks-bot@alsa-project.org>
References: <1659590947464731932-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add profile for MSI MEG Z690I Unify
Message-Id: <20220804052914.845ADF8016A@alsa1.perex.cz>
Date: Thu,  4 Aug 2022 07:29:14 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #196 was opened from 13r0ck:

This is tested and works, though I am not a fan of my `Needle` and `Haystack` solution here, but before also making a PR to alsa-utils I wanted direction. Would it be better to add a `Type Bool` condition, or a `skip` modifier to `SectionDevice`? I prefer the later, because it skips the `If {} Condition {} true {}` lines, but I would like an alsa maintainer's opinion.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/196
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/196.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
