Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206651F6A5C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 16:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AD941689;
	Thu, 11 Jun 2020 16:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AD941689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591887211;
	bh=j2gmY2UIS2xMMyn5OxP/Nd8MIM+P8bMe2uaPK08ww+s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XrwsTGncdPRhbVznor+6ewCZF6el32NViwUvDWRP2/BMvW20RN+Pb2qqDFNUO7Hxy
	 sAc1Q6K0+j0P9l6v+xAEC/2agDyrrNBIFe06/v7mbWSEFPMtUnYYBCOx6sfQ//1EWB
	 o8XxiGWZm+iYcotm/gfTkYd3gr2gyvAYqwTydFHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93205F8028D;
	Thu, 11 Jun 2020 16:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0815FF8028C; Thu, 11 Jun 2020 16:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DF4EDF80149
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 16:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF4EDF80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591887102073673964-webhooks-bot@alsa-project.org>
References: <1591887102073673964-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp: make Headphone Playback Switch conditional
Message-Id: <20200611145149.0815FF8028C@alsa1.perex.cz>
Date: Thu, 11 Jun 2020 16:51:48 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #34 was opened from kv2019i:

The Headphone Playback Switch control is not present in all
HDA codecs. Allow the Headphones definition to work also on
such systems.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/34
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/34.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
