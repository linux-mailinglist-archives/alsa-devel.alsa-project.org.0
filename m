Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE546AA66
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 22:26:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC832357;
	Mon,  6 Dec 2021 22:25:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC832357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638825981;
	bh=WrdJT37ASPUzHOCTgplPEuYPsv8e5CNEXm2Lc5ZgPno=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bgj6lS54xx8KFfpFRXjYt2NIsxIv9BtIy1eU/ZuFJUjF1Q9WLd3rjKqPitcu8Lf0w
	 EekY1ZL/l1WTEtggJUIeZlIBis67xA6KQNQi3wgLWt5KYlzhrOUzUOYwBZzccIm1xo
	 JygSSfAiWsh0FkZm/ZrfavMlFdCso1eSeIqW1DvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E19F804ED;
	Mon,  6 Dec 2021 22:25:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51D25F804EC; Mon,  6 Dec 2021 22:25:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DFCB3F804AE
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 22:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFCB3F804AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638825896176964998-webhooks-bot@alsa-project.org>
References: <1638825896176964998-webhooks-bot@alsa-project.org>
Subject: pre-processor only works with relative path based on input file with
 the complete path
Message-Id: <20211206212501.51D25F804EC@alsa1.perex.cz>
Date: Mon,  6 Dec 2021 22:25:01 +0100 (CET)
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

alsa-project/alsa-utils issue #123 was opened from ranj063:

For ex:

`alsatplg -P sof-hda-generic.conf -o test.conf` fails with:

Unable to open included conf file sof-hda-generic.conf/include/components/eqiir/highpass_40hz_0db_48khz.conf
Unable to process include file 
Failed to process includes
Failed to process conditional includes in input config

whereas:

`alsatplg -P ~/work/sof/sof/tools/topology/topology2/sof-hda-generic.conf -o test.conf` works OK.

Would it be possible to make the first command work with the use of the ALSA_CONFIG_DIR environment variable?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/123
Repository URL: https://github.com/alsa-project/alsa-utils
