Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC2655F29
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 03:31:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C3B57CF;
	Mon, 26 Dec 2022 03:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C3B57CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672021861;
	bh=smyNeioRH+6xG9Mj+q3v/unHdsbrW4UvKb1ptBK2R/o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VvArQm5tAsxYDpRHfGBpzPExSdpV1I7nO3PNTERuz4s7fFca+pbcNDY8DPPugPMlP
	 OCo/7EuyDkDyQf6w78uN3s7KaFY9aOmgjXvFUMr6KwfUT4TZNi3cqB1uXNUDhmP+2I
	 QG311VCpQ2UZtTYCJ69+foL9wumpJiHQa98z9UNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A118F8027B;
	Mon, 26 Dec 2022 03:30:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9D2F80310; Mon, 26 Dec 2022 03:30:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1F334F80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 03:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F334F80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1672021799100692034-webhooks-bot@alsa-project.org>
References: <1672021799100692034-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp: Set Dmic0 Capture Switch on
Message-Id: <20221226023003.1E9D2F80310@alsa1.perex.cz>
Date: Mon, 26 Dec 2022 03:30:03 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-ucm-conf pull request #259 was opened from KaiChuan-Hsieh:

Internal microphone default is off after fresh installation. Add operation to set the control on to align with other sound architecture.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/259
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/259.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
