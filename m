Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D777317A613
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:10:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 435201661;
	Thu,  5 Mar 2020 14:09:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 435201661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583413847;
	bh=/UPiOxsuucMb8padFBubdEP01nT2C3ZljTPONylfi6Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Itf6qjVqpAT3IWRgQzWs4TOAiPmy2+mBrGqKOX/3Qud+EU1XsLJow/9P8nrB1yHqf
	 SZkQUBSCjMepMKuBvy0qOJWrMOAD3VroW0HlGVPF7YkM0OnAsdggt0xAbviLcsEMti
	 9iT417OoGyCX9Vgkque2kx8Nzig84DcMtJ7hqA90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0961F8029A;
	Thu,  5 Mar 2020 14:07:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF256F80271; Thu,  5 Mar 2020 14:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 01720F80279
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01720F80279
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583413597191935062-webhooks-bot@alsa-project.org>
References: <1583413597191935062-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp: Support systems without integrated graphics audio
Message-Id: <20200305130640.DF256F80271@alsa1.perex.cz>
Date: Thu,  5 Mar 2020 14:06:40 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #15 was opened from kv2019i:

On systems where integrated graphics audio is not present
or is disabled, the HDMI PCM nodes are disabled. Add rules to
detect these systems by checking presence of HDMI jack controls
with UCM2 rules.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/15
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/15.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
