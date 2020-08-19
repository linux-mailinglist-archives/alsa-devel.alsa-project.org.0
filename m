Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9B2493BC
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 06:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A13BD17F5;
	Wed, 19 Aug 2020 06:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A13BD17F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597810361;
	bh=AHI8NvPgNOMxhtu0h5kkNVP7LNhIQyIeDkXpamog7/g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxyqk//Qj7/JP+UlbGytbP3PCoN9qA1hUSLkElfXwO5+vVwaa9eM/3DVPOrHQuVFW
	 oL1yFFFAG7Vw8wPyCo0KtKEizm5LbCPcxVUdhr+uwtSjXksc/4ebz77gq1YtZtoWsj
	 eTKkWuGvgXgx3rcarbag9TOAYoIim6juLsRKNpYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC62F80114;
	Wed, 19 Aug 2020 06:11:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 411FFF80218; Wed, 19 Aug 2020 06:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C73DCF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 06:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C73DCF80114
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1597810249724416018-webhooks-bot@alsa-project.org>
References: <1597810249724416018-webhooks-bot@alsa-project.org>
Subject: ucm: let rval_sysfs check the device/driver/module first
Message-Id: <20200819041057.411FFF80218@alsa1.perex.cz>
Date: Wed, 19 Aug 2020 06:10:57 +0200 (CEST)
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

alsa-project/alsa-lib pull request #79 was opened from jason77-wang:

We plan to use the sound driver module's name for the top ucm's name,
I checked it on 3 different ASoC machines, the device/driver links to
machine driver while deice/driver/module links to the sound driver
module, so change the code to readlink the device/driver/module first,
if it fails then readlink the device/driver.

This is the output from those 3 machines:
$readlink /sys/class/sound/card0/device/driver
../../../../bus/platform/drivers/skl_hda_dsp_generic
$readlink /sys/class/sound/card0/device/driver/module
../../../../module/snd_soc_skl_hda_dsp

$readlink /sys/class/sound/card2/device/driver
../../../../../bus/platform/drivers/acp_pdm_mach
$readlink /sys/class/sound/card2/device/driver/module
../../../../module/snd_acp3x_rn

$readlink /sys/class/sound/card0/device/driver
../../../../bus/platform/drivers/sof_sdw
$readlink /sys/class/sound/card0/device/driver/module
../../../../module/snd_soc_sof_sdw

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/79
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/79.patch
Repository URL: https://github.com/alsa-project/alsa-lib
