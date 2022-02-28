Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692B64C62BB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 07:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9EC71698;
	Mon, 28 Feb 2022 07:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9EC71698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646028275;
	bh=j+J6UrsImWtxLDV//rv48cQjUojemQb2FjYB/qjcotc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUihl85plcVFkihLhqin/FrwyU4Nik2gwqVTTwm209IIeFcnny03qcPhUZacxBKpe
	 3hRsNqI/PmUW/9IGvWEoiWD9CACt8rRVWjmJS9GQ3OWLmBsZJKElvXPavldqU+5Y3Q
	 5lWLyV4TkLfq3CRRcyPZ4ubkCPuWihfQQwN8gGSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25986F80154;
	Mon, 28 Feb 2022 07:03:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96C36F8013C; Mon, 28 Feb 2022 07:03:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D16D8F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 07:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D16D8F800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1646028200238337040-webhooks-bot@alsa-project.org>
References: <1646028200238337040-webhooks-bot@alsa-project.org>
Subject: ucm2: add additional symlink for Pinebook Pro
Message-Id: <20220228060327.96C36F8013C@alsa1.perex.cz>
Date: Mon, 28 Feb 2022 07:03:27 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #140 was opened from kmcopper:

since 907f0a305186 ASoC: simple-card: Fill in driver name of the linux
kernel, the base name is simple-card instead of rockchip_es8316

Fixes: 85eea19783cf ("ucm2: Add UCM support for rockchip_es8316 on Pinebook Pro")
Signed-off-by: Kyle Copperfield <kmcopper@danwin1210.me>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/140
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/140.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
